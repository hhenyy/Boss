package boss.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boss.common.PagePgm;
import boss.dao.MasterNoticeDao;
import boss.model.MasterNotice;

@Service
public class MasterNoticeService {
	
	@Autowired
	MasterNoticeDao dao;

	public int totalCount() {

		return dao.totalCount();
	}

	public List<MasterNotice> noticeList(PagePgm page) {

		return dao.noticeList(page);
	}

	public int noticeInsert(MasterNotice notice) {

		return dao.noticeInsert(notice);
	}

	
 
}
