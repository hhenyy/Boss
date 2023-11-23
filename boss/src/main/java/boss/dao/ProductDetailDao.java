package boss.dao;

import org.apache.ibatis.annotations.Mapper;

import boss.model.Product;

@Mapper
public interface ProductDetailDao {


	Product select(String pid);

}
