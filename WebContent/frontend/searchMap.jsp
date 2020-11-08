 

<%@page import="com.allSpace.service.AllSpaceServiceList"%>
<%@page import="com.popularFunction.service.PopularService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<%@ page import="java.util.*"%>
<%@ page import="com.space.model.*"%>
<%@ page import="com.space.controller.*"%>

<%@ page import="com.spaceDetail.model.*"%>
<%@ page import="com.spaceComment.model.*"%>
<%@ page import="com.spacePhoto.model.*"%>

<%@ page import="com.spacePhoto.service.controller.*"%>
<%@ page import="com.searchFunction.service.*"%>
<%@ page import="com.popularFunction.*" %>  
<%@ page import="com.updateFunction.*" %>  
<%@ page import="com.allSpace.*" %>  


<jsp:useBean id="memberFavoriteSvc" scope="page" class="com.memberFavorite.model.MemberFavoriteService" />
<jsp:useBean id="spaceSvc" scope="page" class="com.space.model.SpaceService" />
<jsp:useBean id="spaceDetailSvc" scope="page" class="com.spaceDetail.model.SpaceDetailService" />	
<jsp:useBean id="spaceCommentSvc" scope="page" class="com.spaceComment.model.SpaceCommentService" />	
<jsp:useBean id="spacePhotoSvc" scope="page" class="com.spacePhoto.model.SpacePhotoService" />



<%

	String keyword = request.getParameter("keyword");
	String location_ = request.getParameter("loaction");
	String categories = request.getParameter("categories");
	
	
	session.setAttribute("keyword", keyword);
	session.setAttribute("location_", location_);
	session.setAttribute("categories", categories);
	
	
	
	/*
	String keyword = "aa";
	String location_ = "bbb";
	String categories = "ccc";
	*/
	/*
	pageContext.setAttribute("keyword",keyword); 
	pageContext.setAttribute("loaction",loaction); 
	pageContext.setAttribute("categories",categories); 
	*/

 	//List<SpaceVO> listResult = (List<SpaceVO>) request.getAttribute("listResult");
	


/* 	pageContext.setAttribute("listResult", listResult);
 */

/* 	String spaceId = request.getParameter("spaceId");
 */	
 /*  ====================================================================  */ 
/*     SpaceService spaceSvc = new SpaceService();
    List<SpaceVO> listSpace = spaceSvc.selectAllSpace();
    pageContext.setAttribute("listSpace",listSpace);  
     */
    /*  ====================================================================  */ 
 /*    SpaceDetailService spaceDetailSvc = new SpaceDetailService();
    List<SpaceDetailVO> listSpaceDetail = spaceDetailSvc.selectAllSpaceDetail();
    pageContext.setAttribute("listSpaceDetail",listSpaceDetail);  
  */   
    /*  ====================================================================  */ 
 /*    SpaceCommentService spaceCommentSvc = new SpaceCommentService();
    List<SpaceCommentVO> listSpaceComment = spaceCommentSvc.getAll();
    pageContext.setAttribute("listSpaceComment",listSpaceComment);
  */   
    
/*  ====================================================================  */   	
	//String spacePhotoId = request.getParameter("spacePhotoId");
	
	/* SpacePhotoService spacePhotoSvc = new SpacePhotoService();
    List<SpacePhotoVO> listSpacePhoto = spacePhotoSvc.getAll();
 */
    
/*  ====================================================================  */   	

    PopularService popularList = new PopularService();
	List<SpaceVO> listPopularSpace = popularList.listByPopular();
	pageContext.setAttribute("listPopularSpace",listPopularSpace);   
	
	
/*  ====================================================================  */   	

/*     UpdateService updateList = new UpdateService();
	List<SpaceVO> listUpdateSpace = updateList.listByDate();
	pageContext.setAttribute("listPopularSpace",listUpdateSpace);   */
	
	//SpacePhotoVO listOneSpacePhoto = spacePhotoSvc.selectOneSpacePhoto(spacePhotoId);
	//pageContext.setAttribute("listOneSpacePhoto",listOneSpacePhoto);
    
    //Map<String, Object> combineSpaceId = new HashMap<String, Object>();
    //System.out.print(listResult + "vvvvvvvvvvvdv");
    
/*  ====================================================================  */   	

	AllSpaceServiceList allSpaceList = new AllSpaceServiceList();
	List<SpaceVO> listAllSpaceInfo = allSpaceList.selectAllSpaceList();
	pageContext.setAttribute("listAllSpaceInfo",listAllSpaceInfo); 




	




/*  ====================================================================  */   	

    
    
%>

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
<form method="post" enctype="multipart/form-data">
		
		<jsp:include page="/frontend/other/header.jsp"/>
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
							<input class="form-control" type="text" name="loaction" placeholder="Where" >
							<i class="icon_pin_alt"></i>
						</div>
						<select class="wide" name="categories">
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
			
			
			
			<!-- map-->
		</div>
		<!-- /map-right-->

		</div>
		<!-- /row-->
	</div>
	<!-- /container-fluid -->	
		
	</main>
		


	</form>
		
		
	

	<!-- /Sign In Popup -->
		


<!-- COMMON SCRIPTS -->
    <script src="${pageContext.request.contextPath}/frontend/js/common_scripts.js"></script>
    <script src="${pageContext.request.contextPath}/frontend/js/main.js"></script>
	<script src="${pageContext.request.contextPath}/frontend/assets/validate.js"></script>
	
	<!-- Map -->
 	<!-- <script 
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDPp1h-YGB5zYOzELLXZcLCcuPsfNNrX-8">
    </script>   -->
    
	  <script src="http://maps.googleapis.com/maps/api/js"></script>  
	
	
	<script src="${pageContext.request.contextPath}/frontend/js/markerclusterer.js"></script>
<%--  	<script src="${pageContext.request.contextPath}/resources/js/map_tours_half_screen.js"></script> 
 --%> 	<script src="${pageContext.request.contextPath}/frontend/js/infobox.js"></script>



	
</body>


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
	constructor(spaceId, spaceAddress, spaceLng, spaceLat,  spaceType, spaceName,spaceContain, spaceSignupDate, avgComment) {
		this.spaceId = spaceId;
		this.spaceAddress = spaceAddress;
		this.spaceLng = spaceLng;
		this.spaceLat = spaceLat;
		this.spaceType = spaceType;
		this.spaceName = spaceName;
		this.spaceContain = spaceContain;
		this.spaceSignupDate = spaceSignupDate;
		this.avgComment = avgComment;
		
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
 --%> 		 template.find('h3').html('<span><a href="<%=request.getContextPath()%>/frontend/spaceDetail.jsp?oneSpaceId='+value.spaceId+'">'+value.spaceName+'</a></span>');
		
		template.find('h3').attr('a', '');
		
		template.find('figure a').attr('src', '<%=request.getContextPath()%>/frontend/spaceDetail.jsp?oneSpaceId='+value.spaceId);
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
					icon: 'img/pins/' + key + '.png',
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

</html>
