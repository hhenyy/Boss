package boss.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import boss.common.PagePgm;
import boss.model.MasterNotice;

@Mapper
public interface MasterNoticeDao {

		int totalCount();

		List<MasterNotice> noticeList(PagePgm page);
	

}
