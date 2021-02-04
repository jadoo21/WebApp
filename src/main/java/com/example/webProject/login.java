package com.example.webProject;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

@WebServlet("/login")
public class login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String user = req.getParameter("email");
        String pwd = req.getParameter("password");
        String error = "";
        if(user.equals("") || pwd.equals("")) {
            error = "Fields can't be empty!!";
        }
        else{
            try{
                Connection con = DBConnection.connect();
                Statement stmt1 = con.createStatement();
                Statement stmt2 = con.createStatement();
                String userName = "select * from user where username = '" + user + "' and password = '" + pwd + "';";
                String email = "select * from user where email = '" + user + "' and password = '" + pwd + "';";
                ResultSet rsUser = stmt1.executeQuery(userName);
                ResultSet rsEmail = stmt2.executeQuery(email);
                if (rsUser.next() || rsEmail.next()) {
                    RequestDispatcher dispatcher = req.getRequestDispatcher("html/dashboard.jsp");
                    req.setAttribute("key", user);
                    dispatcher.forward(req, resp);
                } else {
                    error = "Invalid Credentials!! Try Again...";
                }
            }
            catch(Exception e){
                error = e.toString();
            }
        }

        RequestDispatcher dispatcher = req.getRequestDispatcher("index.jsp");
        req.setAttribute("error", error);
        dispatcher.forward(req, resp);
    }
}
