<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>file upload test</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
.oriImg {
	width: 500px;
	height: auto;
}

.thumbImg {
	width: 300px;
	height: auto;
}

.testImg {
	width: 100px;
	height: auto;
}
</style>
</head>
<body>
	<h1>file upload test</h1>
	<input type="button" value="파일업로드" onclick="location.href='file' ">
	<hr>
	<%-- ${requestScope["javax.servlet.forward.request_uri"]}
	<br> ${pageContext.request.requestURL}
	<br> ${pageContext.request.requestURI}
	<br> ${pageContext.request.contextPath}
	<br>
	<%=request.getRealPath("")%> --%>
	
	<p>Context Path => <%= request.getContextPath() %> 입니다.</p>


<p>Context Real Path => <%= request.getRealPath(".") %> 입니다.</p>
	<table border="1">
		<tr>
			<td>number</td>
			<td>name</td>
			<td>image</td>
			<td>Thumb Image</td>
		</tr>
		<c:forEach items="${fileResult}" var="vo">
			<tr>
				<td>${vo.gdsNum}</td>
				<td>${vo.gdsName}</td>
				<td><img src="${vo.gdsImg}" class="oriImg"></td>
				<td><img src="${vo.gdsThumbImg}" class="thumbImg"></td>
				<%-- <td><img src="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}${vo.gdsImg}" class="oriImg"></td>
				
				<td><img src="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}${vo.gdsThumbImg}" class="thumbImg"></td> --%>
				<%-- <td><img src="${vo.gdsImg}" class="oriImg"></td>
				<td><img src="${vo.gdsThumbImg}"class="thumbImg"></td> --%>
		</c:forEach>

	</table>
</body>
</html>