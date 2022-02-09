package study.spring.simplespring.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.simplespring.model.Test;
import study.spring.simplespring.service.TestService;

@Service
@Slf4j
public class TestServiceImpl implements TestService {

	@Autowired
	SqlSession sqlSession;

	@Override
	public Test getTestItem(Test input) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Test> getTestList(Test input) throws Exception {
		List<Test> result = null;

		try {
			result = sqlSession.selectList("TestMapper.selectList", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public List<Test> getTestList1(Test input) throws Exception {
		List<Test> result = null;

		try {
			result = sqlSession.selectList("TestMapper.selectList1", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int getTestCount(Test input) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int addTest(Test input) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int editTest(Test input) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteTest(Test input) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
