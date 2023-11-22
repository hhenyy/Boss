package boss.dao;

import org.springframework.stereotype.Repository;

import boss.model.Member;

@Repository
public interface MemberDao {

	public int InsertMember(Member member);

	public Member SelectOne(String id);
	
}
