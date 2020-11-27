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
public class get_recent_ten_drink_request_controller extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String City = request.getParameter("city");
        String Town = request.getParameter("town");
        String Country = request.getParameter("country");
        
        //this controller gets recent ten published drink request
        String JsonRes = 
                "["
                +   "{"
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
                +       "\"meeting_budget\": \"$5.00\","
                +       "\"added_message\": \"This is a place holder text for message to be added on for the drink request\","
                +       "\"requestee_id\": 255,"
                +       "\"requestee_propic\": \"Pictures/TestPhotos/1.jpg\","
                +       "\"requestee_coverphoto\": null,"
                +       "\"requestee_name\": \"Filomina Mundo\","
                +       "\"requestee_gender\": \"female\","
                +       "\"requestee_age\": 25,"
                +       "\"requestee_address\": \"1913 Bronxdale Ave, The Bronx\""
                +   "},"
                +   "{"
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
                +       "\"meeting_budget\": \"$5.00\","
                +       "\"added_message\": \"This is a place holder text for message to be added on for the drink request\","
                +       "\"requestee_id\": 255,"
                +       "\"requestee_propic\": \"Pictures/TestPhotos/2.jpg\","
                +       "\"requestee_coverphoto\": null,"
                +       "\"requestee_name\": \"Luv Steve\","
                +       "\"requestee_gender\": \"female\","
                +       "\"requestee_age\": 24,"
                +       "\"requestee_address\": \"1112 Greg st, Manhattan\""
                +   "},"
                +   "{"
                +       "\"request_id\": 24,"
                +       "\"request_purpose\": \"Drink\","
                +       "\"rest_location\": \"1913 Bronxdale Ave, Bronx\","
                +       "\"rest_name\": \"F&J Pine\","
                +       "\"rest_rating\": 5,"
                +       "\"rest_photo\": null,"
                +       "\"rest_category_icon\": null,"
                +       "\"rest_service_types\": null,"
                +       "\"meeting_date\": \"09/04/2020\","
                +       "\"meeting_time\": \"14:00\","
                +       "\"meeting_budget\": \"$5.00\","
                +       "\"added_message\": \"This is a place holder text for message to be added on for the drink request\","
                +       "\"requestee_id\": 255,"
                +       "\"requestee_propic\": \"Pictures/TestPhotos/3.jpg\","
                +       "\"requestee_coverphoto\": null,"
                +       "\"requestee_name\": \"Karrisa Fernando\","
                +       "\"requestee_gender\": \"female\","
                +       "\"requestee_age\": 23,"
                +       "\"requestee_address\": \"3213 Manning Boulevard, Albany\""
                +   "},"
                +   "{"
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
                +       "\"meeting_budget\": \"$5.00\","
                +       "\"added_message\": \"This is a place holder text for message to be added on for the drink request\","
                +       "\"requestee_id\": 255,"
                +       "\"requestee_propic\": \"Pictures/TestPhotos/1.jpg\","
                +       "\"requestee_coverphoto\": null,"
                +       "\"requestee_name\": \"Filomina Mundo\","
                +       "\"requestee_gender\": \"female\","
                +       "\"requestee_age\": 25,"
                +       "\"requestee_address\": \"1913 Bronxdale Ave, The Bronx\""
                +   "},"
                +   "{"
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
                +       "\"meeting_budget\": \"$5.00\","
                +       "\"added_message\": \"This is a place holder text for message to be added on for the drink request\","
                +       "\"requestee_id\": 255,"
                +       "\"requestee_propic\": \"Pictures/TestPhotos/4.jpg\","
                +       "\"requestee_coverphoto\": null,"
                +       "\"requestee_name\": \"Stephany Sanchez\","
                +       "\"requestee_gender\": \"female\","
                +       "\"requestee_age\": 24,"
                +       "\"requestee_address\": \"1433 Grand Ave, Bronx\""
                +   "},"
                +   "{"
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
                +       "\"meeting_budget\": \"$5.00\","
                +       "\"added_message\": \"This is a place holder text for message to be added on for the drink request\","
                +       "\"requestee_id\": 255,"
                +       "\"requestee_propic\": \"Pictures/TestPhotos/3.jpg\","
                +       "\"requestee_coverphoto\": null,"
                +       "\"requestee_name\": \"Karrisa Fernando\","
                +       "\"requestee_gender\": \"female\","
                +       "\"requestee_age\": 23,"
                +       "\"requestee_address\": \"3213 Manning Boulevard, Albany\""
                +   "}" +
                "]";
        response.getWriter().print(JsonRes);
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
