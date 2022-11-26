package com.thrj.Entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@RequiredArgsConstructor
@NoArgsConstructor
@AllArgsConstructor
@Data // getter setter
@ToString
public class Movies {
	
	@NonNull private int movie_seq;                    // 영화순번
	@NonNull private String movie_title;               // 영화제목
	@NonNull private String movie_content;             // 영화 줄거리
	@NonNull private String movie_img;                 // 영화이미지
	@NonNull private String movie_type;                // 영화줄거리
	@NonNull private String movie_open_date;           // 영화개봉날짜           
	@NonNull private int movie_rating;              // 영화점수
	@NonNull private String movie_runtime;             // 상영시간
	@NonNull private String movie_actor;               // 영화 출연배우
	@NonNull private String movie_country;             // 영화 제작국가
	@NonNull private String admin_id;                  // 관리자 아이디
	@NonNull private String movie_director;            // 영화감독
	private String movie_cnt;                          // 페이지 관람수
	private String movie_age;                          // 영화 시청연령
	private int movie_participate;                     // 별점 참여자수
	private String mb_id;                              // 시청자 아이디
	private int cmt_seq;                               // 댓글수
}
