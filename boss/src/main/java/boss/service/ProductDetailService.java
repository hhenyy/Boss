package boss.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boss.common.PagePgm;
import boss.dao.ProductDetailDao;
import boss.model.Product;
import boss.model.Review;
import java.util.List;

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

	public Review selectReviewOne(int rid) {
		return dao.selectReviewOne(rid);
	}

	public Review prselect(int rid) {
		System.out.println("서비스까지 옴 "+ rid);
		return dao.prselect(rid);
	}

	public int total() {
		return dao.total();
	}

	public List<Review> list(PagePgm pp) {
		return dao.list(pp);
	}


//	public int insert(int rid) {
//		return dao.insert(rid);
//	}



}
