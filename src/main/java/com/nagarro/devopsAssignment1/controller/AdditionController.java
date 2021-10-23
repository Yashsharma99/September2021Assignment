package com.nagarro.devopsAssignment1.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller

public class AdditionController {
	@RequestMapping(value="/add")
	public ModelAndView add(HttpServletRequest req, HttpServletResponse resp) {

		ModelAndView mv = new ModelAndView();
		int a = Integer.parseInt(req.getParameter("num1"));
		int b = Integer.parseInt(req.getParameter("num2"));
		int sum = a + b;
		mv.addObject("result", sum);
		mv.setViewName("addResult");

		return mv;

	}


}
