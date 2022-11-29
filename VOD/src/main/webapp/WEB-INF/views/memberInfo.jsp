<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<c:set var ="userPhoto"><%="resources/memberPhoto"%></c:set>
<c:set var ="memberProfile"><%="http://gjaischool-b.ddns.net:8086/memberProfile"%></c:set>
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
<link
	href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/plyr.css" type="text/css">
<link rel="stylesheet" href="resources/css/nice-select.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/style.css" type="text/css">
</head>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- header -->
	<%@ include file="./header.jsp"%>

	<!-- Normal Breadcrumb Begin -->
	<%@ include file="./include/BreadcrumbSignUp.jsp"%>
	<!-- Normal Breadcrumb End -->

	<!-- Signup Section Begin -->
	<section class="signup spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-7">
					<div class="login__form">
						<h3>어서오세요!! &nbsp; NeTupidia</h3>
						<form id="joinFrm" method="post" action="${context}/updateMember.do" role="form">
							<div class="input__item">
								<input type="text" name="mb_id" id="mb_id" class="mb_id" placeholder="아이디를 입력해주세요"  required="required" autofocus="autofocus" readonly="readonly" value="${userBean.mb_id}"> 
								<span class="icon_id"></span>
								<p id="message"></p>
							</div>
							<div class="input__item">
								<input class="form-control" type="text" id="mb_name" name="mb_name" placeholder="이름을 입력해주세요" autofocus="autofocus" required="required" readonly="readonly" value="${userBean.mb_name}" /> <span class="icon_profile"></span>
							</div>
							<div class="input__item">
								<input type="text" class="form-control" type="password" name="mb_pw" id="mb_pw" required="required" placeholder="비밀번호를 입력해주세요"><span class="icon_lock"></span>
							</div>
							
							<div class="input__itemN">
								<span class="icon_check">&nbsp;&nbsp;판타지</span> <input type="checkbox" class="mb_genre"  name="mb_genre" id="mb_genre" required="required" value="fan"  <c:if test="${fn:contains(userBean.mb_genre, 'fan')}" > checked</c:if>>
								<span class="icon_check">&nbsp;&nbsp;드라마</span> <input type="checkbox"  class="mb_genre"  name="mb_genre" id="mb_genre" required="required" value="dra"  <c:if test="${fn:contains(userBean.mb_genre, 'dra')}" > checked</c:if>>
								<span class="icon_check">&nbsp;&nbsp;로맨스</span><input type="checkbox" class="mb_genre"  name="mb_genre" id="mb_genre" required="required" value="rom"  <c:if test="${fn:contains(userBean.mb_genre, 'rom')}" > checked</c:if>>
							</div>
							<div class="input__itemN">
								<span class="icon_check">&nbsp;&nbsp;액&nbsp;&nbsp;&nbsp;션</span><input type="checkbox"  class="mb_genre"  name="mb_genre" id="mb_genre" required="required" value="act"  <c:if test="${fn:contains(userBean.mb_genre, 'act')}" > checked</c:if>>
								<span class="icon_check">&nbsp;&nbsp;코미디</span><input type="checkbox" class="mb_genre"  name="mb_genre" id="mb_genre" required="required" value="com"  <c:if test="${fn:contains(userBean.mb_genre, 'com')}" > checked</c:if>>
								<span class="icon_check">&nbsp;&nbsp;스릴러</span><input type="checkbox" class="mb_genre"  name="mb_genre" id="mb_genre" required="required" value="thr"  <c:if test="${fn:contains(userBean.mb_genre, 'thr')}" > checked</c:if>>
							</div>
							<div class="input__itemN">								
								<span class="icon_check">&nbsp;&nbsp;과&nbsp;&nbsp;&nbsp;학</span><input type="checkbox" class="mb_genre"  name="mb_genre" id="mb_genre" required="required" value="sf"  <c:if test="${fn:contains(userBean.mb_genre, 'sf')}" > checked</c:if>>
								<span class="icon_check">&nbsp;&nbsp;만&nbsp;&nbsp;&nbsp;화</span><input type="checkbox" class="mb_genre"  name="mb_genre" id="mb_genre" required="required" value="ani"  <c:if test="${fn:contains(userBean.mb_genre, 'ani')}" > checked</c:if>>
								<span class="icon_check">&nbsp;&nbsp;다&nbsp;&nbsp;&nbsp;큐</span><input type="checkbox" class="mb_genre"  name="mb_genre" id="mb_genre" required="required" value="doc" <c:if test="${fn:contains(userBean.mb_genre, 'doc')}" > checked</c:if>>
							</div>
							<input type="hidden" id="userImage" name="mb_profile" required="required">
						</form><br/><br/>
							<button type="button" id="delete-btn" class="btn btn-warning" onclick="fn_back()">취소하기</button>
							<button type="button" id="ok-btn" class="btn btn-success" onclick="fn_update()">등록하기</button>
							<button type="button" class="site-btn " onclick="fn_Delete()">삭제하기</button>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="login__social__links">
						<h3>사진</h3>
						<img id="pic" style="margin-left: 15px;" height="180px" width="150px"
								src="${memberProfile}/memberProfile.jpg"><br />
						<div class="col-md-6"></div>
					</div>
					<input type="hidden" id="flag" name="flag" value="false">
				<form id="ajaxform" action="${context}/saveFile.do" method="post" enctype="multipart/form-data" role="form">
					<label class="control-label col-md-2 col-xs-12"></label>
						<div class="col-md-6">
							<input class="form-control" type="file" id="imageFile" name="imageFile" onchange="fn_upload()" /> 
							<input type="hidden" id="imageFolder" name="imageFolder" value="userImg">
						</div>
				</form>
				</div>
			</div>
		</div>
	</section>
	<!-- Signup Section End -->

	<!-- footer section -->
	<%@ include file="./footer.jsp"%>

	<!-- Search model Begin -->
	<div class="search-model">
		<div class="h-100 d-flex align-items-center justify-content-center">
			<div class="search-close-switch">
				<i class="icon_close"></i>
			</div>
			<form class="search-model-form">
				<input type="text" id="search-input" placeholder="Search here.....">
			</form>
		</div>
	</div>
	<!-- Search model end -->

	<!-- Js Plugins -->
	<%@ include file="./include/jsscript.jsp"%>
	<script type="text/javascript">


	$(document).ready(function(){
// 		$('#dataTables-example').dataTable();
		//fn_init();

		fn_setDetailInfo();
		
	});
	
	function fn_setDetailInfo(){

		var userImage = '${userBean.mb_profile}';
		userImage = userImage.replace(/"/gi, "");

		$("#pic").attr("src", '${context}/resources/memberPhoto/' + userImage);
		$("#userImage").val(userImage);

	}
	
	function fn_Delete(){
		location.href='${context}/deleteMember.do';
	}
	
	function fn_update(){
		if(confirm("수정하시겠습니까?")){
	 		alert("회원정보가 성공적으로 수정되었습니다.");
	 		$("#joinFrm").submit();
		}
	}

	function idCheck(){
		var mb_id = $("#mb_id").val();
		var access = $("#message");
		$.ajax({
			url:"${context}/idCheck.do?mb_id=" + mb_id,
			success:function(result){
				result2 = result.replace(/"/gi, "");
				var splResult = result2.split("@");
				access.html(splResult[0]);
				$("#flag").val(splResult[1]);
			}
		});
	}

	function fn_upload(){
		$("#ajaxform").ajaxSubmit({
	        type: "POST",
	        dataType: 'text',
	        url: $("#ajaxform").attr("action"),
	        data: $("#ajaxform").serialize(),
	        success: function (data) {
	        	data = data.replace(/"/gi, "");
	        	var imageUrl = "${context}/resources/memberPhoto/" + data;
	        	$("#pic").attr("src", imageUrl);
	        	$("#userImage").val(data);
	        },
	        error: function (xhr, status, error) {
	            alert(error);
	        }
	    });
	}
	
	function fn_back(){
		history.back();
	}


</script>
	
	<style>
	.login__form form .input__itemN checkbox {
		height:50px;
		width: 100%;
		font-size: 15px;
		color: #b7b7b7;
		background: #ffffff;
		border: none;
		padding-left: 76px;
	}
	
	.login__form form .input__itemN checkbox::-webkit-input-placeholder {
		color: #b7b7b7;
	}
	
	.login__form form .input__itemN checkbox::-moz-placeholder {
		color: #b7b7b7;
	}
	
	.login__form form .input__itemN checkbox:-ms-input-placeholder {
		color: #b7b7b7;
	}
	
	.login__form form .input__itemN checkbox::-ms-input-placeholder {
		color: #b7b7b7;
	}
	
	.login__form form .input__itemN checkbox::placeholder {
		color: #b7b7b7;
	}
	
	.login__form form .input__itemN checkbox {
		color: #b7b7b7;
		font-size: 20px;
		position: absolute;
		left: 15px;
		top: 13px;
	}
	.icon_check{
		color:white;
		margin:20px;
	}
	
	.mb_genre {
	display: inline;

	height: calc(1.5em + .75rem + 1px); 
	padding: .975rem .375rem;
	
	line-height: 1.5;
	color: #495057;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #ced4da;
	border-radius: .25rem;
	transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out
	}

#ok-btn{
	font-size:13px;
	color:#ffffff;
	font-weight:700px;
	border:none;
	border-radius:2px;
	letter-spacing:2px;
	text-transform:uppercase;
	display:inline-block;
	padding:12px 30px;
}

#delete-btn{
	font-size:13px;
	color:#ffffff;
	font-weight:700px;
	border:none;
	border-radius:2px;
	letter-spacing:2px;
	text-transform:uppercase;
	display:inline-block;
	padding:12px 30px;
}

@media ( prefers-reduced-motion :reduce) {
	.form-control {
		transition: none
	}
}
</style>
</body>

</html>