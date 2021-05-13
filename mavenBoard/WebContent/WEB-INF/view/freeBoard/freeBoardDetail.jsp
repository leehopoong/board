<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type ="text/javascript">
;
function modify(){
	if(confirm('수정하시겠습니까?') == true){
	var title = $('#title').val();
	var content = $('#content').val();
	var num = $('#num').val();
	var par = $('#insertForm').serialize();
	if (content == ""){
		alert('본문을 작성해주세요')
		$('#content').focus();
	}
	else if(title == ""){
		alert('제목을 입려하세요')
		$('#title').focus();
	}
	$.ajax({
		type: 'POST',
		datatype: 'json',
		data: par,
		url: './freeBoardModify.ino',
		success: function(data) {
			if(data.result == "true"){
				if(confirm('메인페이로 이동하시겠습니까?') == true){
				document.location.href = "main.ino";
				}
				else{
					return;
				}
			}
			else{
				document.location.href = "freeBoardModify.ino?num="+data.num;
			}
				
			
		},
		error: function(xhr, status, error) {
			alert('ajax error : ' + xhr.status + error);
		}
	});
	}
	else{
		return;
	}
};

window.onload = function(){ 
	document.getElementById('delete').onclick = function(){
		if(confirm('삭제 하시겠습니까?') == true){
			var num = $('#num').val();
			$.ajax({
				type: 'POST',
				datatype: 'json',
				data: {num : num},
				url: './freeBoardDelete.ino',
				success: function(data) {
					if(data.result == "true"){
						alert('삭제되었습니다.')
						document.location.href = "main.ino";  
					}
					else{
						return;
					}
					
				},
				error: function(xhr, status, error) {
					alert('ajax error : ' + xhr.status + error);
				}
			});	
		}
		
		
		else{
			return;
		}
	}
};

</script>
</head>
<body>

	<div>
		<h1>자유게시판</h1>
	</div>
	<div style="width:650px;" align="right">
		<a href="./main.ino">리스트로</a>
	</div>
	<hr style="width: 600px">

	<form name="insertForm" id = "insertForm">
		<input type="hidden" name="num" id = "num" value="${FreeBoardDto.num}" />
		<table border="1">
			<tbody>
				<tr>
					<td style="width: 150px;" align="center">타입 :</td>
					<td style="width: 400px;">
						<select >
							<c:forEach items="${commCdMap1 }" var="dto">
								<option value="${dto.CODE }" <c:if test = "${FreeBoardDto.codeType eq dto.CODE }">selected</c:if>>${dto.CODE_NAME }</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td style="width: 150px;"align="center">이름 :</td>
					<td style="width: 400px;"><input type="text" name="name" value="${FreeBoardDto.name}" readonly/></td>
				</tr>
				<tr>
					<td style="width: 150px;"align="center">제목 :</td>
					<td style="width: 400px;"><input type="text" name="title" id = "title"  value="${FreeBoardDto.title }"/></td>
				</tr>
				<tr>
					<td style="width: 150px;"align="center">내용 :</td>
					<td style="width: 400px;"><textarea name="content" id = "content" rows="25" cols="65"  >${FreeBoardDto.content }</textarea></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td></td>
					<td align="right">
					<input type="button" value="수정" onclick="modify()" >
					<input type="button" value="삭제" id = "delete">
					<input type="button" value="취소" onclick="location.href='./main.ino'">
					&nbsp;&nbsp;&nbsp;
					</td>
				</tr>
			</tfoot>
		</table>

	</form>


<%-- 	<input type="hidden" name="num" value="${freeBoardDto.num }" />

		<div style="width: 150px; float: left;">이름 :</div>
		<div style="width: 500px; float: left;" align="left"><input type="text" name="name" value="${freeBoardDto.name }" readonly/></div>

		<div style="width: 150px; float: left;">제목 :</div>
		<div style="width: 500px; float: left;" align="left"><input type="text" name="title"  value="${freeBoardDto.title }"/></div>

		<div style="width: 150px; float: left;">작성날자</div>
		<div style="width: 500px; float: left;" align="left"><input type="text" name="regdate"  value="${freeBoardDto.regdate }"/></div>

		<div style="width: 150px; float: left;">내용 :</div>
		<div style="width: 500px; float: left;" align="left"><textarea name="content" rows="25" cols="65"  >${freeBoardDto.content }</textarea></div>
		<div align="right">
		<input type="button" value="수정" onclick="modify()">
		<input type="button" value="삭제" onclick="location.href='./freeBoardDelete.ino?num=${freeBoardDto.num }'">

		<input type="button" value="취소" onclick="location.href='./main.ino'">
		&nbsp;&nbsp;&nbsp;
		</div> --%>

</body>
</html>