package boss.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boss.dao.LikeDao;
import boss.model.Likes;

@Service
public class LikeService {
	
	@Autowired
	private LikeDao ldao;
	
	public Likes findLike(int fId, String mEmail) {
		// 2개의 parameter를 보내기 위해 Map 선언 및 Map에 데이터 삽입
		Map<String, Object> number = new HashMap<String, Object>();
		number.put("fId", fId);
		number.put("mEmail", mEmail);
		return ldao.findLike(number);
	}

	public int insertLike(Likes like) {
		// 좋아요가 DB에 저장이 되는것이 없으면 0이 그대로 리턴으로 넘어감
		int result = 0;
		
		int fId= like.getfId();
		String mEamil = like.getmEmail();
		// 좋아요가 이미 있는지 확인하는 코드
		Likes find = ldao.findLikes(like);
		
		// find가 null이면 좋아요가 없는 상태이므로 정보 저장
		// find가 null이 아니면 좋아요가 있는 상태이므로 정보 삭제
		if(find==null) {
			// insert의 리턴값은 DB에 성공적으로 insert된 갯수를 보내므로 result가 1이 됨
			result = ldao.insertLike(like);
		} else {
			ldao.deleteLike(like);
		}
	    	// 0 or 1이 담겨져서 @Controller에 보냄.
		return result;
	}
	
	

}
