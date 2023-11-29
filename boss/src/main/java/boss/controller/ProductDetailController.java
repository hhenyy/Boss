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

		// Review review = service.list(map);

		if (!list.equals(null) && list.size() > 0) { // 1개라도 구해옴.
			System.out.println("list를 구해옴 : " + list.size());
			model.addAttribute("reviewList", list);
		} else { // 1개도 못구해옴
			System.out.println("list를 못구해옴 : " + list.size());

		}

		// 무슨경우에도 상품은 띄워주어야함.
		model.addAttribute("product", product); // 상품 불러오기
		model.addAttribute("pid", pid);
		return "./product/productDetail";
	}

	// 리뷰 작성 페이지 이동
	@RequestMapping("productReviewInsertForm.do")
	public String productReviewInsertForm(String pid, Model model, Review review, Orders orders,
			@RequestParam(name = "oid", required = false) Integer oid, HttpSession session) {
		System.out.println("productReviewInsertForm");

//		 // 세션을 통해서 이메일을 가져감		
//		Member member = (Member) session.getAttribute("member");

		String memail = "wooas0105";

		List<Review> reviewList = new ArrayList<Review>();
		reviewList = service.selectMemberReview(memail);
		System.out.println("list size : " + reviewList.size());

		// 작성하는 실시간 날짜
		Date date = new Date();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String reviewDate = sdf.format(date);

		// 내 아이디가 pid 를 주문 헀는지 확인시키기 위한 로직 추가중

//		   if(oid != null) {							// 주문결과가 있는 경우 	
//			   
//			   Orders orders = service.					// oid를 가져올려고 함 
//			   if(orders(oid,pid)) {					// oid 와 pid로 주문 여부 확인
//				   
//				   model.addAttribute("oid", oid);
//				   
//			   }else {
//				   
//				   return"redirect:/productDetail";		//주문 정보가 없거나, 주문한 상품이 아닐경우
//				   
//			   }
//			   
//			   	return"redirect:/productDetail";		// 주문 정보가 없을 경우
//		   }

		if (review != null) {
			System.out.println("productReviewInsertForm : " + "리뷰 작성하러 옴");
			review = reviewList.get(0);

			model.addAttribute("review", review);
			model.addAttribute("pid", pid);
			model.addAttribute("reviewDate", reviewDate); // 오늘 날짜 띄우기

		} else {
			System.out.println("productReviewInsertForm : " + "리뷰가 없는 페이지");
		}

		return "./product/review/productReviewInsertForm";
	}

	// order 테이블에서 oid pid 주문 여부 확인
//	private boolean orders(Integer oid, int pid, String memail) {	
//		
//		return false;
//	}

	// 리뷰 등록
	@RequestMapping("productReviewcheck.do")
	public String prInsert(Model model, Review review, HttpSession session, String pid) {
		System.out.println("productReviewcheck:" + "등록 확인중");

		// 세션 얻어오기
		Member member = (Member) session.getAttribute("member");

		// 이메일 얻기
		String mEmail = member.getmEmail();

		// pid set하기
		int pid1 = Integer.parseInt(pid);

		// 내 이메일로 주문 번호 가져오기 oid 얻어오기 ( 나중에 list로 바꿔야함)
		Orders order = service.selectOrders(mEmail);

		int oid = order.getOid();

		review.setOid(oid);
		review.setPid(pid1);
		review.setMemail(mEmail);

		// 리뷰 등록 (서비스로 가는 곳)
		int result = service.reviewInsert(review);

		System.out.println("리뷰작성결과:" + result);
		if (result == 1) {
			System.out.println("리뷰 작성 성공");
		} else {
			System.out.println("리뷰 적성 안됐음");
		}

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
	public String productReviewUpdateForm(int pid, Model model, Review review,int rid) {
		System.out.println("productReviewUpdateForm :" + "수정");
		
		review = service.prselect(rid);
		
		
		model.addAttribute("review", review);
		model.addAttribute("pid", pid);
		return "./product/review/productReviewUpdateForm";
	}

}
