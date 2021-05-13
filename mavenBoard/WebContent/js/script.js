$(document).ready(function(){
	$('#typing').on('click', function() {
		alert('하이용');
		var codeType = $('#codeType').val();
		var name = $('#name').val();
		var title = $('#title').val();
		var content = $('#content').val();
		
		$.ajax({
			type: 'POST',
			datatype: 'json',
			data: { codeType: codeType,name: name,title: title,content: content},
			url: 'freeBoardInsertPro',
			success: function(data) {
				
			},
			error: function(xhr, status, error) {
				alert('ajax error : ' + xhr.status + error);
			}
		});
	});
	
});
 

