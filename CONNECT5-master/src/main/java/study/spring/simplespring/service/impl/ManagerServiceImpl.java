package study.spring.simplespring.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.simplespring.model.Manager;
import study.spring.simplespring.model.User;
import study.spring.simplespring.service.ManagerService;

@Service
@Slf4j
public class ManagerServiceImpl implements ManagerService {

	@Autowired
	SqlSession sqlSession;

	@Override
	public Manager getManagerItem(Manager input) throws Exception {

		Manager result = null;
		try {
			result = sqlSession.selectOne("ManagerMapper.selectItem", input);

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
	public List<Manager> getManagerList(Manager input) throws Exception {
		List<Manager> result = null;

		try {
			result = sqlSession.selectList("ManagerMapper.selectList", input);

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
	public int getManagerCount(Manager input) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int createManager(Manager input) throws Exception {

		int result = 0;
		try {

			result = sqlSession.insert("ManagerMapper.insertItem", input);
			if (result == 0) {
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
	public int deleteManager(Manager input) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int editManager(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("ManagerMapper.updateItem", input);

			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("수정된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 수정에 실패했습니다.");
		}
		return result;
	}

	@Override
	public List<Manager> getManagerList1(Manager input) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Manager getManagerItem1(Manager input) throws Exception {
		Manager result = null;
		try {
			result = sqlSession.selectOne("ManagerMapper.selectItem1", input);

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
	public Manager getManagerItem2(Manager input) throws Exception {
		Manager result = null;
		try {
			result = sqlSession.selectOne("ManagerMapper.selectItem2", input);

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
	public Manager getManagerItem3(Manager input) throws Exception {
		Manager result = null;
		try {
			result = sqlSession.selectOne("ManagerMapper.selectItem3", input);

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
	public Manager getManagerItem4(Manager input) throws Exception {
		Manager result = null;
		try {
			result = sqlSession.selectOne("ManagerMapper.selectItem4", input);

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
	public Manager getManagerItem5(Manager input) throws Exception {
		Manager result = null;
		try {
			result = sqlSession.selectOne("ManagerMapper.selectItem5", input);

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
}