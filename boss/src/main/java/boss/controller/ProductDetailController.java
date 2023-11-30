package boss.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import boss.common.PagePgm;
import boss.model.Member;
import boss.model.Orders;
import boss.model.Product;
import boss.model.Review;
import boss.service.ProductDetailService;

@Controller
public class ProductDetailController {

	@Autowired
	private ProductDetailService service;

	// 상세페이지
	@RequestMapping("productDetail.do")
	public String productDetail(String pid, PagePgm pp, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage, String search) throws Exception {
		System.out.println("productDetail");

		// 상품 불러오기
		Product product = service.selectProduct(pid);

		// 페이징 처리
		System.out.println("productReviewList 들어가");

		int total = service.total();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}

		System.out.println("페이징 나옴.");
		Map<String, Object> map = new HashMap<String, Object>();
		pp = new PagePgm(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("pp", pp);
		map.put("pp", pp);
		map.put("pid", pid);
		System.out.println("pp공유끝.");

		System.out.println("pp. sr: " + pp.getStartRow());
		System.out.println("pp. er: " + pp.getEndRow());
		System.out.println("pid : " + pid);
		List<Review> list = service.list(map);

		if (!list.equals(null) && list.size() > 0) { // 1개라도 구해옴.
			System.out.println("list를 구해옴 : " + list.size());
			model.addAttribute("reviewList", list);
		} else { // 1개도 못구해옴
			System.out.println("list를 못구해옴 : " + list.size());
		}

		model.addAttribute("product", product);
		model.addAttribute("pid", pid);
		return "./product/productDetail";
	}

	// 리뷰 작성 페이지 이동
	@RequestMapping("productReviewInsertForm.do")
	public String productReviewInsertForm(String pid, Model model, HttpSession session) {
		System.out.println("productReviewInsertForm");

		// 세션을 통해서 이메일을 가져감
		Member member = (Member) session.getAttribute("member");
		String mEmail = member.getmEmail();

		// 작성하는 실시간 날짜
		Date date = new Date();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String reviewDate = sdf.format(date);
		
		model.addAttribute("mEmail", mEmail);
		model.addAttribute("pid", pid);
		model.addAttribute("reviewDate", reviewDate); // 오늘 날짜 띄우기

		return "./product/review/productReviewInsertForm";
	}

	// 리뷰 등록
	@RequestMapping("productReviewcheck.do")
	public String prInsert(Model model, Review review, HttpSession session, String pid) {

		int result = 0;

		// 세션 얻어오기
		Member member = (Member) session.getAttribute("member");

		// 이메일 얻기
		String mEmail = member.getmEmail();
		System.out.println("세션 이메일 확인 : " + mEmail);
		
		// pid set하기
		int pid1 = Integer.parseInt(pid);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memail", mEmail);
		map.put("pid", pid);

		// 내 이메일, pid 로 orders에서 정보 추출 (주문 내역이 있나)
		List<Orders> olist = service.selectlist(map);

		// 내가 쓴 리뷰 갯수 구하기
		List<Review> rlist = service.selectReviewOne(map); // 내가 쓴 리뷰의 갯수

		int oid[] = new int[olist.size()]; 				// oid

		if (olist != null && rlist.size() <= olist.size()) { // 리뷰등록이 가능한지 검사
			for (int i = 0; i < olist.size(); i++) {
				oid[i] = olist.get(i).getOid();
				// 여기에 review테이블에 이미 oid를 가지고 리뷰를 썼는지 확인 해야함
				Review rcheck = service.rcheck(oid[i]);
				
				if(rcheck == null) { // oid로 리뷰를 작성 한 적이 없다면
					review.setOid(oid[i]);							
					review.setPid(pid1);
					review.setMemail(mEmail);
					result = service.reviewInsert(review);
					break;
				}else {
					continue;
				}
				
			} // for문 end
		} // if문 end

		model.addAttribute("pid", pid1);
		model.addAttribute("result", result);

		return "./product/review/productReviewcheck";
	}

	// 리뷰 상세 불러오기
	@RequestMapping("productReviewSelect.do")
	public String productReviewSelect(int pid, Model model, int rid, Review review) {
		System.out.println("productReviewSelect :" + "리뷰 상세");

		review = service.prselect(rid);

		model.addAttribute("review", review);
		model.addAttribute("pid", pid);

		System.out.println("상세페이지 불러옴");

		return "./product/review/productReviewSelect";
	}

	// 리뷰 수정폼으로 이동
	@RequestMapping("productReviewUpdateForm.do")
	public String productReviewUpdateForm(int pid, Model model, Review review, int rid) {
		System.out.println("productReviewUpdateForm :" + "수정");

		review = service.prselect(rid);

		model.addAttribute("review", review);
		model.addAttribute("pid", pid);
		return "./product/review/productReviewUpdateForm";
	}

}
