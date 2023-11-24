package boss.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import boss.common.PagePgm;
import boss.model.Member;
import boss.model.OrderDetail;
import boss.model.Orders;

@Mapper
public interface MasterOrdersDao {

	Orders selectOne(String oid);

	int total();

	List<Member> list(PagePgm pp);

	int delete(List<String> idList);

	List<OrderDetail> odList(String oid);

}
