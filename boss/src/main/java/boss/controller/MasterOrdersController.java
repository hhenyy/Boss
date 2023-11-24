package boss.controller;

import java.util.ArrayList;
import java.util.Arrays;
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
import boss.model.Product;
import boss.service.MasterOrdersService;
import boss.service.MasterProductService;

@Controller
public class MasterOrdersController {

	@Autowired
	MasterOrdersService ms;

	@Autowired
	MasterProductService ps;
	// masterOrdersList.do

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
		return "./master/orders/masterOrdersList";
	}

	// 관리자 주문 상세정보
	@RequestMapping("masterOrdersSelect.do")
	public String masterOrdersSelect(Orders orders, String oid, Model model)throws Exception{
		System.out.println("masterOrdersSelect");
		System.out.println("oid : " + oid);

		List<Product> plist = new ArrayList<Product>();
 
		orders = ms.selectOne(oid);
		if (orders != null) { // 주문번호가 있다면.
			System.out.println("시작 진입");

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
			System.out.println("실패");
		}

		return "./master/orders/masterOrdersSelect";
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
		return "./master/orders/masterOrdersDelete";
	}
}
