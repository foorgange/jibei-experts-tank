package com.jd.tecachieve.domain;

public class PatentCountByMonth {
    private String month;
    private int publishedCount;
    private int grantedCount;

    // Getters and Setters
    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public int getPublishedCount() {
        return publishedCount;
    }

    public void setPublishedCount(int publishedCount) {
        this.publishedCount = publishedCount;
    }

    public int getGrantedCount() {
        return grantedCount;
    }

    public void setGrantedCount(int grantedCount) {
        this.grantedCount = grantedCount;
    }
}
