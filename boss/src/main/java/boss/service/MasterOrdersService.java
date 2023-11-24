package boss.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boss.common.PagePgm;
import boss.dao.MasterOrdersDao;
import boss.model.Member;
import boss.model.OrderDetail;
import boss.model.Orders;

@Service
public class MasterOrdersService {

	@Autowired
	private MasterOrdersDao dao;

	public Orders selectOne(String oid) {
		return dao.selectOne(oid);
	}

	public int total() {
		return dao.total();
	}

	public List<Member> list(PagePgm pp) {
		return dao.list(pp);
	}
	

	public int delete(List<String> idList) {
		return dao.delete(idList);
	}

	public List<OrderDetail> odList(String oid) {
		return dao.odList(oid);
	}
}
