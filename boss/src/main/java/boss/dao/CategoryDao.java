package boss.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import boss.model.Category;
import boss.model.Product;

@Repository
public interface CategoryDao {

	int categoryCount(String cid);

	List<Product> categoryList(String cid);

}
