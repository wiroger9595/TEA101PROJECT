package com.spacePhoto.service.controller;

import java.io.*;
import java.sql.*;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.sql.DataSource;


@WebServlet("/space/showonepicture")
public class SpacePhotoServiceServlet extends HttpServlet {
	
	private static final String driver = "oracle.jdbc.driver.OracleDriver";
	private static final String url = "jdbc:oracle:thin:@localhost:1521:XE";
	private static final String userid = "TEA101G2";
	private static final String passwd = "123456";
	private static final String GET_ONEPHOTO = "SELECT SPACE_PHOTO FROM SPACE_PHOTO WHERE SPACE_ID = ? AND ROWNUM = 1";


	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		Connection con = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		} catch (SQLException e1) { 
			e1.printStackTrace();
		}
		

		res.setContentType("image/gif");
		ServletOutputStream out = res.getOutputStream();

		try {
			PreparedStatement pstmt = con.prepareStatement(GET_ONEPHOTO);
			String spaceId = req.getParameter("spaceId").trim();
			pstmt.setString(1, spaceId);
			ResultSet rs = pstmt.executeQuery();
			

			if (rs.next()) {
//				InputStream in = rs.getBinaryStream("PIC");
//				InputStream in = new BufferedInputStream(rs.getBinaryStream("PIC"));
				BufferedInputStream in = new BufferedInputStream(rs.getBinaryStream("SPACE_PHOTO"));
				byte[] buf = new byte[8 * 1024]; // 4K buffer
				int len;
				while ((len = in.read(buf)) != -1) {
					out.write(buf, 0, len);
				}
				in.close();
			} else {
				res.sendError(HttpServletResponse.SC_NOT_FOUND);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
			System.out.println(req.getParameter("spaceId").trim());
		}
	}
}