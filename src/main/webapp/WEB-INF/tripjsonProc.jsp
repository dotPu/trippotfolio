<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

<script>
	
	$.ajax({
		type:'get',
		url:'https://apis.data.go.kr/B551011/KorService1/areaBasedList1?numOfRows=20&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=json&areaCode=39&serviceKey=ASFMkt7oBR3EQtEzt2OHaPCqKJcrsqtwQVcbkNzSEB5d4xFv10CRJdwfBQUCRIj54jwEwBm3si2evB%2FlGXj4vQ%3D%3D',
		dataType: 'json',
		success:function(result){
			console.log(result.response.body.items.item);
			$.ajax({
				type:'post',
				url:'/tripjson',
				contentType: "application/json",
	    		dataType: 'json',
	    		data: JSON.stringify(result.response.body.items.item),
	    		success:function(r){
	    			
	    		}
			});
		}
	})
	
</script>