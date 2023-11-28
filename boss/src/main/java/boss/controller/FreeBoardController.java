package boss.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import boss.common.PagingPgmf;
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

	// 자유게시판 글등록 ok 
	@RequestMapping("freeBoardInsertok.do")
	public String freeBoardInsertok(@ModelAttribute FreeBoard board, Model model) throws Exception {
		// @ModelAttribute 을 이용해서 form에서 넘어온 값을 dto객체로 값을 받고
		// name값이 일치되면 set메소드로 값이 저장됨
		System.out.println("freeBoardInsertok");

		int result=fservice.insert(board); // 글 insert
		model.addAttribute("result", result);

		return "freeboard/freeBoardInsertok";
	}

	// 자유게시판 목록 
	@RequestMapping("freeBoardList.do")
	public String freeBoardList(String page, FreeBoard board, Model model) {
		System.out.println("freeBoardList");

		final int rowPerPage = 10;	// 화면에 출력할 데이터 갯수
		if (page == null || page.equals("")) {
			page = "1";
		}
		int currentPage = Integer.parseInt(page); // 현재 페이지 번호
		
		// 총 데이터 갯수 (검색기능 추가)
		int total = fservice.freeBoardListCount(board); 
		
		//startRow: 한 페이지 화면 출력 시작번호, endRow: 한 페이지 화면출력 끝번호
		int startRow = (currentPage - 1) * rowPerPage + 1; //1,11,21..
		int endRow = startRow + rowPerPage - 1; //10,20,30,...
		
		//PagingPgmf : paging dto 
		PagingPgmf pp = new PagingPgmf(total, rowPerPage, currentPage);
		board.setStartRow(startRow);
		board.setEndRow(endRow);

		int no = total - startRow + 1;		// 화면 출력 번호
		
		List<FreeBoard> list = fservice.freeBoardList(board);
		
		model.addAttribute("list", list);
		model.addAttribute("no", no);
		model.addAttribute("pp", pp);
		// 검색
		model.addAttribute("search", board.getSearch());
		model.addAttribute("keyword", board.getKeyword());
		
		return "freeboard/freeBoardList";
	}

	// 조회수증가, 게시판 상세페이지, 수정폼,삭제폼에 답변폼 내용 출력
	@RequestMapping("freeBoardDetail.do")
	public String freeBoardUpdate(@RequestParam("fId") int fId, @RequestParam("page") String page,
			@RequestParam("state") String state, Model model) {
		System.out.println("freeBoardDetail");

		// state로 설정한곳 판별 //state가 detail과 같다면(목록에서 제목클릭시 상세페이지로 이동)
		if (state.equals("detail")) {
			fservice.readcount(fId); // 조회수 증가 }
		}

		FreeBoard board = fservice.getDetail(fId);

		model.addAttribute("detail", board);
		model.addAttribute("page", page);

		// state가 detail과 같다면(목록에서 제목클릭시 상세페이지로 이동) if(state.equals("detail")) {
		if (state.equals("detail")) {
			return "freeboard/freeBoardDetail";
		} else if (state.equals("update")) { // 수정폼
			return "freeboard/freeBoardUpdateform";
		} else if (state.equals("delete")) { // 삭제폼
			return "freeboard/freeBoardDelete";
		} // 답변컬럼추가후 답변폼 이동 추가하기 return
		return null;
	}

	// 글 수정
	@RequestMapping("freeBoardUpdateok.do")
	public String freeBoardUpdateok(@ModelAttribute FreeBoard board, 
			                        @RequestParam("page") String page, 
			                        Model model) throws Exception {
		System.out.println("freeBoardUpdateok");
		int result=0;
		
		
		fservice.update(board); // 글 insert

		return "redirect:/freeBoardDetail.do?fId=" + board.getfId()
		+ "&page=" + page + "state=detail";
	}

	// 글 삭제
	@RequestMapping("freeBoardDeleteok.do")
	public String freeBoardDeleteok(@RequestParam("fId") int fId,
			                        @RequestParam("page") String page, 
			                        Model model) throws Exception {
		//@RequestParam("page") String page, 
		System.out.println("freeBoardUpdateok");
		int result=0;
		
	
       fservice.delete(fId); // 글 delete

		return "redirect:/freeBoardDetail.do?page=" + page;
	}
}