package edu.kh.test.user.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import edu.kh.test.user.model.vo.UserDTO;

public class UserDAO {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;
    private Properties prop;


    public UserDTO selectUser(int userNo) {
        UserDTO user = null;

        String sql = prop.getProperty("selectUser");

        try {
            pstmt.setInt(1, userNo);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                user = new UserDTO();
                user.setUserNo(rs.getInt("USER_NO"));
                user.setUserId(rs.getString("USER_ID"));
                user.setUserName(rs.getString("USER_NAME"));
                user.setUserAge(rs.getInt("USER_AGE"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return user;
    }

    }
