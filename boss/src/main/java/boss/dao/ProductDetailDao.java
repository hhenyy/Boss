package boss.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import boss.model.Product;
import boss.model.Review;

@Mapper
public interface ProductDetailDao {

	

	Product selectProduct(String pid);

	Review selectReview(String pid);

	Review selectReviewOne(int rid);

	Review prselect(int rid);

}
