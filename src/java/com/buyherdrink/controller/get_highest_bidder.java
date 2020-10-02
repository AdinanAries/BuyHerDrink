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

/**
 *
 * @author aries
 */
public class get_highest_bidder extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String drinkRequestId = request.getParameter("drink_request_id");
        
        response.getWriter().print(""
                + "{"
                +       "\"request_id\": 24,"
                +       "\"request_purpose\": \"Drink\","
                +       "\"rest_location\": \"1913 Bronxdale Ave, The Bronx\","
                +       "\"rest_name\": \"F&J Pine\","
                +       "\"rest_rating\": 5,"
                +       "\"rest_photo\": null,"
                +       "\"rest_category_icon\": null,"
                +       "\"rest_service_types\": null,"
                +       "\"meeting_date\": \"09/04/2020\","
                +       "\"meeting_time\": \"14:00\","
                +       "\"meeting_budget\": \"$50.00\","
                +       "\"added_message\": \"This request was so good it needed a 50.00 offer from me\","
                +       "\"bidder_id\": 252,"
                +       "\"bidder_propic\": null,"
                +       "\"bidder_coverphoto\": null,"
                +       "\"bidder_name\": \"Kristina Rodriquez\","
                +       "\"bidder_gender\": \"female\","
                +       "\"bidder_age\": 21,"
                +       "\"bidder_address\": \"3423 River Ave, Albany, NY\""
                + "}");
        
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
