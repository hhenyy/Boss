package boss.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import boss.service.LikeService;

@Controller
public class LikeController {

	@Autowired
	private LikeService lservice;

	@RequestMapping("toggleLike.do")
	public @ResponseBody int toggleLike(@RequestParam("fId") int fId, String mEmail, Model model) {
		System.out.println("toggleLike");
		int result = lservice.toggleLike(fId, mEmail);
		//model.addAttribute("result",result);
		
		//좋아요 갯수
//		int countLike=lservice.countLike(fId);
//		System.out.println("countLike:"+countLike);
//		model.addAttribute("countLike",countLike);

		
		//return "freeboard/freeBoardDetail";
		return result;

	}
}
