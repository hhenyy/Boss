package boss.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import boss.service.ProductDetailService;



@Controller
public class ProductDetailController {
	
	@Autowired
	ProductDetailService service;
	
	@RequestMapping("/productDetail.do")
	public String productDetail(Model model) throws Exception{
		 
		System.out.println("productDetail");
		
		
		
		return "./product/productDetail";
	}
}
