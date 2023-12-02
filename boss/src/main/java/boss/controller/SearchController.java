package boss.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import boss.common.PagePgm;
import boss.model.Product;
import boss.service.SearchService;

@Controller
public class SearchController {

	@Autowired
	SearchService ss;

	@RequestMapping("allSearch.do")
	public String allSearch(PagePgm pp, 
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage, Model model) {
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "15";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "15";
		}
		int total = ss.searchCount(pp.getKeyword());
		System.out.println(total);
		
		PagePgm sl = new PagePgm(total,Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		
		List<Product> searchList = ss.allSearch(sl);
		System.out.println(searchList.get(0).getPname());
		model.addAttribute("search", searchList);
		model.addAttribute("pp", pp);
		
		return "./product/search";
}
	
}
