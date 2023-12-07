package boss.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import boss.model.AskBoard;
import boss.model.Member;
import boss.model.Product;
import boss.service.ProductAskBoardService;

@Controller
public class ProductAskBoardController {

	@Autowired
	private ProductAskBoardService service;

	// 문의 작성페이지로 이동
	@RequestMapping("productAskBoardInsertForm.do")
	public String productAskBoardInsertForm(Model model, String pid, HttpSession session) {

		// 세션 불러오기
		Member member = (Member) session.getAttribute("member");

		String mEmail = member.getmEmail();
		System.out.println("세션 이메일 :" + mEmail);

		// 작성하는 실시간 날짜
		Date date = new Date();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		String askDate = sdf.format(date);
		
	
		
		model.addAttribute("pid",pid);
		model.addAttribute("mEmail", mEmail);
		model.addAttribute("askDate", askDate); // 오늘 날짜 띄우기
	

		return "./product/askBoard/productAskBoardInsertForm";
	}
	// 문의 작성 체크
	@RequestMapping("productAskBoardInsertCheck.do")
	public String productAskBoardInsertCheck(Model model,String pid,HttpSession session,AskBoard askboard) {
		System.out.println("productAskBoardInsertCheck 여기는 왔따.");
		
		int result = 0;
		
		Member member = (Member)session.getAttribute("member");
		String mEmail = member.getmEmail();
		

		
		result = service.askinsert(askboard);
		
		model.addAttribute("mEmail", mEmail);
		model.addAttribute("result", result);
		model.addAttribute("pid", pid);
		
		return"./product/askBoard/productAskBoardInsertCheck";
	}
	// 문의 상세보기
	@RequestMapping("productAskBoardSelectForm.do")
	public String productAskBoardSelectForm(Model model, AskBoard askboard,int pid,Product product,HttpSession session) {
		System.out.println("productAskBoardSelectForm:" + "문의 상세 들어왔찌");
		
		askboard = service.askselect(askboard.getAskid());
		
		Date date = new Date();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		String askDate = sdf.format(date);
	
		
		model.addAttribute("askboard", askboard);
		model.addAttribute("pid", product.getPid());
		model.addAttribute("askDate", askDate);
		
		return"./product/askBoard/productAskBoardSelectForm";
	}
	
	// 문의 수정폼 이동
	@RequestMapping("productAskBoardUpdateForm.do")
	public String productAskBoardUpdateForm(Model model, AskBoard askboard, Product product) {
		System.out.println("productAskBoardUpdateForm:" + "문의 수정폼 이동");
		
		
		// 날짜 띄우기
		Date date = new Date();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		String askDate = sdf.format(date);
		
			
		model.addAttribute("askboard", askboard);
		model.addAttribute("pid", product.getPid());
		model.addAttribute("askDate", askDate);
		return"./product/askBoard/productAskBoardUpdateForm";
	}
	// 문의 수정
	@RequestMapping("productAskBoardUpdateCheck.do")
	public String productAskBoardUpdateCheck(Model model, AskBoard askboard,Product product) {
		System.out.println("productAskBoardUpdateCheck");
		
		int result = 0;
		
		result = service.askboardupdate(askboard);
		
		model.addAttribute("result", result);
		model.addAttribute("askboard", askboard);
		model.addAttribute("askid", askboard.getAskid());
		model.addAttribute("pid", askboard.getAskid());
		
		
		return "./product/askBoard/productAskBoardUpdateCheck";
		
	}
		
	}


