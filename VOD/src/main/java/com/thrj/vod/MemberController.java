package com.thrj.vod;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.thrj.Entity.Members;
import com.thrj.Entity.Movies;
import com.thrj.Mapper.HistoryMapper;
import com.thrj.Mapper.MemberMapper;
import com.thrj.Mapper.MovieMapper;


@Controller
public class MemberController {

	@Autowired
	public MemberMapper mapper;
	
	@Autowired
	public MovieMapper movie_mapper;
	
	@Autowired
	public HistoryMapper history_mapper;
	
	@GetMapping("/login.do")
	public ModelAndView login(){
		ModelAndView mv = new ModelAndView();
		Movies detail = movie_mapper.bannerOne();
		mv.addObject("movies",detail);
		mv.setViewName("login");
		return mv;
	}
	
	@RequestMapping(value="/logout.do")
	public String logout(HttpServletRequest request){
		HttpSession session = request.getSession();
		session.removeAttribute("mb_id");
		session.invalidate();
		return "redirect:/index.do";
	}
	
	@RequestMapping(value="/login_ok.do",method = RequestMethod.POST)
	public ModelAndView login_ok(@ModelAttribute Members vo, HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		Members userBean=mapper.logincheck(vo);
		session.setAttribute("mb_id", userBean.getMb_id());
		mv.setViewName("redirect:/index.do");
		return mv;
	}
	
	@RequestMapping(value="/ajaxLoginCheck.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public Map<String, String> ajaxLogincheck(HttpServletRequest request
			, @RequestParam(value="mb_id", required=false) String mb_id
			, @RequestParam(value="mb_pw", required=false) String mb_pw) {
		Map<String, String> loginYnMap = new HashMap<String, String>();
		Members vo=new Members();
		vo.setMb_id(mb_id);
		vo.setMb_pw(mb_pw);
		
		Members userBean=mapper.logincheck(vo);
		if(userBean!=null) { //아이디가 저장되었는지  확인여부
			loginYnMap.put("loginYn", "success");
		 } else {
			loginYnMap.put("loginYn","fail");
		}
		
		return loginYnMap;
	}
	
	@RequestMapping(value="/deleteMember.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView deleteMember(HttpServletRequest request, @ModelAttribute Members vo){
		ModelAndView mv = new ModelAndView();
		 HttpSession session = request.getSession();
		 String mb_id=(String)session.getAttribute("mb_id");
		 
		 //회원 정보 삭제
		 mapper.deleteMember(mb_id);
		 //회원댓글삭제
		 
		 //회원 history삭제
		 history_mapper.deleteHistory(mb_id);
		 
		 session.invalidate();
		 mv.setViewName("redirect:/index.do");
		 
	  return mv;
	}
	
	@RequestMapping(value="/myinfoMember.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView myinfoMember(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		 HttpSession session = request.getSession();
		 String movie_id=(String)session.getAttribute("mb_id");
		 Members userBean=mapper.retrieveSessionInfo(movie_id);
		 mv.addObject("userBean",userBean);
		Movies detail = movie_mapper.bannerOne();
		mv.addObject("movies",detail);
		 mv.setViewName("memberInfo");
	  return mv;
	}
	
	@RequestMapping(value="/updateMember.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView updateMember(HttpServletRequest request, @ModelAttribute Members vo){
			ModelAndView mv = new ModelAndView();
			mapper.updateMember(vo);
			mv.setViewName("redirect:/myinfoMember.do");
		return mv;
	}
	
	@RequestMapping(value="/signup.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView bannerOne(@ModelAttribute Members vo) {	
		ModelAndView mv = new ModelAndView();
		Movies detail = movie_mapper.bannerOne();
		mv.addObject("movies",detail);
        mv.setViewName("/signup"); 
		return mv;
	}
	
	
	@RequestMapping(value="/saveFile.do", method=RequestMethod.POST)
	@ResponseBody public String saveFile(HttpServletRequest request ) throws IOException {
		String imgFolder ="\\resources\\memberPhoto\\";
		String realFolder = request.getRealPath("/")+imgFolder;
		MultipartHttpServletRequest multipartRequest =  (MultipartHttpServletRequest)request;
		MultipartFile file = multipartRequest.getFile("imageFile"); //단일 파일 업로드
		String filename = file.getOriginalFilename();
		File ufile = new File(realFolder + file.getOriginalFilename());
		file.transferTo((ufile));
		return filename;
	}
	
	@RequestMapping(value="/idCheck.do", method=RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<String> idCheck(HttpServletRequest request){
		String mb_id = request.getParameter("mb_id");
		Members vo = mapper.retrieveUser(mb_id);
		String checkMsg = "";
		
		if(vo != null){
			checkMsg = "<font color='red' size='3px;'><i class='fa fa-times'>&nbsp;이미 사용중인 아이디입니다.</i></font>@false";
		} else {
			checkMsg = "<font color='green' size='3px;'><i class='fa fa-check'>&nbsp;사용 가능한 아이디입니다.</i></font>@true";
		}
		HttpHeaders resHeader = new HttpHeaders();
		resHeader.add("Content-Type","text/html;charset=UTF-8");
		ResponseEntity resultMsg = new ResponseEntity<String>(checkMsg, resHeader, HttpStatus.OK);
		return resultMsg;
	}
	
	@RequestMapping(value="/createMember.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView createMember(@ModelAttribute Members vo){
		ModelAndView mv = new ModelAndView();
        mapper.createMember(vo);
		mv.setViewName("redirect:/login.do");
		return mv;
	}

}

