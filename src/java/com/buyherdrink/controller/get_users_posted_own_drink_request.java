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
public class get_users_posted_own_drink_request extends HttpServlet {

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
        String userId = request.getParameter("user_id");
        String JsonObject = "[ "
                +   "{"
                +       "\"user_id\": \"user_id\", "
                +       "\"drink_request_id\": \"request_id\", "
                +       "\"rest_name\": \"Cafe Bravo\", "
                +       "\"rest_photo_url\": \"https://maps.googleapis.com/maps/api/place/js/PhotoService.GetPhoto?1sCmRaAAAAnp5jaz2fdkJUU9di0Ilug1EfhqN_X6OjlWOOZTCRwjEtOoE0GgcnQfQzv_Jg48dceXMpXHiMRRWitvWgBZLKb7C2EIL4EZHwU00-t1Lf8BmZ3ajXyKNeMu-rd4_nRlgCEhBawaUkUE5ufTXnFXs3eYUFGhQJSaw2n4GoS2y4QloO6MfrScdiaw&3u1920&5m1&2e1&callback=none&key=AIzaSyAoltHbe0FsMkNbMCAbY5dRYBjxwkdSVQQ&token=36538\", "
                +       "\"rest_icon_url\": \"https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/restaurant-71.png\", "
                +       "\"rating_number\": 5, "
                +       "\"rest_address\": \"1413 Davidson Ave, Bronx NY, USA 1023\", "
                +       "\"rest_types\": \"bar, restaurant, food, point of interest, establishment\", "
                +       "\"date\": \"04/05/2020\", "
                +       "\"time\": \"02:24PM\", "
                +       "\"request_purpose\": \"Drink\", "
                +       "\"request_budget\": \"$50.00\""
                +   "}, "
                +   "{"
                +       "\"user_id\": \"user_id\", "
                +       "\"drink_request_id\": \"request_id\", "
                +       "\"rest_name\": \"Cafe Bravo\", "
                +       "\"rest_photo_url\": \"https://maps.googleapis.com/maps/api/place/js/PhotoService.GetPhoto?1sCmRaAAAAnp5jaz2fdkJUU9di0Ilug1EfhqN_X6OjlWOOZTCRwjEtOoE0GgcnQfQzv_Jg48dceXMpXHiMRRWitvWgBZLKb7C2EIL4EZHwU00-t1Lf8BmZ3ajXyKNeMu-rd4_nRlgCEhBawaUkUE5ufTXnFXs3eYUFGhQJSaw2n4GoS2y4QloO6MfrScdiaw&3u1920&5m1&2e1&callback=none&key=AIzaSyAoltHbe0FsMkNbMCAbY5dRYBjxwkdSVQQ&token=36538\", "
                +       "\"rest_icon_url\": \"https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/restaurant-71.png\", "
                +       "\"rating_number\": 5, "
                +       "\"rest_address\": \"1413 Davidson Ave, Bronx NY, USA 1023\", "
                +       "\"rest_types\": \"bar, restaurant, food, point of interest, establishment\", "
                +       "\"date\": \"04/05/2020\", "
                +       "\"time\": \"02:24PM\", "
                +       "\"request_purpose\": \"Drink\", "
                +       "\"request_budget\": \"$50.00\""
                +   "}"
                + " ]";
        
        response.getWriter().print(JsonObject);
        
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
