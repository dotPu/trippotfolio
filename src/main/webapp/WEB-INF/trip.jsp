<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

</head>
<body>
검색어입력:<input type="text" id="search">
<button onclick="search()">찾기</button><br>
<div>
</div>
<img id="img1id">
<img id="img2id">

<script>
	
	function search() {
		
		var searchtext = document.querySelector("#search").value;
		console.log(searchtext);
		
		$.ajax({
			type:'get',
			url:'http://apis.data.go.kr/B551011/KorService1/searchKeyword1?serviceKey=ASFMkt7oBR3EQtEzt2OHaPCqKJcrsqtwQVcbkNzSEB5d4xFv10CRJdwfBQUCRIj54jwEwBm3si2evB/lGXj4vQ==&_type=json&MobileApp=AppTest&MobileOS=ETC&pageNo=1&numOfRows=10&listYN=Y&&arrange=A&contentTypeId=12&keyword='+searchtext,
			dataType: "json",
			success:function(result){
				console.log(result.response.body.items.item[1]);
				var addr = result.response.body.items.item[1].addr1 + " " + result.response.body.items.item[1].addr2;
				var title = result.response.body.items.item[1].title;
				var img1 = result.response.body.items.item[1].firstimage;
				console.log(img1);

				$("div").html("<h1>"+addr+"<h1><br><h2>"+title+"</h2><br>");

				$("#img1id").attr("src",img1);
				
				$.ajax({
					type:'post',
					url:'/senddata',
					contentType: "application/json",
		    		dataType: 'json',
		    		data: JSON.stringify(result.response.body.items.item),
		    		success:function(r){
		    			
		    		}
				});
				
			}
		});
	}
	
</script>
</body>
</html>