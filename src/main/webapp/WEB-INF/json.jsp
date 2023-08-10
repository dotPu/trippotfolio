<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>        

<script>
var num = 49; /* 서울 보건소만 찾기위해 49개까지만 */
var v;
var jsonobj;
var jsonstring;
var names = new Array(); // JSON 문자열을 담을 배열 추가
var address = new Array();

$(document).ready(function(){
	$.ajax({
		type: "get",
		url : "https://api.odcloud.kr/api/3072692/v1/uddi:9d420e87-8e70-4fb0-a54a-be1244249b2e_201909271427?page=1&perPage="+ num +"&returnType=%EC%8B%9C%EB%8F%84%3A%EC%84%9C%EC%9A%B8&serviceKey=ASFMkt7oBR3EQtEzt2OHaPCqKJcrsqtwQVcbkNzSEB5d4xFv10CRJdwfBQUCRIj54jwEwBm3si2evB%2FlGXj4vQ%3D%3D",
		data: {},
		dataType: "json",
		success: function(result){
			console.log(result);
			console.log(typeof(result.data));
			jsonobj = result.data;
			//jsonstring = JSON.Stringify(jsonobj[1]);
			//console.log(typeof(JSON.stringify(jsonobj[1])));
			//console.log(JSON.stringify(jsonobj[1]));
			//console.log(JSON.stringify(jsonobj));
			
			v = Object.values(result.data); 
			
			$.ajax({
		    		type:"post",
		    		url:"/sendjson",
		    		contentType: "application/json",
		    		dataType: 'json',
		    		data: JSON.stringify(result.data),
		    		success : function(data) {	
		    			
		    		}
		    		
		    	});
			
			for(i = 0; i < num; i++){
				names.push(v[i].보건기관명); // names 배열에 데이터 추가
		        address.push(v[i].주소);    // address 배열에 데이터 추가
				
		        document.querySelector("#tt").innerHTML+="<tr><td>"+ names[i] +"</td><td>"+ address[i]+"</td></tr>";			
				
		        
			
			}
			
		      /*  $.ajax({
		    		type:"post",
		    		data: JSON.stringify(result.data),
		    		url:"/ajaxtest",
		    		contentType: "application/json",
		    		success : function(data) {	
		    			
		    		}
		    		
		    	}); */
		        
					

				}
			
			})  
			
			var obj = {name:"hong",age:17};
			
			$.ajax({
				type:'post',   //post 방식으로 전송
				url:'/jsontest',   //데이터를 주고받을 파일 주소
				data:{name:"hong",age:"17"},   //위의 변수에 담긴 데이터를 전송해준다.
				success : function(data){   //파일 주고받기가 성공했을 경우. data 변수 안에 값을 담아온다.
				
				}
			});
			
			
		}
)	




</script>

<div style="overflow:scroll; width:1000px; height:600px;">

<div class="input-group mt-3 mb-3"> 

<input type="text" class="form-control" id="search" name="search" placeholder="보건소명이나 보건소주소를 이용하여 검색">
<input id="searchbtn" type="button" class="btn btn-secondary" value="검색" onclick="search()">
</div>

	<table class="table table-hover">
		<thead>
			<tr>
				<td>보건기관명</td>
				<td>보건소 주소</td>
			</tr>
		</thead>
		<tbody id="tt">
		
		</tbody>
	</table>
</div>