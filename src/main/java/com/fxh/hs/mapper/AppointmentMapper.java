package com.fxh.hs.mapper;

import com.fxh.hs.entity.Appointment;
import com.fxh.hs.entity.AppointmentExample;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface AppointmentMapper {
    int countByExample(AppointmentExample example);

    int deleteByExample(AppointmentExample example);

    int deleteByPrimaryKey(Integer aid);

    int insert(Appointment record);

    int insertSelective(Appointment record);

    List<Appointment> selectByExampleWithBLOBs(AppointmentExample example);

    List<Appointment> selectByExample(AppointmentExample example);

    Appointment selectByPrimaryKey(Integer aid);

    int updateByExampleSelective(@Param("record") Appointment record, @Param("example") AppointmentExample example);

    int updateByExampleWithBLOBs(@Param("record") Appointment record, @Param("example") AppointmentExample example);

    int updateByExample(@Param("record") Appointment record, @Param("example") AppointmentExample example);

    int updateByPrimaryKeySelective(Appointment record);

    int updateByPrimaryKeyWithBLOBs(Appointment record);

    int updateByPrimaryKey(Appointment record);
    
    int setInfo(Map<String, Object> map);
}