package boss.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boss.common.PagePgm;
import boss.dao.ProductDetailDao;
import boss.model.AskBoard;
import boss.model.Orders;
import boss.model.Product;
import boss.model.QnaBoard;
import boss.model.Review;

@Service
public class ProductDetailService {

	@Autowired
	ProductDetailDao dao;

	public Product selectProduct(String pid) {
		return dao.selectProduct(pid);
	}

	public Review selectReview(String pid) {

		return dao.selectReview(pid);
	}

	public List<Review> selectReviewOne(Map<String, Object> map) {
		return dao.selectReviewOne(map);
	}
	
	public Review prselect(int rid) {
		System.out.println("서비스까지 옴 " + rid);
		return dao.prselect(rid);
	}

	public int total() {
		return dao.total();
	}
	// 리뷰 페이징
	public List<Review> list(Map<String, Object> map) {
		return dao.list(map);
	}
	// 리뷰 작성 리스트
	public List<Review> selectMemberReview(String memail) {

		return dao.selectMemberReview(memail);
	}
	
	// 리뷰 작성 

	public int reviewInsert(Review review) {
		return dao.reviewInsert(review);
	}

	public Orders selectOrders(String mEmail) {
		return dao.selectOrders(mEmail);
	}
	
	// 리뷰 작성 시 주문 결과 확인
	public List<Orders> selectlist(Map<String, Object> map) {
		return dao.selectlist(map);
	}

	public Review rcheck(int oid) {
		return dao.rcheck(oid);
	}
	
	// 리뷰 수정
	public int reviewupdate(Review review) {
		return dao.reviewupdate(review);
	}
	
	public List<AskBoard> asklist(Map<String, Object> map) {
		return dao.asklist(map);
	}

	

	
	
	

//	public int insert(int rid) {
//		return dao.insert(rid);
//	}

}
