package boss.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import boss.model.MainImage;
import boss.model.Product;
import boss.service.MasterProductService;

@Controller
public class MainController {

	@Autowired
	private MasterProductService service;

	/*
	 * 메인 페이지 이동 메소드
	 */
	@RequestMapping(value = "main.do")
	public String main(Model model, @RequestParam(value = "block", required = false, defaultValue = "1") String block)
			throws Exception {
		System.out.println("main");

		// 초기값 뿌려줌
		Map<String, MainImage> mainImageList = new HashMap<String, MainImage>();
		List<MainImage> mainImageList_db = service.selectMainProductList();

		if (mainImageList_db.size() > 0) { // 1개라도 구해옴.
			System.out.println("1개라도 구해옴.");
			for (int i = 0; i < mainImageList_db.size(); i++) { // list size만큼 put

				System.out.println("사이즈 : " + mainImageList_db.size());

				// int s = Integer.parseInt(block);

				model.addAttribute("block" + (i + 1), i + 1);

				model.addAttribute("mainImageList" + i, mainImageList_db.get(i));
				System.out.println(mainImageList_db.get(i).getMainimage());
				System.out.println(mainImageList_db.get(i).getMainid());
			}
		} else {
			System.out.println("1개도 못구해옴.");
		}
		
		model.addAttribute("block", block);
 
		return "common/main";
	}

	/*
	 * 메인 이미지 수정 메소드
	 */
	@RequestMapping("masterImageUpdateForm.do")
	public String masterImageUpdateForm(String id, String block, Model model) {

		Product product = service.selectOne(id);
		System.out.println("block : " + block+50);
		
		
		String mainImage = product.getPimage();
		String mainPname = product.getPname();
		String mainContent = product.getPcontent();
		
		System.out.println(id);
		
		int bk = Integer.parseInt(block);
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("block", bk);
		map.put("id", id);
		map.put("mainimage", mainImage);
		map.put("mainpname", mainPname);
		map.put("maincontent", mainContent);
		
		System.out.println("쿼리문 돌기전");
		int result = service.updateMainImageInsert(map);
		System.out.println("쿼리문 돌음");
		System.out.println("result : " + result);

		model.addAttribute("block",block);
		
		return "redirect:/main.do";
	}
}
