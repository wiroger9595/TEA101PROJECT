<%@page import="com.updateFunction.model.UpdateService"%>
<%@page import="com.allSpace.service.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<%@ page import="java.util.*"%>

<%@include file="/frontend/template/header.jsp"%> 
     
<%@ page import="com.space.model.*"%>
<%@ page import="com.spaceDetail.model.*"%>
<%@ page import="com.spaceComment.model.*"%>
<%@ page import="com.spacePhoto.model.*"%>
<%@ page import="com.member.model.*"%>
<%@ page import="com.orderMaster.model.*"%>
<%@ page import="com.orderDetail.model.*"%>
<%@ page import="com.popularFunction.service.*"%>
<%@ page import="com.updateFunction.*"%>
<%@ page import="java.sql.Timestamp"%>


	<%
		Base64.Encoder encoder = Base64.getEncoder();
	%>

<%
	/* ===================== space id =============================================== */
	
	String oneSpaceId = request.getParameter("oneSpaceId");

	


	SpaceService spaceSvc = new SpaceService();
	List<SpaceVO> listAllSpace = spaceSvc.getAll();
	pageContext.setAttribute("listAllSpace",listAllSpace);

	/* ===================== space detail =============================================== */

	
	SpaceDetailVO spaceDeatilVO = (SpaceDetailVO) request.getAttribute("sDetailVO");
	//SpaceDetailService spaceDetailSvc = new SpaceDetailService();
	pageContext.setAttribute("spaceDeatilVO",spaceDeatilVO);
	System.out.println(spaceDeatilVO);
	
	/* ===================== space comment =============================================== */


	
	System.out.println("f1");

	
	
	SpacePhotoVO spacePhotoVO = (SpacePhotoVO) request.getAttribute("sPhotoVO");
	//SpaceDetailService spaceDetailSvc = new SpaceDetailService();
	pageContext.setAttribute("spacePhotoVO",spacePhotoVO);
	
	System.out.println("f2");
	
	
	
	SpacePhotoService spacePhotoSvc = new SpacePhotoService();
	SpacePhotoVO listOneSpacePhoto = spacePhotoSvc.selectOneSpacePhoto(oneSpaceId);
	pageContext.setAttribute("listOneSpacePhoto",listOneSpacePhoto);
	
	List<SpacePhotoVO> listAllSpacePhoto = spacePhotoSvc.getAll();
	pageContext.setAttribute("listAllSpacePhoto",listAllSpacePhoto); 
	System.out.print(listAllSpacePhoto + " ooooooo  ");
	
	/* ===================== select all comment from all one spaceId =============================================== */
	
		
	String spaceCommentId = request.getParameter("spaceCommentId");
	

	SpaceCommentService spaceCommentSvc = new SpaceCommentService();
	
	SpaceCommentVO listOneSpaceComment = spaceCommentSvc.selectOneSpaceComment(oneSpaceId);
	pageContext.setAttribute("oneSpaceId",oneSpaceId);
	System.out.print(listOneSpaceComment + " ooooooo  ");
	
	
	List<SpaceCommentVO> listAllSpaceComment = spaceCommentSvc.getAll();
	pageContext.setAttribute("listAllSpaceComment",listAllSpaceComment); 
	

	/* ===================== space photo =============================================== */
		System.out.println("f4");
	
	
	SpaceVO allSpaceVO = (SpaceVO) request.getAttribute("listAllSpaceInfo");
	System.out.print(allSpaceVO + " ooooooo  ");

	SpaceDetailService spaceDetailSvc = new SpaceDetailService();
	List<SpaceDetailVO> listAllSpaceDetail = spaceDetailSvc.getAll();
	
	/* ===================== space photo =============================================== */

		System.out.println("f5");
	
	
	/* MemberService memberService = new MemberService();
 	List<MemberVO> listAllMember = memberService.getAll();
 	pageContext.setAttribute("listAllMember", listAllMember); */
	
 	
	/* ===================== order master photo =============================================== */

	
 	
/*  	OrderMasterService orderMasterService = new OrderMasterService();
 	List<OrderMasterVO> listAllOrderMaster = orderMasterService.selectAllOrderMaster();
 	pageContext.setAttribute("listAllOrderMaster", listAllOrderMaster); */
 
	/* ===================== order detail photo =============================================== */

 			System.out.println("f6");		

 	OrderDetailService orderDetailService = new OrderDetailService();
	List<OrderDetailVO> listAllOrderDetail = orderDetailService.selectAllOrderDetail();
	pageContext.setAttribute("listAllOrderDetail",listAllOrderDetail); 

	System.out.println("f7");		

	
	PopularService popularList = new PopularService();
	List<SpaceVO> listPopularSpace = popularList.listByPopular();
	
	
	pageContext.setAttribute("listPopularSpace",listPopularSpace);  
	
	/*  ====================================================================  */  

	System.out.println("f8");		

	UpdateService updateList = new UpdateService();
	List<SpaceVO> updatePopularSpace = updateList.listByDate();
	pageContext.setAttribute("updatePopularSpace",updatePopularSpace);  
	
	
	
	SpaceService SpaceSvc = new SpaceService();
	SpaceVO getOneSpace = (SpaceVO) SpaceSvc.selectOneSpace(oneSpaceId);
	pageContext.setAttribute("getOneSpace",getOneSpace);  


	/* ===================== end  =============================================== */
System.out.println(oneSpaceId + "[[[[[[[dss]]]]]]]" + listAllSpaceComment.get(2).getSpaceId());
%>


  	
	<main>
		
		<section class="hero_in hotels_detail">
			<div class="wrapper">
				<div class="container">
					<h1 class="fadeInUp"><span></span>${getOneSpace.spaceName}</h1>
				</div>
				
					<span class="magnific-gallery">
						<a href="<%=request.getContextPath()%>/space/space.do?action=getOne_For_Display&spaceId=${getOneSpace.spaceId}" class="btn_photos" title="Photo title" data-effect="mfp-zoom-in">View photos</a>
							
  								<a href="data:image/png;base64,<%=encoder.encodeToString(((SpacePhotoVO)pageContext.getAttribute("listOneSpacePhoto")).getSpacePhoto())%>" title="Photo title" data-effect="mfp-zoom-in"></a>
							
					</span>
				
			</div>
		</section>
		<!--/hero_in-->
		
		<div class="container ">
						<div class="hidden-md">
								<img src="img/avatar1.jpg" alt="" class="rounded-circle thumb_visit">
				
							</div>
				</div>
		<!--  -->

		<div class="bg_color_1">
			<nav class="secondary_nav sticky_horizontal">
				<div class="container">
					<ul class="clearfix">
						<li><a href="#description" class="active">Description</a></li>
						<li><a href="#reviews">Reviews</a></li>
						<li><a href="#sidebar">Booking</a></li>
					</ul>
				</div>
			</nav>
			<div class="container margin_60_35">
				<div class="row">
					<div class="col-lg-8">
						<section id="description">
							
							<h2>空間規劃</h2>
							<p>本系目前區分為院大樓空間區與專業工作室兩大區域，院大樓空間區包含本系辦公室1間，專任教師研究室8間，多媒體電腦教室1間，圖學教室1間，專業討論室3間，攝影教室1間，以及產學合作暨精密加工機教室1間共計16間專用空間。</p>
							<br>
							<p>而專業工作室空間共包含暗房2間，木竹媒材設計研究工作室1間、文化產品設計研究工作室1間、金屬媒材設計研究工作室1間、塑性媒材設計研究工作室1間、玉石媒材設計研究工作室1間、石雕設計工作室1間、塑造教室1間、大型共用機具教室1間，以及二年級工作室1間、一年級工作室1間，共計12個專業工作教室。</p>
							<br>
							<br>
							
							<h2>詳細介紹</h2>
							<p>文化產品設計研究工作室由專任教師-翁群儀教師負責規劃與管理。總面積約120.9平方公尺，工作室備有一般工作桌24張，提供二年級創意設計課程，以及四年級創意設計課程之修課同學使用。本工作室主要以在地傳統工藝與生活文化之調查研究為基礎，提出活用傳統工藝技術，並符合現代生活型態之產品為主要目標。希望借由設計的創新手法，賦予傳統工藝新的樣態，並重新回歸生活當中，進而達到工藝傳承的目的。</p>
							<hr>
							<p>近年以來，以金屬為主要媒材的設計工作，相當受到年輕世代的青睞，因此近來以金屬媒材為主的設計相關科系相繼成立。本系金屬媒材設計研究工作室，由專任教師-賴廷鴻老師負責規劃與管理，總面積約180平方公尺。自本系成立以來，即是本系重要媒材工作室之一，立年以來投入相當多的資源設置各項軟硬體設備。目前本系之金屬媒材設計工作室所屬大小設備機具總數達100項以上，不論是金屬拉絲細工，或是鍛造、鑄造、噴砂、包鑲、琺瑯、銲接，以及表面碾壓、腐蝕、鋁染陽極處理等現代加工技術，皆可在本系工作式完成。另本系金屬媒材設計研究工作室，更從傳統工藝之傳承與技術研究出發，發展出全台灣唯一教授傳統錫藝技巧的課程內容，對於傳統機屬工藝之人才傳承與技術保存，具有相當的貢獻。</p>
							<br>
							<br>
							
							
							<h2>種類彙整</h2>
							<p>想要找活動場地卻總是搶輸別人？不是時間無法配合，就是空間租借出去？辦活動時，場地問題最令人困擾，不但要空間適當、硬體完善還要雙方時間可以配合？《小型會議室租借要注意什麼？5項硬體設施，讓你開會不出糗！》中有提到硬體設備與空間規劃是會議室租借最重要的步驟。那到底該如何規劃活動場地？這次，小編幫大家整理好各種場合適用的空間租借規劃，要讓大家租借不煩惱！</p>
							<hr>
							<p>挑選活動空間場地一定要先確認好租借規劃，桌距之間不可過大或過窄，視覺感受才舒服。桌椅的排列是有學問的，哪種活動適合哪種排法也要依據空間租借而定，只要把這些問題都一起考量進租借條件，就可以找到滿意的活動場地喔！ 馬蹄型排法，是最適合參加會議、座談會的排法。中間挖空，可以讓講者自由走動，並增加與會者的互動，達成雙方會議的成功。根據日本教育大師佐藤學提倡的「學習共同體」，使用馬蹄型排法，將會促進協同學習，且也會讓講者與台下關係更親近。而會議最令人擔心的部分，就是因設備的問題，造成會議流程卡關、不順暢，而讓人有不可靠的感覺，而TCCC提供完善的會議相關設備，幫助消費者不論是提案或會議討論，確保流程齊全順暢，關於現場設備的部分，可參考，活動場地-設備FAQ，可獲得更多詳細資訊！</p>
							<br>
							<br>
							
							
							
							<p>活動聚會最適合分組型排法，藉由分組聚會遊戲，增加彼此之間的認識，讓活動更加出色。</p>
							<hr>
							<p>活動場地與空間租借不困難，只要挑對場合所需的場地，就可以讓你成功辦好活動與會議！TCCC以活力、笑顏、互助為理念，提供專業的服務，承接無數的活動成功案例，成為你強而有力的後盾。並致力於提供兼具舒適與專業的環境，滿足不同場合的需求，並在台北、桃園、台中、台南及高雄設置活動場地，要給你空間租借的最高規格待遇，讓每場活動都精彩滿分！ </p>
							<p>挑選活動空間場地一定要先確認好租借規劃，桌距之間不可過大或過窄，視覺感受才舒服。桌椅的排列是有學問的，哪種活動適合哪種排法也要依據空間租借而定，只要把這些問題都一起考量進租借條件，就可以找到滿意的活動場地喔！ 馬蹄型排法，是最適合參加會議、座談會的排法。中間挖空，可以讓講者自由走動，並增加與會者的互動，達成雙方會議的成功。根據日本教育大師佐藤學提倡的「學習共同體」，使用馬蹄型排法，將會促進協同學習，且也會讓講者與台下關係更親近。而會議最令人擔心的部分，就是因設備的問題，造成會議流程卡關、不順暢，而讓人有不可靠的感覺，而TCCC提供完善的會議相關設備，幫助消費者不論是提案或會議討論，確保流程齊全順暢，關於現場設備的部分，可參考，活動場地-設備FAQ，可獲得更多詳細資訊！</p>
							<br>
							<br>
							
							
							<div class="row">
								<div class="col-lg-6">
									<ul class="bullets">
										<li>Dolorem mediocritatem</li>
										<li>Mea appareat</li>
										<li>Prima causae</li>
										<li>Singulis indoctum</li>
									</ul>
								</div>
								<div class="col-lg-6">
									<ul class="bullets">
										<li>Timeam inimicus</li>
										<li>Oportere democritum</li>
										<li>Cetero inermis</li>
										<li>Pertinacia eum</li>
									</ul>
								</div>
							</div>
							
							<br>
							<br>
							<br>
							<!-- /row -->
							
							
							
							<!--  row  -->
							<!-- <hr>
							
							<h3>Location</h3>
							<div id="map" class="map map_single add_bottom_30"></div> -->
							<!-- End Map -->
						</section>
						<!-- /section -->
					
						<jsp:useBean id="allSpaceSvc" scope="page" class="com.allSpace.service.AllSpaceDAO" />
						<section id="reviews">
							<h2>Reviews</h2>
							<div class="reviews-container">
								<div class="row">
									<div class="col-lg-3">
										<div id="review_summary">
											<c:forEach var="spaceCommentVO" items="${listAllSpaceComment}">
												<c:if test="${commentFromSpecificId == 5}">
													<em>Good</em>
												</c:if>
												<c:if test="${commentFromSpecificId <= 4 || commentFromSpecificId > 2}">
													<em>Average</em>
												</c:if>
												<c:if test="${spaceCommentVO.spaceCommentLevel <= 2}">
													<em>Bad</em>
												</c:if>
											</c:forEach>
										</div>
									</div>
									<div class="col-lg-9">
										<div class="row">
											<div class="col-lg-10 col-9">
												<div class="progress">
													<div class="progress-bar" role="progressbar" style="width: 90%" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"></div>
												</div>
											</div>
											<div class="col-lg-2 col-3"><small><strong>5 stars</strong></small></div>
										</div>
										<!-- /row -->
										<div class="row">
											<div class="col-lg-10 col-9">
												<div class="progress">
													<div class="progress-bar" role="progressbar" style="width: 95%" aria-valuenow="95" aria-valuemin="0" aria-valuemax="100"></div>
												</div>
											</div>
											<div class="col-lg-2 col-3"><small><strong>4 stars</strong></small></div>
										</div>
										<!-- /row -->
										<div class="row">
											<div class="col-lg-10 col-9">
												<div class="progress">
													<div class="progress-bar" role="progressbar" style="width: 60%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
												</div>
											</div>
											<div class="col-lg-2 col-3"><small><strong>3 stars</strong></small></div>
										</div>
										<!-- /row -->
										<div class="row">
											<div class="col-lg-10 col-9">
												<div class="progress">
													<div class="progress-bar" role="progressbar" style="width: 20%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
												</div>
											</div>
											<div class="col-lg-2 col-3"><small><strong>2 stars</strong></small></div>
										</div>
										<!-- /row -->
										<div class="row">
											<div class="col-lg-10 col-9">
												<div class="progress">
													<div class="progress-bar" role="progressbar" style="width: 10%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
												</div>
											</div>
											<div class="col-lg-2 col-3"><small><strong>1 stars</strong></small></div>
										</div>
										<!-- /row -->
									</div>
								</div>
								<!-- /row -->
							</div>

							<hr>





							<div class="reviews-container">
								
									<c:forEach var="spaceCommentVO" items="${listAllSpaceComment}">
										<c:if test="${spaceCommentVO.spaceId.equals(oneSpaceId)}">



											<div class="review-box clearfix">
												<figure class="rev-thumb"><img src="img/avatar1.jpg" alt="">
												</figure>
												<div class="rev-content">
													<div class="rating">
														<c:if test="${spaceCommentVO.spaceCommentLevel == 1}">
															<i class="icon_star voted"></i><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i>
														</c:if>
														<c:if test="${spaceCommentVO.spaceCommentLevel == 2}">
															<i class="icon_star voted"></i><i class="icon_star voted"></i><i class="icon_star"></i><i class="icon_star "></i><i class="icon_star"></i>
														</c:if>
														<c:if test="${spaceCommentVO.spaceCommentLevel == 3}">
															<i class="icon_star voted"></i><i class="icon_star voted"></i><i class="icon_star voted"></i><i class="icon_star "></i><i class="icon_star"></i>
														</c:if>
														<c:if test="${spaceCommentVO.spaceCommentLevel == 4}">
															<i class="icon_star voted"></i><i class="icon_star voted"></i><i class="icon_star voted"></i><i class="icon_star voted"></i><i class="icon_star"></i>
														</c:if>
														<c:if test="${spaceCommentVO.spaceCommentLevel == 5}">
															<i class="icon_star voted"></i><i class="icon_star voted"></i><i class="icon_star voted"></i><i class="icon_star voted"></i><i class="icon_star voted"></i>
														</c:if>
													</div>
													
													
													
													
													
													
													
													
													
													
													<div class="rev-info">
														匿名 – ${spaceCommentVO.spaceCommentDate}:
													</div>
													<div class="rev-text">
														<p>
															${spaceCommentVO.spaceCommentContent}
														</p>
													</div>
												</div>
											</div>
											<!-- /review-box -->
										</c:if>
									</c:forEach>
								
								
							</div>
							<!-- /review-container -->
							
							
							
							
							
							
							
							
						</section>
						<!-- /section -->
						<hr>

							<div class="add-review">
								<h5>Leave a Review</h5>
								
									<div class="row">
										<div class="form-group col-md-6">
											<label>Name and Lastname *</label>
											<input type="text" name="name_review" id="name_review" placeholder="" class="form-control">
										</div>
										<div class="form-group col-md-6">
											<label>Email *</label>
											<input type="email" name="email_review" id="email_review" class="form-control">
										</div>
										<div class="form-group col-md-6">
											<label>Rating </label>
											<div class="custom-select-form">
											<select name="rating_review" id="rating_review" class="wide">
												<option value="1">1 (lowest)</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
												<option value="5" selected>5 (medium)</option>
												<option value="6">6</option>
												<option value="7">7</option>
												<option value="8">8</option>
												<option value="9">9</option>
												<option value="10">10 (highest)</option>
											</select>
											</div>
										</div>
										<div class="form-group col-md-12">
											<label>Your Review</label>
											<textarea name="review_text" id="review_text" class="form-control" style="height:130px;"></textarea>
										</div>
										<div class="form-group col-md-12 add_top_20">
											<input type="submit" value="Submit" class="btn_1" id="submit-review">
										</div>
									</div>
								
							</div>
					</div>
					<!-- /col -->
					
					 <aside class="col-lg-4" id="sidebar">
					 	<FORM METHOD="post" name="orderListPage" ACTION="<%=request.getContextPath()%>/frontendPage/orderSingle.jsp?oneSpaceId=<%=oneSpaceId %>" enctype="multipart/form-data">
					 
						<div class="box_detail booking">
							<div class="price">
		
										<span id="price" name="totoalAmount"><%=listAllSpaceDetail.get(0).getSpaceDetailCharge()%></span><small>/h</small>
										
								
								<div class="score">
								
								
								
																
									<%-- <c:forEach var="popularLevel" items="${listPopularSpace}">
										
											<c:if test="${popularLevel.avgComment = 5}">
												<h5>Good</h5>
											</c:if>
											<c:if test="${popularLevel.avgComment <= 4 || popularLevel.avgComment > 2}">
												<h5>Average</h5>
											</c:if>
											<c:if test="${popularLevel.avgComment <= 2}">
												<h5>Bad</h5>
											</c:if>
										
									</c:forEach> --%>
										
													
								
								</div>
								
								
								
								
								
							</div>

								<div class="form-group input-dates">
									<input class="form-control" id="dateTimePick" type="text" name="dates" value="<%=new Timestamp(System.currentTimeMillis()) %>" placeholder="When..">
									
									<i class="icon_calendar"></i>
								</div> 
							
							
								<div class="panel-dropdown">
									<a href="#">Guests <span id="qtyTotal" class="qtyTotal" name="quanity" onchange="qtyFunction()">1</span></a>
									<div class="panel-dropdown-content right">
										<div class="qtyButtons">
											<label>總人數</label>
											<input type="text" name="qtyInput" value="1" id="adult">
										</div>
										
									</div>
								</div>
									
									
								
									
								<input type="submit" value="Checkout" class="btn_1 full-width purchase">

								<input type="hidden" name="action"	value="startingOrdering">
								<input type="hidden" name="spaceId"  value="<%=listAllSpace.get(0).getSpaceId()%>">
								<input type="hidden" name="totoalAmount"  value="<%=listAllSpaceDetail.get(0).getSpaceDetailCharge()%>">
								<input type="hidden" name="spaceDetailId"  value="<%=listAllSpaceDetail.get(0).getSpaceDetailId()%>">
								
								<input type="hidden" name="dates"  value="<%=listAllOrderDetail.get(0).getRentStartTime()%>">	
					     		
								<input type="hidden" name="detailCharge"  value="${spaceDeatilVO.spaceDetailCharge}">
								<input type="hidden" name="rentStartTime"  value="${orderDetailVO.rentStartTime}">
								<input type="hidden" name="rentEndTime"  value="${orderDetailVO.rentEndTime}">
								<input type="hidden" name="orderAmount"  value="${orderMasterVO.orderAmount}">
								<input type="hidden" name="orderStatus"  value="${orderMasterVO.orderStatus}">
								
								<a href="wishlist.html" class="btn_1 full-width outline wishlist"><i class="icon_heart" name="totalChargePerPerson" onclick="total-date()"></i> Add to wishlist</a>
							<div class="text-center"><small>No money charged in this step</small></div>
						</div>
						
						
						
						</FORM>
						
						
						
					</aside> 
					
					
					
					
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /bg_color_1 -->
		
	</main>
	<!--/main-->




	








	<%@include file="/frontend/template/footer.jsp"%>   

	<script src="http://maps.googleapis.com/maps/api/js"></script>
	
	<!-- DATEPICKER  -->

	<script>
		$(function () {

			$('input[name="dates"]').daterangepicker({
				timePicker: true,
				"timePicker24Hour": true,
				startDate: moment().startOf('hour'),
				endDate: moment().startOf('hour').add(32, 'hour'),
				opens: 'left',
				locale: {
					cancelLabel: 'Clear',
					format: 'YY/MM/DD HH:mm',
				},
				minDate: new Date(),
			});

			/*
			$('input[name="dates"]').daterangepicker({
				autoUpdateInput: false,
				timePicker: true,
				parentEl:'.scroll-fix',
				minDate:new Date(),
				opens: 'left',
				locale: {
					cancelLabel: 'Clear'
				}
			});
			  */
			
			$('input[name="dates"]').on('apply.daterangepicker', function (ev, picker) {
				$(this).val(picker.startDate.format('MM-DD-YY') + ' > ' + picker.endDate.format('MM-DD-YY'));
				var start_date = picker.startDate;
				var end_date = picker.endDate;
				
				var price = parseInt("50");

				var diff_hours = end_date.diff(start_date, "hours");
				var total_price = price * diff_hours;
				

				$("#price").html(total_price);
				
				var dateString = document.getElementById("dateTimePick");
				
				console.log(dateString);
				$('#dateTimePick').on('click', function(){
				
					
					
					
					
					
				})

			});
			  

			$('input[name="dates"]').on('cancel.daterangepicker', function (ev, picker) {
				$(this).val('');
            });
            

            $("#adult").on('click')



        });
        
		 $(document).ready(function(){
	        $('#qtyTotal').change(function(){
	
	            alert("aaaa");
	            /* val total = $(this).val();
	            
	            var price = parseInt("20");

				
				var total_price = price * total; */
				

				$("#price").html(total_price);
				
				
	            
	        });
		}); 
        

	</script>

	<!-- INPUT QUANTITY  -->
	<script src="${pageContext.request.contextPath}/resources/js/input_qty.js"></script>

	

	<!-- ======================================= map ================================================ -->
	
	<script>
	function(A) {

		if (!Array.prototype.forEach)
			A.forEach = A.forEach || function(action, that) {
				for (var i = 0, l = this.length; i < l; i++)
					if (i in this)
						action.call(that, this[i], i, this);
				};

			})(Array.prototype);

			var
			mapObject,
			markers = [],
			markersData = {
				'Marker': [
				{
					type_point: 'Paris Centre',
					name: 'Mariott Hotel',
					location_latitude: 48.865633, 
					location_longitude: 2.321236,
					map_image_url: 'img/thumb_map_single_hotel.jpg',
					rate: 'Superb | 7.5',
					name_point: 'Mariott Hotel',
					get_directions_start_address: '',
					phone: '+3934245255'
				}
				]

			};

				var mapOptions = {
					zoom: 14,
					center: new google.maps.LatLng(48.865633, 2.321236),
					mapTypeId: google.maps.MapTypeId.ROADMAP,

					mapTypeControl: false,
					mapTypeControlOptions: {
						style: google.maps.MapTypeControlStyle.DROPDOWN_MENU,
						position: google.maps.ControlPosition.LEFT_CENTER
					},
					panControl: false,
					panControlOptions: {
						position: google.maps.ControlPosition.TOP_RIGHT
					},
					zoomControl: true,
					zoomControlOptions: {
						style: google.maps.ZoomControlStyle.LARGE,
						position: google.maps.ControlPosition.TOP_LEFT
					},
					scrollwheel: false,
					scaleControl: false,
					scaleControlOptions: {
						position: google.maps.ControlPosition.TOP_LEFT
					},
					streetViewControl: true,
					streetViewControlOptions: {
						position: google.maps.ControlPosition.LEFT_TOP
					},
					styles: [
						{
							"featureType": "administrative.country",
							"elementType": "all",
							"stylers": [
								{
									"visibility": "off"
								}
							]
						},
						{
							"featureType": "administrative.province",
							"elementType": "all",
							"stylers": [
								{
									"visibility": "off"
								}
							]
						},
						{
							"featureType": "administrative.locality",
							"elementType": "all",
							"stylers": [
								{
									"visibility": "off"
								}
							]
						},
						{
							"featureType": "administrative.neighborhood",
							"elementType": "all",
							"stylers": [
								{
									"visibility": "off"
								}
							]
						},
						{
							"featureType": "administrative.land_parcel",
							"elementType": "all",
							"stylers": [
								{
									"visibility": "off"
								}
							]
						},
						{
							"featureType": "landscape.man_made",
							"elementType": "all",
							"stylers": [
								{
									"visibility": "simplified"
								}
							]
						},
						{
							"featureType": "landscape.natural.landcover",
							"elementType": "all",
							"stylers": [
								{
									"visibility": "on"
								}
							]
						},
						{
							"featureType": "landscape.natural.terrain",
							"elementType": "all",
							"stylers": [
								{
									"visibility": "off"
								}
							]
						},
						{
							"featureType": "poi.attraction",
							"elementType": "all",
							"stylers": [
								{
									"visibility": "off"
								}
							]
						},
						{
							"featureType": "poi.business",
							"elementType": "all",
							"stylers": [
								{
									"visibility": "off"
								}
							]
						},
						{
							"featureType": "poi.government",
							"elementType": "all",
							"stylers": [
								{
									"visibility": "off"
								}
							]
						},
						{
							"featureType": "poi.medical",
							"elementType": "all",
							"stylers": [
								{
									"visibility": "off"
								}
							]
						},
						{
							"featureType": "poi.park",
							"elementType": "all",
							"stylers": [
								{
									"visibility": "on"
								}
							]
						},
						{
							"featureType": "poi.park",
							"elementType": "labels",
							"stylers": [
								{
									"visibility": "off"
								}
							]
						},
						{
							"featureType": "poi.place_of_worship",
							"elementType": "all",
							"stylers": [
								{
									"visibility": "off"
								}
							]
						},
						{
							"featureType": "poi.school",
							"elementType": "all",
							"stylers": [
								{
									"visibility": "off"
								}
							]
						},
						{
							"featureType": "poi.sports_complex",
							"elementType": "all",
							"stylers": [
								{
									"visibility": "off"
								}
							]
						},
						{
							"featureType": "road.highway",
							"elementType": "all",
							"stylers": [
								{
									"visibility": "off"
								}
							]
						},
						{
							"featureType": "road.highway",
							"elementType": "labels",
							"stylers": [
								{
									"visibility": "off"
								}
							]
						},
						{
							"featureType": "road.highway.controlled_access",
							"elementType": "all",
							"stylers": [
								{
									"visibility": "off"
								}
							]
						},
						{
							"featureType": "road.arterial",
							"elementType": "all",
							"stylers": [
								{
									"visibility": "simplified"
								}
							]
						},
						{
							"featureType": "road.local",
							"elementType": "all",
							"stylers": [
								{
									"visibility": "simplified"
								}
							]
						},
						{
							"featureType": "transit.line",
							"elementType": "all",
							"stylers": [
								{
									"visibility": "off"
								}
							]
						},
						{
							"featureType": "transit.station.airport",
							"elementType": "all",
							"stylers": [
								{
									"visibility": "off"
								}
							]
						},
						{
							"featureType": "transit.station.bus",
							"elementType": "all",
							"stylers": [
								{
									"visibility": "off"
								}
							]
						},
						{
							"featureType": "transit.station.rail",
							"elementType": "all",
							"stylers": [
								{
									"visibility": "off"
								}
							]
						},
						{
							"featureType": "water",
							"elementType": "all",
							"stylers": [
								{
									"visibility": "on"
								}
							]
						},
						{
							"featureType": "water",
							"elementType": "labels",
							"stylers": [
								{
									"visibility": "off"
								}
							]
						}
					]
				};
				var
				marker;
				mapObject = new google.maps.Map(document.getElementById('map'), mapOptions);
				for (var key in markersData)
					markersData[key].forEach(function (item) {
						marker = new google.maps.Marker({
							position: new google.maps.LatLng(item.location_latitude, item.location_longitude),
							map: mapObject,
							icon: 'img/pins/' + key + '.png',
						});

						if ('undefined' === typeof markers[key])
							markers[key] = [];
						markers[key].push(marker);
						google.maps.event.addListener(marker, 'click', (function () {
					  closeInfoBox();
					  getInfoBox(item).open(mapObject, this);
					  mapObject.setCenter(new google.maps.LatLng(item.location_latitude, item.location_longitude));
					 }));

		});
		
			function hideAllMarkers () {
				for (var key in markers)
					markers[key].forEach(function (marker) {
						marker.setMap(null);
					});
			};

			function closeInfoBox() {
				$('div.infoBox').remove();
			};

			function getInfoBox(item) {
				return new InfoBox({
					content:
					'<div class="marker_info" id="marker_info">' +
					'<img src="' + item.map_image_url + '" alt=""/>' +
					'<span>'+ 
						'<span class="infobox_rate">'+ item.rate +'</span>' +
						'<h3>'+ item.name_point +'</h3>' +
					'<em>'+ item.type_point +'</em>' +
					'<strong>'+ item.description_point +'</strong>' +
					'<form action="http://maps.google.com/maps" method="get" target="_blank"><input name="saddr" value="'+ item.get_directions_start_address +'" type="hidden"><input type="hidden" name="daddr" value="'+ item.location_latitude +',' +item.location_longitude +'"><button type="submit" value="Get directions" class="btn_infobox_get_directions">Get directions</button></form>' +
						'<a href="tel://'+ item.phone +'" class="btn_infobox_phone">'+ item.phone +'</a>' +
						'</span>' +
					'</div>',
					disableAutoPan: false,
					maxWidth: 0,
					pixelOffset: new google.maps.Size(10, 92),
					closeBoxMargin: '',
					closeBoxURL: "img/close_infobox.png",
					isHidden: false,
					alignBottom: true,
					pane: 'floatPane',
					enableEventPropagation: true
				});


			};

	
	</script>
	
	
	
	<% String dates = request.getParameter("dates");
		System.out.println(dates + "datadatadata");
	
	%>
	
	
	
	
	
	

	<!--   =============================================== 觸發 Ajax ================================================ 
	-->
	
</body>
</html>
