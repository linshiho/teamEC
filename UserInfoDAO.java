package com.internousdev.olive.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.internousdev.olive.dto.UserInfoDTO;
import com.internousdev.olive.util.DBConnector;

public class UserInfoDAO {

	//入力情報の登録
	public int createUser(String familyName,String firstName,String familyNameKana,String firstNameKana,String sex,String email,String userId,String password) {
		DBConnector db=new DBConnector();
		Connection con=db.getConnection();
		int count=0;

		String sql="INSERT INTO user_info(family_name,first_name,family_name_kana,first_name_kana,sex,email,user_id,password,regist_date,update_date)VALUES(?,?,?,?,?,?,?,?,now(),now())";

		try{
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,familyName);
			ps.setString(2,firstName);
			ps.setString(3,familyNameKana);
			ps.setString(4,firstNameKana);
			ps.setString(5,sex);
			ps.setString(6,email);
			ps.setString(7,userId);
			ps.setString(8,password);

			count=ps.executeUpdate();

		}catch(SQLException e){
			e.printStackTrace();
		}try{
			con.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return count;

	}
	//ユーザーID・パスワードの存在確認
	public boolean checkExistsUser(String userId,String password) {
		DBConnector db=new DBConnector();
		Connection con=db.getConnection();
		boolean result=false;

		String sql="SELECT count(*)as count FROM user_info where user_id=? AND password=?";

		try{
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,userId);
			ps.setString(2,password);
			ResultSet rs=ps.executeQuery();

			while(rs.next()){
				if(rs.getInt("count")>0){
					result=true;
				}
			}
		}catch(SQLException e){
			e.printStackTrace();

		}try{
			con.close();

		}catch(SQLException e){
			e.printStackTrace();

		}
		return result;

	}
	//ユーザーID重複確認
	public boolean checkExistsUser(String userId){
		DBConnector db=new DBConnector();
		Connection con=db.getConnection();
		boolean result=false;

		String sql="SELECT count(*)as count FROM user_info where user_id=?";

		try{
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,userId);
			ResultSet rs=ps.executeQuery();

			while(rs.next()){
				if(rs.getInt("count")>0){
					result= true;

				}
			}

		}catch(SQLException e){
			e.printStackTrace();

		}try{
			con.close();
		}catch(SQLException e){
			e.printStackTrace();

		}
		return result;

	}

   //購入履歴の表示
	public UserInfoDTO getUserInfo(String userId){
		DBConnector db=new DBConnector();
		Connection con=db.getConnection();
		UserInfoDTO userInfoDTO=new UserInfoDTO();

		String sql="select*from user_info where user_id=?";

		try{
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, userId);
			ResultSet rs=ps.executeQuery();

			while(rs.next()){
				userInfoDTO.setId(rs.getInt("id"));
				userInfoDTO.setUserId(rs.getString("user_id"));
				userInfoDTO.setPassword(rs.getString("password"));
				userInfoDTO.setFamilyName(rs.getString("family_name"));
				userInfoDTO.setFirstName(rs.getString("first_name"));
				userInfoDTO.setFamilyNameKana(rs.getString("family_name_kana"));
				userInfoDTO.setFirstNameKana(rs.getString("first_name_kana"));
				userInfoDTO.setSex(rs.getInt("sex"));
				userInfoDTO.setEmail(rs.getString("email"));
				userInfoDTO.setLogined(rs.getInt("logined"));

			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
				con.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return userInfoDTO;
	}
	//パスワードの再設定情報更新
	public int resetPassword(String userId,String password){
		DBConnector db=new DBConnector();
		Connection con=db.getConnection();

		String sql="update user_info set password=?,update_date=now()where user_id=?";
		int result=0;

		try{
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, password);
			ps.setString(2, userId);
			result=ps.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
				con.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return result;
	}
	//ログイン認証、日時の更新
	public int login(String userId,String password){
		DBConnector db=new DBConnector();
		Connection con=db.getConnection();
		int result=0;
		String sql="update user_info set logined=1,update_date=now()where user_id=? and password=?";
		try{
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, userId);
			ps.setString(2, password);
			result=ps.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
				con.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return result;
	}
	//ログアウト、日時の更新
	public int logout(String userId){
		DBConnector db=new DBConnector();
		Connection con=db.getConnection();
		int result=0;
		String sql="update user_info set logined=0, update_date=now() where user_id=?";
		try{
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,userId);
			result=ps.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
				con.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return result;
	}

}
