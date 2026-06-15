<%@page import="java.util.Calendar"%>
<%@page import="java.util.List"%>
<%@page import="day0612.TestService"%>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="day0612.TestDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="http://192.168.10.88/JSP_prj/common/favicon.ico" type="image/x-icon">
<!-- Bootstrap CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity
="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.min.js" integrity="sha384-G/EV+4j2dNv+tEPo3++6LCgdCROaejBqfUeNjuKAiuXbjrxilcCdDz6ZAVfHWe1Y" crossorigin="anonymous"></script>
<style type="text/css">
#wrap {
	width: 1000px;
	height: 900px;
	margin: 0px auto;
}

#header {
	height: 200px;
}

#container {
	height: 600px;
}


#footer {
	height: 100px;
}

.age {
    color: red;
    font-size: 20px;
    font-weight: bold;
    }
    
.age2 {
    color: blue;
    font-size: 20px;
    font-weight: bold;
    }
 
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">

$(function(){
    
    
})// ready


</script>


</head>

<body>

<div id="wrap">

	<div id="header"></div>

	<div id="container">
<%
    //_jspService() 안쪽으로 코드가 생성된다.
    int age = 25; // 지역변수 => 초기화 필요

    String css = "age"; // 기본 CSS class는 age

    if(new Random().nextBoolean()) {
        css = "age2";
    } // end if
%>

<div>
    나이는 <span class="<%= css %>"><%= age %></span> 살입니다.
</div>

<%
	int sum = 0;

	for(int i = 1; i <= 100; i++) {
		sum += i;
	}
	
	out.print("1부터 100까지의 합 = " + sum);
%>

<table class="table table-hover" style="width:500px;">
    <thead>
        <tr>
            <th>번호</th>
            <th>이름</th>
            <th>나이</th>
            <th>비고</th>
        </tr>
    </thead>
    <tbody>
<%
    TestService ts = new TestService();
    List<TestDTO> list = ts.searchMember();

    TestDTO tDTO = null;

    for(int i = 0; i < list.size(); i++){
        tDTO = list.get(i);
%>
        <tr>
            <td><%= i + 1 %></td>
            <td><%= tDTO.getName() %></td>
            <td><%= tDTO.getAge() %></td>
            <td>
                <button class="btn btn-warning btn-sm">삭제</button>
            </td>
        </tr>
<%
    }
%>
    </tbody>
</table>

<!-- 올해를 기준으로 2026년 이전 2년, 이후 2년을 옵션으로 보여주는 select을 calendar를 사용하여 만들기 -->

<%
    Calendar cal = Calendar.getInstance();
    int year = cal.get(Calendar.YEAR);
    int month = cal.get(Calendar.MONTH) + 1; // 0부터 시작하므로 +1
    int day = cal.get(Calendar.DAY_OF_MONTH);
    int score = new Random().nextInt(11); // 0부터 10까지의 랜덤 점수
%> <!-- 자바 문법 --> 

<select name="year" id="year">
<%
    for(int i = year - 2; i <= year + 2; i++) {
%>
      <option value="<%= i %>" <%= i == year ? "selected='selected'" : "" %>>
            <%= i %>년
        </option>
<%
    }
%>
</select>

<select name="month" id="month">
<%
	for(int i = 1; i <= 12; i++) {
%>
        <option value="<%= i %>"<%= i == month ? "selected='selected'" : "" %>><%= i %>월</option>
<%
	}
%>
</select>

<select name="day" id="day">
<%
    for(int i = 1; i <= 31; i++) {
    	%>
        <option value="<%= i %>"<%= i == day ? "selected='selected'" : "" %>><%= i %>일</option>
<%
    }
%>        
</select>	    
<br><br>
<!-- 0점 ~10점까지 선택할 수 있는 라디오버튼 -->
<%
for(int i = 0; i <= 10; i++) {
	%>
    <input type="radio" name="score" value="<%= i %>" <%= i == score ? "checked='checked'" : "" %>>
    <label for="score<%= i %>"><%= i %>점</label>
    <%
}
    %>
<br><br>

<!-- 아래 이미지가 강아지 또는 google.png, naver.png, daum.png가 보여지도록 -->
<!-- <img src="../common/images/default_img2.png">  -->

<%
String[] imgArr = {"default_img2.png", "google.png", "naver.png", "daum.png"};

int randomIndex = new Random().nextInt(imgArr.length);
String imgName = imgArr[randomIndex];

%>

<img src="../common/images/<%= imgName %>" alt="랜덤 이미지" width="200px">
<%
//	public void method() {
        // 메서드 안에서 스크립틀릿 코드를 사용할 수 없다.
//  }

%>


</div>
	<div id="footer"></div>
</div>

</body>
</html>