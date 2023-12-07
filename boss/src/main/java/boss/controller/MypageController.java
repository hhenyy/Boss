package boss.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import boss.model.AskBoard;
import boss.model.Member;
import boss.model.OrderDetail;
import boss.model.Orders;
import boss.model.Product;
import boss.model.QnaBoard;
import boss.model.Review;
import boss.service.MasterOrdersService;
import boss.service.MasterProductService;
import boss.service.MypageService;

@Controller
public class MypageController {

	@Autowired
	private MypageService service;
	
	// 마이페이지 이동
	@RequestMapping("mypage.do")
	public String doMypage(HttpSession session, Model model) {
		System.out.println("마이 페이지 이동");

		Member member = (Member) session.getAttribute("member");

		List<Orders> orders = service.myoders(member.getmEmail()); // 내 주문내역 구해오기 -> 문제 list 로 받아와야함
		int totalcount = 0;
		// 주문 한 내역이 있다면
		if (orders != null) {      // 주문번호가 있다면.
	        model.addAttribute("orders", orders);
		}
		
		return "login/mypage";
	}
	
	// 주문내역
	@RequestMapping("mypageOrderDetail.do")
	public String mypageOrderDetail(String oid,HttpSession session,Model model) {
		
		Member member = (Member) session.getAttribute("member");
		
		String mEmail = member.getmEmail();
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("mEmail", mEmail);
		map.put("oid", oid);
		
		List<Orders> orders = service.myoders(member.getmEmail()); // 내 주문내역 구해오기

		List<HashMap<String, Object>> ordersList = new ArrayList<>();
		
		// 주문 한 내역이 있다면
		if (orders != null) { // 주문번호가 있다면.
			System.out.println("주문 번호가 있다면??");
			
			// 이제 주문 상세를 뽑아올 수 있어야해
			ordersList = service.listProduct(map);

			// 모든정보의 List
			model.addAttribute("ordersList", ordersList);
			System.out.println("ordersList.size() : " + ordersList.size());

			// 메세지 넣을 배열을 주문 갯수만큼 빼오기
			String statusMsg[] = new String[ordersList.size()]; // 주문 갯수
			
			// 배송상태 처리
			for (int i = 0; i < ordersList.size(); i++) {
				HashMap<String, Object> orderstatus = ordersList.get(i); // 개별 주문 구해오기

				Object odStatusValue = orderstatus.get("ODSTATUS");

				int odstatus = ((Number) odStatusValue).intValue();
				statusMsg[i] = service.statusMsg(odstatus);

				System.out.println("배송 상태 : " + statusMsg[i] + odstatus);
			}

			// 배송처리 한 메세지 model로 뿌리기
			model.addAttribute("statusMsg", statusMsg);

			// 단일정보 (뷰에서 쓰기쉽게 foreach안돌려도됨)
			model.addAttribute("orders", ordersList.get(0));
			System.out.println(ordersList.get(0));
		}
		return "login/mypage/mypageOrderDetail";
	}
	
	// 리뷰 페이지 이동
	@RequestMapping("mypageReview.do")
	public String mypageReview(HttpSession session, Model model) {

		// 세션 얻어오기
		Member member = (Member) session.getAttribute("member");
		String mEmail = member.getmEmail();

		// review 불러와서 저장 하는 List ( drop값이 N 인것만 )
		List<Review> rlist = service.myreviews(mEmail);

		model.addAttribute("rlist", rlist);
		return "login/mypage/mypageReview";
	}

	@RequestMapping("mypageQnA.do")
	public String mypageQnA(HttpSession session, Model model) {

		// 세션 얻어오기
		Member member = (Member) session.getAttribute("member");
		String mEmail = member.getmEmail();

		// 내가 쓴 QnA 불러와서 저장하는 List ( drop 값이 N 인것만 )
		List<QnaBoard> qlist = service.myqnas(mEmail);

		System.out.println(qlist);

		model.addAttribute("qlist", qlist);
		return "login/mypage/mypageQnaBoard";
	}

	// 리뷰 삭제
	@RequestMapping("mypageDeleteReview.do")
	@ResponseBody
	public String mypageDeleteReview(@RequestParam("rid") String rid) {

		int result = service.mypageDeleteReview(rid);

		if (result == 1) {
			return "Y";
		} else {
			return "N";
		}

	}

	// 환불 요청
	@RequestMapping("refund.do")
	@ResponseBody
	public String refund(@RequestParam("odid") String odid) {
		
		System.out.println("odid : " + odid);
		int result = 0;
		
		OrderDetail od = service.myorderDetail(odid);
		
		int odstatus = od.getOdstatus();
		
		if (odstatus == 0) {
			result = service.refund(odid);
			return "Y"; // 환불 요청 완료
		} else if (odstatus == 1) {
			return "A"; // arrive 배송 완료
		} else if (odstatus == 2) {
			return "R"; // already 환불 처리중 이미
		} else {
			return "F"; // finish 환불 처리 완료.
		}

	}
	
	// my ask폼으로 이동
	@RequestMapping("mypageAskBoard.do")
	public String mypageAskBoard(HttpSession session,Model model) {
		
		Member member = (Member) session.getAttribute("member");
		
		String mEmail = member.getmEmail();
		
		// 내가 쓴 ask 불러오기
		List<Map<String,Object>> plist = service.productlist(mEmail);
		System.out.println("plist.size() : " + plist.size());
		model.addAttribute("plist", plist);
		return "login/mypage/mypageAskBoard";
	}
	
	//

}
