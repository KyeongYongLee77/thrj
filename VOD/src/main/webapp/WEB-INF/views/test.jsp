<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<h1>회원가입 페이지 입니다.</h1>
	<form action="">
		<table>
			<tr>
				<td>아이디 <button type="button" id="idCheck">중복체크</button></td>
				<td><input class="mb_id" type="text" name="mb_id">
					<br>
					<span id="result"></span>
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input class='check' readonly='readonly' type="text" name="pw"></td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td><input class='check' readonly='readonly' type="text" name="nick"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input class='check' readonly='readonly' type="text" name="addr"></td>
			</tr>
		</table>
		
	</form>
	
	<script type="text/javascript">		
		$('.check').on('click', function(){
			
			var text = $(this).attr('readonly');
			if(text == 'readonly') {
				alert('아이디 중복체크를 먼저해주세요');
			}
		});
	
		$('#idCheck').on('click', function(){
			
			var mb_id = $('.mb_id').val();
			$.ajax({
				url : 'idCheck.do',
				data : {'mb_id' : mb_id},
				method : 'POST',
				dataType : 'JSON',
				success : idCheck,
				error : function(e) {
					console.log(e);
				}
			});			
		});
		
		function idCheck (data) {
			if(data.mb_id == 'null') {
				// 중복된 아이디가 없다.
				$('#result').text('사용할 수 있는 아이디입니다.');
				$('#result').css('color', 'blue');
				
				$('.check').removeAttr('readonly');
			}
			else {
				// 중복된 아이디가 있다.
				$('#result').text('사용할 수 없는 아이디입니다.')
				$('#result').css('color', 'red');
			}
			
		}
	
	</script>
	
	
</body>
</html>