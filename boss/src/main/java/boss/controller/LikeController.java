package boss.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import boss.model.FreeBoard;
import boss.model.Likes;
import boss.service.FreeBoardService;
import boss.service.LikeService;

@Controller
public class LikeController {

	@Autowired
	private FreeBoardService fservice;
	
	@Autowired
	private LikeService lservice;

	//상세페이지에서 하트눌렀던 로그인 유저의 하트 유무 찾기
	@RequestMapping("hasLike.do")
	public String hasLike(int fId,String mEmail,Model model) {
		Likes like = lservice.findLike(fId, mEmail);
		
		model.addAttribute("like", like);
		return "freeboard/like";
	}
	
	
	
	@RequestMapping("toggleLike.do")
	public @ResponseBody Map<String, Object> toggleLike(@RequestParam("fId") int fId, 
										String mEmail, 
										String likeDrop,
										Model model) {
		System.out.println("toggleLike");
		System.out.println("likeDrop:"+ likeDrop);
		System.out.println("mEmail:"+ mEmail);
		
		FreeBoard board = new FreeBoard();
		board.setmEmail(mEmail);
		board.setfId(fId);
		
		// 부모 테이블의 좋아요 갯수 증가/감소
		if(likeDrop.equals("N")) {		// 좋아요 증가 (N=>Y) 
			System.out.println("likeDrop:"+ likeDrop);
			fservice.inUpdate(board);			
		}else {							// 좋아요 감소 (Y=>N)
			System.out.println("likeDrop:"+ likeDrop);
			fservice.deUpdate(board);
		}
		
		int result = lservice.toggleLike(fId, mEmail, likeDrop);
		System.out.println("result:"+ result);		
		
		FreeBoard fboard = fservice.getDetail(fId);
		
		Likes like = lservice.findLike(fId, mEmail);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", result);
		map.put("fboard", fboard);
		map.put("like", like);
		
		
		return map;

	}
}
