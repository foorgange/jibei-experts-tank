package com.jd.tecachieve.service;

import com.jd.tecachieve.domain.Papers;
import com.jd.tecachieve.domain.Patent;
import com.jd.tecachieve.vo.PapersQueryVo;
import com.jd.tecachieve.vo.PatentQueryVo;

import java.util.List;
import java.util.Map;

public interface PapersService {

    List<Papers> getAllPapers();

    List<Papers> selectPapersListByPapersQueryVo(PapersQueryVo papersQueryVo);

    /**
     * 根据论文ID删除论文
     *
     * @param id 要删除的论文ID
     * @return 返回受影响的行数
     */
    int deletePaperById(int id);

    void addPaper(Map<String, Object> paperData);
}
