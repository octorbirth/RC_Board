<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>RC 창의교육하우스</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/main.css?ver=2" />
</head>
<body>
	<style>
	ul.icons li{
		padding : 0 0.3em 0 0;
	}
	.logoImg{
		width : 0.5em;
		height : 0.5em;
	}
	</style>

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">

				<!-- Header -->
				<header id="header"><a href="/board/list" class="logo"><strong>창의교육</strong>
					4분반</a>
				<ul class="icons">
					<li><span class="label">${memberVO.mname}님  |</span></li>
					<li><a href="/logout"><span class="label">Logout</span></a></li>
				</ul>

				</header>