package boss.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import boss.common.PagePgm;
import boss.model.QnaBoard;
import boss.model.QnaReply;

@Mapper
public interface MasterQnaBoardDao {

	// 총qna게시글 갯수
	int totalQnaCount();

	// 모든 qna게시글 조회
	List<QnaBoard> selectQnaBoardList(PagePgm page);

	// Qna 게시글 상세정보 구하기
	QnaBoard selectQnaDetail(int pid);

	// qna 답글 저장
	int insertReply(Map<String, Object> map);

	// 댓글 상세 1개 구하기 
	QnaReply selectReplyOne(int qid);

}
