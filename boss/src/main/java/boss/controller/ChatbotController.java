package boss.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import boss.service.ChatbotService;

@Controller
public class ChatbotController {
	
	@Autowired
	private ChatbotService chatservice;
	
	

}
