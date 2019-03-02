<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>top component page</title>
</head>
<body>

	<div class='container-fluid my-top' id='indexTop'>
		<div class='container my-top-container'>
			<div class='container my-top-content' id='myTopContent'>
				<p style='font-size: 16pt; cursor: pointer;' onclick='funcMovePage("main")'>책 상</p>
				<p style='font-size: 7pt; margin-top: -16px;'>세상의 모든 책 리뷰</p>
			</div>
			<div class='searchForm'>
				<form name='searchForm' action=''>
					<span class='icon'><i class='fa fa-search'></i></span>
					<input type='search' id='search' placeholder='Search...' />
				</form>
			</div>
		</div>
	</div>

</body>
</html>