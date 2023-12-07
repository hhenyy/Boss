package boss.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import boss.model.AskBoard;
import boss.model.OrderDetail;
import boss.model.Orders;
import boss.model.QnaBoard;
import boss.model.Review;

@Mapper
public interface MypageDao {

	List<Orders> myoders(String mEmail);

	List<Review> myreviews(String mEmail);

	List<QnaBoard> myqnas(Map<String, Object> search);

	int mypageDeleteReview(String rid);

	int refund(String odid);

	OrderDetail myorderDetail(String odid);

	List<OrderDetail> mypageOrderDetail(String oid);

	List<HashMap<String, Object>> listProduct(Integer oid);

	Orders myorders(String mEmail);

	List<Map<String, Object>> productlist(String mEmail);

	int qnaInsert(QnaBoard board);

	QnaBoard selectQna(int qid);

	int totalCount(String mEmail);


}
