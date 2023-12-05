package boss.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import boss.model.Bucket;
import boss.model.Member;
import boss.model.Orders;
import boss.model.Product;
import boss.service.BucketService;
import boss.service.MasterProductService;
import boss.service.OrdersService;

@Controller
public class OrdersController {
	
	@Autowired
	OrdersService os;
	@Autowired
	MasterProductService mps;
	@Autowired
	BucketService bs;
  
	/*
	 * 결제하기 이동 메소드
	 */
	@RequestMapping("ordersForm.do")
	public String ordersForm(Member member, Model model, String bid, 
			String mEmail, String omessage, String pid) {
		
		System.out.println("pid : " + pid);
		Bucket bucket = bs.selectBucketOne(bid);
		model.addAttribute("bucket", bucket);
		
		if(bucket != null) {
			member.setmName(mEmail);
		} else {
			System.out.println("bucket null : " + bucket);
		}
		
		model.addAttribute("member", member);
		model.addAttribute("omessage", omessage);
		model.addAttribute("pid", pid);
		model.addAttribute("bcount", bucket.getBcount());
		
		return "orders/ordersForm";
	}

	@RequestMapping("ordersCheck.do")
	public String ordersCheck(Bucket bucket, Model model) {

		return "orders/ordersCheck";
	}
	
	/*
	 * 결제 폼 이동 메소드
	 */
	@RequestMapping("moveOrdersForm.do")
	public String moveOrdersForm(Bucket bucket, Model model, HttpSession session, String bid) {
		
		System.out.println("ordersForm");
		Member member = (Member) session.getAttribute("member");
		int result = 0;
		String msg = "";
		bucket = bs.selectBucketOne(bid);
		model.addAttribute("bucket", bucket);
		model.addAttribute("member", member);
		System.out.println("Dsadsadsad : " + member.getmEmail());
		
		return "./orders/moveOrdersForm";
	}
	
	/*
	 * 주문 정보 db 저장
	 */
	@ResponseBody
	@RequestMapping("orderResult.do")
	public String orderResult(String mEmail, String bid, 
			Orders orders, String pid, String bcount) {
		
		Map<String,Object> map = new HashMap<String, Object>();
		
		if(orders != null) {
			orders.setMemail(mEmail);
			System.out.println("여기는?");
			int result = os.insertOrders(orders);
			if(result == 1) {
				
				orders = os.selectOrdersOne(orders.getMemail());
				System.out.println("oid : " + orders.getOid());
				Product product = mps.selectOne(pid);
				map.put("product", product);
				map.put("oid", orders.getOid());
				map.put("bcount", bcount);
				int insertOrderDetail = os.insertOrderDetail(map);
				System.out.println("insertOrderDetail : " + insertOrderDetail);
				System.out.println(product.getPid());
				System.out.println("주문 등록 성공");
				int id = Integer.parseInt(bid);
				int bucket = bs.deleteCartOne(id);
				map.put("pid", pid);
				int productCount = os.updateProductCount(map);
			}
		} else if(orders == null){
			System.out.println("오더 null");
		}
		
		//map.
		
		return "hi";
	}
}










