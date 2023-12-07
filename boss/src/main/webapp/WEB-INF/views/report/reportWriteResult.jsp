<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 글작성 성공 -->
	<c:if test="${result == 1 }">
		<script>
			alert('${msg}');
			location.href = 'masterMain.do';
		</script>
	</c:if>
	<!-- 파일이 없는경우 -->
	<c:if test="${result == -1 }">
		<script>
			alert('${msg}');
			location.href = 'masterMain.do';
		</script>
	</c:if>
	<!-- 용량이 초과한경우 -->
	<c:if test="${result == 2 }">
		<script>
			alert('${msg}');
			history.go(-1);
		</script>
	</c:if>
	<!-- 파일 형식이 올바르지 않은경우 -->
	<c:if test="${result == 3 }">
		<script>
			alert('${msg}');
			history.go(-1);
		</script>
	</c:if>
</body>
</html>