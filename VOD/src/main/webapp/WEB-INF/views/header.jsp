<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <!-- Header Section Begin -->
    <header class="header">
        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                    <div class="header__logo" style="width:200px">
                        <a href="index.do">
                            <img src="resources/img/logo.png" alt="">
                        </a>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="header__nav">
                        <nav class="header__menu mobile-menu">
                            <ul>
                                <li class="active"><a href="index.do">Home</a></li>
                                <li><a href="categories.do">영화 </a></li>
                                   <li><a href="#">장르 <span class="arrow_carrot-down"></span></a>
                                    <ul class="dropdown">
                                        <li><a href="#">액션</a></li>
                                        <li><a href="#">애니메이션</a></li>
                                        <li><a href="#">코미디</a></li>
                                        <li><a href="#">로맨스</a></li>
                                        <li><a href="#">스릴러</a></li>
                                        <li><a href="#">판타지</a></li>
                                    </ul>
                                </li>
                                <li><a href="#">랭킹</a></li>
                                <li><a href="#">상영예정작</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <div class="col-lg-2">
                    <div class="header__right">
                        <a href="#" class="search-switch"><span class="icon_search"></span></a>
                        
                        	<c:choose>
								<c:when test = "${sessionScope.mb_id != null}">
                                    <a href="#"><span class="icon_profile"></span></a>	
                                </c:when>
                                <c:otherwise>
                                     <a href="login.do"><span class="icon_profile"></span></a>
                                </c:otherwise>
                             </c:choose>
                       </div>
                </div>
            </div>
            <div id="mobile-menu-wrap"></div>
        </div>
    </header>
    <!-- Header End -->