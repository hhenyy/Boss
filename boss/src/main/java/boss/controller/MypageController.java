package boss.controller;

import java.util.ArrayList;
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
	MasterOrdersService ms;

	@Autowired
	MasterProductService ps;
	
	@RequestMapping("mypage.do")
	public String doMypage(HttpSession session, Model model) {
		System.out.println("마이 페이지 이동");
		
		Member member = (Member) session.getAttribute("member");
		
		Orders orders = service.myoders(member.getmEmail());	// 내 주문내역 구해오기
		
		List<Product> plist = new ArrayList<Product>();
		
		
		// 주문 한 내역이 있다면
		if (orders != null) { // 주문번호가 있다면.
			System.out.println("시작 진입");
			
			int stilloid = orders.getOid(); // oid 구해오기
			String oid = stilloid + ""; // String 형으로 oid 바꾸기

			List<OrderDetail> odlist = ms.odList(oid);
			System.out.println("odlist 가 널인가 : " + odlist);
			if (odlist.size() > 0) { // // od리스트를 구해왔음. 해당정보로 배송정보를 컨트롤함.
				System.out.println("odlist : " + odlist.size());
				System.out.println("odlist의 pid[] : " + odlist.get(0).getPid());
				
				for (int i = 0; i < odlist.size(); i++) { // odid[]를 기반으로 pid[]를 구해옴.
					int pid_ = odlist.get(i).getPid();
					String pid = ""+pid_;
					System.out.println(pid);
					System.out.println("pid로 구해온 product : " + ps.selectOne(pid));
					plist.add(i, ps.selectOne(pid));
					System.out.println("plist : " + i + "+" + pid);
					System.out.println("plist의 요소들 : " + plist.get(0).getPprice());
				}
			} 
			
			model.addAttribute("plist", plist);
			model.addAttribute("odlist", odlist);
			model.addAttribute("orders", orders);
		} else { // 주문번호가 없다면.
			System.out.println("주문 내역 없음");
		}
		
		return "login/mypage";
	}
	
	
}
