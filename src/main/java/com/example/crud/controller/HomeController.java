package com.example.crud.controller;

import com.example.crud.model.Student;
import com.example.crud.service.impl.StudentServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class HomeController {

    @Autowired
    private StudentServiceImpl studentService;

    @GetMapping("/")
    public ModelAndView showHomePage(ModelAndView modelAndView){


        List<Student> studentList = studentService.findAll();
        modelAndView.addObject("students", studentList);
        modelAndView.setViewName("index");

        return modelAndView;
    }
}