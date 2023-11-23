package boss.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boss.dao.ProductDetailDao;
import boss.model.Product;

@Service
public class ProductDetailService{

	@Autowired
	ProductDetailDao dao;

	public Product select(String pid) {
		return dao.select(pid);
	}


}
