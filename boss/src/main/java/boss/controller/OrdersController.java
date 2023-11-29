package boss.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import boss.service.OrdersService;

@Controller
public class OrdersController {

	@Autowired
	OrdersService service;

	/*
	 * 결제 폼 이동 메소드
	 */
	@RequestMapping("ordersForm.do")
	public String ordersForm() {

		System.out.println("ajax동작");

		return "orders/ordersForm";
	}

}
