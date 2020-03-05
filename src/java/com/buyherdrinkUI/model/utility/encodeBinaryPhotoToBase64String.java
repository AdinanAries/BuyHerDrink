
package com.buyherdrinkUI.model.utility;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.InputStream;
import java.net.URL;
import java.sql.Blob;
import java.util.Base64;
import javax.imageio.ImageIO;
import javax.swing.JOptionPane;


public class encodeBinaryPhotoToBase64String {
    
    private String Base64StringPhoto;
    private String PhotoAsElementProperty;
    private byte[] FileImageInByte;
    
    public encodeBinaryPhotoToBase64String(Blob Pic){
        try{    
            //put this in a try catch block for incase getProfilePicture returns nothing
            InputStream inputStream = Pic.getBinaryStream();
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            byte[] buffer = new byte[4096];
            int bytesRead = -1;

            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }

            byte[] imageBytes = outputStream.toByteArray();

                Base64StringPhoto = Base64.getEncoder().encodeToString(imageBytes);


        }
        catch(Exception e){

        }
        
        
    }
    
    public encodeBinaryPhotoToBase64String(String Path){
        JOptionPane.showMessageDialog(null, "encoder called");
        FileImageInByte = convertPicFileToByteArray(Path);
        
        try{
            Base64StringPhoto = Base64.getEncoder().encodeToString(FileImageInByte);


        }
        catch(Exception e){

        }
        
        
    }
    
    public final byte[] convertPicFileToByteArray(String Path){
        
        byte[] imageInByte = null;
        
        try{
            
            URL url = new URL(Path);
            BufferedImage originalImage = ImageIO.read(url);
            
            //File file = new File(url.toString());
            /*
                Provided the image data is in the filesystem or permanent storage
                new File("path/to/image/imag.jpg");
            
                //Provider the image data is in memory or temporary storage
             
            */
            
            JOptionPane.showMessageDialog(null, "Im here");
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            ImageIO.write( originalImage, "jpg", baos );
            baos.flush();
            imageInByte = baos.toByteArray();
            
        }catch(Exception e){}
        
        JOptionPane.showMessageDialog(null, imageInByte);
        return imageInByte;
        
    }
    
    //Getter Methods
    public String GetBaseString64Image(){
        return Base64StringPhoto;
    }
    public String GetImageAsElementProp(){
        PhotoAsElementProperty = "data:image/jpg;base64,"+Base64StringPhoto;
        return PhotoAsElementProperty;
    }
    
}
