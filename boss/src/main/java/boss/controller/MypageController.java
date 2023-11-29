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
import boss.model.QnaBoard;
import boss.model.Review;
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

		List<Orders> list = new ArrayList<Orders>();
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

			// 메세지 넣을 배열을 주문 갯수만큼 빼오기
			String statusMsg[] = new String[ordersList.size()]; // 주문 갯수

			// 배송상태 처리
			for (int i = 0; i < ordersList.size(); i++) {
				HashMap<String, Object> orderstatus = ordersList.get(i); // 개별 주문 구해오기

				Object odStatusValue = orderstatus.get("ODSTATUS");

				int odstatus = ((Number) odStatusValue).intValue();
				statusMsg[i] = service.statusMsg(odstatus);

				System.out.println("배송 상태 : " + statusMsg[i]);
			}

			// 배송처리 한 메세지 model로 뿌리기
			model.addAttribute("statusMsg", statusMsg);

			// 단일정보 (뷰에서 쓰기쉽게 foreach안돌려도됨)
			model.addAttribute("orders", ordersList.get(0));
			System.out.println(ordersList.get(0));

		}
		return "login/mypage";
	}

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

}
