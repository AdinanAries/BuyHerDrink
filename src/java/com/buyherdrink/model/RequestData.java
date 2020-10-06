/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.buyherdrink.model;

/**
 *
 * @author aries
 */
public class RequestData {
    private String request_id;
    private String request_purpose;
    private String rest_location;
    private String rest_name;
    private String rest_rating;
    private String rest_photo;
    private String rest_category_icon;
    private String rest_service_types;
    private String place_type_of_search;
    private String meeting_date;
    private String meeting_time;
    private String meeting_budget;
    private String added_message;
    private String requestee_id;

    public RequestData(){}
    
    public RequestData(String request_id, String request_purpose, String rest_location, String rest_name, String rest_rating, String rest_photo, String rest_category_icon, String rest_service_types, String place_type_of_search, String meeting_date, String meeting_time, String meeting_budget, String added_message, String requestee_id) {
        this.request_id = request_id;
        this.request_purpose = request_purpose;
        this.rest_location = rest_location;
        this.rest_name = rest_name;
        this.rest_rating = rest_rating;
        this.rest_photo = rest_photo;
        this.rest_category_icon = rest_category_icon;
        this.rest_service_types = rest_service_types;
        this.place_type_of_search = place_type_of_search;
        this.meeting_date = meeting_date;
        this.meeting_time = meeting_time;
        this.meeting_budget = meeting_budget;
        this.added_message = added_message;
        this.requestee_id = requestee_id;
    }
    
    

    public String getRequest_id() {
        return request_id;
    }

    public void setRequest_id(String request_id) {
        this.request_id = request_id;
    }

    public String getRequest_purpose() {
        return request_purpose;
    }

    public void setRequest_purpose(String request_purpose) {
        this.request_purpose = request_purpose;
    }

    public String getRest_location() {
        return rest_location;
    }

    public void setRest_location(String rest_location) {
        this.rest_location = rest_location;
    }

    public String getRest_name() {
        return rest_name;
    }

    public void setRest_name(String rest_name) {
        this.rest_name = rest_name;
    }

    public String getRest_rating() {
        return rest_rating;
    }

    public void setRest_rating(String rest_rating) {
        this.rest_rating = rest_rating;
    }

    public String getRest_photo() {
        return rest_photo;
    }

    public void setRest_photo(String rest_photo) {
        this.rest_photo = rest_photo;
    }

    public String getRest_category_icon() {
        return rest_category_icon;
    }

    public void setRest_category_icon(String rest_category_icon) {
        this.rest_category_icon = rest_category_icon;
    }

    public String getRest_service_types() {
        return rest_service_types;
    }

    public void setRest_service_types(String rest_service_types) {
        this.rest_service_types = rest_service_types;
    }

    public String getPlace_type_of_search(){
        return this.place_type_of_search;
    }
    
    public void setPlace_type_of_search(String place_type_of_search){
        this.place_type_of_search = place_type_of_search;
    }
    
    public String getMeeting_date() {
        return meeting_date;
    }

    public void setMeeting_date(String meeting_date) {
        this.meeting_date = meeting_date;
    }

    public String getMeeting_time() {
        return meeting_time;
    }

    public void setMeeting_time(String meeting_time) {
        this.meeting_time = meeting_time;
    }

    public String getMeeting_budget() {
        return meeting_budget;
    }

    public void setMeeting_budget(String meeting_budget) {
        this.meeting_budget = meeting_budget;
    }

    public String getAdded_message() {
        return added_message;
    }

    public void setAdded_message(String added_message) {
        this.added_message = added_message;
    }

    public String getRequestee_id() {
        return requestee_id;
    }

    public void setRequestee_id(String requestee_id) {
        this.requestee_id = requestee_id;
    }
    
    
}
