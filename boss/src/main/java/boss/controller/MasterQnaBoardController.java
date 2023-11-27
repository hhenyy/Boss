package boss.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import boss.common.PagePgm;
import boss.common.Search;
import boss.model.Product;
import boss.model.QnaBoard;
import boss.model.QnaReply;
import boss.service.MasterQnaBoardService;

@Controller
public class MasterQnaBoardController {

	@Autowired
	MasterQnaBoardService service;
	
	/*
	 * qna게시판 이동 메소드 + 페이징 처리
	 */
	@RequestMapping("masterQnaBoardList.do")
	public String masterQnaBoardList(PagePgm page, Model model, 
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPage", required = false) String cntPerPage) {
		System.out.println("masterQnaBoardList");
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}

		// 총qna게시글 갯수
		int totalQnaCount = service.totalQnaCount();
		System.out.println(totalQnaCount + "개");

		page = new PagePgm(totalQnaCount, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));

		// 페이징 처리된 리스트
		List<QnaBoard> list = service.selectQnaBoardList(page);
	
		model.addAttribute("page", page);
		model.addAttribute("list", list);
		return "master/qnaBoard/masterQnaBoardList";
	}
	
	/*
	 * qna 상세보기 페이지 이동 메소드
	 */
	@RequestMapping("masterQnaBoardDetail.do")
	public String masterQnaBoardDetail(PagePgm page, String qid, Model model) {
		System.out.println("masterQnaBoardDetail");
		System.out.println("qid : " + qid);
		
		int id = Integer.parseInt(qid);
		
		QnaBoard qnaBoard = service.selectQnaDetail(id);
		System.out.println("id : " + id);
		QnaReply qnaReply = service.selectReplyOne(id);
		
		model.addAttribute("qnaBoard", qnaBoard);
		model.addAttribute("qnaReply", qnaReply);
		model.addAttribute("page", page);
		
		return "master/qnaBoard/masterQnaBoardDetailForm";
	}
	 
	/*
	 * qna게시글 댓글 인서트
	 */
	@RequestMapping("masterQnaReplyInsert.do")
	public String masterQnaReplyInsert(PagePgm page, Model model, HttpServletRequest request, @RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPage", required = false) String cntPerPage) {
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}
		
		int totalQnaCount = service.totalQnaCount();
		
		page = new PagePgm(totalQnaCount, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		System.out.println("masterQnaReplyInsert");
		System.out.println("qid22 : " + request.getParameter("qid"));
		int qid = Integer.parseInt(request.getParameter("qid"));
		String memail = request.getParameter("memail");
		String qrcontent = request.getParameter("qrcontent"); 
		
		System.out.println("qid : " + qid);
		System.out.println("memail : " + memail);
		System.out.println("qrcontent : " + qrcontent);
		 
		Map<String,Object> map = new HashMap<String,Object>(); 
		map.put("qid", qid);
		map.put("memail", memail);
		map.put("qrcontent", qrcontent);
		List<QnaBoard> list = service.selectQnaBoardList(page);
		
		// 댓글 저장
		int inset = service.insertReply(map);
		// qnaBoard 답변 상태 'Y'변겅
		int update = service.updateQnaBoardReplyYn(qid);
		System.out.println("update성공 : " + update);
		
		System.out.println("여기까지옴?");
		QnaReply qnaReply = service.selectReplyOne(qid);
		
		model.addAttribute("qid", qid);
		model.addAttribute("memail", memail);
		model.addAttribute("qrcontent", qrcontent);
		model.addAttribute("qnaReply", qnaReply);
		model.addAttribute("page", page);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("cntPerPage", cntPerPage);
		model.addAttribute("list", list);
		
		return "redirect:/masterQnaBoardList.do";
	}
	
	/*
	 * qna답글 수정 메소드
	 */
	@RequestMapping("masterQnaBoardUpdate.do")
	public String masterQnaBoardUpdate(String qid, String qrcontent, Model model) {
		
		int id = Integer.parseInt(qid);
		
		QnaReply qnaReply = service.selectReplyOne(id);
		System.out.println(qnaReply.getQrid());
		System.out.println(qnaReply.getQrcontent());
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("id", id);
		map.put("qrcontent", qrcontent);
		
		int result = service.updateQnaReply(map);
		
		return "redirect:/masterQnaBoardList.do";
	}
	
	/*
	 * qna 게시글 삭제('Y')업데이트 메소드
	 */
	@RequestMapping("masterQnaBoardDelete.do")
	public String masterQnaBoardDelete(String qid, Model model) {
		
		int id = Integer.parseInt(qid);
		int result = service.deleteQnaBoard(id);
		
		return "redirect:/masterQnaBoardList.do";
	}
	
	/*
	 * qna게시글 검색 메소드
	 */
	@RequestMapping("masterQnaBoardSearch.do")
	public String masterQnaBoardSearch(Search search, Model model) {
		
		System.out.println(search.getKeyword());
		System.out.println(search.getSearchtype());
		
		if(search.getSearchtype().equals("qnayn")) {
			search.setKeyword(search.getKeyword().toUpperCase());
		}
		
		if(search.getKeyword() != "" && search.getSearchtype() != "") {
			List<QnaBoard> list = service.searchQnaList(search);
			System.out.println(list);
			model.addAttribute("list", list);
			//return "./master/product/masterProductList";
		}
		if(search.getKeyword() == "" && search.getSearchtype() != "") {
			model.addAttribute("type", "notKey");
			model.addAttribute("msg", "검색어를 입력해 주세요.");
			return "./master/product/masterMoveProductList";
		}
		if(search.getKeyword() != "" && search.getSearchtype() == "") {
			model.addAttribute("type", "notType");
			model.addAttribute("msg", "검색타입을 선택해 주세요.");
			return "./master/product/masterMoveProductList";
		}
		if(search.getKeyword() == "" && search.getSearchtype() == "") {
			model.addAttribute("type", "notKeynotType");
			model.addAttribute("msg", "검색타입 & 검색어를 입력해 주세요.");
			return "./master/product/masterMoveProductList";
		}
		
		return "./master/qnaBoard/masterQnaBoardList";
	}
	
}





















