<%@page import="com.allSpace.service.AllSpaceServiceList"%>
<%@page import="com.updateFunction.model.UpdateService"%>
<%@page import="com.popularFunction.service.PopularService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.member.model.*"%>
<%@ page import="com.memberComment.model.*"%>
<%@ page import="com.space.model.*"%>
<%@ page import="com.spaceDetail.model.*"%>


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="/frontend/template/header.jsp"%>    
<%@ page import="java.util.*"%>








<%@ page import="com.updateFunction.*"%>
<%@ page import="com.popularFunction.*"%>
<%@ page import="com.searchFunction.service.*"%>
<%@ page import="com.space.model.*"%>
<%@ page import="com.spaceDetail.model.*"%>
<%@ page import="com.spaceComment.model.*"%>
<%@ page import="com.spacePhoto.model.*"%>
<%@ page import="java.sql.Connection" %>  
<%@ page import="java.sql.DriverManager" %>  
<%@ page import="java.sql.Statement" %>  
<%@ page import="java.sql.ResultSet" %>  
<%@ page import="java.sql.SQLException" %>  
<%@ page import="java.sql.DriverManager" %>  
<%@ page import="com.updateFunction.*" %>  
<%@ page import="com.allSpace.*" %>  
  

  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?libraries=places&key=AIzaSyDPp1h-YGB5zYOzELLXZcLCcuPsfNNrX-8"></script> 

  
  
<%
    






 /*  ====================================================================  */ 
  
    SpaceService spaceSvc = new SpaceService();
    List<SpaceVO> listSpace = spaceSvc.getAll();
    pageContext.setAttribute("listSpace",listSpace);  
    
    
    SpaceVO spaceVO = listSpace.get(0);
    
    
   	System.out.print(spaceVO + " ijijijij ");
    /*  ====================================================================  */ 
    SpaceDetailService spaceDetailSvc = new SpaceDetailService();
    List<SpaceDetailVO> listSpaceDetail = spaceDetailSvc.getAll();
    pageContext.setAttribute("listSpaceDetail",listSpaceDetail);  
    
    
    
    
    String spaceDetailId = listSpaceDetail.get(0).getSpaceDetailId(); 
   	System.out.print(spaceDetailId + " jkjkjkj ");

    /*  ====================================================================  */ 
    		
    
    SpaceCommentService spaceCommentSvc = new SpaceCommentService();
    List<SpaceCommentVO> listSpaceComment = spaceCommentSvc.getAll();
    pageContext.setAttribute("listSpaceComment",listSpaceComment);
    
    /*  ====================================================================  */ 
    
    		
    SpacePhotoService spacePhotoSvc = new SpacePhotoService();
    List<SpacePhotoVO> listSpacePhoto = spacePhotoSvc.getAll();
	
    //SpacePhotoVO oneSpacePhotoVO = (SpacePhotoVO)session.getAttribute("SpacePhotoVO");
    
    
    //byte[] spacePhoto = spacePhotoSvc.selectOnePhotoMember(spaceId).getSpacePhoto();
    byte[] oneSpacePhotoVO = listSpacePhoto.get(0).getSpacePhoto();
    
    //System.out.print(spacePhoto + "jkqwqqwqwqq");
    
    
    
    
   // String listOneSpacePhoto = spacePhotoSvc.selectOnePhotoMember(spaceId);
    pageContext.setAttribute("oneSpacePhotoVO",oneSpacePhotoVO);
    
    	Base64.Encoder encoder = Base64.getEncoder();
/*  ====================================================================  */  

 %> 

<%


	PopularService popularList = new PopularService();
	List<SpaceVO> listPopularSpace = popularList.listByPopular();
	pageContext.setAttribute("listPopularSpace",listPopularSpace);  
	
	/*  ====================================================================  */  

	
	UpdateService updateList = new UpdateService();
	List<SpaceVO> updatePopularSpace = updateList.listByDate();
	pageContext.setAttribute("updatePopularSpace",updatePopularSpace);  
	
	/*  ====================================================================  */  

	AllSpaceServiceList allSpaceList = new AllSpaceServiceList();
	List<SpaceVO> listAllSpaceInfo = allSpaceList.selectAllSpaceList();
	pageContext.setAttribute("listAllSpaceInfo",listAllSpaceInfo); 
	
	
	List<SpaceVO> listResult = (List<SpaceVO>) request.getAttribute("listResult");
%>






<%-- <jsp:useBean id="avgSvc" scope="page" class="com.spaceComment.Service.SpaceCommentServiceService" />
 --%>
     
	<main>
		<section class="header-video">
			<div id="hero_video">
				<div class="wrapper">
				<div class="container">
					<h3>挑選你要的空間</h3>
					<p> 可以挑選各式各樣的空間</p>
					
					 
					
					
					<FORM METHOD="get" name="searchWord" ACTION="<%=request.getContextPath()%>/frontend/searchMap.jsp" enctype="multipart/form-data">
						
						<div class="row no-gutters custom-search-input-2">
							<div class="col-lg-4">
								<div class="form-group">
								
								 
												
									<input class="form-control" name="keyword" type="text" placeholder="What is space name you are looking for..." >
									<i class="icon_search"></i>
									
								</div>
							</div>
							<div class="col-lg-3">
								<div class="form-group">
									<input id="searchInput" class="form-control" type="text" name="loaction" placeholder="Where">
						            <input type="hidden" id="loc_lat" />
						            <input type="hidden" id="loc_long" />
									<i class="icon_pin_alt"></i>
									
									
								</div>
							</div>
							<div class="col-lg-3">
								<select class="wide" name="categories">
									<option>All Categories</option>	
									<option>共用工作空間</option>
									<option>親子活動</option>
									<option>攝影棚</option>
									<option>讀書室</option>
								</select>
							</div>
							<div class="col-lg-2">
									<input type="submit" name="submit" id="searchResult" class="btn_search">
							     	<input type="hidden" name="spaceId"  value="${spaceVO.spaceId()}">
							     	<input type="hidden" name="spaceName"  value="${spaceVO.spaceName()}">									

								</div>
							</div>
						
					
						<!-- /row -->
					</form>
						
						
						
					
					</div>
				
				</div>
		</section>
		<!-- /header-video -->


		<div class="container container-custom margin_80_0">
			<div class="main_title_2">
				<span><em></em></span>
				<h2>精選空間</h2>
				<p>我們有各式精選空間</p>
			</div>
			<div id="reccomended" class="owl-carousel owl-theme">
			
			
				
					
						<c:forEach var="allSpaceVO" items="${listAllSpaceInfo}" varStatus="status">
							
						 <form method="post" action="/space/space.do"  enctype="multipart/form-data" name="spaceForm">
			     
							<div class="item">
								<div class="box_grid" name="clickSpaceDetail" onclick="clickSpaceDetail">
									<figure>
										<a href="#0" class="wish_bt"></a>
<%-- 										<a href="<%=request.getContextPath()%>/space/space.do?action=frontend_getOne_For_Display&spaceId=${allSpaceVO.spaceId}"><img src="<%=request.getContextPath()%>/space/showonepicture?spaceId=${allSpaceVO.spaceId}" class="img-fluid" alt="" width="800" height="533"><div class="read_more"><span>Read more</span></div></a>
 --%>										<a href="<%=request.getContextPath()%>/frontend/spaceDetail.jsp?oneSpaceId=${allSpaceVO.spaceId}"><img src="<%=request.getContextPath()%>/space/showonepicture?spaceId=${allSpaceVO.spaceId}" class="img-fluid" alt="" width="800" height="533"></a>
												 
<%-- 										<!-- data:image/png;base64,<%=encode.encodeToString(((SpacePhotoVO)pageContext.getAttribute("oneSpacePhotoVO")).getSpacePhoto())%>" -->
 --%>										
										<small>${allSpaceVO.spaceType}</small>
									</figure>
									<div class="wrapper">
										<h3><a href="">${allSpaceVO.spaceName}</a></h3>
										<p>Id placerat tacimates definitionem sea, prima quidam vim no. Duo nobis persecuti cu.</p>
									</div>
									<ul>
										<li><i class="icon_clock_alt"></i> 1h 30min</li>
										<li><div class="score">
																					
												
															<strong>${allSpaceVO.avgComment}</strong>
														
													
											</div></li>
										</ul>
									</div>
								</div>
								 <input type="hidden" name="action"	value="frontend_getOne_For_Display">
							     <input type="hidden" name="spaceId"  value="${allSpaceVO.spaceId}">
<%-- 							     <input type="hidden" name="spaceDetailId"  value="${spaceDetailVO.spaceDetailCharge}">
 --%>							   	 <input type="submit" value="前往場地介紹">
								</form>
								
							</c:forEach>	
						</div>
					</div>
					<!-- /item -->
				
				
				
				
				
				
				
				
				
		<p class="btn_home_align"><a href="tours-grid-isotope.html"></a></p>
		<hr class="large">
				

		
		<div class="container container-custom margin_120_95">
			
			
			
			
					<section class="add_bottom_45">
						<div class="main_title_3">
							<span><em></em></span>
							<h2>熱門空間</h2>
							<p>我們的熱門空間</p>
						</div>
						<div class="row">
						
						
							<c:forEach  items="${listAllSpaceInfo}" var="popularList" begin="1" end="4">
									<div class="col-xl-3 col-lg-6 col-md-6">
									
											<a href="<%=request.getContextPath()%>/space/space.do?action=frontend_getOne_For_Display&spaceId=${popularList.spaceId}" class="grid_item">
												
														<figure>	
															
																<div class="score"><strong>${popularList.avgComment}</strong></div>
																<img src="<%=request.getContextPath()%>/space/showonepicture?spaceId=${popularList.spaceId}" class="img-fluid" alt="" width="800" height="533">
																<div class="info">
																	<div class="cat_star"></div>
																	<h3>${popularList.spaceName}</h3>
																</div>
															
														</figure>
													
												
											
										</div>
							</c:forEach>
							<!-- /grid_item -->
		
		
		
							<!-- /grid_item -->
						</div>
						<!-- /row -->
						<c:if test="${listResult == null}">
							<a href="<%=request.getContextPath()%>/SearchController"><i class="arrow_carrot-right"></i></a>
						</c:if>
					</section>
					<!-- /section -->
					
			
			
			
			
			<section class="add_bottom_45">
				<div class="main_title_3">
					<span><em></em></span>
					<h2>最今上架</h2>
					<p>最新的空間</p>
				</div>
				<div class="row">
				
				
					<c:forEach  items="${updatePopularSpace}" var="updateList">
					
						<div class="col-xl-3 col-lg-6 col-md-6">
							<a href="<%=request.getContextPath()%>/space/space.do?action=frontend_getOne_For_Display&spaceId=${updateList.spaceId}" class="grid_item">
								<figure>
								
								
								
								
									<div class="score"><strong>${updateList.spaceSignupDate}</strong></div>
									<img src="<%=request.getContextPath()%>/space/showonepicture?spaceId=${updateList.spaceId}" class="img-fluid" alt=""  width="800" height="533">
									<div class="info">
										<h3>${updateList.spaceName}</h3>
									</div>
								</figure>
							</a>
						</div>
					
					</c:forEach>
					
					
				</div>
				
				<!-- /row -->
				<a href="restaurants-grid-isotope.html"><i class="arrow_carrot-right"></i></a>
			</section>
			<!-- /section -->

			

		</div>
		<!-- /container -->

		<div class="bg_color_1">
			<div class="container margin_80_55">
				<div class="main_title_2">
					<span><em></em></span>
					<h3>最新 和 活動</h3>
					<p>近期的活動及優惠</p>
				</div>
				<div class="row">
					
						<div class="col-lg-6">
							<a class="box_news" href="#0">
								<figure><img src="img/news_home_1.jpg" alt="">
									<figcaption><strong>28</strong>Dec</figcaption>
								</figure>
								<ul>
									<li>Discount coupon</li>
									<li>2020-10-10</li>
								</ul>
								<h4>Pri oportere scribentur eu</h4>
								<p>Cu eum alia elit, usu in eius appareat, deleniti sapientem honestatis eos ex. In ius esse ullum vidisse....</p>
							</a>
						</div>
						<!-- /box_news -->

				</div>
				<!-- /row -->
				<p class="btn_home_align"><a href="blog.html" class="btn_1 rounded"></a></p>
			</div>
			<!-- /container -->
		</div>
		<!-- /bg_color_1 -->

		
		
	</main>
	<!-- /main -->
	
	
<%@include file="/frontend/template/footer.jsp" %>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?libraries=places&key=AIzaSyDPp1h-YGB5zYOzELLXZcLCcuPsfNNrX-8"></script> 
  
 -->

<script>


class Space {
	constructor(spaceId, spaceAddress, spaceLng, spaceLat, spaceName, spaceType, spaceContain, spaceSignupDate, avgComment, detailCharge) {
		this.spaceId = spaceId;
		this.spaceAddress = spaceAddress;
		this.spaceLng = spaceLng;
		this.spaceLat = spaceLat;
		this.spaceName = spaceName;
		this.spaceType = spaceType;
		this.spaceContain = spaceContain;
		this.spaceSignupDate = spaceSignupDate;
		this.avgComment = avgComment;
		this.detailCharge = detailCharge;
	}
}

var spaceList = [];
<c:forEach var="allspacelist" items="${listAllSpaceInfo}">
	spaceList.push(new Space('${allspacelist.spaceId}', '${allspacelist.spaceAddress}', '${allspacelist.spaceLng}', '${allspacelist.spaceLat}' , '${allspacelist.spaceName}', '${allspacelist.spaceType}', '${allspacelist.spaceContain}', '${allspacelist.spaceSignupDate}', '${allspacelist.avgComment}', ''));
</c:forEach>


function displaySpaceListDiv(spaceList) {
	var newSpaceList = spaceList.slice();
		
		alert("hihi");
	
		var tempList1 = [];
		if ($('#searchResult').is(':checked') === true) {
			newSpaceList.forEach(space => {
				if (space.spaceName == allspacelist.spaceName) {
					tempList1.push(space);
				}
			});
		}
		
		displaySpaceListDiv(spaceList);
}





</script>














<script>
     var searchInput = 'search_input';
    function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: -33.8688, lng: 151.2195},
          zoom: 13
        });
        var input = document.getElementById('searchInput');
        map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

        var autocomplete = new google.maps.places.Autocomplete(input);
        autocomplete.bindTo('bounds', map);

        var infowindow = new google.maps.InfoWindow();
        var marker = new google.maps.Marker({
            map: map,
            anchorPoint: new google.maps.Point(0, -29)
        });

        autocomplete.addListener('place_changed', function() {
            infowindow.close();
            marker.setVisible(false);
            var place = autocomplete.getPlace();
            if (!place.geometry) {
                window.alert("Autocomplete's returned place contains no geometry");
                return;
            }
      
            // If the place has a geometry, then present it on a map.
            if (place.geometry.viewport) {
                map.fitBounds(place.geometry.viewport);
            } else {
                map.setCenter(place.geometry.location);
                map.setZoom(17);
            }
            marker.setIcon(({
                url: place.icon,
                size: new google.maps.Size(71, 71),
                origin: new google.maps.Point(0, 0),
                anchor: new google.maps.Point(17, 34),
                scaledSize: new google.maps.Size(35, 35)
            }));
            marker.setPosition(place.geometry.location);
            marker.setVisible(true);
        
            var address = '';
            if (place.address_components) {
                address = [
                  (place.address_components[0] && place.address_components[0].short_name || ''),
                  (place.address_components[1] && place.address_components[1].short_name || ''),
                  (place.address_components[2] && place.address_components[2].short_name || '')
                ].join(' ');
            }
        
            infowindow.setContent('<div><strong>' + place.name + '</strong><br>' + address);
            infowindow.open(map, marker);
          
            // Location details
            for (var i = 0; i < place.address_components.length; i++) {
                if(place.address_components[i].types[0] == 'postal_code'){
                    document.getElementById('postal_code').innerHTML = place.address_components[i].long_name;
                }
                if(place.address_components[i].types[0] == 'country'){
                    document.getElementById('country').innerHTML = place.address_components[i].long_name;
                }
            }
            document.getElementById('location').innerHTML = place.formatted_address;
            document.getElementById('lat').innerHTML = place.geometry.location.lat();
            document.getElementById('lon').innerHTML = place.geometry.location.lng();
        });
    } 
    
    var searchInput = 'searchInput';

    $(document).ready(function () {
        var autocomplete;
            autocomplete = new google.maps.places.Autocomplete((document.getElementById(searchInput)), {
                types: ['geocode'],
            });
            
            google.maps.event.addListener(autocomplete, 'place_changed', function () {
                var near_place = autocomplete.getPlace();
                document.getElementById('loc_lat').value = near_place.geometry.location.lat();
                document.getElementById('loc_long').value = near_place.geometry.location.lng();
                
                document.getElementById('latitude_view').innerHTML = near_place.geometry.location.lat();
                document.getElementById('longitude_view').innerHTML = near_place.geometry.location.lng();
            });
        });


        $(document).on('change', '#'+searchInput, function () {
        document.getElementById('latitude_input').value = '';
        document.getElementById('longitude_input').value = '';
    	
        document.getElementById('latitude_view').innerHTML = '';
        document.getElementById('longitude_view').innerHTML = '';
    });
    
    
</script>
		