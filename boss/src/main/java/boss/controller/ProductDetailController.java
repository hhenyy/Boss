package boss.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import boss.model.Product;
import boss.model.Review;
import boss.service.ProductDetailService;

@Controller
public class ProductDetailController {

	@Autowired
	ProductDetailService service;

	@RequestMapping("productDetail.do")
	public String productDetail(String pid, Model model, Product product, Review review) throws Exception {
		System.out.println("productDetail");
		System.out.println("pid : " + pid);

		int rid = 61;
		product = service.selectProduct(pid);
		review = service.selectReviewOne(rid);

		System.out.println("review : " + review.getMemail() + review.getRcontent());
		if (product != null) { // 상품을 잘 구해왔다면.
			model.addAttribute("product", product);

		} else {
			model.addAttribute("msg", "메인으로 돌아갑니다.");
		}
		model.addAttribute("review", review);
		return "./product/productDetail";

	}

	// 리뷰 작성 페이지 이동
	@RequestMapping("productReviewInsert.do")
	public String productReview(int pid, Model model, Review review) {
		System.out.println("productReview");
		System.out.println("pid : " + pid);
		
		return "./product/review/productReviewInsert";
	}
	
	
	//리뷰 상세 불러오기 
	@RequestMapping("productReviewSelect.do")
	public String productReviewSelect(int pid, Model model, int rid,Review review) {
		System.out.println("productReviewSelect");
		
		
		  review = service.prselect(rid);
		
		model.addAttribute("review", review);
		model.addAttribute("pid", pid);
		
		
		
		System.out.println("상세페이지 불러옴");
		
		return "./product/review/productReviewSelect";
	}
	
//	// 리뷰 상세 수정하기 
//	@RequestMapping("productReviewUpdate")
//	
}
