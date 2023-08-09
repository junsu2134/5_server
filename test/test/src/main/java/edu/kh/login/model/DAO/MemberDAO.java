package com.kh.test.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TestDao {
    private static final String DB_URL = "jdbc:oracle:thin:@192.168.10.3:1521:xe";
    private static final String DB_USERNAME = "kh";
    private static final String DB_PASSWORD = "kh";

    public List<Test> selectList() {
        List<Test> testList = new ArrayList<>();

        try {
            
            Connection conn = getConnection();

            String sql = "SELECT * FROM TEST";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                int SEQ = rs.getInt("SEQ");
                String WRITER = rs.getString("WRITER");
                String TITLE = rs.getString("TITLE");
                String CONTENT = rs.getString("CONTENT");
                Date REGDATE = rs.getDate("REGDATE");

                Test test = new Test(SEQ, WRITER, TITLE, CONTENT, REGDATE);
                testList.add(test);
            }

            rs.close();
            pstmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return testList;
    }
}
