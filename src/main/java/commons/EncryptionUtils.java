package commons;

import java.security.MessageDigest;

/**
 * <h1>암호화 관련 클래스</h1>
 * 
 * @author LSJ
 * @version 1.0.0
 */
public class EncryptionUtils {

	/**
	 * <h1>SHA-256 암호화</h1><br>
	 * 1. 입력값을 256비트(32바이트) 암호화 처리하는 알고리즘<br>
	 * 2. 암호화는 가능하지만, 복호화는 불가능<br>
	 * 3. 1바이트를 2글자로 표현하여 총 64글자 공간이 필요<br>
	 * 4. 모든 입력이 64글자 암호화 처리<br>
	 * 5. java.security 패키지<br>
	 * 
	 * @param msg : 암호화할 문자열
	 * @return String : 암호화된 64자리 문자열
	 */
	public static String sha256(String msg) throws Exception {
		MessageDigest md = MessageDigest.getInstance("SHA-256");
		md.update(msg.getBytes());
		StringBuilder builder = new StringBuilder();
		for (byte b : md.digest()) {
			builder.append(String.format("%2x", b));
		}
		return builder.toString();
	}

	/**
	 * <h1>SHA-512 암호화</h1><br>
	 * 1. 입력값을 512비트(64바이트) 암호화 처리하는 알고리즘<br>
	 * 2. 암호화는 가능하지만, 복호화는 불가능<br>
	 * 3. 1바이트를 2글자로 표현하여 총 128글자 공간이 필요<br>
	 * 4. 모든 입력이 128글자 암호화 처리<br>
	 * 5. java.security 패키지<br>
	 * 
	 * @param msg : 암호화할 문자열
	 * @return String : 암호화된 128자리 문자열
	 */
	public static String sha512(String msg) throws Exception {
		MessageDigest md = MessageDigest.getInstance("SHA-512");
		md.update(msg.getBytes());
		StringBuilder builder = new StringBuilder();
		for (byte b : md.digest()) {
			builder.append(String.format("%2x", b));
		}
		return builder.toString();
	}
}
