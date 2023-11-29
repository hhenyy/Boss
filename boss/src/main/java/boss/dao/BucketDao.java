package boss.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import boss.model.Bucket;

@Mapper
public interface BucketDao {

   // 장바구니 전체리스트 구하기(세션)
   List<Bucket> selectBucketList(String memail);

}