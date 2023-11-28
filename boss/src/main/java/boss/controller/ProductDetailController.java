package boss.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import boss.common.PagePgm;
import boss.model.Product;
import boss.model.Review;
import boss.service.ProductDetailService;

@Controller
public class ProductDetailController {

	@Autowired
	ProductDetailService service;

	@RequestMapping("productDetail.do")
	public String productDetail(String pid, Model model, Product product, Review review,PagePgm pp,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage, String search) throws Exception {
		System.out.println("productDetail");
		System.out.println("productDetail");
		System.out.println("pid : " + pid);
		

		int rid = 61;
		product = service.selectProduct(pid);
		System.out.println("pid 구해옴 : " + product);
		review = service.selectReviewOne(rid);
		System.out.println("rid 구해옴");

		if (product != null) { // 상품을 잘 구해왔다면.
			model.addAttribute("product", product);

		} else {
			model.addAttribute("msg", "메인으로 돌아갑니다.");
		} 
		model.addAttribute("review", review);
		

	
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
		model.addAttribute("pp", pp);
		model.addAttribute("reviewList", service.list(pp));
//		model.addAttribute("list", service.list(pp));
		return "./product/productDetail";
	}


	
	
	
	// 리뷰 작성 페이지 이동 및 작성
	@RequestMapping("productReviewInsertForm.do")
	public String productReviewInsertForm(int pid, Model model, Review review,int rid) {
		System.out.println("productReviewInsertForm");
		System.out.println("pid : " + pid);
		
//		int result = service.insert(rid);
		
//		System.out.println(result);
		
		
		return "./product/review/productReviewInsertForm";
	}
	@RequestMapping("productReviewcheck.do")
	public String prInsert(Model model, String pid, int rid ) {
		
		
		
		
		return "./product/review/productReviewcheck";
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
		
	

}
