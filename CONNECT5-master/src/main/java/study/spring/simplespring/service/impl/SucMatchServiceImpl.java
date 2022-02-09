package study.spring.simplespring.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.simplespring.model.SucMatch;
import study.spring.simplespring.service.SucMatchService;


@Service
@Slf4j
public class SucMatchServiceImpl implements SucMatchService {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public int addSucMatch(SucMatch input) throws Exception {
		int result = 0;

		try {
			
			result = sqlSession.insert("SucMatchMapper.insertSucMatchItem", input);

			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");
		}

		return result;
	}

	@Override
	public SucMatch getSucMatchItem(SucMatch input) throws Exception {
		SucMatch result = null;
		try {
			result = sqlSession.selectOne("SucMatchMapper.selectItem", input);

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
	public int getSucMatchItem_Id(SucMatch input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("SucMatchMapper.selectItem_memberId", input);
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
	public int getSucMatchItem_otherMemberId(SucMatch input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("SucMatchMapper.selectItem_otherMemberId", input);
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
	public List<SucMatch> getSucMatchList(SucMatch input) throws Exception {
		List<SucMatch> result = null;

		try {
			
			result = sqlSession.selectList("SucMatchMapper.selectList", input);

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
	public int editSucMatch(SucMatch input) throws Exception {
		 int result = 0;
			
			try {
				result = sqlSession.update("SucMatchMapper.updateItem", input);
				
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
	public int editSucMatch1(SucMatch input) throws Exception {
		 int result = 0;
			
			try {
				result = sqlSession.update("SucMatchMapper.updateDisItem", input);
				
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

	public SucMatch getSucMatchItemStatus(SucMatch input) throws Exception {
		SucMatch result = null;
		try {
			result = sqlSession.selectOne("SucMatchMapper.select1", input);

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
	public List<SucMatch> getSucMatchItemStatus0(SucMatch input) throws Exception {
		List<SucMatch> result = null;
		try {
			result = sqlSession.selectList("SucMatchMapper.select0", input);

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
		

	public int deleteSucMatch(SucMatch input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.delete("SucMatchMapper.deleteItem", input);

			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("삭제된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 삭제에 실패했습니다.");
		}

		return result;
	}

	// my연-결  매칭 기록 보기 시작 ================================================== /	
	@Override
	public List<SucMatch> getSucMatchListExRecord(SucMatch input) throws Exception {
		List<SucMatch> result = null;

		try {
			
			result = sqlSession.selectList("SucMatchMapper.selectListExRecord", input);

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
	public int getSucMatchCountExRecord(SucMatch input) throws Exception {
		int result = 0;
        
        try {
            result = sqlSession.selectOne("SucMatchMapper.selectCountAllExRecord", input);
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }
        
        return result;
	}

	@Override
	public SucMatch getSucMatchItemExRecord(SucMatch input) throws Exception {
		SucMatch result = null;

		try {
			result = sqlSession.selectOne("SucMatchMapper.selectItemExRecord", input);

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
	public SucMatch getPrevPageExRecord(SucMatch inputPrev) throws Exception {
		SucMatch result = null;

		try {
			result = sqlSession.selectOne("SucMatchMapper.selectPrevPageExRecord", inputPrev);
			
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("이전글이 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}

	@Override
	public SucMatch getNextPageExRecord(SucMatch inputNext) throws Exception {
		SucMatch result = null;

		try {
			result = sqlSession.selectOne("SucMatchMapper.selectNextPageExRecord", inputNext);

		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("다음글이 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}
	// my연-결  매칭 기록 보기 끝 ================================================== /

}

