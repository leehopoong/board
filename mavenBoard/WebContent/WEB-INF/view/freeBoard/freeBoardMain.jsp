<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	function selectbox(value) {
		var result = $('#optionvalue option:selected').val();
		if (result == '1') {
			$('#optioninput1').show().attr("disabled", false);
			$('#optioninput2').val('').hide().attr("disabled",true);
			$('#optioninput3').val('').hide().attr("disabled", true);
			$('#optioninput4').val('').hide().attr("disabled", true);
			$('#optioninput5').val('').hide().attr("disabled", true);
			$('#optioninput6').val('').hide().attr("disabled", true);
			$('#optioninput7').val('').hide().attr("disabled", true);
			$('#optioninput0').val('').hide().attr("disabled", true);
		}
		else if(result == '0'){
			$('#optioninput0').show().attr("disabled", false);
			$('#optioninput2').val('').hide().attr("disabled",true);
			$('#optioninput3').val('').hide().attr("disabled", true);
			$('#optioninput4').val('').hide().attr("disabled", true);
			$('#optioninput5').val('').hide().attr("disabled", true);
			$('#optioninput6').val('').hide().attr("disabled", true);
			$('#optioninput7').val('').hide().attr("disabled", true);
			$('#optioninput1').val('01').hide().attr("disabled", true);
		}
		else if (result == '2') {
			$('#optioninput2').val('').show().attr("disabled", false);
			$('#optioninput1').val('').hide().attr("disabled", true);
			$('#optioninput3').val('').hide().attr("disabled", true);
			$('#optioninput4').val('').hide().attr("disabled", true);
			$('#optioninput5').val('').hide().attr("disabled", true);
			$('#optioninput6').val('').hide().attr("disabled", true);
			$('#optioninput7').val('').hide().attr("disabled", true);
			$('#optioninput0').val('').hide().attr("disabled", true);
		}
		else if (result == '3') {
			$('#optioninput3').val('').show().attr("disabled", false);
			$('#optioninput1').val('').hide().attr("disabled", true);
			$('#optioninput2').val('').hide().attr("disabled", true);
			$('#optioninput4').val('').hide().attr("disabled", true);
			$('#optioninput5').val('').hide().attr("disabled", true);
			$('#optioninput6').val('').hide().attr("disabled", true);
			$('#optioninput7').val('').hide().attr("disabled", true);
			$('#optioninput0').val('').hide().attr("disabled", true);
		}
		else if (result == '4') {
			$('#optioninput4').val('').show().attr("disabled", false);
			$('#optioninput1').val('').hide().attr("disabled", true);
			$('#optioninput2').val('').hide().attr("disabled", true);
			$('#optioninput3').val('').hide().attr("disabled", true);
			$('#optioninput5').val('').hide().attr("disabled", true);
			$('#optioninput6').val('').hide().attr("disabled", true);
			$('#optioninput7').val('').hide().attr("disabled", true);
			$('#optioninput0').val('').hide().attr("disabled", true);
		}
		else if (result == '5') {
			$('#optioninput5').val('').show().attr("disabled", false);
			$('#optioninput1').val('').hide().attr("disabled", true);
			$('#optioninput2').val('').hide().attr("disabled", true);
			$('#optioninput4').val('').hide().attr("disabled", true);
			$('#optioninput3').val('').hide().attr("disabled", true);
			$('#optioninput6').val('').hide().attr("disabled", true);
			$('#optioninput7').val('').hide().attr("disabled", true);
			$('#optioninput0').val('').hide().attr("disabled", true);
		}
		else if (result == '6') {
			$('#optioninput6').val('').show().attr("disabled", false);
			$('#optioninput7').val('').show().attr("disabled", false);
			$('#optioninput1').val('').hide().attr("disabled", true);
			$('#optioninput2').val('').hide().attr("disabled", true);
			$('#optioninput4').val('').hide().attr("disabled", true);
			$('#optioninput5').val('').hide().attr("disabled", true);
			$('#optioninput3').val('').hide().attr("disabled", true);
			$('#optioninput0').val('').hide().attr("disabled", true);
		}
		else {
			$('#optioninput1').val('').hide().attr("disabled", true);
			$('#optioninput2').val('').hide().attr("disabled", true);
			$('#optioninput3').val('').hide().attr("disabled", true);
			$('#optioninput4').val('').hide().attr("disabled", true);
			$('#optioninput5').val('').hide().attr("disabled", true);
			$('#optioninput6').val('').hide().attr("disabled", true);
			$('#optioninput7').val('').hide().attr("disabled", true);
			$('#optioninput0').val('').hide().attr("disabled", true);
		}

	}
	function  finders(page){
		$('#tb').empty();
		var codeType = $('#optioninput1').val();
		var name = $('#optioninput2').val();
		var title = $('#optioninput3').val();
		var content = $('#optioninput4').val();
		var num = $('#optioninput5').val();
		var regdate = $('#optioninput6').val();
		var regdate2 = $('#optioninput7').val();
		$('#page').val(page)
		var paramarse = $('#mainino').serialize();
			$.ajax({
				type : 'POST',
				data : paramarse,
				url : './freeBoardfinder.ino',
				dataType:"json",
				success : function(data) {
					$('#selectpage').empty();
						$.each(data.list,function(index, item){
							var tag = "<tr>" + 
							"<td>"+"<input type='checkbox' name = 'onecheck' id = 'onecheck'>"+"</td>"+
   	                   		"<td style='width: 55px; padding-left: 30px;' align='center'>" + item.codeType + "</td>" + 
   	                   		"<td style='width: 48px; padding-left: 50px;' align='center'>" + item.num + "</td>" +
   	                   		"<td style='width: 125px;'  align='centet'>"+"<a href = './freeBoardDetail.ino?num="+item.num+"'>"+ item.title+"</a>" +"</td>" +
   	                  	 	"<td style='width: 50px; padding-left: 10px;' align='center'>" + item.name + "</td>" +
   	                		"<td style='width: 100px; padding-left: 95px;' align='center'>" + item.regdate + "</td>" + 
	                   	  "</tr>"
	                   	  $("#tb").append(tag);
						})
						
						
						$.each(data.pages,function(index, page){
						var pag = 
							"<a href = 'javascript:finders("+page+")'>" +
							"<span>" + page+"  " +"</span>" + "</a>"
						$('#selectpage').append(pag);
						})
						
				},
				error : function(xhr, status, error) {
					alert('ajax error : ' + xhr.status + error);
				}
			});
	};
	jQuery(document).ready(function() {
// 		$('#finders').on('click', function() {
// 			$('#tb').empty();
// 			var codeType = $('#optioninput1').val();
// 			var name = $('#optioninput2').val();
// 			var title = $('#optioninput3').val();
// 			var content = $('#optioninput4').val();
// 			var num = $('#optioninput5').val();
// 			var regdate = $('#optioninput6').val();
// 			var regdate2 = $('#optioninput7').val();
// 			var paramarse = $('#mainino').serialize();
// 			alert('ㅎㅇ')
// 				$.ajax({
// 					type : 'POST',
// 					data : paramarse,
// 					url : './freeBoardfinder.ino',
// 					dataType:"json",
// 					success : function(data) {
// 							$.each(data.list,function(index, item){
// // 								item.num = parseFloat(item.num);
								
// 								var tag = "<tr>" + 
// 	   	                   		"<td style='width: 55px; padding-left: 30px;' align='center'>" + item.codeType + "</td>" + 
// 	   	                   		"<td style='width: 48px; padding-left: 50px;' align='center'>" + item.num + "</td>" +
// 	   	                   		"<td style='width: 125px;'  align='centet'>"+"<a href = './freeBoardDetail.ino?num="+item.num+"'>"+ item.title+"</a>" +"</td>" +
// 	   	                  	 	"<td style='width: 50px; padding-left: 10px;' align='center'>" + item.name + "</td>" +
// 	   	                		"<td style='width: 100px; padding-left: 95px;' align='center'>" + item.regdate + "</td>" +
// // 	   	                		"<td style='width: 100px; padding-left: 95px;' align='center'>" + item.rowcount + item.pages"</td>" +
// 		                   	  "</tr>"
// 		                   	  $("#tb").append(tag);
		                   	
// //	 							
// 							})var ho = "<input type = 'hidden' name = 'page' id='page'>"
// 							$('#selectpage').append(ho);
							
// 					},
// 					error : function(xhr, status, error) {
// 						alert('ajax error : ' + xhr.status + error);
// 					}
// 				});
// 		});
		$('#allcheck').on('click',function(){
			if($(this).prop('checked')){
				$('input:checkbox[id="onecheck"]').each(function() {
					this.checked = true
				})
			}
			else{
					$('input:checkbox[id="onecheck"]').each(function() {
						this.checked = false
					});
				}
			})
		$('#boardDelete').on('click',function(){
			var num = [];
			var alc = $("input:checkbox[id='allcheck']").is(":checked") ==  true;
			var checkbox = $('input:checkbox[name=onecheck]:checked');
			checkbox.each(function(i){
				var tr = checkbox.parent().parent().eq(i);
				var td = tr.children();
				var idlist = td.eq(2).text();
				num.push(idlist);
			});
			
			if ($("input:checkbox[id='onecheck']").is(":checked") == true){
			    if(confirm("삭제하시겠습니까?")){
			    	$.ajax({
						type: 'POST',
						data: {'num':num},
						url: './boardDeleteAjex.ino',
						success: function(data) {
							alert('삭제되었습니다.')
							$("input:checkbox[name=onecheck]:checked").parent().parent().remove();
							$("input:checkbox[id='allcheck']").prop("checked", false);
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
			else{
				alert('하나이상을 체크하여 주십시오');
				return;
			}
		})
	});
// 			$(document).on('click', '#tb td #onecheck', function() {
// 				var row = $(this).closest('tr');
// 				var td = row.children();
// 				var num = td.eq(2).text();
// 				var chk = $('#onecheck').prop('checked');
// 				var chs = $('#allcheck').prop('checked');
// 				 $('#boardDelete').on('click',function(){
// 					 for(i = 0; num.length; i++){
						 
// 					 }

// 					 if (chk == true || chs == true) {
// 						 if(confirm('삭제 하시겠습니까?') == true){
// 								$.ajax({
// 									type: 'POST',
// 									data: { num : num },
// 									url: './boardDeleteAjex.ino',
// 									success: function(data) {
// 										if(data.result == "true"){
// 											$(row).remove();
// 										}
// 										else{
// 											return;
// 										}
// 									},
// 									error: function(xhr, status, error) {
// 										alert('ajax error : ' + xhr.status + error);
// 									}
// 								});
// 							}
// 						 else{
// 								return;
// 							}

// 					 }
// 					 else{
// 						 alert('삭제할 게시글을 선택해주세요.')
// 						 return;
// 					 }
// 				})
// 		});

		
</script>
</head>
<body>
	<form id="mainino" name="mainino">
		<div>
			<h1>자유게시판</h1>
		</div>
		<div>
			<select name = "optionvalues" id="optionvalue" onChange="selectbox(this.value);">
				<option value="0" selected="selected">전체</option>
				<c:forEach items="${commCdMap2 }" var="dto">
					<option value="${dto.CODE }">${dto.CODE_NAME }</option>
				</c:forEach>
				
			</select>
			<input type="text" id="optioninput0">
			<select name = "codeType" id="optioninput1" style = "display:none">
				
				<c:forEach items="${commCdMap1 }" var="dto">
					<option value="${dto.CODE }">${dto.CODE_NAME }</option>
				</c:forEach>

			</select>
			<input type="text" name = "name" id="optioninput2" style = "display:none">
			<input type="text" name = "title" id="optioninput3" style = "display:none">
			<input type="text" name = "content" id="optioninput4" style = "display:none">
			<input type="text"  oninput ="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="3" name = "num" id="optioninput5" style = "display:none">
			<input type="text" oninput ="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="8" name = "regdate" id="optioninput6" style = "display:none">
			<input type="text"  oninput ="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="8" name = "regdate2" id="optioninput7" style = "display:none"> 
			<input  type="button" onClick = 'finders(1)' value="검색">
		</div>
		<div style="width: 650px;" align="right">
			<a href="./freeBoardInsert.ino">글쓰기</a>
		</div>
		<hr style="width: 600px;">
		<div style="padding-bottom: 10px;">
			<table border="1">
				<thead>
					<tr>
						<td><input type="checkbox" name = "allcheck" id = "allcheck"></td>
						<td style="width: 55px; padding-left: 30px;" align="center">타입</td>
						<td style="width: 50px; padding-left: 10px;" align="center">글번호</td>
						<td style="width: 125px;" align="center">글제목</td>
						<td style="width: 48px; padding-left: 50px;" align="center">글쓴이</td>
						<td style="width: 100px; padding-left: 95px;" align="center">작성일시</td>
					</tr>
				</thead>
			</table>
		</div>
		<hr style="width: 600px;">

		<div>
			<table border="1">
				<tbody id="tb" name="tb" >
					<c:forEach var="dto" items="${freeBoardList}">
						<tr id = "testtr">
							<td><input type="checkbox" name = "onecheck" id = "onecheck"></td>
							<td style="width: 55px; padding-left: 30px;" align="center"
								id="dtocodetype">${dto.codeType }</td>
							<td style="width: 50px; padding-left: 10px;" align="center"
								id="dtonum">${dto.num }</td>
							<td style="width: 125px;"  align="center" id="dtotitle"><a
								href="./freeBoardDetail.ino?num=${dto.num}">${dto.title }</a></td>
							<td style="width: 48px; padding-left: 50px;" align="center"
								id="dtoname">${dto.name }</td>
							<td style="width: 100px; padding-left: 95px;" align="center"
								id="dtoregdate">${dto.regdate }</td>
						<tr>
					</c:forEach>
				</tbody>
			</table>
			<input type = "hidden" name = "page" id="page">
			<div class = "pagination" id= "selectpage" style="text-align: center;">
						<span id = "pagelist" > 
							<c:forEach var="page" items="${pages}">
							<a href = "javascript:finders(${page})"><span >${page}</span>
							</a>
						</c:forEach>
						</span>
					</div>
			<div>
				<input type = "button" id = "boardDelete" value = "삭제" style="cursor:pointer">
			</div>
		</div>
		
	</form>
</body>
</html>