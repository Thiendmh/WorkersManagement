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
public class OrderDetails {
    private int orderId;
    private int jobId;
    private String jobName;
    private Date stDate;
    private Date endDate;
    private int quantity;
    private byte active;

    public OrderDetails() {
    }

    public OrderDetails(int orderId, int jobId, String jobName, Date stDate, Date endDate, int quantity, byte active) {
        this.orderId = orderId;
        this.jobId = jobId;
        this.jobName = jobName;
        this.stDate = stDate;
        this.endDate = endDate;
        this.quantity = quantity;
        this.active = active;
    }

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

    public String getJobName() {
        return jobName;
    }

    public void setJobName(String jobName) {
        this.jobName = jobName;
    }

    public Date getStDate() {
        return stDate;
    }

    public void setStDate(Date stDate) {
        this.stDate = stDate;
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

    public byte getActive() {
        return active;
    }

    public void setActive(byte active) {
        this.active = active;
    }

    
}
