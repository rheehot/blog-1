package com.sang12.blog.domain.board;


import java.io.Serializable;

import com.sang12.blog.utils.SecurityUtil;

import lombok.Data;

/**
 * 
 * board 댓글 
 * @author sang12
 *
 */
@Data
public class BoardReplyEntity implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 3794846291912322914L;
	
	private String reply_id;
    private String board_id;
    private String parent_id;
    private String depth;
    private String reply_content;
    private String reply_writer;
    private String reply_password;
    private String register_datetime;
    private String del_yn;
    
    public String getReply_password() {
    	try {
    		if(this.reply_password != null) {
    			return SecurityUtil.getEncSHA256(this.reply_password);
    		}else {
    			return this.reply_password;
    		}
		} catch (Exception e) {
			e.printStackTrace();
			return this.reply_password;
		}
    }
}
