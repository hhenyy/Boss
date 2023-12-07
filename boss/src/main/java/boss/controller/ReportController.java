package boss.controller;

import java.io.File;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import boss.model.Report;
import boss.service.ReportService;

@Controller
public class ReportController {

	@Autowired
	ReportService rs;

	// 신고 작성 폼 이동
	@RequestMapping("reportWriteForm.do")
	public String reportWriteForm() {
		System.out.println("reportWriteForm");
		return "report/reportWriteForm";
	}

	// 신고 작성 폼 이동
	@RequestMapping("reportWrite.do")
	public String reportWrite(Report report, Model model,
			@RequestParam(value = "image1", required = false) MultipartFile mfile) throws Exception {
		System.out.println("reportWrite");
		int result = 0;
		String realFileName = mfile.getOriginalFilename();
		int size = (int) mfile.getSize();
		if (realFileName != null && realFileName != "") { // 파일이 있는경우
			String extension = realFileName.substring(realFileName.lastIndexOf("."), realFileName.length());
			System.out.println("파일이있음. : " + extension);
			if (size > 4000000) { // 이미지의 용량이 약 4MB를 초과한 경우.
				System.out.println("용량초과");
				model.addAttribute("result", 2);
				model.addAttribute("msg", "용량이 3MB 이상입니다.");
				return "report/reportWriteResult"; 
			} else if (!(extension.equals(".jpg") && extension.equals(".png") && extension.equals(".jpeg")
					&& extension.equals(".gif"))) { // 이미지 형식이 올바르지 않은경우.
				System.out.println("이미지 형식 다름");
				model.addAttribute("result", 3);
				model.addAttribute("msg", "올바른 파일 형식이 아닙니다.");
				return "report/reportWriteResult";
			}
			UUID uuid = UUID.randomUUID();
			String newFileName = uuid + extension;
			report.setReportimage(newFileName);
			String path = "C:\\gitBoss\\boss\\src\\main\\webapp\\uploadReport";
			mfile.transferTo(new File(path + "/" + newFileName));
		} else { // 파일이 없는경우
			System.out.println("파일이 없음.");
			model.addAttribute("result", -1);
			model.addAttribute("msg", "파일이 존재하지 않습니다.");
			return "report/reportWriteResult";
		}
		
		result = rs.insert(report);
		if (result == 1) {

			model.addAttribute("msg", "신고가 접수되었습니다.");
			model.addAttribute("result", result);
		} else {
			model.addAttribute("msg", "글 작성에 실패하였습니다.");
			model.addAttribute("result", result);
		}

		return "report/reportWriteResult";
	}
}
