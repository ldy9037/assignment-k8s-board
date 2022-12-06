package com.emadam.board.api;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.emadam.board.api.dto.HelloWorldResponse;

@RestController
public class HelloWorldController {
    
    @GetMapping("/")
    public HelloWorldResponse helloworld() {
        return new HelloWorldResponse("Hello world!");
    }
}
