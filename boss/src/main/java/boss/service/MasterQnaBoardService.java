package boss.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boss.common.PagePgm;
import boss.dao.MasterQnaBoardDao;
import boss.model.QnaBoard;
import boss.model.QnaReply;

@Service
public class MasterQnaBoardService {

	@Autowired
	MasterQnaBoardDao dao;

	// 총qna게시글 갯수
	public int totalQnaCount() {
		return dao.totalQnaCount();
	}

	// 모든 qna게시글 조회
	public List<QnaBoard> selectQnaBoardList(PagePgm page) {
		// TODO Auto-generated method stub
		return dao.selectQnaBoardList(page);
	}

	/*
	 * Qna게시글 상세정보 구하기
	 */
	public QnaBoard selectQnaDetail(int pid) {
		return dao.selectQnaDetail(pid);
	}

	// qna답글 인서트
	public int insertReply(Map<String, Object> map) {
		return dao.insertReply(map);
	}

	/*
	 * 댓글 상세정보 1개 구하기 메소드
	 */
	public QnaReply selectReplyOne(int qid) {
		return dao.selectReplyOne(qid);
	}

	public int deleteQna(List<String> idList) {
		return dao.deleteQna(idList);
	}
}
