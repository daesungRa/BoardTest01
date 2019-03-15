<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
	<meta charset='utf-8'>
	<meta name='viewport' content='width=device-width, initial-scale=1'>
	<title>Home Page</title>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" />
	<link rel='stylesheet' href='//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css'/>
	<link rel='stylesheet' href='/desktop/resources/css/index.css' />
	<link rel='stylesheet' href='/desktop/resources/css/component.css' />
	<link rel='stylesheet' href='/desktop/resources/css/member.css' />
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src='/desktop/resources/js/index.js'></script>
	<script src='/desktop/resources/js/component.js'></script>
	<script src='/desktop/resources/js/member.js'></script>
</head>
<body style='position: relative; height: 100%; padding-bottom: 200px; min-height: 3057px;'>	
	<!-- 브라우저 크기 확인 (임시) -->
	<!-- <div id='windowSize' style='width: 180px; border: 1px solid black;'>
		window size : 
	</div> -->
	
	<!-- top -->
	<jsp:include page="/WEB-INF/views/component/top.jsp"></jsp:include>
	
	<!-- include navbar(top) -->
	<jsp:include page="/WEB-INF/views/component/navBar_top.jsp"></jsp:include>
	
	<!-- include header -->
	<header id='indexHeader'>
		<jsp:include page="/WEB-INF/views/component/header.jsp"></jsp:include>
	</header>

	<!-- article component -->
	<article id='article'>
		<div class='container my-index-article' id='introducePart'>
			<div class='row my-index-article-row'>
				<div class='col-sm-4' id='introPart-left'>
					<img src='/desktop/resources/imgs/blank_profile01.png' class='introImg' id='' alt='' /><br/><br/>
					<div class='container-fluid'>
						<span style='font-size: 16pt;'>책 리뷰</span><br/><br/>
						<span style='font-size: 11pt;'>나만의 감성적인 책 리뷰를 작성하세요</span>
					</div>
				</div>
				<div class='col-sm-4' id='introPart-center'>
					<img src='/desktop/resources/imgs/blank_profile01.png' class='introImg' id='' alt='' /><br/><br/>
					<div class='container-fluid'>
						<span style='font-size: 16pt;'>커뮤니티</span><br/><br/>
						<span style='font-size: 11pt;'>댓글, 피드백, 추천, 구독 등<br/>커뮤니티 기능</span>
					</div>
				</div>
				<div class='col-sm-4' id='introPart-right'>
					<img src='/desktop/resources/imgs/blank_profile01.png' class='introImg' id='' alt='' /><br/><br/>
					<div class='container-fluid'>
						<span style='font-size: 16pt;'>계정 보안</span><br/><br/>
						<span style='font-size: 11pt;'>SHA-512 알고리즘으로<br/>암호화된 안전한 계정관리</span>
					</div>
				</div>
			</div>
		</div>
		
		<div class='container my-index-article' id='bookSharePart'>
			<div class='row my-index-article-row'>
				<div class='col-sm-6' id='bookImg-left'>
				</div>
				<div class='col-sm-6' id='bookImg-right'>
				</div>
			</div>
		</div>
		
		<div class='container-fluid my-index-article' id='communicationPart' style='width: 90%;'>
			<div class='row my-index-article-row'>
				<div class='col-sm-6' id='communication-left'>
				</div>
				<div class='col-sm-6' id='communication-right'>
				</div>
			</div>
		</div>
		
		<div class='container-fluid my-index-article' id='encryptionPart'>
			<div class='row my-index-article-row'>
				<div class='col-sm-6' id='encryption-left'>
				</div>
				<div class='col-sm-6' id='encryption-right'>
				</div>
			</div>
		</div>
		
		<div class='container my-index-article-dev' id='devPart'>
			<div class='row my-index-article-row'>
				<span class='col-sm-2' id='dev-left'>
					
				</span>
				<div class='col-sm-2' id='dev-centerImg' style='padding: 140px; text-align: center;'>
					<img src='/desktop/resources/imgs/blank_profile01.png' class='introImg' id='' alt='' /><br/><br/>
				</div>
				<div class='col-sm-6' id='dev-centerIntro' style='padding: 120px; text-align: left;'>
					<div class='container-fluid' style='margin-left: -80px;'>
						<span style='font-size: 16pt;'>개발자 소개</span><br/><br/>
						<span style='font-size: 11pt;'>하하하하하하하하하하</span><br/>
						<span style='font-size: 11pt;'>하하하하하하하하하하</span><br/>
						<span style='font-size: 11pt;'>하하하하하하하하하하</span><br/>
						<span style='font-size: 11pt;'>하하하하하하하하하하</span><br/>
						<span style='font-size: 11pt;'>하하하하하하하하하하</span>
					</div>
				</div>
				<span class='col-sm-2' id='dev-right'>
					
				</span>
			</div>
		</div>
	</article>
	
	<!-- button for to-top -->
	<a class='btn btn-secondary my-btn-toTop' href='#' onclick='funcMovePage("indexTop");' style='z-index: 1;'>top</a>
	
	<!-- include footer -->
	<footer style='z-index: 0;'>
		<jsp:include page="/WEB-INF/views/component/footer.jsp"></jsp:include>
	</footer>
	
    <!-- Modal -->
    <jsp:include page="/WEB-INF/views/component/modal.jsp"></jsp:include>
	
</body>
</html>
