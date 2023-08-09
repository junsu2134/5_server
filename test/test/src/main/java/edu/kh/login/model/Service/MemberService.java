package edu.kh.login.model.Service;

import java.sql.Connection;
import java.sql.SQLException;

public class MemberService {
    
    public boolean login(String id, String password) {
        boolean loginResult = false;

        // 데이터베이스 연결을 위한 Connection 객체
        Connection conn = null;

        try {
            // JDBCTemplate 클래스의 getConnection 메소드를 사용하여 데이터베이스 연결
            conn = JDBCTemplate.getConnection();

            // MemberDAO 객체 생성
            MemberDAO memberDAO = new MemberDAO();

            // MemberDAO의 login 메소드 호출하여 로그인 처리
            loginResult = memberDAO.login(conn, id, password);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 데이터베이스 자원 반환
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        
        return loginResult;
    }
}

