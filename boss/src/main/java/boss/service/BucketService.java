package boss.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boss.dao.BucketDao;
import boss.model.Bucket;

@Service
public class BucketService {

	@Autowired
	private BucketDao dao;

	public int insert(Bucket bucket) {
		return dao.insert(bucket);
	}

	public int update(Bucket bucket) {
		return dao.update(bucket);
	}



}
