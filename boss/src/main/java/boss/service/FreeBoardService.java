package boss.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boss.dao.FreeBoardDao;

@Service
public class FreeBoardService {

	@Autowired
	private FreeBoardDao fdao;
	
	
	
}
