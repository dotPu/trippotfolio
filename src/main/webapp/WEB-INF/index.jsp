<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

<script>
	var jsondata = {"name":"hong","age":"17"};

	$.ajax({
		type:'post',
		url:'/sendjson',
		dataType:'json',
		contentType:'application/json',
		data:JSON.stringify(jsondata),		
		//data:jsondata,
		success:function(result){
				
		}
	})
</script>

</head>
<body>

</body>
</html>