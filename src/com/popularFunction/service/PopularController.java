package com.popularFunction.service;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.space.model.SpaceService;
import com.space.model.SpaceVO;
import com.spaceComment.model.SpaceCommentVO;
import com.updateFunction.model.UpdateDAO;
import com.updateFunction.model.UpdateInterface;


/**
 * Servlet implementation class PopularController
 */
@WebServlet("/PopularController")
public class PopularController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public String execute(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		
		
		PopularInterface popSvc = new PopularDAO();
		List<SpaceVO> popSpace = popSvc.listByPopular();
		
		UpdateInterface updateSvc = new UpdateDAO();
		List<SpaceVO> updateSpace = updateSvc.listByDate();
		
		
		req.setAttribute("popList", popSpace);
		req.setAttribute("updateList", updateSpace);
		
		
		return "/frontendPage/homePage.jsp";
		}

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		
		doGet(req, res);
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
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
	}
}
