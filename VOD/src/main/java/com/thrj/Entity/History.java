package com.thrj.Entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Data // getter setter
@ToString
public class History { //이력남은 테이블
	
	private String mb_id; // 시청아이디
	private int movie_seq; //선택된 영화번호
	private Date date; //저장날짜
	
}