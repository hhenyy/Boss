package boss.dao;

import org.apache.ibatis.annotations.Mapper;

import boss.model.Orders;

@Mapper
public interface MypageDao {

	Orders myoders(String mEmail);

}
