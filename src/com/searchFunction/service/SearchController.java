package com.searchFunction.service;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.orderDetail.model.OrderDetailService;
import com.orderDetail.model.OrderDetailVO;
import com.popularFunction.service.PopularService;
import com.space.model.SpaceService;
import com.space.model.SpaceVO;
import com.spaceComment.model.SpaceCommentService;
import com.spaceComment.model.SpaceCommentVO;

@WebServlet("/SearchController")
public class SearchController extends HttpServlet{
	
	
 
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		
		if ("searchResultDisplay".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view. 
			req.setAttribute("errorMsgs", errorMsgs);
			
			SpaceVO spaceVO = new SpaceVO();
			
			try {
				/*************************** 1.get value first and calculate **********************/
				
				
				
				
				String str = req.getParameter("keyword");
				String address =req.getParameter("location");
				String catorgie = req.getParameter("categories");
				
				
				if (str == null || (str.trim()).length() == 0 || address == null ) {
					SpaceService searchAllSpace = new SpaceService();
					List<SpaceVO> listAllResult = searchAllSpace.getAll();
					
					System.out.println("------------------------------");
					System.out.println(spaceVO.getSpaceName() + " jjijijij ");
					System.out.println("------------------------------");

					
					req.setAttribute("listResult", listAllResult); // spaceCommentVO
					
				} else if (str.equals(((List<String>) spaceVO))) {
						SearchService searchService = new SearchService();
						List<SpaceVO> listResult = searchService.listTheResult(str);
						req.setAttribute("listResult", listResult); // spaceCommentVO
						
				} else if (address.equals(spaceVO.getSpaceAddress())) {
					
					SearchService searchService = new SearchService();
					List<SpaceVO> listResult = searchService.listTheAddress(address);
					req.setAttribute("listResult", listResult);
				} else {
					
//					SearchService searchService = new SearchService();
//					List<SpaceVO> listResult = searchService.listTheBoth(str, address);
//					req.setAttribute("listResult", listResult);
				}
				// Send the use back to the form, if there were errors
						
				req.setAttribute("keyword", str);
				req.setAttribute("location", address);
				req.setAttribute("catorgie", catorgie);
				String url = "/frontendPage/searchMap.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); //  listOneSpaceComment.jsp
				successView.forward(req, res);		
						
						
						
						
						
						
						
				/*************************** ��L�i�઺���~�B�z *************************************/
			} catch (Exception e) {
				errorMsgs.add("error message:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/frontendPage/404.jsp");
				failureView.forward(req, res);
			}
		}
	
		/***************************  *************************************/		/***************************  *************************************/


	
		if ("DisplayByUpdate".equals(action)) { // �Ӧ�spaceHome.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
    
			try {
				/*************************** 1.�����ШD�Ѽ� - ��J�榡�����~�B�z **********************/
				PopularService popularSvc = new PopularService();
				List<SpaceVO> spaceVO = popularSvc.listByPopular();


				/*************************** 3.(Send the Success view) *************/
				req.setAttribute("popularList", spaceVO); // ��Ʈw���X��spaceVO����,�s�Jreq
				String url = "/frontendPage/spaceDetail.jsp";
				//String url = "/frontendPage/spaceDetail.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneSpace.jsp
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z *************************************/
			} catch (Exception e) {
				errorMsgs.add("AAAAAA:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/frontendPage/404.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		
		/***************************  *************************************/		/***************************  *************************************/

		
		
		
	}
		
	
	
}
