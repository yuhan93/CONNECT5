package study.spring.simplespring.service;

import java.util.List;

import study.spring.simplespring.model.SucMatch;

public interface SucMatchService {
	
	public int addSucMatch(SucMatch input) throws Exception;
	
	public SucMatch getSucMatchItem(SucMatch sucmatch) throws Exception;
	
	public int getSucMatchItem_Id(SucMatch input) throws Exception;
	
	public int getSucMatchItem_otherMemberId(SucMatch input) throws Exception;
	
	public SucMatch getSucMatchItemStatus(SucMatch input) throws Exception;
	
	public List<SucMatch> getSucMatchItemStatus0(SucMatch input) throws Exception;
	
	public List<SucMatch> getSucMatchList(SucMatch input) throws Exception;
	
	public int editSucMatch(SucMatch input) throws Exception;
	
	public int editSucMatch1(SucMatch input) throws Exception;
	
	public int deleteSucMatch(SucMatch input) throws Exception;

	// my연-결 매칭 기록 보기 시작 ================================================== /	
	public List<SucMatch> getSucMatchListExRecord(SucMatch input) throws Exception;

	public int getSucMatchCountExRecord(SucMatch input) throws Exception;

	public SucMatch getSucMatchItemExRecord(SucMatch input) throws Exception;	
	
	public SucMatch getPrevPageExRecord(SucMatch inputPrev) throws Exception;

	public SucMatch getNextPageExRecord(SucMatch inputNext) throws Exception;	
	// my연-결 매칭 기록 보기 끝 =================================================== /		
}
