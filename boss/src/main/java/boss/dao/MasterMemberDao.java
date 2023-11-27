package boss.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import boss.common.PagePgm;
import boss.common.Search;
import boss.model.Member;

@Mapper
public interface MasterMemberDao {
	Member selectOne(String id);

	int update(Member member);

	int delete(List<String> idList);

	int getTotal(Member member);

	// 게시물 총 갯수
	int total();

	// 페이징 처리 게시글 조회
	List<Member> list(PagePgm vo);
	
	
	int deleteMember(List<String> midList);

	// 유형별 검색
	List<Member> searchMember(Search search);


}
