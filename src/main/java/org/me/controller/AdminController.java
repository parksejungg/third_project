package org.me.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/*")
@Log4j
public class AdminController {

	@RequestMapping(value="/main", method = RequestMethod.GET)
	public void adminGET() {
		log.info("관리자 페이지 이동");
	}
}
