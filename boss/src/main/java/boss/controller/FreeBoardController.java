package boss.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import boss.model.FreeBoard;
import boss.service.FreeBoardService;

@Controller
public class FreeBoardController {

	@Autowired
	private FreeBoardService fservice;
	
	// 자유게시판 글등록폼 이동
	@RequestMapping("freeBoardInsertform.do")
	public String freeBoardInsertform() {
		System.out.println("freeBoardInsertform");
		return "freeboard/freeBoardInsertform";
	}
	
	// 자유게시판 글등록 ok (수정 요망!!! insert가 안됨요)
	@RequestMapping("freeBoardInsertok.do")
	public String freeBoardInsertok(@ModelAttribute FreeBoard board) throws Exception {
		//@ModelAttribute 을 이용해서 form에서 넘어온 값을 dto객체로 값을 받고 
		//name값이 일치되면 set메소드로 값이 저장됨
		System.out.println("freeBoardInsertok");
		
		fservice.insert(board); //글 insert
		
		return "redirect:/freeBoardList.do";
	}
	
	// 자유게시판 목록  (수정 요망!!!)
	@RequestMapping("freeBoardList.do")
	public String freeBoardList(Model model, HttpServletRequest request) {
		System.out.println("freeBoardList");

		List<FreeBoard> boardlist = new ArrayList<FreeBoard>();

		int page = 1; // 기본 설정페이지 1
		int limit = 10; // 한 화면에 출력할 글갯수

		if (request.getParameter("page") != null) { // page값이 있으면
			page = Integer.parseInt(request.getParameter("page"));
		}

		// 글 갯수
		int listcount = fservice.freeBoardListCount();
		System.out.println("listcount:"+listcount);

		// 페이지 번호를 dao에 전달
		boardlist = fservice.freeBoardList(page);
		System.out.println("boardlist:"+boardlist);
		
		// 총페이지
		int maxpage = listcount / limit + ((listcount % limit == 0) ? 0 : 1);

		int startpage = ((page - 1) / 10) * limit + 1; // 1, 11, 21..
		int endpage = startpage + 10 - 1; // 10, 20, 30..

		if (endpage < maxpage)
			endpage = maxpage;
		
		model.addAttribute("page", page);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("listcount", listcount);
		model.addAttribute("boardlist", boardlist);

		return "freeboard/freeBoardList";
	}
	
	//조회수증가, 게시판 상세페이지, 수정폼,삭제폼에 답변폼 내용 출력
	 @RequestMapping("freeBoardDetail.do")
	 public String freeBoardUpdate(@RequestParam("fId") int fId,
	                               @RequestParam("page") String page,
	                               @RequestParam("state") String state, Model model) {
	 System.out.println("freeBoardDetail");
	 
	 //state로 설정한곳 판별 //state가 detail과 같다면(목록에서 제목클릭시 상세페이지로 이동)
	 if(state.equals("detail")) { 
		 fservice.readcount(fId); //조회수 증가 }
	 }

     FreeBoard freeBoard=fservice.getDetail(fId);
	 
	 model.addAttribute("detail", freeBoard); 
	 model.addAttribute("page", page);
	 
	 //state가 detail과 같다면(목록에서 제목클릭시 상세페이지로 이동) if(state.equals("detail")) {
	 if(state.equals("detail")) { 
	 return "freeboard/freeBoardDetail"; 
	 }else if(state.equals("update")) { //수정폼
	 return "freeboard/freeBoardUpdateform"; 
	 }else if(state.equals("delete")) { //삭제폼 
	 return "freeboard/freeBoardDelete"; 
	 } //답변컬럼추가후 답변폼 이동 추가하기 return
	 return null; }

	
	//글 수정
	 
	//글 삭제 
	
	

}