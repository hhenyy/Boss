package boss.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boss.dao.ProductAskBoardDao;
import boss.model.AskBoard;

@Service
public class ProductAskBoardService {

	@Autowired
	ProductAskBoardDao dao;
	
	// 상품문의 등록
	public int askinsert(AskBoard askboard) {
		return dao.askinsert(askboard);
	}
	
	// 상품 문의 불러오기
	public AskBoard askselect(int askid) {
		return dao.askselect(askid);
	}
}
