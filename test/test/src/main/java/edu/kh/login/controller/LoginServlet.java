package edu.kh.login.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login/do")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	String path = "/WEB-INF/views/common/errorPage.jsp";
    	
        // 한글 인코딩 설정
        request.setCharacterEncoding("UTF-8");

        // 로그인 화면에서 전달된 아이디와 비밀번호 정보 가져오기
        String id = request.getParameter("id");
        String password = request.getParameter("pwd");

        // MemberService 객체 생성
        MemberService memberService = new MemberService();

        // 로그인 처리 결과를 담을 변수
        boolean loginSuccess = memberService.login(id, password);

        if (loginSuccess) {
            // 로그인 성공 시 메인페이지로 이동
            response.sendRedirect("mainPage.jsp");
        } else {
            // 로그인 실패 시 에러 페이지로 이동
            request.getRequestDispatcher().forward(request, response);
        }
    }
}
