package boss.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import boss.model.Bucket;
import boss.model.Member;
import boss.service.BucketService;
import boss.service.MasterProductService;
import boss.service.OrdersService;

@Controller
public class OrdersController {

	@Autowired
	OrdersService os;
	@Autowired
	MasterProductService mps;
	@Autowired
	BucketService bs;

	/*
	 * 결제 폼 이동 메소드
	 */
	@RequestMapping("ordersForm.do")
	public String ordersForm(Bucket bucket, Model model, HttpSession session, String bid) {
		System.out.println("ordersForm");
		Member member = (Member) session.getAttribute("member");
		int result = 0;
		String msg = "";
		bucket = bs.selectBucketOne(bid);
		model.addAttribute("bucket", bucket);
		model.addAttribute("member", member);
		return "orders/ordersForm";
	}

	@RequestMapping("ordersCheck.do")
	public String ordersCheck(Bucket bucket, Model model) {

		return "orders/ordersCheck";
	}
}
