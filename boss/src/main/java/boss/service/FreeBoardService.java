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
	
	public void insert(FreeBoard board) {
		fdao.insert(board);
	}

	public int freeBoardListCount() {
		return fdao.listcount();
	}

	public List<FreeBoard> freeBoardList(int page) {
		return fdao.selectList(page);
	}

	public void readcount(int fId) {
		fdao.readcount(fId);		
	}

	public FreeBoard getDetail(int fId) {
		return fdao.getDetail(fId);
	}


}
