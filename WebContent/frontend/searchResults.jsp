<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page import="com.allSpace.service.AllSpaceServiceList"%>
<%@page import="com.popularFunction.service.PopularService"%>
<%@ page import="com.space.model.*"%>
<%@ page import="java.util.*"%>

<jsp:useBean id="memberFavoriteSvc" scope="page" class="com.memberFavorite.model.MemberFavoriteService" />
<jsp:useBean id="spaceSvc" scope="page" class="com.space.model.SpaceService" />
<jsp:useBean id="spaceDetailSvc" scope="page" class="com.spaceDetail.model.SpaceDetailService" />	
<jsp:useBean id="spaceCommentSvc" scope="page" class="com.spaceComment.model.SpaceCommentService" />	
<jsp:useBean id="spacePhotoSvc" scope="page" class="com.spacePhoto.model.SpacePhotoService" />
					
<%
	String keyword = request.getParameter("keyword");
	String location_ = request.getParameter("spaceAddress");
	String categories = request.getParameter("spaceType");
	
	
	session.setAttribute("keyword", keyword);
	session.setAttribute("location_", location_);
	session.setAttribute("categories", categories);
	
	/*  ====================================================================  */   	

    PopularService popularList = new PopularService();
	List<SpaceVO> listPopularSpace = popularList.listByPopular();
	pageContext.setAttribute("listPopularSpace",listPopularSpace);   
	
	
	/*  ====================================================================  */   	


	/*  ====================================================================  */   	

	AllSpaceServiceList allSpaceList = new AllSpaceServiceList();
	List<SpaceVO> listAllSpaceInfo = allSpaceList.selectAllSpaceList();
	pageContext.setAttribute("listAllSpaceInfo",listAllSpaceInfo); 

	/*  ====================================================================  */   	

	String thisSpaceId = request.getParameter("spaceId");
	
	
%>
					
					
		<jsp:include page="/frontend/template/header.jsp"/>

<%-- 
<style>
.ellipsis {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 1;
	-webkit-box-orient: vertical;
	white-space: normal;
}

.list-wrapper {
	padding: 15px;
	overflow: hidden;
}

.list-item h4 {
	color: #FF7182;
	font-size: 18px;
	margin: 0 0 5px;
}

.list-item p {
	margin: 0;
}

.simple-pagination ul {
	margin: 0 0 20px;
	padding: 0;
	list-style: none;
	text-align: center;
}

.simple-pagination li {
	display: inline-block;
	margin-right: 5px;
}

.simple-pagination li a, .simple-pagination li span {
	color: #666;
	padding: 5px 10px;
	text-decoration: none;
	border: 1px solid #EEE;
	background-color: #FFF;
	box-shadow: 0px 0px 10px 0px #EEE;
}

.simple-pagination .current {
	color: #FFF;
	background-color: #FF7182;
	border-color: #FF7182;
}

.simple-pagination .prev.current, .simple-pagination .next.current {
	background: #e04e60;
}

.hero_in.hotels:before {
  background: url(<%=request.getContextPath()%>/frontend/image/home.jpg) center center no-repeat;
}

</style>
 --%>


		<!-- /header -->
	<%-- <main>
		
		<section class="hero_in hotels">
			<div class="wrapper">
				<div class="container">
					
				</div>
			</div>
		</section>
		<!--/hero_in-->
		
		<div class="filters_listing sticky_horizontal">
			<div class="container">
				<ul class="clearfix">
					<li>
						<div class="switch-field">
							<input type="radio" id="all" name="listing_filter" value="all" checked data-filter="*" class="selected">
							<label for="all">全部</label>
						</div>
					</li>
					<li>
						<a class="btn_map" data-toggle="collapse" href="#collapseMap" aria-expanded="false" aria-controls="collapseMap" data-text-swap="地圖隱藏" data-text-original="地圖檢視">地圖檢視</a>
					</li>
				</ul>
			</div>
			<!-- /container -->
		</div>
		<!-- /filters -->
		
		<div class="collapse" id="collapseMap">
			<div id="map" class="map"></div>
		</div>
		<!-- End Map -->

		<div class="container margin_60_35">
			<div class="row">
				<aside class="col-lg-3">
					<form method="post" action="<%=request.getContextPath()%>/space/space.do">
					<div class="custom-search-input-2 inner-2">
						<div class="form-group">
							<input class="form-control" name="spaceAddress" type="text" placeholder="區域" value="${param.spaceAddress}">
							<i class="icon_pin_alt"></i>
						</div>
						<div class="form-group">
							<input class="form-control" name="spaceContain" type="text" placeholder="人數" value="${param.spaceContain}">
							<i class="icon_search"></i>
						</div>
						<div class="form-group">
						<select name="spaceType" class="wide">
                        	<option value="">類型</option>
                        	<option value="會議" ${(param.spaceType eq '會議')? 'selected':''}>會議</option>
							<option value="課程講座" ${(param.spaceType eq '課程講座')? 'selected':''}>課程講座</option>
							<option value="親子活動" ${(param.spaceType eq '親子活動')? 'selected':''}>親子活動</option>
							<option value="攝影棚" ${(param.spaceType eq '攝影棚')? 'selected':''}>攝影棚</option>
						</select>
						</div>
						<input type="hidden" name="subQueryCommand" value="${subQueryCommand}">
						<input type="hidden" name="action" value="search_space">
						<input type="submit" class="btn_search" value="搜尋">
					</div>
					</form>
					<div style="margin-bottom:20px">
						<form>
							<input type="hidden" name="action" value="search_space">
							<button type="submit" class="btn btn-light" style="height:50; width:100%">清除結果</button>
						</form>
					</div>	
					<!-- /custom-search-input-2 -->
				</aside>
				<!-- /aside -->

					<div class="col-lg-9">
					<div class="isotope-wrapper">
						<div class="row">
						<c:forEach var="spaceVO" items="${spaceVO}" varStatus="s">
							<c:if test="${spaceVO.spaceStatus eq 'T'}">
							<div class="col-md-6 isotope-item popular">
								<div class="box_grid">
									<figure>
										<c:if test="${userVO != null}">
											<c:choose>
												<c:when test="${memberFavoriteSvc.getMemberFavoriteStatus(userVO.memberId,spaceVO.spaceId) != null }">
													<a href="#0" class="wish_bt mfs${s.index} liked"></a>
												</c:when>
												<c:otherwise>
													<a href="#0" class="wish_bt mfs${s.index}"></a>
												</c:otherwise>
											</c:choose>
										</c:if>
										<form method="post" action="<%=request.getContextPath()%>/space/space.do" id="form_getOneSpaceC${s.index}">
											<input type="hidden" name="spaceId" value="${spaceVO.spaceId}">
											<input type="hidden" name="action" value="getOne_For_Display">
       									</form>
										<a href="#0" onclick="document.getElementById('form_getOneSpaceC${s.index}').submit()">
										<img src="<%=request.getContextPath()%>/space/showonepicture?spaceId=${spaceVO.spaceId}" class="img-fluid" alt="" width="800" height="533"><div class="read_more"><span>Read more</span></div></a>
										<small>${spaceVO.spaceType}</small>
									</figure>
									<div class="wrapper">									
										<div class="cat_star">
											<c:forEach var="i" begin="1" end="${spaceCommentSvc.getSpaceRating(spaceVO.spaceId)}">
												<i class="icon_star"></i>
											</c:forEach>
										</div>
										<h3><a href="#0" onclick="document.getElementById('form_getOneSpaceC${s.index}').submit()">${spaceVO.spaceName}</a></h3>
										<p class="ellipsis">${spaceVO.spaceText}</p>
										<span class="price"><i class="icon_clock_alt" style="margin-right:8px"></i>1 hr / <strong>${spaceDetailSvc.selectOneLowest(spaceVO.spaceId).spaceDetailCharge} $</strong></span>
										<br>
										<small class="address_ellipsis">${spaceVO.spaceAddress}</small>
									</div>
									<ul>
										<li><i class="ti-eye"></i></li>
										<li><div class="score"><span>
										<c:if test="${spaceCommentSvc.getSpaceRating(spaceVO.spaceId) >= 3.0 and spaceCommentSvc.getSpaceRating(spaceVO.spaceId) <= 3.9 }">
											Good
										</c:if>
										<c:if test="${spaceCommentSvc.getSpaceRating(spaceVO.spaceId) >= 4.0}">
											Awesome
										</c:if>
										<em>${spaceCommentSvc.getSpaceCommentCount(spaceVO.spaceId)} Reviews</em></span><strong>${spaceCommentSvc.getSpaceRating(spaceVO.spaceId)}</strong></div></li>
									</ul>
								</div>
							</div>
								<form method="post" action="<%=request.getContextPath()%>/MemberFavoriteServlet.do" id="form_getMemberFavoriteStatus${s.index}">
									<input type="hidden" name="memberId" value="${userVO.memberId}">
									<input type="hidden" name="spaceId" value="${spaceVO.spaceId}">
									<input type="hidden" name="action" value="getMemberFavoriteStatus">
								</form>
								</c:if>
									<script>
									
								    	$(document).ready(function () {							
								    		$('.mfs${s.index}').on('click', function() {
								    			alert("test");
									            $.ajax({
									                url: "<%=request.getContextPath()%>/MemberFavoriteServlet.do",
									                type: "POST",
									                dataType: "json",
									                data: $("#form_getMemberFavoriteStatus${s.index}").serialize(),
									                beforeSend: function () {},
									                success: function (data) {
									                    console.log("success");
									                    if(data == null){
									                    	$(this).removeClass('liked');
									                    } else{
									                    	$(this).addClass('liked');
									                    }
									                },
									                error: function (xhr) {
									                    consoloe.log("error");
									                },
									                complete: function (xhr) {
									                }
									            });
									            return false;
									        });
									    });
				    				</script>
							</c:forEach>
							<!-- /box_grid -->
						</div>
						<!-- /row -->
				</div>
				<!-- /isotope-wrapper -->
			
				</div>
				<!-- /col -->
			</div>		
		</div>
		<!-- /container -->
	</main>
	<!--/main-->
	</div>
	<!-- page --> --%>
	
	
	<!--  =================================== my part ==================================  -->
	<!--  =================================== my part ==================================  -->
	<!--  =================================== my part ==================================  -->
	<!--  =================================== my part ==================================  -->
	
	
	<main>
	
	<div class="container-fluid full-height">
		<div class="row row-height">
			<div class="col-lg-5 content-left order-md-last order-sm-last order-last">
			<div id="results_map_view">
		   <div class="container-fluid">
			   <div class="row">
				   <div class="col-10">
					   <%-- <h4><strong><%listAllSpaceInfo. %></strong> results</h4> --%>
				   </div>
<!-- 				   <div class="col-2">
					   <a href="#0" class="search_map btn_search_map_view"></a> /open search panel
				   </div> -->
			   </div>
			   <!-- /row -->
				<div class="search_map_wp">
					<div class="custom-search-input-2 map_view">
						<div class="form-group">
							<input class="form-control" type="text" name="keyword" placeholder="What are you looking for...">
							<i class="icon_search"></i>
						</div>
						<div class="form-group">
							<input class="form-control" type="text" name="loaction" placeholder="Where" value="${param.spaceAddress}">
							<i class="icon_pin_alt"></i>
						</div>
						<select class="wide" name="categories" value="${param.spaceContain}">
							<option>All Categories</option>	
							<option>課程講座</option>
							<option>親子活動</option>
							<option>會議</option>
							<option>讀書室</option>
						</select>
						<input type="submit" value="Search">
					</div>
				</div>
				<!-- /search_map_wp -->
		   </div>
		   <!-- /container -->
	   </div>
	   <!-- /results -->
	   
	   <div class="filters_listing version_3">
			<div class="container-fluid">
				<ul class="clearfix">
					<li>
						<div class="switch-field">
							<input type="radio" id="all" name="listing_filter" value="all" checked>
							<label for="all">All</label>
							<input type="radio" id="popular" name="listing_filter" value="popular">
							<label for="popular" >Popular</label>
							<input type="radio" id="latest" name="listing_filter" value="latest">
							<label for="latest">Latest</label>
						</div>
					</li>
					<li><a class="btn_filt_map" data-toggle="collapse" href="#filters" aria-expanded="false" aria-controls="filters" data-text-swap="Less filters" data-text-original="More filters">More filters</a></li>
				</ul>
			</div>
			<!-- /container -->
		</div>
		<!-- /filters -->
		
		<div class="collapse map_view" id="filters">
			<div class="container-fluid margin_30_5">
				<h6>Category</h6>
				<div class="row">
				    <div class="col-md-6">
				    	<div class="filter_type">
							<ul>
							    <li>
							        <label class="container_check">All 
							            <input type="checkbox" name="check_all" checked>
							            <span class="checkmark"></span>
							        </label>
							    </li>
							    <li>
							        <label class="container_check">課程講座
							            <input type="checkbox" name="check_type3" checked>
							            <span class="checkmark"></span>
							        </label>
							    </li>
							    <li>
							        <label class="container_check">親子活動
							            <input type="checkbox" name="check_type2" checked>
							            <span class="checkmark"></span>
							        </label>
							    </li>
							</ul>
				    	</div>
				    </div>
				    <div class="col-md-6">
				    	<div class="filter_type">
					       	<ul>
							    <li>
							        <label class="container_check">會議
							            <input type="checkbox" name="check_type1" checked>
							            <span class="checkmark"></span>
							        </label>
							    </li>
							    <li>
							        <label class="container_check">讀書室 
							            <input type="checkbox" name="check_type4" checked>
							            <span class="checkmark"></span>
							        </label>
							    </li>
							</ul>
				    	</div>
				    </div>
				</div>
					<div class="row">
						<div class="col-md-12">
							<div class="add_bottom_30">
								<h6>Distance</h6>
								<div class="distance"> Radius around selected destination <span id="searchDistance"></span> km</div>
								<input type="range" min="5" max="50" step="1" value="20" data-orientation="horizontal">
							</div>
						</div>
					</div>
				<!-- /row -->
			</div>
		</div>
		<!-- /Filters -->
		
		<div id="spacelist_div"></div>
		
				<template id='template'>
			
					<div class="box_list map_view">
					    <div class="row no-gutters add_top_20">
					        <div class="col-4">
						            <figure>
						                <a></a>
						            </figure>
					        </div>
					        <div class="col-8" id="clickSpaceDetail">
					            <div class="wrapper">
					                <a href="#0" class="wish_bt"></a>
					               	<h3></h3>
					                		
					                		
						              		
					            </div>
					            <ul>
					               <li>
					                	<a href="#0" onclick="onHtmlClick('Marker',2)" class="address">On Map</a>
					                </li>
					                <li>
					                
					                    <div class="score"></div>
					                 	
					                    
					                </li>
					            </ul>
					        </div>
					    </div>
					</div>
					<!-- /box_list -->
		
			</template>
				
		</div>
		<!-- /content-left-->

		<div class="col-lg-7 map-right">
			<div id="map"></div>
			
			
			<form action="">
				<input type="hidden" name="" id="lat">
				<input type="hidden" name="" id="lng">
				
			</form>
			<!-- map-->
		</div>
		<!-- /map-right-->

		</div>
		<!-- /row-->
	</div>
	<!-- /container-fluid -->	
		
	</main>
		


	
	
	
	
	
	
	
	
	</div>
	<div id="toTop"></div><!-- Back to top button -->
	
	<!-- common script-->
    <script src="<%=request.getContextPath()%>/frontend/js/common_scripts.js"></script>
    <script src="<%=request.getContextPath()%>/frontend/js/main.js"></script>
	<script src="<%=request.getContextPath()%>/frontend/assets/validate.js"></script>
	
	 <!-- Map -->
<!-- 	<script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyBHWGXYppmIEDkttcTX_yZk6hkQZEI6uC0&callback=initMap"></script>
 -->	<script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDPp1h-YGB5zYOzELLXZcLCcuPsfNNrX-8&callback=initMap"></script>
 																
	<script src="<%=request.getContextPath()%>/frontend/js/markerclusterer.js"></script>
	<script src="<%=request.getContextPath()%>/frontend/js/infobox.js"></script>
	
	
	<%-- <script>
	$('#collapseMap').on('shown.bs.collapse', function(e){
		(function(A) {

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
					<c:forEach var='spaceVO' items='${spaceVO}'>
						{
							type_point: '${spaceVO.spaceType}',
							name: 'TEST',
							location_latitude: '${spaceVO.spaceLat}', 
							location_longitude: '${spaceVO.spaceLng}',
							map_image_url: '<%=request.getContextPath()%>/space/showonepicture?spaceId=${spaceVO.spaceId}',
							rate: '${spaceCommentSvc.getSpaceRating(spaceVO.spaceId)}',
							name_point: '${spaceVO.spaceName}',
							phone: '+ 暫無提供',
							url_point: '<%=request.getContextPath()%>/space/space.do?action=getOne_For_Display&spaceId=${spaceVO.spaceId}'
						},
					</c:forEach>
				]
			};

				var mapOptions = {
					zoom: 14,
					center: new google.maps.LatLng(25.0520567, 121.5428842),
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
							icon: '../frontend/img/pins/' + key + '.png',
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
		
			new MarkerClusterer(mapObject, markers[key]);
		
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
					'<img src="' + item.map_image_url + '" alt="" width="240" height="140"/>' +
					'<span>'+ 
						'<span class="infobox_rate">'+ item.rate +'</span>' +
						'<h3>'+ item.name_point +'</h3>' +
					'<em>'+ item.type_point +'</em>' +
					'<strong>'+ item.description_point +'</strong>' +
					'<a href="'+ item.url_point + '" class="btn_infobox_detail"></a>' +
						'<a href="tel://'+ item.phone +'" class="btn_infobox_phone">'+ item.phone +'</a>' +
						'</span>' +
					'</div>',
					disableAutoPan: false,
					maxWidth: 0,
					pixelOffset: new google.maps.Size(10, 92),
					closeBoxMargin: '',
					closeBoxURL: "../frontend/img/close_infobox.png",
					isHidden: false,
					alignBottom: true,
					pane: 'floatPane',
					enableEventPropagation: true
				});


			};

	    });
	</script>
	<script src="<%=request.getContextPath()%>/frontend/js/infobox.js"></script>

	<!-- Masonry Filtering -->
	<script src="js/isotope.min.js"></script>
	<script>
	$(window).on('load', function(){
	  var $container = $('.isotope-wrapper');
	  $container.isotope({ itemSelector: '.isotope-item', layoutMode: 'masonry' });
	});

	$('.filters_listing').on( 'click', 'input', 'change', function(){
	  var selector = $(this).attr('data-filter');
	  $('.isotope-wrapper').isotope({ filter: selector });
	});
	</script>
	
	<!-- Range Slider -->
	<script>
		 $("#range").ionRangeSlider({
            hide_min_max: true,
            keyboard: true,
            min: 30,
            max: 180,
            from: 60,
            to: 130,
            type: 'double',
            step: 1,
            prefix: "Km ",
            grid: false
        });
	</script>
	
	<script>
	 $(function () {
         var len = 16; 
         $(".ellipsis").each(function (i) {
             if ($(this).text().length > len) {
                 $(this).attr("title", $(this).text());
                 var text = $(this).text().substring(0, len - 1);
                 $(this).text(text+"..."); 
             }
         });
     });
	 
	 $(function () {
         var len = 26; 
         $(".address_ellipsis").each(function (i) {
             if ($(this).text().length > len) {
                 $(this).attr("title", $(this).text());
                 var text = $(this).text().substring(0, len - 1);
                 $(this).text(text+"..."); 
             }
         });
     });
	</script>
</body>
</html> --%>






<!-- ======================== javascript ============================= -->
<!-- ======================== javascript ============================= -->
<!-- ======================== javascript ============================= -->
<!-- ======================== javascript ============================= -->
<!-- ======================== javascript ============================= -->
<!-- ======================== javascript ============================= -->
<!-- ======================== javascript ============================= -->
<!-- ======================== javascript ============================= -->
<!-- ======================== javascript ============================= -->
<!-- ======================== javascript ============================= -->
<!-- ======================== javascript ============================= -->
<!-- ======================== javascript ============================= -->
<!-- ======================== javascript ============================= -->



<script>

class Space {
	constructor(spaceId, spaceAddress, spaceLng, spaceLat,  spaceType, spaceName,spaceContain, spaceSignupDate, avgComment, memberId, spaceText, spaceEqument, spaceRule, spaceRefund, spaceStatus, spaceOnsaleDate, spaceOffSaleDate, spaceStatusEmp, spaceStatusComm) {
		this.spaceId = spaceId;
		this.spaceAddress = spaceAddress;
		this.spaceLng = spaceLng;
		this.spaceLat = spaceLat;
		this.spaceType = spaceType;
		this.spaceName = spaceName;
		this.spaceContain = spaceContain;
		this.spaceSignupDate = spaceSignupDate;
		this.avgComment = avgComment;
		this.memberId = memberId;
		
		this.spaceText = spaceText;
		this.spaceEqument = spaceEqument;
		this.spaceRule = spaceRule;
		this.spaceRefund = spaceRefund;
		this.spaceStatus = spaceStatus;
		this.spaceOnsaleDate = spaceOnsaleDate;
		this.spaceOffSaleDate = spaceOffSaleDate;
		this.spaceStatusEmp = spaceStatusEmp;
		this.spaceStatusComm = spaceStatusComm;
	}
}


var keyword = '<%=keyword%>';
var location_ = '<%=location_%>';
var categories = '<%=categories%>';

var gSpaceList = [];
<c:forEach var="allspacelist" items="${listAllSpaceInfo}">
	gSpaceList.push(new Space('${allspacelist.spaceId}', '${allspacelist.spaceAddress}', '${allspacelist.spaceLng}', '${allspacelist.spaceLat}' , '${allspacelist.spaceType}', '${allspacelist.spaceName}', '${allspacelist.spaceContain}', '${allspacelist.spaceSignupDate}', '${allspacelist.avgComment}'));
</c:forEach>





var newSpaceList2 = [];

var sortFlag = '';

var gMapObject = null;
var gMarkerList = [];



// searhMap filter

function updateSpaceListDiv(oldSpaceList) {
	console.log(oldSpaceList);
	var newSpaceList = oldSpaceList.slice();
	
	// filter
	if ($('input[name="check_all"]').is(':checked') === false) {
		newSpaceList = [];
	}
	
	/*
	if ($('input[name="check_type1"]').is(':checked') === false) {
		var tempList = [];
		newSpaceList.forEach(space => {
			if (space.spaceName != '親子活動') {
				tempList.push(space);
			}
		});
		newSpaceList = tempList.slice();
	}
	*/
	
	var tempList1 = [];
	if ($('input[name="check_type1"]').is(':checked') === true) {
		newSpaceList.forEach(space => {
			if (space.spaceType == '課程講座') {
				tempList1.push(space);
			}
		});
	}
	
	var tempList2 = [];
	if ($('input[name="check_type2"]').is(':checked') === true) {
		newSpaceList.forEach(space => {
			if (space.spaceType == '親子活動') {
				tempList2.push(space);
			}
		});
	}
	
	var tempList3 = [];
	if ($('input[name="check_type3"]').is(':checked') === true) {
		newSpaceList.forEach(space => {
			if (space.spaceType == '會議') {
				tempList3.push(space);
			}
		});
	}
	
	newSpaceList = [];
	newSpaceList = newSpaceList.concat(tempList1);
	newSpaceList = newSpaceList.concat(tempList2);
	newSpaceList = newSpaceList.concat(tempList3);
	
	/* // no keyword found
	if (keyword != 'null' && keyword != '' ) {
		var tempList = [];
		newSpaceList.forEach(space => {
			if(!space.spaceName.indexOf(keyword) > -1){
			alert("沒有符合條件，請回上一頁");
			}	
		}); */
	
	
	// second filter
	if (keyword != 'null' && keyword != '' ) {
		var tempList = [];
		newSpaceList.forEach(space => {
			if (space.spaceName.indexOf(keyword) > -1) {
				tempList.push(space);
			}
			
		});
		newSpaceList = tempList.slice();
		
		
		
		
	} 
	
	
	
	
	
	if (location_ != 'null' && location_ != '') {
		var tempList = [];
		newSpaceList.forEach(locate => {
			if(locate.spaceAddress.indexOf(location_) > -1){
				tempList.push(locate);	
			}
		});
		
		newSpaceList = tempList.slice();
		
		
	}
	
	if (categories != 'null' && categories != '' && categories != 'All Categories') {
		var tempList = [];
		newSpaceList.forEach(category => {
			if(category.spaceType.indexOf(categories) > -1){
				tempList.push(category);
			}	
		});
		
		newSpaceList = tempList.slice();
	}
	
	
	
	
	// distance filter
	console.log(gMapObject);
	if (gMapObject != null) {
		var dist = parseFloat($('#searchDistance').html());
		var center = gMapObject.getCenter();
		
		console.log(dist);
		
		var tempList = [];
		newSpaceList.forEach(space => {
			var d = haversine_distance([center.lat(), center.lng()], [space.spaceLat, space.spaceLng])
			console.log([center.lat(), center.lng(), space.spaceLat, space.spaceLng])
			console.log('d = ' + d);
			if(d <= dist){
				tempList.push(space);
			}	
		});
		
		newSpaceList = tempList.slice();
	}
	
	
	// sorting
	if (sortFlag == 'popular') {
		newSpaceList = newSpaceList.sort(function (a, b) {
			return a.avgComment < b.avgComment ? 1 : -1;
		});
	} else if (sortFlag == 'latest') {
		newSpaceList = newSpaceList.sort(function (a, b) {
			return a.spaceSignupDate < b.spaceSignupDate ? 1 : -1;
		});
	}
	
	newSpaceList2 = newSpaceList;
	

	// display
	$('#spacelist_div').html('');
	
	
	$.each(newSpaceList, function(key, value) {
		var template = $($('#template').html()).clone();
<%--  		template.find('h3').html('<span><a href="<%=request.getContextPath()%>/space/space.do?action=frontend_getOne_For_Display&spaceId='+value.spaceId+'">'+value.spaceName+'</a></span>');
 --%> 		 template.find('h3').html('<span><a href="<%=request.getContextPath()%>/frontend/space/listOneSpace.jsp?oneSpaceId='+value.spaceId+'">'+value.spaceName+'</a></span>');
		
		template.find('h3').attr('a', '');
		
		template.find('figure a').attr('src', '<%=request.getContextPath()%>/frontend/space/listOneSpace.jsp?oneSpaceId='+value.spaceId);
		template.find('figure a').html('<img src="<%=request.getContextPath()%>/space/showonepicture?spaceId='+value.spaceId+'" class="img-fluid" alt="" width="800" height="533">');
		template.find('.score').html('<span>'+value.avgComment+'</span>');
		$('#spacelist_div').append(template);
	});
	
	
		if(newSpaceList == ''){
			$.each(newSpaceList, function(key, value) {
				var template = $($('#template').html()).clone();
				
				template.find('h3').attr('a')
		})
	}
	
	
	updateMap(newSpaceList2);
	
	
};

/*  ================== popular and latest list ===============================*/

$('#popular').click(function() {
	sortFlag = 'popular';
	updateSpaceListDiv(gSpaceList);
});

$('#latest').click(function() {
	sortFlag = 'latest';
	updateSpaceListDiv(gSpaceList);
});

$('input[name="check_all"]').click(function(){
	updateSpaceListDiv(gSpaceList);
})

$('input[name="check_type1"]').click(function(){
	updateSpaceListDiv(gSpaceList);
})

$('input[name="check_type2"]').click(function(){
	updateSpaceListDiv(gSpaceList);
})

$('input[name="check_type3"]').click(function(){
	updateSpaceListDiv(gSpaceList);
})

$('input[name="check_type4"]').click(function(){
	updateSpaceListDiv(gSpaceList);
})


<!--   ================================  get geo location =======================================================-->


<!-- ======================= google map start =================================== -->

var center_lat = 25.047695;
var center_lng = 121.517377;
var zoom = 14; 
 
 function updateMap(spaceList) {
	 if (gMapObject == null) {
	 	if (spaceList.length > 0) {
		 	var avg_lat = 0;
			var avg_lng = 0;
	
			$.each(spaceList, function (key, value) {
				console.log([value.spaceLng, value.spaceLat])
				avg_lat += parseFloat(value.spaceLat);
				avg_lng += parseFloat(value.spaceLng);
			});
			avg_lat /= spaceList.length;
			avg_lng /= spaceList.length;
			//console.log([lat_avg, lng_avg])
			center_lat = avg_lat;
			center_lng = avg_lng;
	 	} else {
			//alert("沒有符合條件，請回上一頁");
			//window.history.back();
	 	}
	 } else {
		var center = gMapObject.getCenter();
		center_lat = center.lat();
		center_lng = center.lng();
		
		if (gMarkerList.length > 0) {
			for (var i=0; i < gMarkerList.length; i++) {
				gMarkerList[i].setMap(null);
			}
			gMarkerList = [];
		}
	 }
	 

		var
			mapObject,
			markers = [];

		var markersData = {
			'Marker': []
		};
		
		$.each(spaceList, function (key, value) {
			markersData['Marker'].push({
				type_point: value.spaceType,
				name: value.spaceName,
				location_latitude: parseFloat(value.spaceLat),
				location_longitude: parseFloat(value.spaceLng),
				map_image_url: '<%=request.getContextPath()%>/space/showonepicture?spaceId='+value.spaceId,
				rate: value.avgComment,
				name_point: value.spaceName,
				get_directions_start_address: '台北市 松山區, 南京東路三段253號',
				phone: '+3934245255',
				url_point: '<%=request.getContextPath()%>/space/space.do?action=getOne_For_Display&spaceId='+value.spaceId
			})
		});
		
		var mapOptions = {
			zoom: zoom,
			center: new google.maps.LatLng(center_lat, center_lng),
			mapTypeId: google.maps.MapTypeId.ROADMAP,

			mapTypeControl: false,
			mapTypeControlOptions: {
				style: google.maps.MapTypeControlStyle.DROPDOWN_MENU,
				position: google.maps.ControlPosition.LEFT_CENTER
			},
			panControl: true,
			panControlOptions: {
				position: google.maps.ControlPosition.TOP_RIGHT
			},
			zoomControl: true,
			zoomControlOptions: {
				position: google.maps.ControlPosition.RIGHT_BOTTOM
			},
			fullscreenControl: true,
			fullscreenControlOptions: {
				position: google.maps.ControlPosition.LEFT_BOTTOM
			},
			scrollwheel: true,
			scaleControl: true,
			scaleControlOptions: {
				position: google.maps.ControlPosition.TOP_LEFT
			},
			streetViewControl: true,
			streetViewControlOptions: {
				position: google.maps.ControlPosition.LEFT_TOP
			},
			styles: [{
					"featureType": "administrative.country",
					"elementType": "all",
					"stylers": [{
						"visibility": "off"
					}]
				},
				{
					"featureType": "administrative.province",
					"elementType": "all",
					"stylers": [{
						"visibility": "off"
					}]
				},
				{
					"featureType": "administrative.locality",
					"elementType": "all",
					"stylers": [{
						"visibility": "off"
					}]
				},
				{
					"featureType": "administrative.neighborhood",
					"elementType": "all",
					"stylers": [{
						"visibility": "off"
					}]
				},
				{
					"featureType": "administrative.land_parcel",
					"elementType": "all",
					"stylers": [{
						"visibility": "off"
					}]
				},
				{
					"featureType": "landscape.man_made",
					"elementType": "all",
					"stylers": [{
						"visibility": "simplified"
					}]
				},
				{
					"featureType": "landscape.natural.landcover",
					"elementType": "all",
					"stylers": [{
						"visibility": "on"
					}]
				},
				{
					"featureType": "landscape.natural.terrain",
					"elementType": "all",
					"stylers": [{
						"visibility": "off"
					}]
				},
				{
					"featureType": "poi.attraction",
					"elementType": "all",
					"stylers": [{
						"visibility": "off"
					}]
				},
				{
					"featureType": "poi.business",
					"elementType": "all",
					"stylers": [{
						"visibility": "off"
					}]
				},
				{
					"featureType": "poi.government",
					"elementType": "all",
					"stylers": [{
						"visibility": "off"
					}]
				},
				{
					"featureType": "poi.medical",
					"elementType": "all",
					"stylers": [{
						"visibility": "off"
					}]
				},
				{
					"featureType": "poi.park",
					"elementType": "all",
					"stylers": [{
						"visibility": "on"
					}]
				},
				{
					"featureType": "poi.park",
					"elementType": "labels",
					"stylers": [{
						"visibility": "off"
					}]
				},
				{
					"featureType": "poi.place_of_worship",
					"elementType": "all",
					"stylers": [{
						"visibility": "off"
					}]
				},
				{
					"featureType": "poi.school",
					"elementType": "all",
					"stylers": [{
						"visibility": "off"
					}]
				},
				{
					"featureType": "poi.sports_complex",
					"elementType": "all",
					"stylers": [{
						"visibility": "off"
					}]
				},
				{
					"featureType": "road.highway",
					"elementType": "all",
					"stylers": [{
						"visibility": "off"
					}]
				},
				{
					"featureType": "road.highway",
					"elementType": "labels",
					"stylers": [{
						"visibility": "off"
					}]
				},
				{
					"featureType": "road.highway.controlled_access",
					"elementType": "all",
					"stylers": [{
						"visibility": "off"
					}]
				},
				{
					"featureType": "road.arterial",
					"elementType": "all",
					"stylers": [{
						"visibility": "simplified"
					}]
				},
				{
					"featureType": "road.local",
					"elementType": "all",
					"stylers": [{
						"visibility": "simplified"
					}]
				},
				{
					"featureType": "transit.line",
					"elementType": "all",
					"stylers": [{
						"visibility": "off"
					}]
				},
				{
					"featureType": "transit.station.airport",
					"elementType": "all",
					"stylers": [{
						"visibility": "off"
					}]
				},
				{
					"featureType": "transit.station.bus",
					"elementType": "all",
					"stylers": [{
						"visibility": "off"
					}]
				},
				{
					"featureType": "transit.station.rail",
					"elementType": "all",
					"stylers": [{
						"visibility": "off"
					}]
				},
				{
					"featureType": "water",
					"elementType": "all",
					"stylers": [{
						"visibility": "on"
					}]
				},
				{
					"featureType": "water",
					"elementType": "labels",
					"stylers": [{
						"visibility": "off"
					}]
				}
			]
		};
		var marker;
		
		if (gMapObject == null) {
			mapObject = new google.maps.Map(document.getElementById('map'), mapOptions);	
			gMapObject = mapObject;
			google.maps.event.addListener(gMapObject, 'dragend', function() {
				console.log('move');
				//zoom = gMapObject.getZoom();
				updateSpaceListDiv(gSpaceList);
			});
		}
		
		for (var key in markersData) {
			markersData[key].forEach(function (item) {
				marker = new google.maps.Marker({
					position: new google.maps.LatLng(item.location_latitude, item.location_longitude),
					map: gMapObject,
					icon: 'img/' + key + '.png',
					draggable: false,
					zoomControl: true
				});
				gMarkerList.push(marker);

				if ('undefined' === typeof markers[key])
					markers[key] = [];
				markers[key].push(marker);
				google.maps.event.addListener(marker, 'click', (function () {
					closeInfoBox();
					getInfoBox(item).open(gMapObject, this);
					gMapObject.setCenter(new google.maps.LatLng(item.location_latitude, item.location_longitude));
				}));
			});
		}


		//new MarkerClusterer(mapObject, markers[key]);
		
		
		
		/////////////// 
		var dist = parseFloat($('#searchDistance').html());
		console.log(dist);
		
		Number.prototype.toRad = function() {
	         return this * Math.PI / 180;
	      }

	      Number.prototype.toDeg = function() {
	         return this * 180 / Math.PI;
	      }

	      google.maps.LatLng.prototype.destinationPoint = function(brng, dist) {
	         dist = dist / 6371;  
	         brng = brng.toRad();  

	         var lat1 = this.lat().toRad(), lon1 = this.lng().toRad();

	         var lat2 = Math.asin(Math.sin(lat1) * Math.cos(dist) + 
	                              Math.cos(lat1) * Math.sin(dist) * Math.cos(brng));

	         var lon2 = lon1 + Math.atan2(Math.sin(brng) * Math.sin(dist) *
	                                      Math.cos(lat1), 
	                                      Math.cos(dist) - Math.sin(lat1) *
	                                      Math.sin(lat2));

	         if (isNaN(lat2) || isNaN(lon2)) return null;

	         return new google.maps.LatLng(lat2.toDeg(), lon2.toDeg());
	      }

	      var pointA = new google.maps.LatLng(center_lat, center_lng);   // Circle center
	                                            // 10km
				          
	         var GLOBAL = {};
	      
	                                            
	      var mapOpt = { 
	         mapTypeId: google.maps.MapTypeId.TERRAIN,
	         center: pointA,
	         zoom: 10
	      };

	      //var map = new google.maps.Map(document.getElementById("map"), mapOpt);

	      // Draw the circle
	      var circle = new google.maps.Circle({
	         center: pointA,
	         radius: dist * 1000,       // Convert to meters
	         fillColor: '#FF0000',
	         fillOpacity: 0.2,
	         map: gMapObject
	      });
			gMarkerList.push(circle);
	      
	      // Show marker at circle center
	      var centerMarker = new google.maps.Marker({
	    	 map,
	    	 draggable: true,
	         position: pointA,
	         map: gMapObject

	      });
	      gMarkerList.push(centerMarker);
	      
	      centerMarker.addListener('dragend', function(event){
	    	    var markerNewPosition = this.getPosition();
	    	    //alert("old position: " + GLOBAL.startDragPosition + " \nnew position: "+markerNewPosition);
	    	    delete GLOBAL.startDragPosition;
	    	    // Do something with the positions here
	    	    // once the user has finished dragging the marker
	    	    
	    	    
	    	    console.log(marker.getPosition().lat());
	    	    console.log(marker.getPosition().lng()); 

	    	});
			
	      /* new google.maps.event.addListener(marker, 'dragend', (function () {
				
				
				var lat = marker.getPosition().lat();
				var lng = marker.getPosition().lng();
				
				$('#lat').val(lat);
				$('#lng').val(lng);
				
			})
			
	      );   */
	    
}

function hideAllMarkers() {
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
		content: '<div class="marker_info" id="marker_info">' +
			'<img src="' + item.map_image_url + '" alt=""/>' +
			'<span>' +
			'<span class="infobox_rate">' + item.rate + '</span>' +
			'<h3>' + item.name_point + '</h3>' +
			'<em>' + item.type_point + '</em>' +
			'<strong>' + item.description_point + '</strong>' +
			'<a href="' + item.url_point + '" class="btn_infobox_detail"></a>' +
			'<form action="http://maps.google.com/maps" method="get" target="_blank"><input name="saddr" value="' + item.get_directions_start_address + '" type="hidden"><input type="hidden" name="daddr" value="' + item.location_latitude + ',' + item.location_longitude + '"><button type="submit" value="Get directions" class="btn_infobox_get_directions">Get directions</button></form>' +
			'<a href="tel://' + item.phone + '" class="btn_infobox_phone">' + item.phone + '</a>' +
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

function onHtmlClick(location_type, key) {
	google.maps.event.trigger(markers[location_type][key], "click");
}



var dist = 0;
$('#searchDistance').on('DOMSubtreeModified', function () {
	var value = $('#searchDistance').html();
	if (value != '') {
		var nowDist = parseInt(value);
		if (nowDist != dist) {
			updateSpaceListDiv(spaceList);
			dist = nowDist;
		}
	}
});
	
	
	
	
	
	
function haversine_distance(mk1, mk2) {
      var R = 6371.0710; // Radius of the Earth in miles
      var rlat1 = mk1[0] * (Math.PI/180); // Convert degrees to radians
      var rlat2 = mk2[0] * (Math.PI/180); // Convert degrees to radians
      var difflat = rlat2-rlat1; // Radian difference (latitudes)
      var difflon = (mk2[1]-mk1[1]) * (Math.PI/180); // Radian difference (longitudes)

      var d = 2 * R * Math.asin(Math.sqrt(Math.sin(difflat/2)*Math.sin(difflat/2)+Math.cos(rlat1)*Math.cos(rlat2)*Math.sin(difflon/2)*Math.sin(difflon/2)));
      return d;
}
	


updateSpaceListDiv(gSpaceList);




</script>

