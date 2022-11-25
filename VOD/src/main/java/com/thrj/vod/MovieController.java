package com.thrj.vod;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.thrj.Entity.Comments;
import com.thrj.Entity.History;
import com.thrj.Entity.Movies;
import com.thrj.Entity.Paging;
import com.thrj.Mapper.CommentsMapper;
import com.thrj.Mapper.MovieMapper;


@Controller
public class MovieController {
	
	@Autowired
	public MovieMapper mapper;
	
	@Autowired
	public CommentsMapper cmt_mapper;
	
	@RequestMapping(value={"/index.do","/"}, method=RequestMethod.GET)
	public String index(Model model, HttpServletRequest request) {
		List<Movies> list = mapper.movieList();
		model.addAttribute("list",list);
		
		List<Movies> list1 = mapper.bannerList();
		model.addAttribute("list1",list1);
		
		HttpSession session = request.getSession();
		String mb_id=(String)session.getAttribute("mb_id");
		List<History> history_seq = mapper.historySeq(mb_id);
		model.addAttribute("history_seq",history_seq);
		return "index";
	}
	
	//상세페이지 사이드바 장르별 리스트 
//	@GetMapping(value="/genreList.do")
//	public String genreList(Movies vo, Model model) {
//		
//		List<Movies> list_genre = mapper.movieGenreList();
//		model.addAttribute("list_genre",list_genre);
//		
//		return "redirect:/animeDetails.do?movie_seq="+vo.getMovie_seq();
//		
//	}
	
	@RequestMapping(value="/animeDetails.do", method=RequestMethod.GET)
	public ModelAndView animeDetails(HttpServletRequest request, Model model) {
		
		ModelAndView mv = new ModelAndView();
		
		int movieSeq = Integer.parseInt(request.getParameter("movie_seq")) ;
		String movieType = request.getParameter("movie_type");
		
		mapper.raiseLookupCount(movieSeq); //영화 게시물 view수
		Movies movie=mapper.animeDetails(movieSeq); //내용 시나리오
		int Comments_cnt=cmt_mapper.CommentsCnt(movieSeq); //댓글수
	    List<Comments> list = cmt_mapper.getAllCommentsByPage(movieSeq); //게시물수
	    
		List<Movies> list_genre = mapper.movieGenreList(movie);
		model.addAttribute("list_genre",list_genre);
		
		mv.addObject("CommentList",list);
		mv.addObject("CommentsCnt",Comments_cnt);
		mv.addObject("movie", movie);
		mv.setViewName("anime-details");
		
		return mv;
	}
	
	@GetMapping("/NeTupidiaRanking.do")
	public String animeWatching(Model model) {
		List<Movies> list = mapper.movieList();
		model.addAttribute("list",list);
		return "anime-watching";
	}
	
	@GetMapping("/NeTupidiaUpcoming.do")
	public String blog(Model model) {
		List<Movies> list = mapper.movieList();
		model.addAttribute("list",list);
		return "blog";
	}
	
	@GetMapping("/blogDetails.do")
	public String blogDetails() {
		
		return "blog-details";
	}
	
	@GetMapping("/categories.do")
	public String categories(Model model, @ModelAttribute("paging")Paging paging) {
		
		int totalRowCount = mapper.getTotalRowCount(paging);
		paging.setTotalRowCount(totalRowCount);
		paging.pageSetting();
		
		List<Paging> getPageList = mapper.getPageList(paging);
		model.addAttribute("Paging", paging);
		
		List<Movies> list = mapper.movieList();
		model.addAttribute("list",list);
		return "categories";
	}
	
	@RequestMapping(value="/CommentWrite.do", method = RequestMethod.POST)
	public String CommentWrite(@ModelAttribute Comments vo) {
		cmt_mapper.createComments(vo);
		return "redirect:/animeDetails.do?movie_seq="+vo.getMovie_seq();
	}
	
	@RequestMapping("/animeDetail.do")
	public @ResponseBody String giveStarRating(@ModelAttribute Movies vo) {
		mapper.updateStarRating(vo);
		return "redirect:/animeDetails.do?movie_seq="+vo.getMovie_seq();
		
	}
	
}