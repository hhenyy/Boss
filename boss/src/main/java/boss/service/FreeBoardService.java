package boss.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boss.dao.FreeBoardDao;
import boss.model.FreeBoard;

@Service
public class FreeBoardService {

	@Autowired
	private FreeBoardDao fdao;
	
	public int insert(FreeBoard board) {
		return fdao.insert(board);
	}

	public int freeBoardListCount(FreeBoard board) {
		return fdao.listcount(board);
	}

	public List<FreeBoard> freeBoardList(FreeBoard board) {
		return fdao.selectList(board);
	}

	public void readcount(int fId) {
		fdao.readcount(fId);		
	}

	public FreeBoard getDetail(int fId) {
		return fdao.getDetail(fId);
	}

	public void update(FreeBoard board) {
		fdao.update(board);
		
	}

	public void delete(int fId) {
		fdao.delete(fId);
	}


}
