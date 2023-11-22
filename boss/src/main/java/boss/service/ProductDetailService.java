package boss.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boss.dao.ProductDetailDao;

@Service
public class ProductDetailService{

	@Autowired
	ProductDetailDao dao;
}
