<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js">

</script>
<script type ="text/javascript">
window.onload = function(){ 
	document.getElementById('typing').onclick = function(){
		if(confirm("등록하시겠습니까?") == true){
			var num = $('#num').val();
			var codeType = $('#codeType').val();
			var name = $('#name').val();
			var title = $('#title').val();
			var content = $('#content').val();
			var params = $('#freeBoardinsertprofrom').serialize();
			if(name == ""){
				alert("이름을 입력해주세요.");
				$('#name').focus();
			}
			else if(title == ""){
				alert("제목을을 입력해주세요.");
				$('#title').focus();
			}
			else if(content == ""){
				alert("본문을 입력해주세요.");
				$('#content').focus();
			}
			else{
				$.ajax({
					type: 'POST',
					data: params,
					url: './freeBoardInsertPro.ino',
					success: function(data) {
						if(data.result == "true"){
							if(confirm("메인페이지로 이동하시겠습니까") == true){
								document.location.href = "main.ino";
							}
							else{
								return;
							}
						}
						else{
							document.location.href = "freeBoardDetail.ino?num="+data.num;
						}
					},
					error: function(xhr, status, error) {
						alert('ajax error : ' + xhr.status + error);
					}
				}); 
			}
			}
		else{
			return;
		}
		
	};
}


</script > 
</head>
<body>
	<div>
		<h1>자유게시판</h1>
	</div>
	<div style="width:650px;" align="right">
		<a href="./main.ino">리스트로</a>
	</div>
	<hr style="width: 600px">

	<form id = "freeBoardinsertprofrom" name ="freeBoardinsertprofrom" onsubmit="return false;">

		<table border="1">
			<tbody>
				<tr>
					<td style="width: 150px;" align="center">타입 :</td>
					<td style="width: 400px;">
						<select name = "codeType" id = "codeType">
							<option value="01">자유</option>
							<option value="02">익명</option>
							<option value="03">QnA</option>
						</select>
					</td>
				</tr>
				<tr>
					<td style="width: 150px;"align="center">이름 :</td>
					<td style="width: 400px;"><input type="text" name="name" id= "name"/></td>
				</tr>
				<tr>
					<td style="width: 150px;"align="center">제목 :</td>
					<td style="width: 400px;"><input type="text" name="title" id = "title"/></td>
				</tr>
				<tr>
					<td style="width: 150px;"align="center">내용 :</td>
					<td style="width: 400px;"><textarea name="content" rows="25" cols="65"  id= "content"></textarea></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td></td>
					<td align="right">
					<input id = "typing" type="button" value="글쓰기">
					<input type="button" value="다시쓰기" onclick="reset()">
					<input type="button" value="취소" onclick="">
					&nbsp;&nbsp;&nbsp;
					</td>
				</tr>
			</tfoot>
		</table>

	</form>



</body>
</html>