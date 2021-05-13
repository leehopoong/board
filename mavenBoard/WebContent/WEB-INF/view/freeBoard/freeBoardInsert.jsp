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
		if(confirm("����Ͻðڽ��ϱ�?") == true){
			var num = $('#num').val();
			var codeType = $('#codeType').val();
			var name = $('#name').val();
			var title = $('#title').val();
			var content = $('#content').val();
			var params = $('#freeBoardinsertprofrom').serialize();
			if(name == ""){
				alert("�̸��� �Է����ּ���.");
				$('#name').focus();
			}
			else if(title == ""){
				alert("�������� �Է����ּ���.");
				$('#title').focus();
			}
			else if(content == ""){
				alert("������ �Է����ּ���.");
				$('#content').focus();
			}
			else{
				$.ajax({
					type: 'POST',
					data: params,
					url: './freeBoardInsertPro.ino',
					success: function(data) {
						if(data.result == "true"){
							if(confirm("������������ �̵��Ͻðڽ��ϱ�") == true){
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
		<h1>�����Խ���</h1>
	</div>
	<div style="width:650px;" align="right">
		<a href="./main.ino">����Ʈ��</a>
	</div>
	<hr style="width: 600px">

	<form id = "freeBoardinsertprofrom" name ="freeBoardinsertprofrom" onsubmit="return false;">

		<table border="1">
			<tbody>
				<tr>
					<td style="width: 150px;" align="center">Ÿ�� :</td>
					<td style="width: 400px;">
						<select name = "codeType" id = "codeType">
							<option value="01">����</option>
							<option value="02">�͸�</option>
							<option value="03">QnA</option>
						</select>
					</td>
				</tr>
				<tr>
					<td style="width: 150px;"align="center">�̸� :</td>
					<td style="width: 400px;"><input type="text" name="name" id= "name"/></td>
				</tr>
				<tr>
					<td style="width: 150px;"align="center">���� :</td>
					<td style="width: 400px;"><input type="text" name="title" id = "title"/></td>
				</tr>
				<tr>
					<td style="width: 150px;"align="center">���� :</td>
					<td style="width: 400px;"><textarea name="content" rows="25" cols="65"  id= "content"></textarea></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td></td>
					<td align="right">
					<input id = "typing" type="button" value="�۾���">
					<input type="button" value="�ٽþ���" onclick="reset()">
					<input type="button" value="���" onclick="">
					&nbsp;&nbsp;&nbsp;
					</td>
				</tr>
			</tfoot>
		</table>

	</form>



</body>
</html>