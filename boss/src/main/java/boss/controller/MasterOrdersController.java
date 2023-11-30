package boss.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import boss.common.PagePgm;
import boss.common.Search;
import boss.model.Orders;
import boss.service.MasterOrdersService;

@Controller
public class MasterOrdersController {

	@Autowired
	MasterOrdersService mos;

	// 관리자 리뷰리스트
	@RequestMapping("masterOrdersList.do")
	public String masterOrdersList(PagePgm pp, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage, String search) throws Exception {
		System.out.println("masterOrdersList");

		int total = mos.total();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}
		pp = new PagePgm(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("pp", pp);
		model.addAttribute("list", mos.list(pp));
		return "master/orders/masterOrdersList";
	}

	// 관리자 주문 상세정보
	@RequestMapping("masterOrdersSelect.do")
	public String masterOrdersSelect(String oid, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) throws Exception {
		System.out.println("masterOrdersSelect");
		System.out.println("oid : " + oid);
		List<HashMap<String, Object>> ordersList = new ArrayList<>();
		if (oid != null) { // 주문정보가 있다면. (없으면 처음부터 select도 못들어옴. else처리 안함)
			System.out.println("oid 널통과");
			ordersList = mos.listProduct(Integer.parseInt(oid));
			if (ordersList != null && ordersList.size() > 0) { // 리스트 구해옴
				System.out.println("list 통과 : ");
				model.addAttribute("ordersList", ordersList);
				// 단일정보 (뷰에서 쓰기쉽게 foreach안돌려도됨)
				model.addAttribute("orders", ordersList.get(0));
				System.out.println("dorders" + ordersList.get(0));
			} else { // oid는 있으나 list를 못구해옴
				System.out.println("oid는 있으나 list는 못구해옴 ");
			}
			// 모든정보의 List

		}
		return "master/orders/masterOrdersSelect";
	}

	// 관리자 주문 상세 - 배송상태 변경
	@RequestMapping("masterOrdersStatus.do")
	public String masterOrdersStatus(String odid, String odstatus, Model model) throws Exception {
		System.out.println("masterOrdersStatus");
		int oid = mos.selectOrderDetail(odid).getOid();
		System.out.println("oid : " + oid);
		System.out.println("odid : " + odid);
		System.out.println("odstatus : " + odstatus);
		if (odstatus != null) {
			int result = mos.updateStatus(odid, odstatus);
			if (result == 1) { // 수정 완료시
				System.out.println("수정성공");
				model.addAttribute("oid", oid);
			} else { // 수정 실패시
				System.out.println("수정실패");
			}
		}
		return "redirect:/masterOrdersSelect.do";
	}

	// 관리자 주문 삭제
	@RequestMapping("masterOrdersDelete.do")
	public String masterReviewDelete(String oid, Model model, HttpServletRequest request) {
		System.out.println("masterMemberDelete");
		System.out.println("rid : " + oid);
		// Service에서 메소드를 1번만 호출하기 위해 리스트로 양식을 통일했음.
		List<String> idList = new ArrayList<String>();
		String[] ids = request.getParameterValues("chkId");

		int result = 0;
		String msg = "";
		// id값이 1개라도 넘어온다면 (복수허용)

		if ((oid != null) || (request.getParameterValues("chkId") != null)) { // 요청받는 방식을 나누는 조건문. 체크박스 / 버튼
			if (oid != null) { // id가 버튼으로 넘어온 경우. (단일, 다중 동일메서드 처리를 위해 List로 양식을 통일했음.)
				System.out.println("id가 버튼으로 1개만 넘어옴.");
				idList.add(0, oid);
				result = mos.deleteOrders(idList);
				model.addAttribute("result", result);
				model.addAttribute("msg", +result + "개 수정 완료");
				System.out.println("1개만 삭제완료. : " + result);

			} else if (oid == null && ids != null) { // id가 체크박스를 통해 넘어온경우.
				System.out.println("id가 체크박스로 1개 or 여러개 넘어옴.");
				System.out.println("체크박스로 넘어온 ID의 갯수 : " + ids.length);
				idList = Arrays.asList(ids);
				result = mos.deleteOrders(idList);
				model.addAttribute("result", result);
				model.addAttribute("msg", +result + "개 수정 완료");
				System.out.println("여러명 삭제 완료 : " + result);
			}
		} else { // 모든값이 Null이라면.
			model.addAttribute("result", result);
			model.addAttribute("msg", "수정할 글을 선택하세요.");
			System.out.println("체크박스가 선택되지않음. " + result);

		}
		return "./master/review/masterReviewDelete";
	}

	@RequestMapping("masterOrdersSearch.do")
	public String masterOrdersSearch(Search search, Model model) {

		System.out.println(search.getKeyword());
		System.out.println(search.getSearchtype());

		if (search.getKeyword() != "" && search.getSearchtype() != "") {
			List<Orders> list = mos.searchOrdersList(search);
			System.out.println(list);
			model.addAttribute("list", list);
			// return "./master/product/masterProductList";
		}
		if (search.getKeyword() == "" && search.getSearchtype() != "") {
			model.addAttribute("type", "notKey");
			model.addAttribute("msg", "검색어를 입력해 주세요.");
			return "./master/product/masterMoveProductList";
		}
		if (search.getKeyword() != "" && search.getSearchtype() == "") {
			model.addAttribute("type", "notType");
			model.addAttribute("msg", "검색타입을 선택해 주세요.");
			return "./master/product/masterMoveProductList";
		}
		if (search.getKeyword() == "" && search.getSearchtype() == "") {
			model.addAttribute("type", "notKeynotType");
			model.addAttribute("msg", "검색타입 & 검색어를 입력해 주세요.");
			return "./master/product/masterMoveProductList";
		}

		return "master/orders/masterOrdersList";
	}

	// 문자를 보낼때 맵핑되는 메소드
	@RequestMapping("sendSms.do")
	public String sendSms(HttpServletRequest request, Model model) throws Exception {
		Orders orders = new Orders();
		// oid를 기준으로 삼음.
		String oid = request.getParameter("oid");
		if (oid != null && oid != "") {
			orders = mos.selectOrders(oid);
		}
		;

		String ophone = request.getParameter("to");
		String type = request.getParameter("type");
		String msg = "";
		int resultMy = 0;
		System.out.println("ophone : " + ophone);
		System.out.println("type : " + type);
		String api_key = "NCSRYPBYYEAXEHUI"; // 위에서 받은 api key를 추가
		String api_secret = "GQXOPEODU6IKF2VHTJCIUDAPOGS3BU2U"; // 위에서 받은 api secret를 추가

		// 이 부분은 홈페이지에서 받은 자바파일을 추가한다음 그 클래스를 import해야 쓸 수 있는 클래스이다.
		boss.common.Coolsms coolsms = new boss.common.Coolsms(api_key, api_secret);

		HashMap<String, String> set = new HashMap<String, String>();
		set.put("to", ophone); // 수신번호

		set.put("from", (String) request.getParameter("from")); // 발신번호, jsp에서 전송한 발신번호를 받아 map에 저장한다.
		set.put("text", (String) request.getParameter("text")); // 문자내용, jsp에서 전송한 문자내용을 받아 map에 저장한다.
		set.put("type", "sms"); // 문자 타입

		System.out.println(set);

		JSONObject result = coolsms.send(set); // 보내기&전송결과받기

		if (((boolean) result.get("status") == true) && result.get("result_message") != null) {
			// 메시지 보내기 성공 및 전송결과 출력
			System.out.println("문자전송 결과 : " + result.get("result_message")); // 결과 메시지
			resultMy = 1;
			msg = orders.getOname() + "님에게" + "문자를 전송하였습니다.";
			model.addAttribute("msg", msg);
			model.addAttribute("result", resultMy);
		} else {
			// 메시지 보내기 실패
			System.out.println("문자전송 결과 : " + result.get("result_message")); // 결과 메시지
			resultMy = -1;
			msg = orders.getOname() + "님에게" + "문자전송에 실패하였습니다.";
			model.addAttribute("msg", msg);
			model.addAttribute("result", resultMy);
		}

		System.out.println("masterOrdersList");

		return "master/orders/masterOrdersSmsResult";

	}

	@RequestMapping("masterOrdersSmsMove.do")
	public String masterOrdersSmsMove(String type, String status, Model model, Orders orders, String oid) {
		System.out.println("masterOrdersSmsMove");
		System.out.println("전송타입 : " + type);
		System.out.println("oid : " + oid);

		// 값이 하나라도 있을경우 자유작성인지, 배송작성인지 메시지작성 타입을 정해주는 조건.
		if ((type != null && type != "") || (status != null & status != "")) {

			if (type.equals("free")) { // 관리자의 임의작성인 경우.
				System.out.println("관리자 임의작성 메시지");
				orders = mos.selectOrders(oid);
				if (orders != null) { // oid를 기준으로 orders를 구해온경우.
					System.out.println("주문번호 : " + oid);
					System.out.println("보낼번호 : " + orders.getOphone());
					System.out.println("수령인 : " + orders.getOname());

					model.addAttribute("orders", orders);

					return "master/orders/masterOrdersSmsForm";
				}

			} else if (type.equals("delivery")) { // 배송탭인경우.
				switch (status) {
				case "1":

					break;
				}
			}
		}
		return "master/orders/masterOrdersSmsMove";
	}

}
