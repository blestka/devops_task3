package com.task3.devopstask3.controllers;

import java.time.LocalDateTime;
import java.util.Optional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;

@RestController
public final class DemoController {
    @GetMapping("/devops")
    public String getDevopsName() {
        return Optional.ofNullable(System.getenv("DEVOPS"))
                .orElse("noname");
    }

    @GetMapping("/current-time")
    public LocalDateTime getCurrentTime() {
        return LocalDateTime.now();
    }
}
