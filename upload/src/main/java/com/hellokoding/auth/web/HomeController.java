package com.hellokoding.auth.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

	@RequestMapping(value= {"/","/HomePage","/homepage"}, method=RequestMethod.GET)
 /*   public String homePage(ModelMap model) {
    	return "HomePage";
    }*/
	public ModelAndView welcomePage() {
		ModelAndView model = new ModelAndView();
		model.setViewName("HomePage");
		return model;
	}
	
	@RequestMapping(value= "/edit_profile", method=RequestMethod.GET)
	 /*   public String homePage(ModelMap model) {
	    	return "HomePage";
	    }*/
		public ModelAndView editProfile() {
			ModelAndView model = new ModelAndView();
			model.setViewName("edit_profile");
			return model;
		}
	
	@RequestMapping(value= "/MainPage", method=RequestMethod.GET)
	 /*   public String homePage(ModelMap model) {
	    	return "HomePage";
	    }*/
		public ModelAndView mainPage() {
			ModelAndView model = new ModelAndView();
			model.setViewName("MainPage");
			return model;
		}
}

