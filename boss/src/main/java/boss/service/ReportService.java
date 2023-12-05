package boss.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boss.dao.ReportDao;

@Service
public class ReportService {
	@Autowired
	ReportDao rd;
}
