package com.sang12.blog.utils;

import java.security.MessageDigest;

/**
 * 
 * 암호관련 클래스
 * @author wo566
 *
 */
public class SecurityUtil {
	
	/**
	 * sha 256 암호화
	 * @param txt
	 * @return
	 * @throws Exception
	 */
	public static String getEncSHA256(String txt) throws Exception{
	    StringBuffer sbuf = new StringBuffer();
	     
	    MessageDigest mDigest = MessageDigest.getInstance("SHA-256");
	    mDigest.update(txt.getBytes());
	     
	    byte[] msgStr = mDigest.digest() ;
	     
	    for(int i=0; i < msgStr.length; i++){
	        byte tmpStrByte = msgStr[i];
	        String tmpEncTxt = Integer.toString((tmpStrByte & 0xff) + 0x100, 16).substring(1);
	         
	        sbuf.append(tmpEncTxt) ;
	    }
	     
	    return sbuf.toString();
	}
}
