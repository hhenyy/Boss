package boss.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import boss.service.FreeBoardService;

@Controller
public class FreeBoardController {
	
	
	@Autowired
	private FreeBoardService fservice;
	
	// 자유게시판 이동
	@RequestMapping("freeBoard.do")
	public String freeBoard() {
		System.out.println("freeBoard");
		return "freeboard/freeBoard";
	}

}