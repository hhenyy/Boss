package boss.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import boss.model.Likes;

@Mapper
public interface LikeDao {

	//좋아요가 DB에 있는지 확인
	public Likes findLike(Map<String, Object> number);

	//좋아요 정보(Likes table에 게시글 번호, 회원 번호) 저장
	public int insertLike(Likes like);

	//좋아요 삭제
	public void deleteLike(Likes like);

	public Likes findLikes(Likes like);

	public int countLike(int fId);

}
