/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.buyherdrink.utility;

import java.util.ArrayList;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;

/**
 *
 * @author aries
 */
public class user_tokens_inmemory_db {
    
    private List<String> tokenList;
    
    private static user_tokens_inmemory_db singleton_instance;
    
    private user_tokens_inmemory_db(){
        this.tokenList = new ArrayList<>();
    }
    
    public static user_tokens_inmemory_db getInstance(){
        
        if(singleton_instance == null)
            singleton_instance = new user_tokens_inmemory_db();
        
        return singleton_instance;
    }
    
    public String findItem(String tokenId){
        
        String temp_token = "";
        try{
            temp_token = tokenList.stream()
                .filter(token -> token.equals(tokenId))
                .findFirst().get();
        }catch(NoSuchElementException e){
            System.out.println(e.getMessage());
        }catch(Exception e){
            System.out.println(e.getMessage());
        }

        if(temp_token.equals("")){
            temp_token = "not found";
        }
        
        return temp_token;
    }
    
    public void addItem(String tokenId){
        this.tokenList.add(tokenId);
    }
    
    public void removeItem(String tokenId){
        try{
            this.tokenList.remove(tokenId);
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
}
