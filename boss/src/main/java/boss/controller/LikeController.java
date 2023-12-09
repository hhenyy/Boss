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
	
	
	@RequestMapping("toggleLike.do")
	public @ResponseBody Map<String, Object> toggleLike(@RequestParam("fId") int fId, 
										String mEmail, 
										Model model) {
		System.out.println("toggleLike");
		System.out.println("mEmail:"+ mEmail);
		
		//상세페이지에서 하트눌렀던 로그인 유저의 하트 유무 찾기
		Likes like = lservice.findLike(fId, mEmail);		
		String likeDrop=like.getLikeDrop();
		
		FreeBoard board = new FreeBoard();
		board.setmEmail(mEmail);
		board.setfId(fId);
		
		//하트 insert or N/Y update
		System.out.println("likeDrop:"+ likeDrop);
		likeDrop = lservice.toggleLike(fId, mEmail, likeDrop);
		like.setLikeDrop(likeDrop);
		System.out.println("changelikeDrop:"+ like.getLikeDrop());
		
		int countLike = lservice.countLike(fId);	
		
		// 부모 테이블의 좋아요 변경
		System.out.println("fLike(before):"+ board.getfLike());
		board.setfLike(countLike);
		fservice.setLike(board);
		System.out.println("fLike(after):"+ board.getfLike());
		
		FreeBoard fboard = fservice.getDetail(fId);
//		fboard.setfLike(countLike);
	//	Likes like = lservice.findLike(fId, mEmail);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("fboard", fboard);
		map.put("like", like);
		
		
		return map;

	}
}
