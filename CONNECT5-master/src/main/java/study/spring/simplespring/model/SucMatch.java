package study.spring.simplespring.model;

import lombok.Data;

@Data
public class SucMatch {
	private int SucMatchId;
	private int Status;
	private int ReqMatchId;
	private int MemberId;

	private int sucMemberId;
	private int myMemberId;
	private int partnerMemberId;
	private String UserName;
	
	private String myUserName;
	private String partnerUserName;
	private int IsMarried;
	private int MyMarry;
	private int PartnerMarry;
	private String myMobile;
	private String partnerMobile;
	private String myEdu_lv;
	private String partnerEdu_lv;
	private int myGender;
	private int partnerGender;
	private String myJob;
	private String partnerJob;
	private String myBld;
	private String partnerBld;
	private String myLoc;
	private String partnerLoc;
	private String mySal;
	private String partnerSal;
	private String myImg;
	private String partnerImg;
	private String PartnerState;
	private String myState;
	private int myLv;
	private int partnerLv;
	private String PartnerBirth;
	private String myBirth;
	

	private String Mobile;

	private String TEL;

	private String Email;

	private String PostCode;

	private String BasicAddress;

	private String StateAddress;

	private String DetailAddress;

	private String Join_Date;

	private int isadmin;

	private int Member_Lv;

	private String Job;

	private String Edu_Lv;

	private String User_Img;

	private String Height;

	private String BldType;

	private String Date_Loc;

	private String Style;

	private String Personality;

	private String Sal_Annual;

	private String Date_Count;
	
	private String Date_Rest;
	
	private int OtherMemberId;
	
	private String BirthDate;


	/** LIMIT 절에서 사용할 조회 시작 위치 */
	private static int offset;
	
	/** LIMIT 절에서 사용할 조회할 데이터 수 */
	private static int listCount;

	public static int getOffset() {
		return offset;
	}

	public static void setOffset(int offset) {
		SucMatch.offset = offset;
	}

	public static int getListCount() {
		return listCount;
	}

	public static void setListCount(int listCount) {
		SucMatch.listCount = listCount;	
	}
}
