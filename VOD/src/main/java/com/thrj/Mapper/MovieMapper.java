package com.thrj.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.thrj.Entity.History;
import com.thrj.Entity.Movies;
import com.thrj.Entity.Paging;

@Mapper
public interface MovieMapper {
	public List<Movies> movieList(); //영화기록
	public Movies animeDetails(int movie_seq); //박스오피스에서 번호값을 받았을경우
	public void raiseLookupCount(int movie_seq);//게시물을 볼경우 count
	public Movies bannerOne(); //하나만 사용할때
	
	public List<Movies> bannerList();
	public int getTotalRowCount(Paging paging);
	public List<Paging> getPageList(Paging paging);
	public void updateStarRating(Movies vo); // 유저 별점 남기기 
	public List<Movies> movieGenreList(Movies vo); // 상세페이지 장르별 유사 영화 추천 
	public List<History> historySeq(String mb_id);
}
