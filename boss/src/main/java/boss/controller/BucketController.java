package boss.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import boss.model.Bucket;
import boss.model.Member;
import boss.service.BucketService;

@Controller
public class BucketController {
   
   @Autowired
   private BucketService service;
   
   /*
    * 장바구니 폼 이동 메소드
    */
   @RequestMapping("cartFormMove.do")
   public String cartFormMove(HttpSession session,Model model) {
      
      Member member = (Member)session.getAttribute("member");
      System.out.println("member : " + member.getmEmail());
      // 장바구니 전체 리스트 구해오기(세션)
      String memail = member.getmEmail();
      List<Bucket> list = service.selectBucketList(memail);
      System.out.println(list);
      if(!list.isEmpty()) {
         System.out.println("list2에 들어있음" + list.get(0).getBimage());
      }
      
      model.addAttribute("list", list);
      
      return "bucket/bucketList";
   }
   
}