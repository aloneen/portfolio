package org.seisen.thymeleafbasic.controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class PortfolioController {

    @Autowired
    private JavaMailSender mailSender;


    @GetMapping("/")
    public String home() {
        return "index";
    }


    @PostMapping("/send")
    public String sendEmail(@RequestParam String name, @RequestParam String email, @RequestParam String message) {
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setTo("diasseisenbek80@gmail.com");
        mailMessage.setSubject("New message from portfolio");
        mailMessage.setText("Name: " + name + "\nEmail: " + email + "\nMessage: " + message);
        mailSender.send(mailMessage);
        return "redirect:/?success";
    }



}
