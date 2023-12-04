package boss.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	 * 결제하기 이동 메소드
	 */
	@RequestMapping("ordersForm.do")
	public String ordersForm(Member member, Model model, String bid, String mEmail) {
		
		Bucket bucket = bs.selectBucketOne(bid);
		model.addAttribute("bucket", bucket);
		
		if(bucket != null) {
			System.out.println("bucket : " + bucket);
			System.out.println("bname : " + bucket.getBname());
			System.out.println("mEmail : " + member.getmEmail());
			System.out.println("mName : " + member.getmName());
			System.out.println("mPhone : " + member.getmPhone());
			System.out.println("mAddress : " + member.getmAddress());
			System.out.println("mPost : " + member.getmPost());
			System.out.println("bprice : " + bucket.getBprice());
			System.out.println("bcount : " + bucket.getBcount());
		} else {
			System.out.println("bucket null : " + bucket);
		}
		
		model.addAttribute("member", member);
		
		return "orders/ordersForm";
	}

	@RequestMapping("ordersCheck.do")
	public String ordersCheck(Bucket bucket, Model model) {

		return "orders/ordersCheck";
	}
	
	/*
	 * 결제 폼 이동 메소드
	 */
	@RequestMapping("moveOrdersForm.do")
	public String moveOrdersForm(Bucket bucket, Model model, HttpSession session, String bid) {
		
		System.out.println("ordersForm");
		Member member = (Member) session.getAttribute("member");
		int result = 0;
		String msg = "";
		bucket = bs.selectBucketOne(bid);
		model.addAttribute("bucket", bucket);
		model.addAttribute("member", member);
		
		return "./orders/moveOrdersForm";
	}
	
	/*
	 * 주문 정보 db 저장
	 */
	@ResponseBody
	@RequestMapping("orderResult.do")
	public Map<String,Object> orderResult(String mEmail, String bid) {
		
		System.out.println("mEmail : " + mEmail);
		System.out.println("bid : " + bid);
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("bid", bid);
		map.put("mEmail", mEmail);
		
		return map;
	}
}










