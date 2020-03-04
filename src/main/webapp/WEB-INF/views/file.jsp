<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>fileuploadtest</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<style>
body {
	font-family: '맑은 고딕', verdana;
	padding: 0;
	margin: 0;
}

ul {
	padding: 0;
	margin: 0;
	list-style: none;
}

div#root {
	width: 90%;
	margin: 0 auto;  
}

header#header {
	font-size: 60px;
	padding: 20px 0;
}

header#header h1 a {
	color: #000;
	font-weight: bold;
}

nav#nav {
	padding: 10px;
	text-align: right;
}

nav#nav ul li {
	display: inline-block;
	margin-left: 10px;
}

section#container {
	padding: 20px 0;
	border-top: 2px solid #eee;
	border-bottom: 2px solid #eee;
}

section#container::after {
	content: "";
	display: block;
	clear: both;
}

aside {
	float: left;
	width: 200px;
}

div#container_box {
	float: right;
	width: calc(100% - 200px - 20px);
}

aside ul li {
	text-align: center;
	margin-bottom: 10px;
}

aside ul li a {
	display: block;
	width: 100%;
	padding: 10px 0;
}

aside ul li a:hover {
	background: #eee;
}

footer#footer {
	background: #f9f9f9;
	padding: 20px;
}

footer#footer ul li {
	display: inline-block;
	margin-right: 10px;
}
</style>

</head>
<body>
	<div id="container_box">
		<h2>상품 등록</h2>

		<form role="form" method="post" autocomplete="off"
			enctype="multipart/form-data">

			<div class="inputArea">
				<label for="gdsName">이름 : </label> <input type="text" id="gdsName"
					name="gdsName" />
			</div>

			<div class="inputArea">
				<label for="gdsImg">이미지 : </label> <input type="file" id="gdsImg"
					name="file" />
				<div class="select_img">
					<img src="" />
				</div>

				<script>
					$("#gdsImg").change(
							function() {
								if (this.files && this.files[0]) {
									var reader = new FileReader;
									reader.onload = function(data) {
										$(".select_img img").attr("src",
												data.target.result).width(300);
									}
									reader.readAsDataURL(this.files[0]);
								}
							});
				</script>
			</div>
			<hr>
				<button type="submit" id="register_Btn" class="btn btn-primary">등록</button>
		</form>
	</div>
</body>
</html>