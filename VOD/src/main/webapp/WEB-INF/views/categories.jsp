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
    <!-- Breadcrumb Begin -->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="index.do"><i class="fa fa-home"></i> Home</a>
                        <a href="categories.do">Categories</a>
                        <span>${param.movie_type}</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Product Section Begin -->
    <section class="product-page spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="product__page__content">
                        <div class="product__page__title">
                            <div class="row">
                                <div class="col-lg-8 col-md-8 col-sm-6">
                                    <div class="section-title">
                                        <h4></h4>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6">
                                    <div class="product__page__filter">
                                        <p>Order by:</p>
                                        <select>
                                            <option value="">A-Z</option>
                                            <option value="">1-10</option>
                                            <option value="">10-50</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                        	<c:choose>
                        	<c:when test="${param.movie_type != null}">
                        		<c:forEach items="${typeList}" var="movies" varStatus="i" begin="${paging.firstRow}" end="${paging.lastRow}" step="1">
	                            <div class="col-lg-4 col-md-6 col-sm-6">
	                                <div class="product__item">
	                                    <div class="product__item__pic set-bg" data-setbg="${imgUrl}/${movies.movie_img}.png">
	                                        <div class="comment"><i class="fa fa-comments"></i> 11</div>
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
                            </c:forEach>
                        	</c:when>
                        	<c:otherwise>
                        	<c:forEach items="${list}" var="movies" varStatus="i" begin="${paging.firstRow}" end="${paging.lastRow}" step="1">
	                            <div class="col-lg-4 col-md-6 col-sm-6">
	                                <div class="product__item">
	                                    <div class="product__item__pic set-bg" data-setbg="${imgUrl}/${movies.movie_img}.png">
	                                        <div class="comment"><i class="fa fa-comments"></i> 11</div>
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
                            </c:forEach>
                            </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="product__pagination">
                    	<a href="categories.do?curPage=1"><i class="fa fa-angle-double-left"></i></a>
                    	<a href="categories.do?curPage=${paging.curPage-1 }"><i class="fa fa-angle-left"></i></a>
                    	<c:forEach begin="${paging.firstPage}" end="${paging.lastPage}" var="i">
                   			<c:if test="${i eq paging.curPage }"><a href="categories.do?curPage=${i}" class="current-page">${i}</a></c:if>
                   			<c:if test="${i ne paging.curPage }"><a href="categories.do?curPage=${i}">${i }</a></c:if>
                    	</c:forEach>
                    	<a href="categories.do?curPage=${paging.curPage+1 }"><i class="fa fa-angle-right"></i></a>
                    	<a href="categories.do?curPage=${paging.totalPageCount}"><i class="fa fa-angle-double-right"></i></a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-8">
                    <div class="product__sidebar">
                        <div class="product__sidebar__view">
                            <div class="section-title">
                                <h5>시청목록</h5>
                            </div>
                            <!-- <ul class="filter__controls">
                                <li class="active" data-filter="*">Day</li>
                                <li data-filter=".week">Week</li>
                                <li data-filter=".month">Month</li>
                                <li data-filter=".years">Years</li>
                            </ul> -->
                            <div class="filter__gallery">
                                <c:forEach items="${list}" var="movies" varStatus="i" begin="0" end="4" step="1">
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
    <div class="product__sidebar__comment">
<!--         <div class="section-title">
            <h5>New Comment</h5>
        </div>
        <div class="product__sidebar__comment__item">
            <div class="product__sidebar__comment__item__pic">
                <img src="resources/img/sidebar/comment-1.jpg" alt="">
            </div>
            <div class="product__sidebar__comment__item__text">
                <ul>
                    <li>Active</li>
                    <li>Movie</li>
                </ul>
                <h5><a href="#">The Seven Deadly Sins: Wrath of the Gods</a></h5>
                <span><i class="fa fa-eye"></i> 19.141 Viewes</span>
            </div>
        </div>
        <div class="product__sidebar__comment__item">
            <div class="product__sidebar__comment__item__pic">
                <img src="resources/img/sidebar/comment-2.jpg" alt="">
            </div>
            <div class="product__sidebar__comment__item__text">
                <ul>
                    <li>Active</li>
                    <li>Movie</li>
                </ul>
                <h5><a href="#">Shirogane Tamashii hen Kouhan sen</a></h5>
                <span><i class="fa fa-eye"></i> 19.141 Viewes</span>
            </div>
        </div>
        <div class="product__sidebar__comment__item">
            <div class="product__sidebar__comment__item__pic">
                <img src="resources/img/sidebar/comment-3.jpg" alt="">
            </div>
            <div class="product__sidebar__comment__item__text">
                <ul>
                    <li>Active</li>
                    <li>Movie</li>
                </ul>
                <h5><a href="#">Kizumonogatari III: Reiket su-hen</a></h5>
                <span><i class="fa fa-eye"></i> 19.141 Viewes</span>
            </div>
        </div>
        <div class="product__sidebar__comment__item">
            <div class="product__sidebar__comment__item__pic">
                <img src="resources/img/sidebar/comment-4.jpg" alt="">
            </div>
            <div class="product__sidebar__comment__item__text">
                <ul>
                    <li>Active</li>
                    <li>Movie</li>
                </ul>
                <h5><a href="#">Monogatari Series: Second Season</a></h5>
                <span><i class="fa fa-eye"></i> 19.141 Viewes</span>
            </div>
        </div> -->
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