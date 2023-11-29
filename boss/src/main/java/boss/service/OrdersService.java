package boss.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boss.dao.OrdersDao;

@Service
public class OrdersService {

	@Autowired
	OrdersDao dao;
}
