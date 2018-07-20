package com.fxh.hs.entity;

public class Appointment {
    private Integer aid;

    private Integer uid;

    private String pname;

    private Integer mid;

    private String visitime;

    private String visitseq;

    public Integer getAid() {
        return aid;
    }

    public void setAid(Integer aid) {
        this.aid = aid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname == null ? null : pname.trim();
    }

    public Integer getMid() {
        return mid;
    }

    public void setMid(Integer mid) {
        this.mid = mid;
    }

    public String getVisitime() {
        return visitime;
    }

    public void setVisitime(String visitime) {
        this.visitime = visitime == null ? null : visitime.trim();
    }

    public String getVisitseq() {
        return visitseq;
    }

    public void setVisitseq(String visitseq) {
        this.visitseq = visitseq == null ? null : visitseq.trim();
    }
}