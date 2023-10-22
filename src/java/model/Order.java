/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;

/**
 *
 * @author Aquarius
 */
public class Order {

    private String total;
    private Date date;
    private Time time;
    private ArrayList<OrderStatus> orderStatus;
    private String address;

    public Order(String total, Date date, Time time, ArrayList<OrderStatus> orderStatus, String address) {
        this.total = total;
        this.date = date;
        this.time = time;
        this.orderStatus = orderStatus;
        this.address = address;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Time getTime() {
        return time;
    }

    public void setTime(Time time) {
        this.time = time;
    }

    public ArrayList<OrderStatus> getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(ArrayList<OrderStatus> orderStatus) {
        this.orderStatus = orderStatus;

    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

}
