package org.me.controller;

import org.me.domain.MapVO;
import org.me.service.MapService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@Log4j
public class MapController {

	private MapService mapService;

	@RequestMapping(value = "/map")
	public ModelAndView map(MapVO vo) {
//		mapService.mapInsert(vo);
		return new ModelAndView("/map/map");
	}

	@RequestMapping(value = "/map", method = RequestMethod.POST)
	public String mapInsert(MapVO vo) {
		
		mapService.mapInsert(vo);
		
		return "redirect:/map";
	}

}
