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

	public int update(FreeBoard board) {
		return fdao.update(board);
		
	}

	public int delete(int fId) {
		return fdao.delete(fId);
	}

	public void inUpdate(FreeBoard board) {
		 fdao.inUpdate(board);
	}

	public void deUpdate(FreeBoard board) {
		 fdao.deUpdate(board);		
	}



}
