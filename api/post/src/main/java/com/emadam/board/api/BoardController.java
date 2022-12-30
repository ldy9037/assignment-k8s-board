package com.emadam.board.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.emadam.board.api.dto.BoardRequest;
import com.emadam.board.api.dto.BoardResponse;
import com.emadam.board.service.BoardService;

@RestController
@RequestMapping(value = "/board")
@CrossOrigin
public class BoardController {
    
    @Autowired
    private BoardService boardService;

    @GetMapping("/{id}")
    public BoardResponse read(@PathVariable long id) {
        return boardService.readBoard(id);
    }

    @GetMapping
    public List<BoardResponse> readAll() {
        return boardService.readAll();
    }

    @PostMapping
    public long create(@RequestBody BoardRequest boardRequest) {
        return boardService.createBoard(boardRequest);
    }
}
