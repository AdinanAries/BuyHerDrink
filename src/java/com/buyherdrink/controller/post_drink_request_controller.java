
package com.buyherdrink.controller;

import com.buyherdrink.model.RequestData;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

public class post_drink_request_controller extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String payload = "";
        RequestData request_data = null;
        Gson gson = new Gson();
        
        //reading the body content of the post request
       if ("POST".equalsIgnoreCase(request.getMethod())) 
        {
           payload = request.getReader().lines().collect(Collectors.joining(System.lineSeparator()));
        }
       
       request_data = gson.fromJson(payload, RequestData.class);
       
       JOptionPane.showMessageDialog(null, request_data.getMeeting_budget());
       JOptionPane.showMessageDialog(null, request_data.getRest_location());
       JOptionPane.showMessageDialog(null, request_data.getMeeting_date());
       JOptionPane.showMessageDialog(null, request_data.getMeeting_time());
       JOptionPane.showMessageDialog(null, request_data.getRest_name());
       JOptionPane.showMessageDialog(null, request_data.getRest_photo());
       JOptionPane.showMessageDialog(null, request_data.getRest_rating());
       JOptionPane.showMessageDialog(null, request_data.getRest_service_types());
       JOptionPane.showMessageDialog(null, request_data.getRequest_purpose());
       
        
        
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
