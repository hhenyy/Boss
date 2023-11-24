package boss.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import boss.common.PagePgm;
import boss.model.Product;

@Mapper
public interface MasterProductDao {

	// 총상품 갯수
	int totalCount();

	// 페이징 처리된 상품 리스트
	List<Product> selectList(PagePgm page);

	// 상품 상세정보 구하기
	Product selectOne(String id);

	// 상품 등록 하기
	int productInsert(Product product);

	Product odidList(String odid);

}
