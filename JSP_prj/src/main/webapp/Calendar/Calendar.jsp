<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%!// declaration 영역
	public static final int START_DAY = 1;%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>calendar</title>

<link rel="shortcut icon"
	href="http://192.168.10.88/JSP_prj/common/favicon.ico"
	type="image/x-icon">

<!-- Bootstrap CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
	crossorigin="anonymous">

<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
	integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvR+Vc4jQkC+hVqc2pM8ODewa9r"
	crossorigin="anonymous"></script>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.min.js"
	integrity="sha384-G/EV+4j2dNv+tEPo3++6LCgdCROaejBqfUeNjuKAiuXbjrxilcCdDz6ZAVfHWe1Y"
	crossorigin="anonymous"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

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

/* 달력 전체 영역 */
#calWarp {
	width: 1000px;
	margin: 0px auto;
}

/* 달력 상단 제목 영역 */
#calHeader {
	height: 200px;
	text-align: center;
	padding-top: 150px;
	margin-bottom: 20px;
}

/* 달력 내용 영역 */
#calContainer {
	height: 600px;
	text-align: center;
}

/* 이전/다음 링크 */
#calHeader a {
	text-decoration: none;
	color: #333;
	font-size: 20px;
	font-weight: bold;
	margin: 0px 5px;
}

/* 마우스 올렸을 때 */
#calHeader a:hover {
	text-decoration: underline;
	color: blue;
}

/* 2026.6 부분 */
.calTitle {
	font-size: 30px;
	font-weight: bold;
	color: #222;
	margin: 0px 8px;
}

/* 달력 테이블 */
#calTab {
	border-collapse: collapse;
	margin: 0px auto;
}

#calTab th, #calTab td {
	border: 1px solid #E5E5E5;
	text-align: center;
}

/* 요일 제목 */
.sunTitle {
	width: 100px;
	height: 30px;
	background-color: #E72203;
	color: white;
	font-weight: bold;
}

.weekTitle {
	width: 100px;
	height: 30px;
	background-color: #F8F8F8;
	color: #333;
	font-weight: bold;
}

.satTitle {
	width: 100px;
	height: 30px;
	background-color: rgb(0, 0, 255);
	color: white;
	font-weight: bold;
}

/* 날짜 칸 */
#calTab td {
	width: 100px;
	height: 80px;
	font-size: 18px;
	background-color: #F8F8F8;
	vertical-align: top;
	text-align: left;
	padding: 5px;
}

/* 일요일 날짜 */
.sunTextColor {
	color: #E72203;
	font-weight: bold;
}

/* 평일 날짜 */
.weekTextColor {
	color: #333;
	font-weight: bold;
}

/* 토요일 날짜 */
.satTextColor {
	color: rgb(0, 0, 255);
	font-weight: bold;
}

/* 오늘 부분 */
#calTab td.toDayCss {
	border: 1px solid #6C86C4;
	background-color: #A5C6E0;
}

#calTab td.dayCss {
	border: 1px solid #E5E5E5;
	background-color: #F8F8F8;
}
</style>

<script type="text/javascript">
	$(function() {

	});
</script>

</head>

<body>

	<div id="wrap">

		<div id="header"></div>

		<div id="container">

			<div id="calWarp">

				<%
				Calendar cal = Calendar.getInstance();

				int nowYear = cal.get(Calendar.YEAR);
				int nowMonth = cal.get(Calendar.MONTH) + 1;
				int nowDay = cal.get(Calendar.DAY_OF_MONTH);
				int nowDayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
				%>

				<div id="calHeader">
					<a href="#void" title="이전 월">&lt;&lt;</a> <span class="calTitle"><%=nowYear%>.<%=nowMonth%></span>
					<a href="#void" title="오늘" class="today">오늘</a> <a href="#void"
						title="다음 월">&gt;&gt;</a>
				</div>

				<div id="calContainer">
					<table id="calTab">
						<thead>
							<tr>
								<th class="sunTitle">일</th>
								<th class="weekTitle">월</th>
								<th class="weekTitle">화</th>
								<th class="weekTitle">수</th>
								<th class="weekTitle">목</th>
								<th class="weekTitle">금</th>
								<th class="satTitle">토</th>
							</tr>
						</thead>

						<tbody>
							<tr>
								<%
								String textCss = ""; // 요일별 글자색을 설정
								String tdCss=""; // 오늘을 강조하기위한 CSS

								for (int tempDay = 1;; tempDay++) {

									// 증가하는 임시일자를 달력 객체에 설정
									cal.set(Calendar.DAY_OF_MONTH, tempDay);

									// 현재 월에 없는 날짜가 되면 반복 종료
									if (cal.get(Calendar.DAY_OF_MONTH) != tempDay) {

										// 마지막 주 남은 칸 공백 출력
										for (int blankTd = cal.get(Calendar.DAY_OF_WEEK); blankTd <= 7; blankTd++) {
								%>
								<td></td>
								<%
								}

								break;
								}

								// 1일 출력 전에 공백 td 출력
								if (tempDay == START_DAY) {
								int startDayOfWeek = cal.get(Calendar.DAY_OF_WEEK);

								for (int blankTd = 1; blankTd < startDayOfWeek; blankTd++) {
								%>
								<td></td>
								<%
								}
								}

								// 요일별 글자색 설정
								switch (cal.get(Calendar.DAY_OF_WEEK)) {
								case Calendar.SUNDAY:
								textCss = "sunTextColor";
								break;
								case Calendar.SATURDAY:
								textCss = "satTextColor";
								break;
								default:
								textCss = "weekTextColor";
								}
								
								tdCss = (tempDay == nowDay) ? "toDayCss" : "dayCss"; // 오늘인 경우 toDayCss, 아닌 경우 dayCss
								
								%>

								<td class="<%= tdCss %>"><span class="<%=textCss%>"><%=tempDay%></span></td>

								<%
								// 설정된 요일이 토요일이면 줄 변경
								if (cal.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY) {
								%>
							</tr>
							<tr>
								<%
								}
								}
								%>
							</tr>
						</tbody>
					</table>
				</div>

			</div>

		</div>

		<div id="footer"></div>

	</div>

</body>
</html>