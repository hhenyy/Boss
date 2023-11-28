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
	ProductDetailService service;
	

	
	@RequestMapping("productDetail.do")
	public String productDetail(String memail, String pid, Model model, Product product, Review review, PagePgm pp,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage, String search) throws Exception {
		System.out.println("productDetail");
		System.out.println("pid : " + pid);
		
		// 상품 불러오기
		product = service.selectProduct(pid);
		// 페이징 처리
		System.out.println("productReviewList 들어가");

		int total = service.total();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "10";
		}
		pp = new PagePgm(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("pp", pp);	// 리뷰 페이징처리
		model.addAttribute("reviewList", service.list(pp));
		model.addAttribute("product", product);		// 상품 불러오기 

		return "./product/productDetail";
	}

	// 리뷰 작성 페이지 이동 
	@RequestMapping("productReviewInsertForm.do")
	public String productReviewInsertForm(int pid, Model model, Review review, Orders orders, @RequestParam(name="oid", required = false) Integer oid) {
		System.out.println("productReviewInsertForm");
		
		
		
		 // 임의로 값 넣음		
		String memail = "wooas0105";
		
		List<Review> reviewList = new ArrayList<Review>();
		reviewList = service.selectMemberReview(memail);
		System.out.println("list size : " + reviewList.size());
		
		// 작성하는 실시간 날짜
		Date date = new Date();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String reviewDate = sdf.format(date);
		
		
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
			System.out.println("productReviewInsertForm : "+"리뷰 작성하러 옴");
			review = reviewList.get(0);
			
			
			model.addAttribute("review", review);	
			model.addAttribute("pid", pid);
			model.addAttribute("reviewDate", reviewDate);		// 오늘 날짜 띄우기

		} else {
			System.out.println("productReviewInsertForm : "+"리뷰가 없는 페이지");
		}
		
		
	
		return "./product/review/productReviewInsertForm";
	}
	
//	// order 테이블에서 oid pid 주문 여부 확인
//	private boolean orders(Integer oid, int pid) {	
//		
//		return false;
//	}

	// 리뷰 등록 
	@RequestMapping("productReviewcheck.do")
	public String prInsert(Model model, Review review, HttpSession session,String pid) {
		System.out.println("productReviewcheck:"+"등록 확인중");
		
		Member member = (Member) session.getAttribute("member");
		
		String mEmail = member.getmEmail();
		
		review.setMemail(mEmail);
		
		// String 으로 받은 pid값을 int 형으로 변환 시켜야함
		
		
		System.out.println("review 1 : " + member.getmEmail());
		System.out.println("review 2 : " + review.getOid());
		System.out.println("review 3 : " + review.getPid());
		System.out.println("review 4 : " + review.getRcontent());
		System.out.println("review 5 : " + review.getRdrop());
		System.out.println("review 6 : " + review.getRimage());
		System.out.println("review 7 : " + review.getRreadcount());
		System.out.println("review 8 : " + review.getRtitle());
		System.out.println("review 9 : " + review.getRwriter());
		System.out.println("review 10 : " + review.getRreg());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mEmail", mEmail);
		map.put("review", review);
		
		// 리뷰 등록 (서비스로 가는 곳)
		int result = service.reviewInsert(map);
		
		System.out.println("리뷰작성결과:"+ result);
		if(result == 1) {
			System.out.println("리뷰 작성 성공");
		}else{
			System.out.println("리뷰 적성 안됐음");
		}
		
		
		
		return "./product/review/productReviewcheck";
	}

	// 리뷰 상세 불러오기
	@RequestMapping("productReviewSelect.do")
	public String productReviewSelect(int pid, Model model, int rid, Review review) {
		System.out.println("productReviewSelect");

		review = service.prselect(rid);

		model.addAttribute("review", review);
		model.addAttribute("pid", pid);

		System.out.println("상세페이지 불러옴");

		return "./product/review/productReviewSelect";
	}

}
