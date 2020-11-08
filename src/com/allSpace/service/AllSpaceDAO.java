package com.allSpace.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.space.model.SpaceVO;


public class AllSpaceDAO implements AllSpaceInterface{
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "TEA101G2";
	String passwd = "123456";

	
	
	private static final String ALL_SPACE_LIST =
			"select space_id, space_name, space_status, AVG(SPACE_COMMENT_LEVEL) as avg_commnet, space_contain, space_type, space_signup_date, space_lat, space_lng, space_address from (select * from space inner join space_comment on space.space_id = space_comment.space_id inner join space_detail on space_detail.space_id = space.space_id where space_status = 'T') group by space_id, space_name, space_contain, space_status, space_signup_date, space_lat, space_lng, space_type, space_address";
			
	@Override
	public List<SpaceVO> selectAllSpaceList() {
		

		Connection con = null;
		PreparedStatement ptmt = null;
		
		ResultSet rs = null; 
		
		SpaceVO spaceVO = null;
		List<SpaceVO> list = new ArrayList<SpaceVO>();
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			ptmt = con.prepareStatement(ALL_SPACE_LIST);
			
			rs = ptmt.executeQuery();
			
			while (rs.next()) {
				spaceVO = new SpaceVO();
				spaceVO.setSpaceId(rs.getString("space_Id"));
				spaceVO.setSpaceName(rs.getString("space_Name"));
				spaceVO.setAvgComment(rs.getDouble("avg_commnet"));
				spaceVO.setSpaceAddress(rs.getString("space_address"));
				spaceVO.setSpaceSignupDate(rs.getDate("space_Signup_Date"));
				spaceVO.setSpaceType(rs.getString("space_type"));
				spaceVO.setSpaceLat(rs.getDouble("space_lat"));
				spaceVO.setSpaceLng(rs.getDouble("space_lng"));
				spaceVO.setSpaceContain(rs.getString("space_contain"));	
				spaceVO.setSpaceStatus(rs.getString("space_status"));
				
					
				
//				
//					
//				}
				
				list.add(spaceVO);
				
				
			}
			
			
			
			
			
		
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			
			}

	return list;
		
	}
}
	

















