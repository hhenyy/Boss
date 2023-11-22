package boss.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boss.common.PagePgm;
import boss.dao.MasterProductDao;
import boss.model.Product;

@Service
public class MasterProductService {

	@Autowired
	MasterProductDao dao;
	
	// 총상품 갯수 구하기
	public int totalCount() {
		return dao.totalCount();
	}

	// 페이징 처리된 리스트 구하기
	public List<Product> selectList(PagePgm page) {
		return dao.selectList(page);
	}

	// 상품 상세정보 구하기
	public Product selectOne(String id) {
		return dao.selectOne(id);
	}

}
