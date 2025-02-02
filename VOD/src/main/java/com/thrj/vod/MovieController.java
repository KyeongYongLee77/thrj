package com.thrj.vod;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.thrj.Entity.Comments;
import com.thrj.Entity.History;
import com.thrj.Entity.Members;
import com.thrj.Entity.Movies;
import com.thrj.Entity.Paging;
import com.thrj.Mapper.CommentsMapper;
import com.thrj.Mapper.MovieMapper;

@CrossOrigin(origins= {"http://127.0.0.1:5000"})
@Controller
public class MovieController {
	
	//추천영화 시퀀스 배열
	int[] movie_seq_array;	
	
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
		
		List<Movies> history_seq = mapper.historySeq(mb_id);
		model.addAttribute("history_seq",history_seq);
		return "index";
	}
	
	//상세페이지 사이드바 유사영화 리스트 (flask 데이터 통신)
		@PostMapping("/recomVod.do")
	    public void recomVod(HttpServletRequest request){
			
			String statu = request.getParameter("status");
			
			String[] str_array = request.getParameterValues("movie_seq[]");
				
			movie_seq_array = Stream.of(str_array).mapToInt(Integer::parseInt).toArray();
	        
			System.out.println(statu);
			for (int i = 0; i < movie_seq_array.length; i++) {
	            System.out.print(movie_seq_array[i]+" ");
	        }
			System.out.println("");
	    }
	
	@RequestMapping(value="/animeDetails.do", method=RequestMethod.GET)
	public ModelAndView animeDetails(HttpServletRequest request) {
		
		ModelAndView mv = new ModelAndView();
		
		int movieSeq = Integer.parseInt(request.getParameter("movie_seq")) ;//게시물 번호 int형으로 변환
		
		mapper.raiseLookupCount(movieSeq); //영화 게시물 view수
		Movies movie=mapper.animeDetails(movieSeq); //내용 시나리오
		int Comments_cnt=cmt_mapper.CommentsCnt(movieSeq); //댓글수
	    List<Comments> list = cmt_mapper.getAllCommentsByPage(movieSeq); //게시물수
	    
	    HttpSession session = request.getSession();
		String mb_id=(String)session.getAttribute("mb_id");
		
		if(mb_id!=null && !"".equals(mb_id)) {
			Movies vo =new Movies();
			vo.setMovie_seq(movieSeq);
			vo.setMb_id(mb_id);
		    mapper.insertHistorySeq(vo);//누락된 시청목록 insert 하기
		}
	    
		List<Movies> list_genre = mapper.movieGenreList(movie);
		
		// 유사영화(flask 데이터 통신)
       // List<Movies> recom_vod = mapper.recomVod(movie_seq_array);
        //mv.addObject("recom_vod", recom_vod);
		
		mv.addObject("list_genre",list_genre);
		mv.addObject("CommentList",list);
		mv.addObject("CommentsCnt",Comments_cnt);
		mv.addObject("movie", movie);
		mv.setViewName("anime-details");
		
		return mv;
	}
	
	@RequestMapping(value="/NeTupidiaRanking.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String animeWatching(Model model) {
		return "anime-watching";
	}
	
	@RequestMapping(value="/NeTupidiaUpcoming.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String blog(Model model) {
		return "blog";
	}
	
	@RequestMapping(value="/RankingDetails.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView rankingDetails(@ModelAttribute Movies vo, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("movies",vo);
		mv.setViewName("blog-details");
		return mv;
	}
	
	@RequestMapping(value="/UpcomingDetails.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView upcomingDetails(@ModelAttribute Movies vo, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("movies",vo);
		mv.setViewName("blog-details");
		return mv;
	}
	
	@GetMapping("/categories.do")
	public String categories(Model model, @ModelAttribute("paging")Paging paging, HttpServletRequest request, Movies movie) {
		
		String movieType = request.getParameter("movie_type");
		int totalRowCount = mapper.getTotalRowCount(movieType);
		paging.setTotalRowCount(totalRowCount);
		
		paging.pageSetting();
		
		model.addAttribute("Paging", paging);
		
		List<Movies> list = mapper.categorieList();
		model.addAttribute("list",list);
		
		List<Movies> movie_type_list = mapper.movie_typeList(movieType);
		List<Movies> typeList = new ArrayList<Movies>();
		
		for(int i=0; i<movie_type_list.size(); i++) {
			int seq =movie_type_list.get(i).getMovie_seq();
			typeList.add(mapper.typeList(seq));
		}
		model.addAttribute("typeList",typeList);
		
		HttpSession session = request.getSession();
		String mb_id=(String)session.getAttribute("mb_id");
		List<Movies> history_seq = mapper.historySeq(mb_id);
		model.addAttribute("history_seq",history_seq);
		
		List<Movies> history_test = mapper.history_test(mb_id);
		model.addAttribute("history_test",history_test);
		
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