package org.me.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/faq/*")
@Log4j
public class FaqController {

	@RequestMapping(value="/faq", method = RequestMethod.GET)
	public void adminGET() {
		log.info("자주 묻는 질문 이동");
	}
}
