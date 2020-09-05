
package com.buyherdrink.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class get_recent_ten_drink_offers_controller extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userID = request.getParameter("client_id");
        //this controller gets recent ten user drink offers
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
                +       "\"requestee_id\": 255,"
                +       "\"requestee_propic\": null,"
                +       "\"requestee_coverphoto\": null,"
                +       "\"requestee_name\": \"Filomina\","
                +       "\"requestee_gender\": \"female\","
                +       "\"requestee_age\": 25"
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
                +       "\"requestee_id\": 255,"
                +       "\"requestee_propic\": null,"
                +       "\"requestee_coverphoto\": null,"
                +       "\"requestee_name\": \"Filomina\","
                +       "\"requestee_gender\": \"female\","
                +       "\"requestee_age\": 25"
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
                +       "\"requestee_id\": 255,"
                +       "\"requestee_propic\": null,"
                +       "\"requestee_coverphoto\": null,"
                +       "\"requestee_name\": \"Filomina\","
                +       "\"requestee_gender\": \"female\","
                +       "\"requestee_age\": 25"
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
                +       "\"requestee_id\": 255,"
                +       "\"requestee_propic\": null,"
                +       "\"requestee_coverphoto\": null,"
                +       "\"requestee_name\": \"Filomina\","
                +       "\"requestee_gender\": \"female\","
                +       "\"requestee_age\": 25"
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
                +       "\"requestee_id\": 255,"
                +       "\"requestee_propic\": null,"
                +       "\"requestee_coverphoto\": null,"
                +       "\"requestee_name\": \"Filomina\","
                +       "\"requestee_gender\": \"female\","
                +       "\"requestee_age\": 25"
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
                +       "\"requestee_id\": 255,"
                +       "\"requestee_propic\": null,"
                +       "\"requestee_coverphoto\": null,"
                +       "\"requestee_name\": \"Filomina\","
                +       "\"requestee_gender\": \"female\","
                +       "\"requestee_age\": 25"
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
