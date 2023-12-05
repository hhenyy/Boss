package boss.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import boss.model.Likes;
import boss.model.Member;
import boss.service.LikeService;

@Controller
public class LikeController {

	@Autowired
	private LikeService lservice;

	//jason으로 받아서 fID mEmail 각각받을지 ?>
	@RequestMapping("toggleLike.do")
	public @ResponseBody int toggleLike(@RequestParam("fId") int fId, String mEmail) {
		System.out.println("toggleLike");
		int result = lservice.toggleLike(fId, mEmail);
		return result;

	}
}
