package study.spring.simplespring.service;

import java.util.List;

import study.spring.simplespring.model.Test;


public interface TestService {

	public Test getTestItem(Test input) throws Exception;
	
	public List<Test> getTestList(Test input) throws Exception;
	
	public int getTestCount(Test input) throws Exception;
	
	public int addTest(Test input) throws Exception;
	
	public int editTest(Test input) throws Exception;
	
	public int deleteTest(Test input) throws Exception;

	public List<Test> getTestList1(Test input) throws Exception;
}
