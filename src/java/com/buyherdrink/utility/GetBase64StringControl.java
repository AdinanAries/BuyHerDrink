
package com.buyherdrink.utility;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

@WebServlet(name = "GetBase64StringControl", urlPatterns = {"/GetBase64StringControl"})

public class GetBase64StringControl extends HttpServlet {
    
    String Base64StringImage = ""; 
    String ImgProperty = "";
    String JSONData = "";
    
    encodeBinaryPhotoToBase64String encoder = null;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String Path = request.getParameter("ImgPath");
        //JOptionPane.showMessageDialog(null, Path);
        encoder = new encodeBinaryPhotoToBase64String(Path);
        
        Base64StringImage = encoder.GetBaseString64Image();
        ImgProperty = encoder.GetImageAsElementProp();
        
        JSONData = "{"
                 +    "\"Base64StringImage\": \"" + Base64StringImage + "\","
                 +    "\"ImgProperty\": \"" + ImgProperty + "\""
                 + "}";
        
        response.getWriter().print(JSONData);
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
