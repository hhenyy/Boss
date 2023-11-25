package boss.controller;

import java.util.Date;
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
		System.out.println(list.get(0));
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
		
		model.addAttribute("qnaBoard", qnaBoard);
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
		
		int result = service.insertReply(map);
		System.out.println("여기까지옴?");
		
		model.addAttribute("qid", qid);
		model.addAttribute("memail", memail);
		model.addAttribute("qrcontent", qrcontent);
		model.addAttribute("page", page);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("cntPerPage", cntPerPage);
		model.addAttribute("list", list);
		
		return "redirect:/masterQnaBoardList.do";
	}
	
}





















