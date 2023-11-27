package boss.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import boss.model.Member;
import boss.model.OrderDetail;
import boss.model.Orders;
import boss.model.Product;
import boss.service.MasterOrdersService;
import boss.service.MasterProductService;
import boss.service.MypageService;

@Controller
public class MypageController {

	@Autowired
	private MypageService service;
	
	@Autowired
	private MasterOrdersService ms;
	
	@RequestMapping("mypage.do")
	public String doMypage(HttpSession session, Model model) {
		System.out.println("마이 페이지 이동");

		Member member = (Member) session.getAttribute("member");

		Orders orders = service.myoders(member.getmEmail()); // 내 주문내역 구해오기
		List<HashMap<String, Object>> ordersList = new ArrayList<>();

		// 주문 한 내역이 있다면
		if (orders != null) { // 주문번호가 있다면.
			System.out.println("주문 번호가 있다면??");
			// 이제 주문 상세를 뽑아올 수 있어야해
			int oid = orders.getOid();
			ordersList = ms.listProduct(oid);
			
			// 모든정보의 List
			model.addAttribute("ordersList", ordersList);
			System.out.println(ordersList);
			// 단일정보 (뷰에서 쓰기쉽게 foreach안돌려도됨)
			model.addAttribute("orders",ordersList.get(0));
			System.out.println(ordersList.get(0));

		}
		return "login/mypage";
	}

}
