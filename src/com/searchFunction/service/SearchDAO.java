package com.searchFunction.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.orderMaster.model.OrderMasterDAOInterface;
import com.orderMaster.model.OrderMasterVO;
import com.space.model.SpaceVO;

public class SearchDAO implements SearchInterface{
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "TEA101G2";
	String passwd = "123456";

	private static final String LIST_BY_NAME = 
			"select * from space where space_name like ?";

	
	private static final String LIST_BY_ADDRESS = 
			"select * from space where space_address like ?";
	
	
	private static final String LIST_BY_TYPE = 
			"select * from space where space_type like ?";
	@Override
	public List<SpaceVO> searchFunction(String str) throws Exception {

		Connection con = null;
		 
		ResultSet rs = null;
				
		
		List<SpaceVO> list = new ArrayList<SpaceVO>();
		PreparedStatement ptmt = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			
			

			ptmt = con.prepareStatement(LIST_BY_NAME);
			ptmt = con.prepareStatement(LIST_BY_TYPE);

			
//			ResultSetMetaData rsmd = ptmt.getMetaData();
//			
//			
			ptmt.setString(1, "%"+str+"%");
			
			SpaceVO spaceVO;
			rs = ptmt.executeQuery();
			while (rs.next()) {

				spaceVO = new SpaceVO();
				
				spaceVO.setSpaceId(rs.getString("SPACE_ID"));
				spaceVO.setMemberId(rs.getString("MEMBER_ID"));
				spaceVO.setEmpId(rs.getString("EMP_ID"));
				spaceVO.setSpaceAddress(rs.getString("SPACE_ADDRESS"));
				spaceVO.setSpaceLng(rs.getDouble("SPACE_LNG"));
				spaceVO.setSpaceLat(rs.getDouble("SPACE_LAT"));
				spaceVO.setSpaceName(rs.getString("SPACE_NAME"));
				spaceVO.setSpaceType(rs.getString("SPACE_TYPE"));
				spaceVO.setSpaceEquipment(rs.getString("SPACE_EQUMENT"));
				spaceVO.setSpaceContain(rs.getString("SPACE_CONTAIN"));
				spaceVO.setSpaceRule(rs.getString("SPACE_RULE"));
				spaceVO.setSpaceRefund(rs.getString("SPACE_REFUND"));
				spaceVO.setSpaceStatus(rs.getString("SPACE_STATUS"));
				spaceVO.setSpaceSignupDate(rs.getDate("SPACE_SIGNUP_DATE"));
				spaceVO.setSpaceOnsaleDate(rs.getDate("SPACE_ONSALE_DATE"));
				spaceVO.setSpaceOffsaleDate(rs.getDate("SPACE_OFFSALE_DATE"));
				
				list.add(spaceVO);
				
				
				System.out.println(" get all info ");
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
	
	//////////////////////////////////////////////////////////////////////////
	
	
	
	
	@Override
	public List<SpaceVO> listTheAddress(String address) throws Exception {
		
		Connection con = null;
		 
		ResultSet rs = null;
				
		
		List<SpaceVO> list = new ArrayList<SpaceVO>();
		PreparedStatement ptmt = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			
		
		ptmt = con.prepareStatement(LIST_BY_ADDRESS);

		ptmt.setString(1, "%"+address+"%");
		
		SpaceVO spaceVO;
		rs = ptmt.executeQuery();
		while (rs.next()) {

			spaceVO = new SpaceVO();
			
			spaceVO.setSpaceId(rs.getString("SPACE_ID"));
			spaceVO.setMemberId(rs.getString("MEMBER_ID"));
			spaceVO.setEmpId(rs.getString("EMP_ID"));
			spaceVO.setSpaceAddress(rs.getString("SPACE_ADDRESS"));
			spaceVO.setSpaceLng(rs.getDouble("SPACE_LNG"));
			spaceVO.setSpaceLat(rs.getDouble("SPACE_LAT"));
			spaceVO.setSpaceName(rs.getString("SPACE_NAME"));
			spaceVO.setSpaceType(rs.getString("SPACE_TYPE"));
			spaceVO.setSpaceEquipment(rs.getString("SPACE_EQUMENT"));
			spaceVO.setSpaceContain(rs.getString("SPACE_CONTAIN"));
			spaceVO.setSpaceRule(rs.getString("SPACE_RULE"));
			spaceVO.setSpaceRefund(rs.getString("SPACE_REFUND"));
			spaceVO.setSpaceStatus(rs.getString("SPACE_STATUS"));
			spaceVO.setSpaceSignupDate(rs.getDate("SPACE_SIGNUP_DATE"));
			spaceVO.setSpaceOnsaleDate(rs.getDate("SPACE_ONSALE_DATE"));
			spaceVO.setSpaceOffsaleDate(rs.getDate("SPACE_OFFSALE_DATE"));
			
			list.add(spaceVO);
			
			
			System.out.println(" get all address ");
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






	@Override
	public List<SpaceVO> listTheBoth(String str, String address) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	
}