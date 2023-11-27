package boss.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import boss.model.FreeBoard;

@Mapper
public interface FreeBoardDao {

	int insert(FreeBoard board);
	int listcount();
	List<FreeBoard> selectList(int page);
	int readcount(int fId);
	FreeBoard getDetail(int fId);

}
