package com.emadam.board.api;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.test.web.servlet.MockMvc;

import com.emadam.board.api.dto.HelloWorldResponse;

@WebMvcTest
public class HelloWorldControllerTest {

    @Autowired
    private MockMvc mvc;

    @Test
    void call_helloworld() throws Exception {
        HelloWorldResponse helloWorldResponse = new HelloWorldResponse("Hello world!");

        this.mvc.perform(get("/"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.message").value(helloWorldResponse.getMessage()));
    }

}
