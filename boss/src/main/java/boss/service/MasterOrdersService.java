package boss.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boss.common.PagePgm;
import boss.common.Search;
import boss.dao.MasterOrdersDao;
import boss.model.Member;
import boss.model.Orders;
import boss.model.QnaBoard;

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

	public List<HashMap<String, Object>> listProduct(int oid) {
		return dao.listProduct(oid);
	}

	// 주문내역 검색 유형별 검색
	public List<Orders> searchOrdersList(Search search) {
		return dao.searchOrdersList(search);
	}

}
