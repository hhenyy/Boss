package boss.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import boss.common.PagePgm;
import boss.model.MasterNotice;

@Mapper
public interface MasterNoticeDao {

		int totalCount();

		List<MasterNotice> noticeList(PagePgm page);

		int noticeInsert(MasterNotice notice);

		void noticeDelete(int mnId);

		void updateMnReadCount(int i);

		MasterNotice selectOne(int mnId);

		void masterNoticeUpdate(MasterNotice mn);

		int noticeCount(String keyword);

		List<MasterNotice> noticeSearchList(PagePgm pp);

		int noticeMax();

		MasterNotice selectMove(int rnum);

}
