package com.emadam.board.api;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyLong;
import static org.mockito.BDDMockito.given;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;

import com.emadam.board.api.dto.BoardRequest;
import com.emadam.board.api.dto.BoardResponse;
import com.emadam.board.domain.Board;
import com.emadam.board.service.BoardService;
import com.fasterxml.jackson.databind.ObjectMapper;

@WebMvcTest
public class BoardControllerTest {
    
    @Autowired
    private MockMvc mvc;
    
    @MockBean
    private BoardService boardService;

    @Autowired
    private ObjectMapper objectMapper;

    @Test
    void readBoard() throws Exception {
        BoardResponse boardResponse = getBoardResponseFixture(0);
        given(boardService.readBoard(anyLong())).willReturn(boardResponse); 

        this.mvc.perform(get("/board/{id}", boardResponse.getId()))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.id").value(boardResponse.getId()))
                .andExpect(jsonPath("$.subject").value(boardResponse.getSubject()))
                .andExpect(jsonPath("$.content").value(boardResponse.getContent()))
                .andExpect(jsonPath("$.username").value(boardResponse.getUsername()))
                .andExpect(jsonPath("$.createdAt").isNotEmpty());
    }

    @Test
    void readAll() throws Exception {
        List<BoardResponse> boards = IntStream.range(0, 10)
                .mapToObj(i -> getBoardResponseFixture((long) i))
                .collect(Collectors.toList());

        given(boardService.readAll()).willReturn(boards);

        this.mvc.perform(get("/board/"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.length()").value(10));
    }

    @Test
    void create() throws Exception {
        BoardRequest boardRequest = getBoardRequestFixture(0);
        given(boardService.createBoard(any(BoardRequest.class))).willReturn(0L);
        
        this.mvc.perform(post("/board/")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(boardRequest)))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$").value(0L));
    }

    private static BoardResponse getBoardResponseFixture(long id) {
        return BoardResponse.of(getBoardFixture(id));
    }

    private static Board getBoardFixture(long id) {
        return Board.create(getBoardRequestFixture(id));
    }

    private static BoardRequest getBoardRequestFixture(long id) {
        BoardRequest boardRequest = new BoardRequest();
        boardRequest.setId(id);
        boardRequest.setSubject("subject");
        boardRequest.setContent("content");
        boardRequest.setUsername("username");

        return boardRequest;
    } 
}
