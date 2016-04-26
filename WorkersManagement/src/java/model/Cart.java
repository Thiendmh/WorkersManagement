/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Date;

/**
 *
 * @author dinhd
 */
public class Cart {
    private int orderId;
    private int jobId;
    private Date startDate;
    private Date endDate;
    private int  quantity;  

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Cart() {
    }

    public Cart(int orderId, int jobId, Date startDate, Date endDate, int quantity) {
        this.orderId = orderId;
        this.jobId = jobId;
        this.startDate = startDate;
        this.endDate = endDate;
        this.quantity = quantity;
    }
    
    
    
    
    
}
