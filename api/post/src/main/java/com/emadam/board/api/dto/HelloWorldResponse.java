package com.emadam.board.api.dto;

public class HelloWorldResponse {
    private String message;

    public HelloWorldResponse(String message) {
        this.message = message;
    }

    public String getMessage() {
        return this.message;
    }
}
