package boss.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String reportWrite(Report report, Model model) {
		System.out.println("reportWriteResult");
		System.out.println("report1 : " + report.getMemail());
		System.out.println("report1 : " + report.getReportanswer());
		System.out.println("report1 : " + report.getReportcontent());
		System.out.println("report1 : " + report.getReportdrop());
		System.out.println("report1 : " + report.getReportid());
		System.out.println("report1 : " + report.getReportimage());
		System.out.println("report1 : " + report.getReportname());
		System.out.println("report1 : " + report.getReportreply());
		System.out.println("report1 : " + report.getReporttitle());
		System.out.println("report1 : " + report.getReportreg());
		System.out.println("report1 : " + report.getReportreplyreg());
		return "report/reportWriteResult";
	}
}
