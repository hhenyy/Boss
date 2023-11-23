package boss.dao;

import org.springframework.stereotype.Repository;

import boss.model.Product;

@Repository
public interface ProductDetailDao {


	Product select(String pid);

}
