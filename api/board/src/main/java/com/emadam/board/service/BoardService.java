package com.emadam.board.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.persistence.NoResultException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.emadam.board.api.dto.BoardRequest;
import com.emadam.board.api.dto.BoardResponse;
import com.emadam.board.domain.Board;
import com.emadam.board.domain.BoardRepository;

@Service
public class BoardService {
    
    @Autowired
    private BoardRepository boardRepository;

    public BoardResponse readBoard(long id) {
        return BoardResponse.of(findBoardById(id));
    }

    public long createBoard(BoardRequest boardRequest) {
        Board board = Board.create(boardRequest);
        return boardRepository.save(board).getId();
    }
    
    public List<BoardResponse> readAll() {
        List<BoardResponse> result = new ArrayList<>();

        boardRepository.findAll()
                .forEach(b -> result.add(BoardResponse.of(b)));
    
        return result;
    } 

    private Board findBoardById(long id) {
        Optional<Board> board = boardRepository.findById(id);

        if (!board.isPresent()) {
            throw new NoResultException("검색 결과가 없습니다.");
        }

        return board.get();
    }
}
