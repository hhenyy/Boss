package boss.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import boss.common.PagePgm;
import boss.model.Orders;
import boss.model.Product;
import boss.model.Review;

@Mapper
public interface ProductDetailDao {

	

	

	Product selectProduct(String pid);

	Review selectReview(String pid);
	
	Review selectReviewOne(String memail);
	
	
	// 리뷰 불러오기
	Review prselect(int rid);

	int total();
	
//	페이징 처리
	List<Review> list(Map<String, Object> map);

//  리뷰 memail 뽑기	

	List<Review> selectMemberReview(String memail);

	// 리뷰 작성 
	int reviewInsert(Review review);

	Orders selectOrders(String mEmail);
	



//	int insert(int rid);

}
