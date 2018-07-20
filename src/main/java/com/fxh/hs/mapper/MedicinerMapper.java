package com.fxh.hs.mapper;

import com.fxh.hs.entity.Mediciner;
import com.fxh.hs.entity.MedicinerExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface MedicinerMapper {
    int countByExample(MedicinerExample example);

    int deleteByExample(MedicinerExample example);

    int deleteByPrimaryKey(Integer mid);

    int insert(Mediciner record);

    int insertSelective(Mediciner record);
    
    List<Integer> selectMid(String hospital);
    
    List<Mediciner> selectMedicinerByWhat(String what);

    List<Mediciner> selectByExample(MedicinerExample example);

    Mediciner selectByPrimaryKey(Integer mid);

    int updateByExampleSelective(@Param("record") Mediciner record, @Param("example") MedicinerExample example);

    int updateByExample(@Param("record") Mediciner record, @Param("example") MedicinerExample example);

    int updateByPrimaryKeySelective(Mediciner record);

    int updateByPrimaryKey(Mediciner record);
    
}