package com.emadam.board.api.dto;

import java.time.LocalDateTime;

import com.emadam.board.domain.Board;

public class BoardResponse {
    private long id;
    private String subject;
    private String content;
    private String username;
    private LocalDateTime createdAt;

    private BoardResponse(Board board) {
        this.id = board.getId();
        this.subject = board.getSubject();
        this.content = board.getContent();
        this.username = board.getUsername();
        this.createdAt = board.getCreatedAt();
    }

    public long getId() {
        return id;
    }

    public String getSubject() {
        return subject;
    }

    public String getContent() {
        return content;
    }
    
    public String getUsername() {
        return username;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public static BoardResponse of(Board board) {
        return new BoardResponse(board);
    }
}
