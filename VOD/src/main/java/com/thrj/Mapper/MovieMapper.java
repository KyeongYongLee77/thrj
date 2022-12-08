package com.thrj.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.thrj.Entity.History;
import com.thrj.Entity.Movies;
import com.thrj.Entity.Paging;

@Mapper
public interface MovieMapper {
	public List<Movies> movieList(); //영화리스트
	public Movies animeDetails(int movie_seq); //박스오피스에서 번호값을 받았을경우
	public void raiseLookupCount(int movie_seq);//게시물을 볼경우 count
	public Movies bannerOne(); //하나만 사용할때
	public void insertHistorySeq(Movies vo); // 상세페이지 장르별 유사 영화 삽입
	public List<Movies> historySeq(String mb_id); //시청 이력 가져오기
	public List<Movies> categorieList(); //카테고리페이지 영화리스트
	
	public List<Movies> bannerList();
	public int getTotalRowCount(String movieType);
	public List<Paging> getPageList(Paging paging);
	public void updateStarRating(Movies vo); // 유저 별점 남기기 
	public List<Movies> movieGenreList(Movies vo); // 상세페이지 장르별 유사 영화 추천 	
	public List<Movies> movie_typeList(String movieType);  //카테고리별 영화 시퀀스
	public Movies typeList(int seq);  //카테고리별 영화 리스트
	
	public List<Movies> history_test(String mb_id);
	public void delete_history(Movies movies);
	public List<History> mb_history_list(String mb_id);
	
	public List<Movies> recomVod(int[] movie_seq_array); //유사영화 시퀀스 배열
}
