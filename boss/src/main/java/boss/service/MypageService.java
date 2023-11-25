package boss.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boss.dao.MypageDao;
import boss.model.Orders;

@Service
public class MypageService {
	
	@Autowired
	private MypageDao dao;

	public Orders myoders(String mEmail) {
		return dao.myoders(mEmail);
	}
	
}
