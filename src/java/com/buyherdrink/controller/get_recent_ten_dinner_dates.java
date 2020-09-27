/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.buyherdrink.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class get_recent_ten_dinner_dates extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String user_id = request.getParameter("user_id");
        
        response.getWriter().print(""
                + "["
                +   "{"
                +       "\"date_profile_pic\": null,"
                +       "\"date_name\": \"Ana Rodriguez\","
                +       "\"date_gender\": \"female\","
                +       "\"date_age\": 28,"
                +       "\"date_address\": \"Greater New York Area\","
                +       "\"rest_name\": \"Cafe' Bravo\","
                +       "\"rest_location\":  \"1770 Greenwich st, NY 1039\","
                +       "\"meeting_purpose\": \"Dinner\","
                +       "\"meeting_date\": \"09/03/2021\","
                +       "\"meeting_time\": \"12:30pm\","
                +       "\"meeting_price\": \"$45.00\""
                +   "},"
                +   "{"
                +       "\"date_profile_pic\": null,"
                +       "\"date_name\": \"Ana Rodriguez\","
                +       "\"date_gender\": \"female\","
                +       "\"date_age\": 28,"
                +       "\"date_address\": \"Greater New York Area\","
                +       "\"rest_name\": \"Cafe' Bravo\","
                +       "\"rest_location\":  \"1770 Greenwich st, NY 1039\","
                +       "\"meeting_purpose\": \"Dinner\","
                +       "\"meeting_date\": \"09/03/2021\","
                +       "\"meeting_time\": \"12:30pm\","
                +       "\"meeting_price\": \"$45.00\""
                +   "},"
                +   "{"
                +       "\"date_profile_pic\": null,"
                +       "\"date_name\": \"Ana Rodriguez\","
                +       "\"date_gender\": \"female\","
                +       "\"date_age\": 28,"
                +       "\"date_address\": \"Greater New York Area\","
                +       "\"rest_name\": \"Cafe' Bravo\","
                +       "\"rest_location\":  \"1770 Greenwich st, NY 1039\","
                +       "\"meeting_purpose\": \"Dinner\","
                +       "\"meeting_date\": \"09/03/2021\","
                +       "\"meeting_time\": \"12:30pm\","
                +       "\"meeting_price\": \"$45.00\""
                +   "}"
                + "]"
                + "");
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
