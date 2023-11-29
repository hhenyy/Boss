package boss.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import boss.common.PagingPgmHyesun;
import boss.model.FreeBoard;
import boss.model.Member;
import boss.service.FreeBoardService;
import boss.service.MemberService;

@Controller
public class FreeBoardController {

	@Autowired
	private FreeBoardService fservice;
	
	// 멤버 서비스
	@Autowired
	private MemberService service;
	//패스워드 암호화 
	@Autowired
	BCryptPasswordEncoder passwordEncoder;

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

		return "freeboard/freeBoardInsertform";
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
		PagingPgmHyesun pp = new PagingPgmHyesun(total, rowPerPage, currentPage);
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
	public String freeBoardUpdateok(@RequestParam("fPassword") String fPassword,
			                        @ModelAttribute FreeBoard board, 
			                        @RequestParam("fId") int fId,
			                        @RequestParam("page") String page, 
			                        Model model, Member member,HttpSession session) throws Exception {
		System.out.println("freeBoardUpdateok");
		
		//session공유된 member를 불러와서 mEmail가져옴
		member = (Member) session.getAttribute("member");
		String mEmail = member.getmEmail();
		System.out.println("mEmail:"+mEmail);
		
		//mEmail로 DB에 저장된 member정보를 가져옴 
		Member dbmember = service.selectOne(mEmail);
		
		// delete (삭제 여부 변경) 이 성공적으로 되었을때 조건문을 달기 위함
		int result = 0;

		//dbmember 값이 있고 , fPassword과 DB에 저장된 pwd(실제비번)과 같으면 delete
		if(dbmember != null && passwordEncoder.matches(fPassword, dbmember.getmPwd())) {
			result = fservice.update(board); // 글 update
		}else {
			result=0;
		}
			model.addAttribute("result", result);
			model.addAttribute("page", page);
			model.addAttribute("fId", fId);

		return "freeboard/freeBoardUpdateform";
	}

	// 글 삭제
	@RequestMapping("freeBoardDeleteok.do")
	public String freeBoardDeleteok(@RequestParam("fPassword") String fPassword,
			                         @RequestParam("fId") int fId,
			                        @RequestParam("page") String page, 
			                        Model model, Member member,HttpSession session) throws Exception {
		System.out.println("freeBoardDeleteok");
		
		//session공유된 member를 불러와서 mEmail가져옴
		member = (Member) session.getAttribute("member");
		String mEmail = member.getmEmail();
		System.out.println("mEmail:"+mEmail);
		
		//mEmail로 DB에 저장된 member정보를 가져옴 
		Member dbmember = service.selectOne(mEmail);
		
		// delete (삭제 여부 변경) 이 성공적으로 되었을때 조건문을 달기 위함
		int result = 0;

		//dbmember 값이 있고 , fPassword과 DB에 저장된 pwd(실제비번)과 같으면 delete
		if(dbmember != null && passwordEncoder.matches(fPassword, dbmember.getmPwd())) {
			result = fservice.delete(fId); //delete이지만 Y값으로 update

		}else {
			result=0;
		}
		model.addAttribute("result", result);
		model.addAttribute("page", page);
		
		return "freeboard/freeBoardDelete";
	}
	
	//댓글 insert
	
	//댓글 list
	


}

     