package study.spring.simplespring.model;

import lombok.Data;

@Data
public class Reply {
	private int ReplyId;
	private String Re_Title;
	private String Re_Content;
	private String Re_CreationDate;
	private int BoardId;
	private int MemberId;
	private String UserName;
	private int Reply_Ok;
}
