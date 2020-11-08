package com.popularFunction.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.space.model.SpaceVO;
import com.spaceComment.model.SpaceCommentVO;

public class PopularDAO implements PopularInterface{
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "TEA101G2";
	String passwd = "123456";

	private static final String LIST_BY_POPULAR =
//		"select space_id, AVG(SPACE_COMMENT_LEVEL) from SPACE_COMMENT group by space_id having avg(SPACE_COMMENT_LEVEL) > 3";
	"select space_id, space_name, space_address,space_signup_date, space_type, AVG(SPACE_COMMENT_LEVEL) as avg_comment from (select * from space_comment inner JOIN space on space.space_id = space_comment.space_id inner join space_detail on space_detail.space_id = space.space_id) group by space_name, space_address, space_signup_date, space_id, space_type";

		
		
		@Override
		public List<SpaceVO> listByPopular() {
			
			
			 
			Connection con = null;
			PreparedStatement ptmt = null;
			
			ResultSet rs = null;
			
			SpaceVO spaceVO = null;
			
			List<SpaceVO> list = new ArrayList<SpaceVO>();;
			
			
			
			try {
				Class.forName(driver);
				con = DriverManager.getConnection(url, userid, passwd);
				ptmt = con.prepareStatement(LIST_BY_POPULAR);
				
				rs = ptmt.executeQuery();
				while (rs.next()) {
					spaceVO = new SpaceVO();
					spaceVO.setSpaceId(rs.getString("SPACE_ID"));
//					spaceVO.setMemId(rs.getString("MEMBER_ID"));
//					spaceVO.setEmpId(rs.getString("EMP_ID"));
					spaceVO.setSpaceAddress(rs.getString("SPACE_ADDRESS"));
//					spaceVO.setSpaceLng(rs.getDouble("SPACE_LNG"));
//					spaceVO.setSpaceLat(rs.getDouble("SPACE_LAT"));
					spaceVO.setSpaceName(rs.getString("SPACE_NAME"));
//					spaceVO.setSpaceType(rs.getString("SPACE_TYPE"));
//					spaceVO.setSpaceEquipment(rs.getString("SPACE_EQUMENT"));
//					spaceVO.setSpaceContain(rs.getString("SPACE_CONTAIN"));
//					spaceVO.setSpaceRule(rs.getString("SPACE_RULE"));
//					spaceVO.setSpaceRefund(rs.getString("SPACE_REFUND"));
//					spaceVO.setSpaceStatus(rs.getString("SPACE_STATUS"));
					spaceVO.setSpaceSignupDate(rs.getDate("SPACE_SIGNUP_DATE"));
//					spaceVO.setSpaceOnsaleDate(rs.getDate("SPACE_ONSALE_DATE"));
//					spaceVO.setSpaceOffsaleDate(rs.getDate("SPACE_OFFSALE_DATE"));
//					
					spaceVO.setAvgComment(rs.getDouble("avg_comment"));
					
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




		@Override
		public List<SpaceCommentVO> listByPopularCon() {
			// TODO Auto-generated method stub
			return null;
		}


//
//
//		@Override
//		public List<SpaceCommentVO> listByPopularCon() {
//			
//			List<SpaceCommentVO> listCon = new ArrayList<SpaceCommentVO>();
//
//			
//			Connection con = null;
//			PreparedStatement ptmt = null;
//			
//			ResultSet rs = null;
//			
//			SpaceCommentVO spaceCommentVO = null;
//			
//			
//			
//			
//			try {
//				Class.forName(driver);
//				con = DriverManager.getConnection(url, userid, passwd);
//				ptmt = con.prepareStatement(LIST_BY_POPULAR);
//				
//				rs = ptmt.executeQuery();
//				while (rs.next()) {
//					spaceCommentVO = new SpaceCommentVO();
//					spaceCommentVO.setSpaceCommentLevel(rs.getDouble("SPACE_COMMENT_LEVEL"));
//
//					listCon.add(spaceCommentVO);
//				}
//			
//			}catch (ClassNotFoundException e) {
//				e.printStackTrace();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}finally {
//				if (rs != null) {
//					try {
//						rs.close();
//					} catch (SQLException se) {
//						se.printStackTrace(System.err);
//					}
//				}
//				if (ptmt != null) {
//					try {
//						ptmt.close();
//					} catch (Exception e) {
//						e.printStackTrace(System.err);
//					}
//				}if (con != null) {
//					try {
//						con.close();
//					} catch (Exception e) {
//						e.printStackTrace(System.err);
//					}
//				}
//			}
//
//		return listCon;
//			
//		}



}