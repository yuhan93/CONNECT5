package study.spring.simplespring.model;

import lombok.Data;

@Data
public class Payment {

	private int paymentid;
	private int servicetype;
	private int pmttype;
	private int servicebank;
	private String payername;
	private int card;
	private int pmtplan;
	private int memberid;
	private String username;
	private String datetime;
	private int member_lv;
	private int managerid;
	private int clear;
	
	
	private static int offset;

	private static int listCount;

	public static int getOffset() {
		return offset;
	}

	public static void setOffset(int offset) {
		Payment.offset = offset;
	}

	public static int getListCount() {
		return listCount;
	}

	public static void setListCount(int listCount) {
		Payment.listCount = listCount;
	}

}
