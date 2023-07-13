package org.me.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NoticeController {

	@RequestMapping(value = "notice.do")
	public ModelAndView fwdPaymentSuccessPage() {
		return new ModelAndView("/notice/notice");
	}
	
}
