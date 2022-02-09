package study.spring.simplespring.model;

import lombok.Data;

@Data
public class ReqMatch {
	private int ReqMatchId;
	private String Select_Date;
	private int MemberId;
	private String Choose_Date;
	private String start;
	private int Gender;
	private String title;
	private String UserName;
	private int ReqSpService;

	
	private static int offset;

	private static int listCount;

	public static int getOffset() {
		return offset;
	}

	public static void setOffset(int offset) {
		ReqMatch.offset = offset;
	}

	public static int getListCount() {
		return listCount;
	}

	public static void setListCount(int listCount) {
		ReqMatch.listCount = listCount;
	}
}
