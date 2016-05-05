/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.Date;

/**
 *
 * @author Administrator
 */
public class Order {
    private int oderId;
    private String userName;
    private Date orderDate;
    private byte active;

    public Order() {
    }

    public Order(int oderId, String userName, Date orderDate, byte active) {
        this.oderId = oderId;
        this.userName = userName;
        this.orderDate = orderDate;
        this.active = active;
    }

    public int getOderId() {
        return oderId;
    }

    public void setOderId(int oderId) {
        this.oderId = oderId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public byte getActive() {
        return active;
    }

    public void setActive(byte active) {
        this.active = active;
    }
    
}
