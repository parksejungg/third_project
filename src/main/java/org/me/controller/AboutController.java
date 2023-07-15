package org.me.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/about/*")
@Log4j
public class AboutController {

	@RequestMapping(value="/about", method = RequestMethod.GET)
	public void adminGET() {
		log.info("회사소개 이동");
	}
}
