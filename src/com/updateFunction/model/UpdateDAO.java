package com.updateFunction.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.orderMaster.model.OrderMasterDAOInterface;
import com.orderMaster.model.OrderMasterVO;
import com.space.model.SpaceVO;

public class UpdateDAO implements UpdateInterface{
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "TEA101G2";
	String passwd = "123456";

	private static final String LIST_BY_UPDATE = 
			"select * from (select * from space order by SPACE_SIGNUP_DATE desc) myQuery where rownum <=4";

	@Override
	public List<SpaceVO> listByDate() {

		Connection con = null;
		PreparedStatement ptmt = null;
		
		ResultSet rs = null; 
		
		SpaceVO spaceVO = null;
		List<SpaceVO> list = new ArrayList<SpaceVO>();
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			ptmt = con.prepareStatement(LIST_BY_UPDATE);
			
			rs = ptmt.executeQuery();
			while (rs.next()) {
				spaceVO = new SpaceVO();
				spaceVO.setSpaceId(rs.getString("space_Id"));
				spaceVO.setSpaceName(rs.getString("space_Name"));
				spaceVO.setSpaceAddress(rs.getString("space_address"));
				spaceVO.setSpaceSignupDate(rs.getDate("space_Signup_Date"));
//				spaceVO.setOrderAmount(rs.getInt("ORDER_AMOUNT"));
//				spaceVO.setOrderStatus(rs.getString("ORDER_STATUS"));
				list.add(spaceVO);
			}
		
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (ptmt != null) {
				try {
					ptmt.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	return list;
		
	}
}