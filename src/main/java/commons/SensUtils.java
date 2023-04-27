package commons;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.Random;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

/**
 * <h1>SENS 관련 클래스</h1>
 * 
 * @author LSJ
 * @version 1.0.0
 */
public class SensUtils {
	private String hostNameUrl = "https://sens.apigw.ntruss.com"; // 고정
	private String requestUrl = "/sms/v2/services/"; // 고정
	private String requestUrlType = "/messages"; // 고정
	private String accessKey = "3cHT4gyV4Jwfy1EHIK0i"; // Access Key
	private String secretKey = "AvBcMHWFhjQRmjpsDrkws9LieH3UIJoT0AbNVODE"; // Secret Key
	private String serviceId = "ncp:sms:kr:307071066782:kickkick"; // Service ID
	private String method = "POST";
	private String timestamp = Long.toString(System.currentTimeMillis());

	private String apiUrl = hostNameUrl + requestUrl + serviceId + requestUrlType;

	/**
	 * <h1>SMS 전송</h1><br>
	 * 1. 6자리 난수 생성<br>
	 * 2. SMS 작성<br>
	 * 3. SMS 전송 및 난수 리턴<br>
	 * 
	 * @param phone : 수신 번호, -를 제외한 숫자
	 * @return String : 6자리 난수
	 * @throws MalformedURLException
	 * @throws IOException
	 * @throws InvalidKeyException
	 * @throws NoSuchAlgorithmException
	 */
	public String sendSMS(String phone) throws Exception {
		System.out.println(apiUrl);
		URL url = new URL(apiUrl);

		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		con.setUseCaches(false);
		con.setDoOutput(true);
		con.setDoInput(true);
		con.setRequestProperty("content-type", "application/json");
		con.setRequestProperty("x-ncp-apigw-timestamp", timestamp);
		con.setRequestProperty("x-ncp-iam-access-key", accessKey);
		con.setRequestProperty("x-ncp-apigw-signature-v2", makeSignature(requestUrl + serviceId + requestUrlType, timestamp, method, accessKey, secretKey));
		con.setRequestMethod(method);
		con.setDoOutput(true);
		DataOutputStream wr = new DataOutputStream(con.getOutputStream());

		String randNum = this.randNum();
		wr.write(writeSMS(phone, randNum).getBytes());
		wr.flush();
		wr.close();

		int responseCode = con.getResponseCode();
		BufferedReader br;
		System.out.println("responseCode" + " " + responseCode);
		if (responseCode == 202) { // 정상 호출
			br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		} else { // 에러 발생
			br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		}

		String inputLine;
		StringBuffer response = new StringBuffer();
		while ((inputLine = br.readLine()) != null) {
			response.append(inputLine);
		}
		br.close();

		System.out.println(response.toString());
		return randNum;
	}

	/**
	 * <h1>SMS - Body 작성</h1><br>
	 * 1. JSON을 통해 SMS 구성<br>
	 * 2. 작성된 JSON을 toString()을 통해 문자열로 변환<br>
	 * 
	 * @param phone   : 수신 번호, -를 제외한 숫자
	 * @param randNum : 6자리 난수 문자열
	 * @return String : SMS 내용
	 */
	public String writeSMS(String phone, String randNum) {
		// JSON 을 활용한 body data 생성
		JsonObject bodyJson = new JsonObject();
		JsonObject toJson = new JsonObject();
		JsonArray toArr = new JsonArray();

		// Optional, messages.subject 개별 메시지 제목, LMS, MMS에서만 사용 가능
		// toJson.put("subject","");
		// Optional, messages.content 개별 메시지 내용, SMS: 최대 80byte, LMS, MMS: 최대 2000byte
		toJson.addProperty("content", "본인인증 [" + randNum + "]");
		// Mandatory(필수), messages.to 수신번호, -를 제외한 숫자만 입력 가능
		toJson.addProperty("to", phone);
		toArr.add(toJson);

		// Madantory, 메시지 Type (SMS | LMS | MMS), (소문자 가능)
		bodyJson.addProperty("type", "SMS");
		// Optional, 메시지 내용 Type (AD | COMM) * AD: 광고용, COMM: 일반용 (default: COMM) * 광고용 메시지 발송 시 불법 스팸 방지를 위한 정보통신망법 (제 50조)가 적용됩니다.
		// bodyJson.put("contentType","");
		// Optional, 국가 전화번호, (default: 82)
		// bodyJson.put("countryCode","82");
		// Mandatory, 발신번호, 사전 등록된 발신번호만 사용 가능
		bodyJson.addProperty("from", "01040205717");
		// Optional, 기본 메시지 제목, LMS, MMS에서만 사용 가능
		// bodyJson.put("subject","");
		// Mandatory(필수), 기본 메시지 내용, SMS: 최대 80byte, LMS, MMS: 최대 2000byte
		bodyJson.addProperty("content", "sms test in spring 222");
		bodyJson.add("messages", toArr);

		return bodyJson.toString();
	}

	/**
	 * <h1>Body 암호화 - HmacSHA256</h1><br>
	 * 
	 * @param url
	 * @param timestamp
	 * @param method
	 * @param accessKey
	 * @param secretKey
	 * @return String : 암호화된 Body 문자열
	 * @throws NoSuchAlgorithmException
	 * @throws InvalidKeyException
	 */
	private String makeSignature(String url, String timestamp, String method, String accessKey, String secretKey) throws NoSuchAlgorithmException, InvalidKeyException {
		String space = " "; // one space
		String newLine = "\n"; // new line

		String message = new StringBuilder().append(method).append(space).append(url).append(newLine).append(timestamp).append(newLine).append(accessKey).toString();

		SecretKeySpec signingKey;
		String encodeBase64String;
		try {

			signingKey = new SecretKeySpec(secretKey.getBytes("UTF-8"), "HmacSHA256");
			Mac mac = Mac.getInstance("HmacSHA256");
			mac.init(signingKey);
			byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
			encodeBase64String = Base64.getEncoder().encodeToString(rawHmac);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			encodeBase64String = e.toString();
		}

		return encodeBase64String;
	}

	/**
	 * <h1>6자리 난수 생성</h1><br>
	 * 
	 * @return String : 6자리 난수 문자열
	 */
	private String randNum() {
		Random rand = new Random();

		String num_str = "";
		for (int i = 0; i < 6; i++) {
			System.out.println(rand.nextInt(10));
			String ran = Integer.toString(rand.nextInt(10));
			num_str += ran;
		}
		System.out.println(num_str);
		return num_str;
	}
}
