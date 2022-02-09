package study.spring.simplespring.model;

import lombok.Data;

@Data
public class Board {
	private int BoardId;
	private String Title;
	private String Content;
	private String CreationDate;
	private String ContentImg;
	private int Category;
	private int MemberId;
	private String UserId;
	private String UserName;
	private int isadmin;
	private int viewcount;
	private int Reply_Ok;
	
	/** LIMIT 절에서 사용할 조회 시작 위치 */
	private static int offset;
	
	/** LIMIT 절에서 사용할 조회할 데이터 수 */
	private static int listCount;

	public static int getOffset() {
		return offset;
	}

	public static void setOffset(int offset) {
		Board.offset = offset;
	}

	public static int getListCount() {
		return listCount;
	}

	public static void setListCount(int listCount) {
		Board.listCount = listCount;
	}
}
