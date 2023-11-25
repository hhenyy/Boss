package boss.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import boss.common.PagePgm;
import boss.model.OrderDetail;
import boss.model.Orders;
import boss.service.MasterOrdersService;

@Controller
public class MasterOrdersController {

	@Autowired
	MasterOrdersService ms;

	// 관리자 리뷰리스트
	@RequestMapping("masterOrdersList.do")
	public String masterOrdersList(PagePgm pp, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage, String search) throws Exception {
		System.out.println("masterOrdersList");

		int total = ms.total();
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
		model.addAttribute("list", ms.list(pp));
		return "master/orders/masterOrdersList";
	}

	// 관리자 주문 상세정보
	@RequestMapping("masterOrdersSelect.do")
	public String masterOrdersSelect(String oid, Model model) throws Exception {
		System.out.println("masterOrdersSelect");
		System.out.println("oid : " + oid);
		List<HashMap<String, Object>> ordersList = new ArrayList<>();
		if (oid != null) { // 주문정보가 있다면. (없으면 처음부터 select도 못들어옴. else처리 안함)
			System.out.println("oid 널통과");
			ordersList = ms.listProduct(Integer.parseInt(oid));
			if (ordersList != null && ordersList.size() > 0 ) { // 리스트 구해옴
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
		int oid = ms.selectOrderDetail(odid).getOid();
		System.out.println("oid : " + oid);
		System.out.println("odid : " + odid);
		System.out.println("odstatus : " + odstatus);
		if (odstatus != null) {
			int result = ms.updateStatus(odid, odstatus);
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
	public String masterOrdersDelete(String oid, Model model, HttpServletRequest request) {
		System.out.println("masterOrdersDelete");

		// Service에서 메소드를 1번만 호출하기 위해 리스트로 양식을 통일했음.
		List<String> idList = new ArrayList<String>();
		int result = 0;
		// id값이 1개라도 넘어온다면 (복수허용)
		if ((oid != null) || (request.getParameterValues("chkId") != null)) {

			if (oid != null) { // 1개만 넘어온경우. (양식이 List기때문에 단일값도 list에 add)
				idList.add(0, oid);
			} else { // 여러개가 넘어온경우. (String[]->List (메서드 양식 통일))
				String[] ids = request.getParameterValues("chkId");
				idList = Arrays.asList(ids);
			}
		} else {
			result = 0;
			model.addAttribute("result", result);
			model.addAttribute("msg", "체크된 글이 없습니다.");
			return "./master/orders/masterOrdersDelete";
		}
		result = ms.delete(idList);
		if (result > 0) { // 삭제 성공시
			model.addAttribute("result", result);
			model.addAttribute("msg", result + "개 리뷰삭제 성공.");
		} else { // 삭제 실패시
			model.addAttribute("result", result);
			model.addAttribute("msg", "삭제할 글이 없습니다.");
		}
		return "master/orders/masterOrdersDelete";
	}
}
