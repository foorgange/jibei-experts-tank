package com.jd.tecachieve.mapper;

import com.jd.tecachieve.domain.Papers;
import com.jd.tecachieve.domain.Patent;
import com.jd.tecachieve.vo.PapersQueryVo;
import com.jd.tecachieve.vo.PatentQueryVo;
import org.springframework.stereotype.Repository;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Repository
public interface PapersMapper {


    /**
     * 动态插入论文信息。
     * @param params 包含所有可能用于插入的数据的Map。
     */
    void dynamicInsertPapers(@Param("params") Map<String, Object> params);


    /**
     * 根据ID删除论文记录
     *
     * @param id 论文的唯一标识（主键）
     * @return 返回受影响的行数（通常为1，表示删除成功）
     */
    int delete(int id);


    /**
     * 查询所有论文
     */
    List<Papers> selectAll();


    List<Papers> selectPapersListByPapersQueryVo(PapersQueryVo papersQueryVo);


}
