/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.buyherdrink.controller;

import com.buyherdrink.utility.user_tokens_inmemory_db;
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
public class login_controller extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String Username = request.getParameter("username");
        String Password = request.getParameter("password");
        
        user_tokens_inmemory_db userTokens = user_tokens_inmemory_db.getInstance();
        
        userTokens.addItem("JWTi4Udhe4348HDkidksseiIK094Kw");
        
        String json_res = 
                "{"
                + "\"status\": \"success\","
                + "\"token_id\": \"JWTi4Udhe4348HDkidksseiIK094Kw\","
                + "\"user_id\": \"2eighkui3iwuhdo9478khdskj022\","
                + "\"user_name\": \"Mohammed Adinan Salifu Wumpini\","
                + "\"gender\": \"male\","
                + "\"age\": \"26\","
                + "\"area\": \"New York City Area\""
                + "}";
        
        response.getWriter().print(json_res);
        
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
