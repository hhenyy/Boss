package boss.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import boss.model.Product;
import boss.service.ProductDetailService;

@Controller
public class ProductDetailController {

	@Autowired
	ProductDetailService service;

	@RequestMapping("/productDetail.do")
	public String productDetail(String pid, Product product, Model model) throws Exception {
		System.out.println("productDetail");
		System.out.println("pid : " + pid);

		product = service.select(pid);

		model.addAttribute("product", product);

		return "./product/productDetail";

	}

	@RequestMapping("productReview.do")
	public String productReview(String pid ,Model model) {
		System.out.println("productReview");
		
		return "./product/review/productReview";
	}
}
