package com.jd.tecachieve.service.impl;

import com.jd.tecachieve.domain.Papers;
import com.jd.tecachieve.domain.Patent;
import com.jd.tecachieve.mapper.PapersMapper;
import com.jd.tecachieve.mapper.PatentMapper;
import com.jd.tecachieve.service.PapersService;
import com.jd.tecachieve.vo.PapersQueryVo;
import com.jd.tecachieve.vo.PatentQueryVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class PapersServicelmpl implements PapersService {
    @Autowired
    private PapersMapper papersMapper;

    /**
     * 调用 mapper 的动态插入方法
     */
    @Override
    public void addPaper(Map<String, Object> paperData) {
        papersMapper.dynamicInsertPapers(paperData);
    }



    @Override
    public List<Papers> getAllPapers() {
        return papersMapper.selectAll();
    }

    /**
     * 根据论文ID删除论文记录
     *
     * @param id 要删除的论文ID
     * @return 返回受影响的行数（1 表示成功删除）
     */
    @Override
    public int deletePaperById(int id) {
        return papersMapper.delete(id);
    }

    @Override
    public List<Papers> selectPapersListByPapersQueryVo(PapersQueryVo papersQueryVo) {
        return papersMapper.selectPapersListByPapersQueryVo(papersQueryVo);
    }





}
