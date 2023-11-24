package boss.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import boss.model.Bucket;
import boss.model.Product;
import boss.service.BucketService;

@Controller
public class BucketController {
	@Autowired
	private BucketService sc;

	// 장바구니에 상품 등록
	@RequestMapping("bucketInsert.do")
	public String bucketInsert(int pId,String mEmail,HttpSession session, Product product, Bucket bucket) {
		System.out.println("bucketInsert");
		System.out.println("pId:"+pId);
		
		bucket.setpId(pId);
		System.out.println("pId:"+bucket.getpId());

	//	String mEMail = (String)session.getAttribute("mEMail");   //email가져오기 
	// 로그인 되어있는 정보를 이용해서 mMail를 가져온다 
	//	 bucket객체를 생성하고 userid와 productId를 set해준다 
	//	String mEMail="1";  //메일 임의지정
//		bucket.setmEmail(mEMail);

		
//		if(bucket==null) {  //bucket에 없는 상품이면 insert, already_existed를 리턴
//			int result=sc.insert(bucket);
//			if(result==1) {
//			return "add_success";
//			}
//		}else {
//		int result=sc.update(bucket); //bucket에 있는 상품이면 수량 업데이트,add_success를 리턴
//		if(result==1) {	
//		return "already_existed"; 
//		}
//		}
		return "order/bucketList";
	
}
	
	
	// 장바구니 목록
//	@RequestMapping("bucketList.do")
//	public String buckettList(HttpSession session, Model model) throws Exception {
//		String mEMail = (String)session.getAttribute("mEMail");
//		System.out.println("mEMail:"+mEMail);
//		
//		List buckettList = cs.list(mEMail);
//		System.out.println("cartList:"+cartList);
//			
//		return "cart/buckettList";
//	}
//	
//	// 장바구니 상품 수량 수정
//	@RequestMapping("bucketCountUpdate.do")
//	public String bucketCountUpdate(HttpSession session, Bucket bucket, Model model) throws Exception {
//		System.out.println("bid:"+bucket.getbId());
//		System.out.println("bCount:"+bucket.getbCount());
//
//		String mEMail = (String)session.getAttribute("mEMail");
//		System.out.println("mEMail:"+mEMail);
//		
//		cs.update(bucket);
//		
//		return "redirect:bucketList.do?mEMail=mEMail";
//	}
//	
//	// 장바구니 개별상품 삭제 (선택삭제)
//	@RequestMapping("bucketDelete.do")
//	public String cartDelete(HttpSession session, int bid, Model model) throws Exception {
//		System.out.println("bid:"+bid);
//		
//		String mEMail = (String)session.getAttribute("mEMail");
//		System.out.println("mEMail:"+mEMail);
//		
//		cs.delete(bid);
//		System.out.println("삭제 완료");
//		
//		return "redirect:bucketList.do?mEMail=mEMail";
//	}
//	
//	// 장바구니 전체 삭제    (그냥 선택삭제만 할듯?)
//	@RequestMapping("allbucketDelete.do")
//	public String allCartDelete(HttpSession session) {
//		String mEMail = (String)session.getAttribute("mEMail");
//		System.out.println("mEMail:"+mEMail);
//		
//		cs.allDelete(mEMail);
//		System.out.println("전체 삭제 완료");
//		
//		return "redirect:bucketList.do?mEMail=mEMail";
//	}

	
	// 장바구니페이지이동 
	@RequestMapping("bucketList.do")
	public String bucketList() {
		System.out.println("bucketList");
		return "order/bucketList";
	}
	
	// 결제페이지이동
	@RequestMapping("order.do")
	public String orderPage() {
		System.out.println("orderPage");
		return "order/orderre";
	}

//	// 상세페이지
//	@RequestMapping("mainre.do")
//	public String main() {
//		System.out.println("main");
//		return "order/main2";
//	}
	
}