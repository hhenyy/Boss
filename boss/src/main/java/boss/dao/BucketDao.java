package boss.dao;

import org.apache.ibatis.annotations.Mapper;

import boss.model.Bucket;

@Mapper
public interface BucketDao {

	int insert(Bucket bucket);
	int update(Bucket bucket);

}
