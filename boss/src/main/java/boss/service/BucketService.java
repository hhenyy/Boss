package boss.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boss.dao.BucketDao;
import boss.model.Bucket;

@Service
public class BucketService {

   @Autowired
   private BucketDao dao;

   // 장바구니 전체 리스트 구하기(세션)
   public List<Bucket> selectBucketList(String memail) {
      return dao.selectBucketList(memail);
   }

}