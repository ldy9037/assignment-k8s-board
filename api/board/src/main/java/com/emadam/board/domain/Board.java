package com.emadam.board.domain;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import com.emadam.board.api.dto.BoardRequest;

@Entity
public class Board {

    @Id
    @GeneratedValue
    private long id;

    private String subject;
    private String content;
    private String username;
    private LocalDateTime createdAt;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
    
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public static Board create(BoardRequest boardRequest) {
        Board board = new Board();
        board.setSubject(boardRequest.getSubject());
        board.setContent(boardRequest.getContent());
        board.setUsername(boardRequest.getUsername());
        board.setCreatedAt(LocalDateTime.now());

        return board;
    }
}
