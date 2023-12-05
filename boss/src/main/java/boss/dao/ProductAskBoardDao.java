package boss.dao;

import org.apache.ibatis.annotations.Mapper;

import boss.model.AskBoard;

@Mapper
public interface ProductAskBoardDao {
	
	// 상품문의등록
	int askinsert(AskBoard askboard);
	
	// 상품문의 불러오기
	AskBoard askselect(int askid);
	
	// 상품 문의 업데이트
	int askupdate(AskBoard askboard);

	
	
}
