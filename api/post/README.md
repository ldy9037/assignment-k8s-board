# ldy9037/assignment-k8s-board

[![standard-readme compliant](https://img.shields.io/badge/readme%20style-standard-brightgreen.svg?style=flat-square)](https://github.com/RichardLitt/standard-readme)


## Table of Contents

- [소개](#소개)
- [시작하기](#시작하기)
- [구성요소](#구성요소)
- [제작자](#제작자)

## 소개

  과제전형 중 웹 어플리케이션 백엔드 구현에 대한 디렉토리입니다. Springboot 2.7.5로 구축하였으며 게시글 추가/읽기 기능이 존재합니다. 
 
 ##### 기술 스택
 - JDK 8
 - Springboot 2.7.5
 - Gradle 

## 구성요소
API 명세서 입니다. 

### 게시글 추가
```sh
# 게시글 추가
$ curl -d '{"subject":"제목", "content":"내용", "username":"작성자"}' \
-H "Content-Type: application/json" \
-X POST http://<endpoint>/board/

1
```

```sh
# 게시글 가져오기 (게시글 ID)
curl -X GET "http://<endpoint>/board/{id}"

{
    "id": 1, 
    "subject": "제목",
    "content": "내용",
    "username": "작성자",
    "createdAt: "2022-12-11T11:28:02.121"
}
```

```sh
# 게시글 목록 가져오기
curl -X GET "http://<endpoint>/board/"

[
    {
        "id": 1, 
        "subject": "제목",
        "content": "내용",
        "username": "작성자",
        "createdAt: "2022-12-11T11:28:02.121"
    }
    ...
]
```

### Endpoint 
http://k8s-board-boarding-c11cd254a0-1150454342.ap-northeast-2.elb.amazonaws.com/

## 제작자
[ldy9037@naver.com](ldy9037@naver.com)