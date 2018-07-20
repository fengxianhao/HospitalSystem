package com.fxh.hs.entity;

public class Mediciner {
    private Integer mid;

    private String mname;

    private String gender;

    private String title;

    private String mspec;

    private String surgeryweekday;

    private Integer limitvisits;

    private String hospital;

    private String dept;

    public Integer getMid() {
        return mid;
    }

    public void setMid(Integer mid) {
        this.mid = mid;
    }

    public String getMname() {
        return mname;
    }

    public void setMname(String mname) {
        this.mname = mname == null ? null : mname.trim();
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getMspec() {
        return mspec;
    }

    public void setMspec(String mspec) {
        this.mspec = mspec == null ? null : mspec.trim();
    }

    public String getSurgeryweekday() {
        return surgeryweekday;
    }

    public void setSurgeryweekday(String surgeryweekday) {
        this.surgeryweekday = surgeryweekday == null ? null : surgeryweekday.trim();
    }

    public Integer getLimitvisits() {
        return limitvisits;
    }

    public void setLimitvisits(Integer limitvisits) {
        this.limitvisits = limitvisits;
    }

    public String getHospital() {
        return hospital;
    }

    public void setHospital(String hospital) {
        this.hospital = hospital == null ? null : hospital.trim();
    }

    public String getDept() {
        return dept;
    }

    public void setDept(String dept) {
        this.dept = dept == null ? null : dept.trim();
    }
}