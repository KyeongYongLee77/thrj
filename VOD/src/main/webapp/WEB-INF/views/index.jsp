<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var ="imgUrl"><%="http://gjaischool-b.ddns.net:8086/crawlingImage"%></c:set>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Anime Template">
    <meta name="keywords" content="Anime, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>NeTupidia</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
    rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="resources/css/plyr.css" type="text/css">
    <link rel="stylesheet" href="resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="resources/css/style.css" type="text/css">
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>
	<!-- header -->
	<%@ include file="./header.jsp"%>
    <!-- Hero Section Begin -->
    <section class="hero">
        <div class="container">
            <div class="hero__slider owl-carousel">
            
            <c:forEach items="${list}" var="movies">
               <div class="hero__items set-bg" data-setbg="${imgUrl}/${movies.movie_img}.png">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="hero__text">
                                <div class="label">${movies.movie_type}</div>
                                <h2>${movies.movie_title}</h2>
                                <p></p>
                                <a href="animeDetails.do?movie_seq=${movies.movie_seq}"><span>Watch Now</span> <i class="fa fa-angle-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
             </c:forEach>
                
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="trending__product">
                        <div class="row">
                            <div class="col-lg-8 col-md-8 col-sm-8">
                                <div class="section-title">
                                    <h4>Ranking</h4>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <div class="btn__all">
                                    <a href="categories.do" class="primary-btn">View All <span class="arrow_right"></span></a>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                        
                        <c:forEach items="${list1}" var="movies">
                               <div class="col-lg-4 col-md-6 col-sm-6">
                                <div style="cursor: pointer;" onclick="location.href='animeDetails.do?movie_seq=${movies.movie_seq}';">
                                   <div class="product__item">
                                      <div class="product__item__pic set-bg" data-setbg="${imgUrl}/${movies.movie_img}.png">
                                          <div class="comment"><i class="fa fa-comments"></i>${movies.movie_cnt}</div>
                                          <div class="view"><i class="fa fa-star"></i> ${movies.movie_rating/2}</div>
                                       </div>
                                       <div class="product__item__text">
                                           <ul>
                                               <li>Movie</li>
                                           </ul>
                                           <h5><a href="animeDetails.do?movie_seq=${movies.movie_seq}">${movies.movie_title}</a></h5>
                                       </div>
                                   </div>
                               </div>
                               </div>
                            </c:forEach>
                            
                        </div>
                    </div>
                    <div class="popular__product">
                        <div class="row">
                            <div class="col-lg-8 col-md-8 col-sm-8">
                                <div class="section-title">
                                    <h4>VOD 추천</h4>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <div class="btn__all">
                                    <a href="categories.do" class="primary-btn">View All <span class="arrow_right"></span></a>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                     <c:forEach items="${list}" var="movies">
                               <div class="col-lg-4 col-md-6 col-sm-6">
                               <div style="cursor: pointer;" onclick="location.href='animeDetails.do?movie_seq=${movies.movie_seq}';">
                                   <div class="product__item">
                                       <div class="product__item__pic set-bg" data-setbg="${imgUrl}/${movies.movie_img}.png">
                                           <div class="comment"><i class="fa fa-comments"></i>${movies.movie_cnt}</div>
                                           <div class="view"><i class="fa fa-star"></i> ${movies.movie_rating/2}</div>
                                       </div>
                                       <div class="product__item__text">
                                           <ul>
                                               <li>Movie</li>
                                           </ul>
                                           <h5><a href="animeDetails.do?movie_seq=${movies.movie_seq}">${movies.movie_title}</a></h5>
                                       </div>
                                   </div>
                                   </div>
                               </div>
                       </c:forEach>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-8">
                    <div class="product__sidebar">
                        <div class="product__sidebar__view">
                            <div class="section-title">
                                <h5>시청목록</h5></div>
                       <c:forEach items="${history_seq}" var="movies">
	                      	<div class="filter__gallery">
		                        <div class="product__sidebar__view__item set-bg"
		                        data-setbg="${imgUrl}/${movies.movie_img}.png">
		                        <div class="view"><!-- <i class="fa fa-eye"> </i> 9141--></div>
		                        <h5><a href="animeDetails.do?movie_seq=${movies.movie_seq}">${movies.movie_title}</a></h5>
		                        </div>
	                        </div>
                      </c:forEach>
				    </div>
				</div>
				</div>
				</div>
				</div>
				</section>
<!-- Product Section End -->

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
<script src="resources/js/jquery-3.3.1.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/player.js"></script>
<script src="resources/js/jquery.nice-select.min.js"></script>
<script src="resources/js/mixitup.min.js"></script>
<script src="resources/js/jquery.slicknav.js"></script>
<script src="resources/js/owl.carousel.min.js"></script>
<script src="resources/js/main.js"></script>
</body>

</html>