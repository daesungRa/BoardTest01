<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/functions' prefix='fn' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>Admin page</title>
	<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css' />
	<link rel='stylesheet' href='//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css'/>
	<link rel='stylesheet' href='/desktop/resources/css/admin.css' />
	<link rel='stylesheet' href='/desktop/resources/css/component.css' />
	
	<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js'></script>
	<script src='https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js'></script>
	<script src='/desktop/resources/js/admin.js'></script>
	<script src='/desktop/resources/js/component.js'></script>
</head>
<body style='position: relative; height: 100%; padding-bottom: 200px;'>
	
	<!-- 
		[관리자 페이지]
			- 회원정보 관리 (수퍼관리자만)
			- 게시글 관리
			- 등록 요청중인 책 정보 관리
			- 신고 게시판 관리
	 -->
	 
	 <c:choose>
		<c:when test='${not empty sessionScope.userId and not empty sessionScope.authority and sessionScope.authority > 0 }'>
			<c:set var='authority' value='${sessionScope.authority }' scope='page' />
			<script>alert('관리자 페이지입니다');</script>
		</c:when>
		<c:otherwise>
			<script>
				location.href = '/desktop/';
			</script>
		</c:otherwise>
	</c:choose>
	
	<c:if test='${not empty requestScope.brvoList and fn:length(requestScope.brvoList) > 0 }'>
		<c:set var='brvoList' value='${requestScope.brvoList }' scope='page' />
		<c:set var='brPageDto' value='${requestScope.brPageDto }' scope='page' />
	</c:if>

	<!-- top -->
	<jsp:include page="/WEB-INF/views/component/top.jsp"></jsp:include>
	
	<!-- include navbar(top) -->
	<div style='z-index: 5;'>
		<jsp:include page="/WEB-INF/views/component/navBar_top.jsp"></jsp:include>
	</div>
	
	<%
		SimpleDateFormat dateFormat = new SimpleDateFormat("YYYY년 MM월 dd일");
		SimpleDateFormat inputDateFormat = new SimpleDateFormat("YYMMdd");
		
		Date date = new Date();
		String today = dateFormat.format(date);
		String inputDate = inputDateFormat.format(date);
	%>

	<article class='container-fluid' id='adminArticle' style='display: block; /* border: 1px solid black; */ margin: 30px 0 30px 0;'>
		<div class='container' id='adminPageTitle'>
			<div style='position: relative; height: 30px;'>
				<span id='categoryContent' style='position: absolute; top: 20%; font-size: 14pt;'>
					<img src='/desktop/resources/imgs/sample/gear02.svg' alt='icon_pencil for board' style='width: 18px; padding-bottom: 3px; margin-right: 10px;' /> 관리자 페이지 (<%=today %>)
				</span>
			</div>
			<hr style='border-top: 3px double #8c8b8b;'/>
		</div>
		<div class='container-fluid' style='min-height: 420px; /* border: 1px solid black; */ margin-top: 40px;'>
			<div class='row'>
				<div class='col-sm-6' style='/* border: 1px solid black; */'>
					<!-- 신고 목록 -->
					<div id='boardReportListComponent'>
						<div style='position: relative; height: 50px;'>
							<span id='categoryContent' style='position: absolute; top: 20%; font-size: 12pt;'>
								<img src='/desktop/resources/imgs/document01.png' alt='icon_pencil for board' style='width: 18px; padding-bottom: 3px; margin-right: 10px;' /> 신고 목록
							</span>
							<form class='form' id='boardReportListForm' name='boardReportListForm' method='post' action='#' style='float: right;'>
								<input class='form-control' type='text' id='nowPage' name='nowPage' value='1' style='display: none;' />
								<select class='form-control' id='dateFlag' name='dateFlag' >
									<option value='0'>전체 기간 조회</option>
									<option value='1'>오늘</option>
									<option value='2'>어제부터</option>
									<option value='3' selected>최근 일주일</option>
									<option value='4'>최근 한 달</option>
								</select>
							</form>
						</div>
						<div id='boardReportListBody'>
							<div class='row' style='height: 30px; font-size: 10pt; border-top: 2px solid black; border-bottom: 1px solid black; padding-top: 4px; background-color: #dedede;'>
								<div class='col-md-1'>NO</div>
								<div class='col-md-3'>분류 / 블럭유무</div>
								<div class='col-md-2'>신고자</div>
								<div class='col-md-4'>[카테고리] 게시글 / 작성자</div>
								<div class='col-md-2'>등록일</div>
							</div>
							<c:choose>
								<c:when test='${not empty requestScope.brvoList and fn:length(requestScope.brvoList) > 0 }'>
									<c:forEach var="brvo" items="${brvoList }" >
										<div class='row my-boardReportlist-row'>
											<div class='col-md-1' id='boardReportSerial'>${brvo.serial }</div>
											<div class='col-md-3'>[${brvo.reportType }]
												<c:choose>
													<c:when test='${brvo.reportType == 1 }'>
														(통합)부적절한 게시글
													</c:when>
													<c:when test='${brvo.reportType == 2 }'>
														광고
													</c:when>
													<c:when test='${brvo.reportType == 3 }'>
														욕설
													</c:when>
													<c:when test='${brvo.reportType == 4 }'>
														음란물
													</c:when>
													<c:when test='${brvo.reportType == 5 }'>
														저작권 침해
													</c:when>
												</c:choose> / ${brvo.isBlocked }
											</div>
											<div class='col-md-2'>${brvo.rUserId }</div>
											<div class='col-md-4'>[${brvo.category }] ${brvo.title } / ${brvo.userId }</div>
											<div class='col-md-2'>${brvo.rDate }</div>
										</div>
									</c:forEach>
									<c:if test='${not empty requestScope.brPageDto }'>
										<div class='container' id='btnBoardReportChangeGrp' style='height: 46px; font-size: 9pt; text-align: center; margin-top: 30px;'>
											<c:if test='${brPageDto.nowPage >= 2 }'>
												<span class='btnBoardReportView'>처음<span style='display: none;'>1</span></span>
												<span class='btnBoardReportView'>이전<span style='display: none;'>${brPageDto.nowPage - 1 }</span></span>
												<span class='btnBoardReportViewBar'>|</span>
											</c:if>
											<c:forEach var='i' begin='${brPageDto.startPage }' end='${brPageDto.endPage }' step='1'>
												<c:choose>
													<c:when test='${brPageDto.nowPage == i }'>
														<span class='btnBoardReportViewNone'>${i }</span>
													</c:when>
													<c:otherwise>
														<span class='btnBoardReportView'>${i }<span style='display: none;'>${i }</span></span>
													</c:otherwise>
												</c:choose>
											</c:forEach>
											<c:if test='${brPageDto.nowPage < brPageDto.totPage }'>
												<span class='btnBoardReportViewBar'>|</span>
												<span class='btnBoardReportView'>다음<span style='display: none;'>${brPageDto.nowPage + 1 }</span></span>
												<span class='btnBoardReportView'>마지막<span style='display: none;'>${brPageDto.totPage }</span></span>
											</c:if>
										</div>
									</c:if>
								</c:when>
								<c:otherwise>
									<div style='height: 180px;'>
										<div id='noSelectResult'>
											<p>검색결과가 없습니다.</p>
										</div>
									</div><br/>
									<hr style='border-top: 3px double #8c8b8b;'/>
									<br/><br/>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<!-- /신고 목록 -->
				</div>
				
				<!-- 분할 블럭 -->
				<span class='col-sm-1' style='min-height: 420px; text-align: center;'><span style='height: 100%; display: inline-block; border: 1px solid #787878;'></span></span>
				
				<div class='col-sm-5' style='min-height: 420px; /* border: 1px solid black; */'>
					<!-- 책 등록 요청 -->
					<div id='boardListViewDate'>
						<div style='position: relative; height: 50px;'>
							<span id='categoryContent' style='position: absolute; top: 20%; font-size: 12pt;'>
								<img src='/desktop/resources/imgs/document01.png' alt='icon_pencil for board' style='width: 18px; padding-bottom: 3px; margin-right: 10px;' /> 등록 요청된 책 목록 (<%=today %>)
							</span>
						</div>
						<div class='row my-board-row' style='height: 30px; border-top: 2px solid black; padding-top: 4px; background-color: #dedede;'>
							<div class='col-md-1 my-board-grid'>NO</div>
							<div class='col-md-5 my-board-grid-title-top'>제목</div>
							<div class='col-md-1 my-board-grid'>작가</div>
							<div class='col-md-2 my-board-grid'>책제목</div>
							<div class='col-md-1 my-board-grid'>조회</div>
							<div class='col-md-2 my-board-grid'>등록일</div>
						</div>
						<c:choose>
							<c:when test='${not empty requestScope.newBookList and fn:length(requestScope.newBookList) > 0 }'>
								<c:forEach var="bvo" items="${boardListDate }" >
									<div class='row my-board-row'>
										<div class='col-md-1 my-board-grid'>${bvo.serial }</div>
										<c:choose>
											<c:when test="${fn:length(bvo.title) < 24 }">
												<div class='col-md-5 my-board-grid-title'>${bvo.title }<c:if test='${bvo.commentCnt > 0 }'><p style='display: inline-block; color: #48baff; font-size: 8pt;'>&nbsp;[${bvo.commentCnt }]</p></c:if><span style='display: none;'>${bvo.serial }</span></div>
											</c:when>
											<c:otherwise>
												<div class='col-md-5 my-board-grid-title' data-toggle="tooltip" data-placement="right" title="${bvo.title }">${fn:substring(bvo.title, 0, 23) }  ... <c:if test='${bvo.commentCnt > 0 }'><p style='display: inline-block; color: #48baff; font-size: 10pt;'>&nbsp;[${bvo.commentCnt }]</p></c:if><span style='display: none;'>${bvo.serial }</span></div>
											</c:otherwise>
										</c:choose>
										<div class='col-md-1 my-board-grid'>${bvo.userId }</div>
										<c:choose>
											<c:when test="${fn:length(bvo.title_kor) < 7 }">
												<div class='col-md-2 my-board-grid-bookTitle' data-toggle="tooltip" data-placement="right" title="[${bvo.title_kor }] / ${bvo.author }">${bvo.title_kor }</div>
											</c:when>
											<c:otherwise>
												<div class='col-md-2 my-board-grid-bookTitle' data-toggle="tooltip" data-placement="right" title="[${bvo.title_kor }] / ${bvo.author }">${fn:substring(bvo.title_kor, 0, 6) }  ... <span style='display: none;'>${bvo.serial }</span></div>
											</c:otherwise>
										</c:choose>
										<div class='col-md-1 my-board-grid'>${bvo.hit }</div>
										<div class='col-md-2 my-board-grid'>${fn:substring(bvo.bDate, 2, 10) }</div>
									</div>
								</c:forEach>
								<div class='container' id='btnBoardChangeGrp' style='height: 46px; font-size: 9pt; text-align: center; margin-top: 30px;'>
									<c:if test='${pageDto.nowPage >= 2 }'>
										<span class='btnBoardView'>처음<span style='display: none;'>1</span></span>
										<span class='btnBoardView'>이전<span style='display: none;'>${pageDto.nowPage - 1 }</span></span>
										<span class='btnBoardViewBar'>|</span>
									</c:if>
									<c:forEach var='i' begin='${pageDto.startPage }' end='${pageDto.endPage }' step='1'>
										<c:choose>
											<c:when test='${pageDto.nowPage == i }'>
												<span class='btnBoardViewNone'>${i }</span>
											</c:when>
											<c:otherwise>
												<span class='btnBoardView'>${i }<span style='display: none;'>${i }</span></span>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:if test='${pageDto.nowPage < pageDto.totPage }'>
										<span class='btnBoardViewBar'>|</span>
										<span class='btnBoardView'>다음<span style='display: none;'>${pageDto.nowPage + 1 }</span></span>
										<span class='btnBoardView'>마지막<span style='display: none;'>${pageDto.totPage }</span></span>
									</c:if>
								</div>
							</c:when>
							<c:otherwise>
								<div style='height: 180px;'>
									<div id='noSelectResult'>
										<p>검색결과가 없습니다.</p>
									</div>
								</div><br/>
								<hr style='border-top: 3px double #8c8b8b;'/>
								<br/><br/>
							</c:otherwise>
						</c:choose>
					</div>
					<!-- /책 등록 요청 -->
				</div>
			</div>
		</div>
		
		<!-- 중간선 -->
		<br/><hr style='border-top: 1px solid #8c8b8b;'/><br/>
		
		<div class='container-fluid' id='boardAdminComponent' style='width: 80%; min-height: 420px; /* border: 1px solid black; */ margin: 0 auto;'>
			<!-- 새로 등록된 게시글 -->
			<div id='boardListViewDate'>
				<div style='position: relative; height: 50px;'>
					<span id='categoryContent' style='position: absolute; top: 20%; font-size: 12pt;'>
						<img src='/desktop/resources/imgs/document01.png' alt='icon_pencil for board' style='width: 18px; padding-bottom: 3px; margin-right: 10px;' /> 새로 등록된 게시글 (<%=today %>)
					</span>
				</div>
				<div class='row my-board-row' style='height: 30px; border-top: 2px solid black; padding-top: 4px; background-color: #dedede;'>
					<div class='col-md-1 my-board-grid'>NO</div>
					<div class='col-md-5 my-board-grid-title-top'>제목</div>
					<div class='col-md-1 my-board-grid'>작가</div>
					<div class='col-md-2 my-board-grid'>책제목</div>
					<div class='col-md-1 my-board-grid'>조회</div>
					<div class='col-md-2 my-board-grid'>등록일</div>
				</div>
				<c:choose>
					<c:when test='${not empty requestScope.boardList and fn:length(requestScope.boardList) > 0 }'>
						<c:forEach var="bvo" items="${boardListDate }" >
							<div class='row my-board-row'>
								<div class='col-md-1 my-board-grid'>${bvo.serial }</div>
								<c:choose>
									<c:when test="${fn:length(bvo.title) < 24 }">
										<div class='col-md-5 my-board-grid-title'>${bvo.title }<c:if test='${bvo.commentCnt > 0 }'><p style='display: inline-block; color: #48baff; font-size: 8pt;'>&nbsp;[${bvo.commentCnt }]</p></c:if><span style='display: none;'>${bvo.serial }</span></div>
									</c:when>
									<c:otherwise>
										<div class='col-md-5 my-board-grid-title' data-toggle="tooltip" data-placement="right" title="${bvo.title }">${fn:substring(bvo.title, 0, 23) }  ... <c:if test='${bvo.commentCnt > 0 }'><p style='display: inline-block; color: #48baff; font-size: 10pt;'>&nbsp;[${bvo.commentCnt }]</p></c:if><span style='display: none;'>${bvo.serial }</span></div>
									</c:otherwise>
								</c:choose>
								<div class='col-md-1 my-board-grid'>${bvo.userId }</div>
								<c:choose>
									<c:when test="${fn:length(bvo.title_kor) < 7 }">
										<div class='col-md-2 my-board-grid-bookTitle' data-toggle="tooltip" data-placement="right" title="[${bvo.title_kor }] / ${bvo.author }">${bvo.title_kor }</div>
									</c:when>
									<c:otherwise>
										<div class='col-md-2 my-board-grid-bookTitle' data-toggle="tooltip" data-placement="right" title="[${bvo.title_kor }] / ${bvo.author }">${fn:substring(bvo.title_kor, 0, 6) }  ... <span style='display: none;'>${bvo.serial }</span></div>
									</c:otherwise>
								</c:choose>
								<div class='col-md-1 my-board-grid'>${bvo.hit }</div>
								<div class='col-md-2 my-board-grid'>${fn:substring(bvo.bDate, 2, 10) }</div>
							</div>
						</c:forEach>
						<div class='container' id='btnBoardChangeGrp' style='height: 46px; font-size: 9pt; text-align: center; margin-top: 30px;'>
							<c:if test='${pageDto.nowPage >= 2 }'>
								<span class='btnBoardView'>처음<span style='display: none;'>1</span></span>
								<span class='btnBoardView'>이전<span style='display: none;'>${pageDto.nowPage - 1 }</span></span>
								<span class='btnBoardViewBar'>|</span>
							</c:if>
							<c:forEach var='i' begin='${pageDto.startPage }' end='${pageDto.endPage }' step='1'>
								<c:choose>
									<c:when test='${pageDto.nowPage == i }'>
										<span class='btnBoardViewNone'>${i }</span>
									</c:when>
									<c:otherwise>
										<span class='btnBoardView'>${i }<span style='display: none;'>${i }</span></span>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test='${pageDto.nowPage < pageDto.totPage }'>
								<span class='btnBoardViewBar'>|</span>
								<span class='btnBoardView'>다음<span style='display: none;'>${pageDto.nowPage + 1 }</span></span>
								<span class='btnBoardView'>마지막<span style='display: none;'>${pageDto.totPage }</span></span>
							</c:if>
						</div>
					</c:when>
					<c:otherwise>
						<div style='height: 180px;'>
							<div id='noSelectResult'>
								<p>검색결과가 없습니다.</p>
							</div>
						</div><br/>
						<hr style='border-top: 3px double #8c8b8b;'/>
						<br/><br/>
					</c:otherwise>
				</c:choose>
			</div>
			<!-- /새로 등록된 게시글 -->
		</div>
		
		<c:if test='${not empty sessionScope.userId and sessionScope.authority == 2 }'>
			<div class='container' style='text-align: center;'>
				<div class='myBtn' id='showMemberAdminComponent' style='display: inline-block;'>회원관리</div>
			</div>
			
			<!-- 중간선 -->
			<br/><hr id='hideAlign' class='container-fluid' style='width: 80%; border-top: 1px solid #8c8b8b; margin: 0 auto; display: none;'/><br/>
			
			<div id='memberAdminComponent' class='container-fluid' style='width: 80%; min-height: 420px; /* border: 1px solid black; */ margin: 0 auto; display: none;'>
				<!-- 회원 관리 -->
				<div id='boardListViewDate'>
					<div style='position: relative; height: 50px;'>
						<span id='categoryContent' style='position: absolute; top: 20%; font-size: 12pt;'>
							<img src='/desktop/resources/imgs/document01.png' alt='icon_pencil for board' style='width: 18px; padding-bottom: 3px; margin-right: 10px;' /> 회원 관리 (<%=today %>)
						</span>
					</div>
					<div class='row my-board-row' style='height: 30px; border-top: 2px solid black; padding-top: 4px; background-color: #dedede;'>
						<div class='col-md-1 my-board-grid'>NO</div>
						<div class='col-md-5 my-board-grid-title-top'>제목</div>
						<div class='col-md-1 my-board-grid'>작가</div>
						<div class='col-md-2 my-board-grid'>책제목</div>
						<div class='col-md-1 my-board-grid'>조회</div>
						<div class='col-md-2 my-board-grid'>등록일</div>
					</div>
					<c:choose>
						<c:when test='${not empty requestScope.memberList and fn:length(requestScope.memberList) > 0 }'>
							<c:forEach var="bvo" items="${boardListDate }" >
								<div class='row my-board-row'>
									<div class='col-md-1 my-board-grid'>${bvo.serial }</div>
									<c:choose>
										<c:when test="${fn:length(bvo.title) < 24 }">
											<div class='col-md-5 my-board-grid-title'>${bvo.title }<c:if test='${bvo.commentCnt > 0 }'><p style='display: inline-block; color: #48baff; font-size: 8pt;'>&nbsp;[${bvo.commentCnt }]</p></c:if><span style='display: none;'>${bvo.serial }</span></div>
										</c:when>
										<c:otherwise>
											<div class='col-md-5 my-board-grid-title' data-toggle="tooltip" data-placement="right" title="${bvo.title }">${fn:substring(bvo.title, 0, 23) }  ... <c:if test='${bvo.commentCnt > 0 }'><p style='display: inline-block; color: #48baff; font-size: 10pt;'>&nbsp;[${bvo.commentCnt }]</p></c:if><span style='display: none;'>${bvo.serial }</span></div>
										</c:otherwise>
									</c:choose>
									<div class='col-md-1 my-board-grid'>${bvo.userId }</div>
									<c:choose>
										<c:when test="${fn:length(bvo.title_kor) < 7 }">
											<div class='col-md-2 my-board-grid-bookTitle' data-toggle="tooltip" data-placement="right" title="[${bvo.title_kor }] / ${bvo.author }">${bvo.title_kor }</div>
										</c:when>
										<c:otherwise>
											<div class='col-md-2 my-board-grid-bookTitle' data-toggle="tooltip" data-placement="right" title="[${bvo.title_kor }] / ${bvo.author }">${fn:substring(bvo.title_kor, 0, 6) }  ... <span style='display: none;'>${bvo.serial }</span></div>
										</c:otherwise>
									</c:choose>
									<div class='col-md-1 my-board-grid'>${bvo.hit }</div>
									<div class='col-md-2 my-board-grid'>${fn:substring(bvo.bDate, 2, 10) }</div>
								</div>
							</c:forEach>
							<div class='container' id='btnBoardChangeGrp' style='height: 46px; font-size: 9pt; text-align: center; margin-top: 30px;'>
								<c:if test='${pageDto.nowPage >= 2 }'>
									<span class='btnBoardView'>처음<span style='display: none;'>1</span></span>
									<span class='btnBoardView'>이전<span style='display: none;'>${pageDto.nowPage - 1 }</span></span>
									<span class='btnBoardViewBar'>|</span>
								</c:if>
								<c:forEach var='i' begin='${pageDto.startPage }' end='${pageDto.endPage }' step='1'>
									<c:choose>
										<c:when test='${pageDto.nowPage == i }'>
											<span class='btnBoardViewNone'>${i }</span>
										</c:when>
										<c:otherwise>
											<span class='btnBoardView'>${i }<span style='display: none;'>${i }</span></span>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:if test='${pageDto.nowPage < pageDto.totPage }'>
									<span class='btnBoardViewBar'>|</span>
									<span class='btnBoardView'>다음<span style='display: none;'>${pageDto.nowPage + 1 }</span></span>
									<span class='btnBoardView'>마지막<span style='display: none;'>${pageDto.totPage }</span></span>
								</c:if>
							</div>
						</c:when>
						<c:otherwise>
							<div style='height: 180px;'>
								<div id='noSelectResult'>
									<p>검색결과가 없습니다.</p>
								</div>
							</div><br/>
							<hr style='border-top: 3px double #8c8b8b;'/>
							<br/><br/>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<!-- /회원관리 -->
			<div class='container' id='hideMemberAdminComponentContainer' style='text-align: center; display: none;'>
				<div class='myBtn' id='hideMemberAdminComponent' style='width: 102px; display: inline-block;'>회원관리 닫기</div>
			</div>
		</c:if>
	</article>
	
	<!-- button for to-top -->
	<a class='btn btn-secondary my-btn-toTop' href='#' onclick='funcMovePage("indexTop");'>top</a>
	
	<!-- include footer -->
	<footer>
		<jsp:include page="/WEB-INF/views/component/footer.jsp"></jsp:include>
	</footer>
	
    <!-- Modal -->
    <jsp:include page="/WEB-INF/views/component/modal.jsp"></jsp:include>

</body>
</html>