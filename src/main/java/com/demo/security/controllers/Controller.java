package com.demo.security.controllers;

import com.demo.security.entities.User;
import com.demo.security.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;

@RestController
@RequiredArgsConstructor
public class Controller {
    private final UserService userService;

    @GetMapping("/")
    public String homePage() {
        return "home";
    }
    @GetMapping("/unsecured")
    public String unsecuredPage() {
        return "unsecured";
    }
    @GetMapping("/auth_page")
    public String authPage() {
        return "auth";
    }
    @GetMapping("/admin")
    public String adminPage() {
        return "admin";
    }
    @GetMapping("/user_info")
    public String userInfoPage(Principal principal) {
        User user = userService.findByUsername(principal.getName()).orElseThrow(() -> new UsernameNotFoundException(String.format("User '%s' not found!")));
        return "Auth user info - " + user.getUsername() + " " + user.getEmail();
    }
}
