package boss.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import boss.model.Bucket;
import boss.model.Product;
import boss.service.MasterProductService;
import boss.service.OrdersService;

@Controller
public class OrdersController {

	@Autowired
	OrdersService os;
	@Autowired
	MasterProductService mps;
	
	/*
	 * 결제 폼 이동 메소드
	 */
	@RequestMapping("ordersForm.do")
	public String ordersForm(Bucket bucket, Model model) {
		System.out.println("ordersForm");

		Product product = new Product();
		product = mps.selectOne("100");
		
		System.out.println("product.getPprice() : " + product.getPprice());
		model.addAttribute("product", product);

		return "orders/ordersForm";
	}

	@RequestMapping("ordersCheck.do")
	public String ordersCheck(Bucket bucket, Model model) {

		return "orders/ordersCheck";
	}
	
	@RequestMapping("moveOrdersForm.do")
	public String moveOrdersForm() {
		
		return "./orders/moveOrdersForm";
	}
}










