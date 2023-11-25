package boss.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import boss.common.PagePgm;
import boss.model.Product;
import boss.model.Review;

@Mapper
public interface ProductDetailDao {

	

	

	Product selectProduct(String pid);

	Review selectReview(String pid);

	Review selectReviewOne(int rid);

	Review prselect(int rid);

	int total();

	List<Review> list(PagePgm pp);

//	int insert(int rid);

}
