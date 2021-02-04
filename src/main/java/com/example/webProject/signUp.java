package com.example.webProject;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.regex.Pattern;
import java.sql.*;

@WebServlet(name = "signUp", value = "/signup")
public class signUp extends HttpServlet {

    boolean isNotNumber(String number){
        try{
            long num = Long.parseLong(number);
        }
        catch(Exception e){
            return true;
        }
        return false;
    }

    public boolean isEmailValid(String email)
    {
        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\."+
                "[a-zA-Z0-9_+&*-]+)*@" +
                "(?:[a-zA-Z0-9-]+\\.)+[a-z" +
                "A-Z]{2,7}$";

        Pattern pat = Pattern.compile(emailRegex);
        if (email == null)
            return false;
        return pat.matcher(email).matches();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String user = req.getParameter("username");
        String mobile = req.getParameter("phoneno");
        String email = req.getParameter("email");
        String pwd = req.getParameter("pwd");
        String cpwd = req.getParameter("cnfrm_pwd");

        RequestDispatcher dispatcher = req.getRequestDispatcher("html/signUp.jsp");
        String data = (user+"\n"+ mobile+ "\n"+ email+ "\n"+ pwd+ "\n"+ cpwd), error = "";

        if(user.equals("") || mobile.equals("") || email.equals("") || pwd.equals("") || cpwd.equals(""))
            error = "Fields can't be empty!!";
        else if(mobile.length()!=10 || isNotNumber(mobile))
            error = "Invalid Mobile Number";
        else if(!isEmailValid(email))
            error = "Invalid Email Address!!!";
        else if(pwd.length()<6)
            error = "Password Length should be greater than 6";
        else if(!pwd.equals(cpwd))
            error = "Passwords do not match";
        else{
            try {
                Connection con = DBConnection.connect();
                Statement stmt1 = con.createStatement();
                Statement stmt2 = con.createStatement();
                Statement stmt3 = con.createStatement();
                String checkUser = "select username from user where username = '"+user+"';";
                String checkEmail = "select email from user where email = '"+email+"';";
                ResultSet rsUser = stmt1.executeQuery(checkUser);
                ResultSet rsEmail = stmt2.executeQuery(checkEmail);
                if(rsUser.next())
                    error = "Username already exists!!";
                else if(rsEmail.next())
                    error = "Email already exists!!";
                else{
                    String insert = "insert into user values ('"+user+"', '"+mobile+"', '"+email+"', '"+pwd+"');";
                    stmt3.execute(insert);

                    RequestDispatcher login = req.getRequestDispatcher("index.jsp");
                    req.setAttribute("success", "Success");
                    login.forward(req, resp);
                }
            }
            catch(Exception e){
                error = e.toString();
            }
        }

        req.setAttribute("error", error);
        dispatcher.forward(req, resp);
    }
}
