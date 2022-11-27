<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<c:set var ="imgUrl"><%="resources/img/blog/details/"%></c:set>

<!DOCTYPE html>
<html lang="ko">
<%@ include file="./include/head.jsp"%>
<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

   <!-- header -->
	<%@ include file="./header.jsp"%>
    <!-- Blog Details Section Begin -->
    <section class="blog-details spad">
        <div class="container">
            <div class="row d-flex justify-content-center">
                <div class="col-lg-8">
                    <div class="blog__details__title">
                    
                        <h6 class="movie_open_date" id="movie_open_date"><span></span></h6>
                        <h2>${movies.movie_title}</h2>
                        <input type="hidden" class="hidenTitle" id="hidenTitle" value="${movies.movie_title}">
                        <input type="hidden" class="hidenMoveId" id="hidenMoveId" value="${movies.movie_seq}">
                        <input type="hidden" class="youtube" id="youtube" value="${movies.cmt_seq}">
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="blog__details__pic">
                        <img src="${imgUrl}blog-details-pic2023.jpg" alt="인공지능 영화 추천시스템  NeTupidia 2023 COMMING SOON">
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="blog__details__content">
                    	    <div class="anime__details__text">
                             <p>${movie.movie_content}</p>
                            <div class="anime__details__widget">
                                <div class="row">
                                	<div class="col-lg-4 col-md-4">
                                		<img class="poster_path" id="poster_path" src="" alt="${movies.movie_title}">
                                	</div>
                                    <div class="col-lg-8 col-md-8">
                                        <ul class="boxOfficeList"></ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    	<br/>
                        <div class="blog__details__item__text" id="blog__details__item__text">
                        </div>
                        <!-- 장르  -->
                        <div class="blog__details__tags" id="blog__details__tags">
                        </div>
                        <div class="blog__details__btns">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="blog__details__btns__item">
                                        <h5><a onclick="javascript:history.go(-1);"><span class="arrow_left"></span>&nbsp;&nbsp;리스트 보기</a>
                                        </h5>
                                    </div>
                                </div>
                            </div>
                       </div>
                  </div>
                </div>
            </div>
        </section>
        <!-- Blog Details Section End -->

     <!-- footer section -->
		<%@ include file="./footer.jsp"%>
          <!-- Search model Begin -->
          <div class="search-model">
            <div class="h-100 d-flex align-items-center justify-content-center">
                <div class="search-close-switch"><i class="icon_close"></i></div>
                <form class="search-model-form">
                    <input type="text" id="search-input" placeholder="Search here.....">
                </form>
            </div>
        </div>
        <!-- Search model end -->
        <!-- Js Plugins -->
		<%@ include file="./include/jsscript.jsp"%>
		<script type="text/javascript">
		 const youtube = document.querySelector("#sub_blog__details");
		 const api_key = "9d58f50eea3bc0cebe233c422bbef69e";
		 const key="f5eef3421c602c6cb7ea224104795888";
		 const myUl = document.querySelector('.boxOfficeList');
		 const base_url = "https://image.tmdb.org/t/p/w300/";
		 const poster_path = document.querySelector('.poster_path');
		 const overview = document.querySelector('#blog__details__item__text');
		 const tags = document.querySelector('#blog__details__tags');
		 
		$(document).ready(function(){
			 const youtubeId=$("#youtube").val();
			 const hidenMoveId=$("#hidenMoveId").val();
			 movieInfo(hidenMoveId);
			 viewTrailer(youtubeId);
		});
		
		function movieInfo(movieId){
			const movieUrl = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key="+key+"&movieCd="+movieId;
			
			fetch(movieUrl).then(res => res.json()).then(function(res){
				//alert(JSON.stringify(res));
				let movieInfo=res.movieInfoResult.movieInfo;
				let prdtYear = movieInfo.prdtYear; //제작연도
				let genreNm = movieInfo.genres[0].genreNm; //영화장르
				let typeNm = movieInfo.typeNm; //영화유형
				let movieNm = movieInfo.movieNm;
				
				let movie_open_date = document.getElementById("movie_open_date");
				movie_open_date.append(genreNm+" , "+typeNm+" ( "+prdtYear+"년도 )");
				
				let showTm = movieInfo.showTm;
				let directors = movieInfo.directors[0].peopleNm;
				let openDt = movieInfo.openDt;
				let nationNm = movieInfo.nations[0].nationNm;
				let watchGradeNm = movieInfo.audits[0]['watchGradeNm'];

				var output = "<li><span>상영시간 :</span>"+showTm+" 분</li>";
				output+="<li><span>감독 :</span> "+directors+"</li>";
				output+="<li><span>개봉일 :</span> "+openDt.substr(0,4)+"년 "+openDt.substr(4,2)+"월 "+openDt.substr(6,2)+"일 개봉</li>";
				output+="<li><span>제작국가 :</span> "+nationNm+"</li>";
				
				if(movieInfo.actors.length > 0 ){
					output+="<li><span>출연배우 :</span> ";
					for(let i=0; i<movieInfo.actors.length; i++){
						output+=movieInfo.actors[i]['peopleNm'];
						if( i < movieInfo.actors.length-1){
							output+=", ";
						}
					}
					+"</li>";
				}
				output+="<li><span>심의정보 :</span> "+watchGradeNm+"</li>";
				output+="<li><span>영화유형 :</span> "+typeNm+"</li>";
				output+="<li><span>영화장르 :</span> "+genreNm+"</li>";
				myUl.innerHTML = output;	
				
			    var tagOutput="<a href='#'>"+directors+"</a>";
			    tagOutput+="<a href='#'>"+movieNm+"</a>";
			    tagOutput+="<a href='#'>"+genreNm+"</a>";
			    tagOutput+="<a href='#'>"+typeNm+"</a>";
			    
			    if(movieInfo.actors.length > 0 ){
				  for(let i=0; i<movieInfo.actors.length; i++){
					 tagOutput+="<a href='#'>"+movieInfo.actors[i]['peopleNm']+"</a>";
				   }
				}
			    
			 	tags.innerHTML=tagOutput;
				const searchUrl = "https://api.themoviedb.org/3/search/movie?api_key="+api_key+"&language=ko-Kr&page=1&include_adult=false&query="+movieNm;
				
				fetch(searchUrl)
                .then(res => res.json())
                .then(function(res){
                	poster_path.src=base_url+res.results[0].poster_path;
                	var v_output = "<h4>영화 줄거리</h4>";
                	v_output+="<p>"+res.results[0].overview+"</p>";
                	overview.innerHTML = v_output;
                });
			});
		}
		
		function viewTrailer(movieId){
			const movieUrl = "https://api.themoviedb.org/3/movie/"+movieId+"/videos?api_key="+api_key;
	        fetch(movieUrl)
	            .then(res => res.json())
	            .then(function(res){
	                let output = "";
	                if(res.results.length > 0){
	                    const youtubeId = res.results[0].key;
	                    output +="<h4>&nbsp;<<&nbsp;영화 미리 보기&nbsp;>>&nbsp;</h4><iframe width='100%' height='550px' src='https://www.youtube.com/embed/"+youtubeId+"?autoplay=1'></iframe>"; 
	                } else {
	                    output = `<center><p>재생할 예고편이 없습니다.</p></center>`;
	                }
	                youtube.innerHTML = output;
	                window.scrollTo(0, 0);
	            }).catch(error => console.log(error));
	    }
		
		</script>
    </body>
    </html>