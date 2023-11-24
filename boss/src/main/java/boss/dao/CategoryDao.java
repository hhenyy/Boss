package boss.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import boss.model.Category;
import boss.model.Product;

@Mapper
public interface CategoryDao {

	int categoryCount(String cid);

	List<Product> categoryList(Category c);

}
