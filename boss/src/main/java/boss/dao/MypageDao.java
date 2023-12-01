package boss.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import boss.model.OrderDetail;
import boss.model.Orders;
import boss.model.QnaBoard;
import boss.model.Review;

@Mapper
public interface MypageDao {

	Orders myoders(String mEmail);

	List<Review> myreviews(String mEmail);

	List<QnaBoard> myqnas(String mEmail);

	int mypageDeleteReview(String rid);

	int refund(String odid);

	OrderDetail myorderDetail(String odid);

}
