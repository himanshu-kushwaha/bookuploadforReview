package com.hellokoding.auth.web;

import com.hellokoding.auth.model.User;
import com.hellokoding.auth.repository.UserRepository;
import com.hellokoding.auth.service.SecurityService;
import com.hellokoding.auth.service.SecurityServiceImpl;
import com.hellokoding.auth.service.UserService;
import com.hellokoding.auth.validator.UserValidator;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;
    
    @Autowired
    private SecurityServiceImpl securityServiceImpl;
    
    @Autowired
    private UserRepository userRepository;
    
    private String userName;

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
        userValidator.validate(userForm, bindingResult);

        userName=userForm.getUsername();
//        System.out.println("here: "+ userName);
        
        if (bindingResult.hasErrors()) {
            return "registration";
        }

        userService.save(userForm);

        securityService.autologin(userForm.getUsername(), userForm.getPasswordConfirm());

        return "redirect:/welcome";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
    	System.out.println("ERROR "+error);
    	System.out.println("LOGOUT "+logout);
    	System.out.println("model: "+model.toString());
    	
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "login";
    }

    @RequestMapping(value = "/welcome", method = RequestMethod.GET)
    public String welcome(Model model) {
        return "welcome";
    }

    @RequestMapping(value="/edit", method=RequestMethod.GET)
    public String editProfile() {
    	System.out.println("I am here");
    	return "edit_profile";
    }
    
    @RequestMapping(value="/edit/{userName}", method=RequestMethod.GET)
//    public String updateProfile(@PathVariable("userName") String userName, Model model) {
//    	System.out.println("in put: "+userRepository.findByUsername(userName).getLastName());
//    	model.addAttribute(userRepository.findByUsername(userName));
//    	return "edit_profile";
//    }
    
    public ModelAndView user(){
        ModelAndView mav = new ModelAndView("edit_profile") ;
        User user=userRepository.findByUsername(userName);
        List<User> userForms = new ArrayList<>();
        userForms.add(user);
        
        mav.addObject("userForms", userForms);  
        return mav;
    }
}
