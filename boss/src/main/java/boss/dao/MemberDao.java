package boss.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import boss.model.Member;

@Repository
public interface MemberDao {
	
	// 회원가입
	public int insertMember(Member member);
	
	// 1명의 정보 가져오기
	public Member selectOne(String mEmail);
	
	// 네이버 회원 가입
	public int insertNMember(Map<String, Object> map);  
	
}
