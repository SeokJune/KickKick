package commons;

/**
 * <h1>XSS (Cross Site Scripting) 관련 클래스</h1>
 * 
 * @author LSJ
 * @version 1.0.0
 */
public class XSSUtils {

	/**
	 * <h1>XSS 인코딩 메서드</h1><br>
	 * 입력된 특수문자를 문자로 인코딩<br>
	 * < => &lt;<br>
	 * > => &gt;<br>
	 * & => &amp;<br>
	 * ' => &#x27;<br>
	 * " => &quot;<br>
	 * ( => &#40;<br>
	 * ) => &#41;<br>
	 * / => &#x2F;<br>
	 * 
	 * @param str : 인코딩할 문자열
	 * @return String : 특수 문자를 인코딩 처리한 문자열
	 */
	public static String xssFilter(String str) {
		String result = "";

		result = str;
		result = result.replaceAll("[<]", "&lt;");
		result = result.replaceAll("[>]", "&gt;");
		result = result.replaceAll("[&]", "&amp;");
		result = result.replaceAll("[']", "&#x27;");
		result = result.replaceAll("[\"]", "&quot;");
		result = result.replaceAll("[(]", "&#40;");
		result = result.replaceAll("[)]", "&#41;");
		result = result.replaceAll("[/]", "&#x2F;");

		return result;
	}

	/**
	 * <h1>XSS 디코딩 메서드</h1><br>
	 * 입력된 문자를 특수문자로 디코딩<br>
	 * < <= &lt;<br>
	 * > <= &gt;<br>
	 * & <= &amp;<br>
	 * ' <= &#x27;<br>
	 * " <= &quot;<br>
	 * ( <= &#40;<br>
	 * ) <= &#41;<br>
	 * / <= &#x2F;<br>
	 * 
	 * @param str : 디코딩할 문자열
	 * @return String : 특수 문자로 디코딩 처리한 문자열
	 */
	public static String xssDecoding(String str) {
		String result = "";

		result = str;
		result = result.replaceAll("&lt;", "[<]");
		result = result.replaceAll("&gt;", "[>]");
		result = result.replaceAll("&amp;", "[&]");
		result = result.replaceAll("&#x27;", "[']");
		result = result.replaceAll("&quot;", "[\"]");
		result = result.replaceAll("&#40;", "[(]");
		result = result.replaceAll("&#41;", "[)]");
		result = result.replaceAll("&#x2F;", "[/]");

		return result;
	}
}
