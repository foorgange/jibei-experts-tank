package com.jb.expert.service.impl;

import java.text.ParsePosition;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.constant.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jb.expert.mapper.PassCodeMapper;
import com.jb.expert.domain.PassCode;
import com.jb.expert.service.IPassCodeService;
import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.RegisterBody;
import com.ruoyi.common.core.redis.RedisCache;
import com.ruoyi.common.exception.user.CaptchaException;
import com.ruoyi.common.exception.user.CaptchaExpireException;
import com.ruoyi.common.utils.MessageUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.service.ISysConfigService;
import com.ruoyi.system.service.ISysUserService;

/**
 * 通行码管理Service业务层处理
 *
 * @author ruoyi
 * @date 2022-02-21
 */
@Service
public class PassCodeServiceImpl implements IPassCodeService {
    @Autowired
    private PassCodeMapper passCodeMapper;

    @Autowired
    private ISysConfigService configService;

    @Autowired
    private RedisCache redisCache;
    /**
     * 查询通行码管理
     *
     * @param passCodeId 通行码管理主键
     * @return 通行码管理
     */
    @Override
    public PassCode selectPassCodeByPassCodeId(Long passCodeId) {
        return passCodeMapper.selectPassCodeByPassCodeId(passCodeId);
    }

    /**
     * 查询通行码管理列表
     *
     * @param passCode 通行码管理
     * @return 通行码管理
     */
    @Override
    public List<PassCode> selectPassCodeList(PassCode passCode) {
        return passCodeMapper.selectPassCodeList(passCode);
    }

    @Override
    public Map<Integer, String> register(PassCode passCode) {
        Map<Integer, String> map = new HashMap<>();
        boolean captchaOnOff = configService.selectCaptchaOnOff();
        // 验证码开关
        if (captchaOnOff)
        {
            validateCaptcha(passCode.getUserName(), passCode.getCode(), passCode.getUuid());
        }
        PassCode passCode1 = passCodeMapper.selectPassCodeByPassCodeValue(passCode.getPassCodeValue());
        if (null == passCode1 || passCode1.getPassCodeValue().equals("")) {
            map.put(101, "该通行码不存在");
        } else {
            if (passCode1.getCodeStatus().equals("1")) {
                map.put(105, "通行码已使用");
            } else if (passCode1.getCodeStatus().equals("2")) {
                map.put(104, "该通行码已过期");
            } else {
                Date createTime = passCode1.getCreateTime();
                Date nowDate = DateUtils.getNowDate();
                long diff = nowDate.getTime() - createTime.getTime();//这样得到的差值是毫秒级别
                long days = diff / (1000 * 60 * 60 * 24);
                if (days > 30) {
                    passCode.setPassCodeId(passCode1.getPassCodeId());
                    passCode.setUseTime(DateUtils.getNowDate());
                    passCode.setCodeStatus("2");
                    passCodeMapper.updatePassCode(passCode);
                    map.put(104, "该通行码已过期");
                } else {
                    if (passCode1.getUserName().equals(passCode.getUserName())) {
                        map.put(103, "通行成功");
                    } else {
                        map.put(102, "专家姓名与通行码不匹配");
                    }
                }
            }

        }
        return map;
    }

    /**
     * 新增通行码管理
     *
     * @param passCode 通行码管理
     * @return 结果
     */
    @Override
    public int insertPassCode(PassCode passCode) {
        passCode.setCreateTime(DateUtils.getNowDate());
        return passCodeMapper.insertPassCode(passCode);
    }

    /**
     * 修改通行码管理
     *
     * @param passCode 通行码管理
     * @return 结果
     */
    @Override
    public int updatePassCode(PassCode passCode) {
        return passCodeMapper.updatePassCode(passCode);
    }

    /**
     * 使用通行码
     *
     * @param passCode
     * @return
     */
    @Override
    public int usePassCode(PassCode passCode) {
        PassCode passCode1 = passCodeMapper.selectPassCodeByPassCodeUserName(passCode.getUserName());
        passCode.setPassCodeId(passCode1.getPassCodeId());
        passCode.setUseTime(DateUtils.getNowDate());
        passCode.setCodeStatus("1");
        return passCodeMapper.updatePassCode(passCode);
    }

    /**
     * 批量删除通行码管理
     *
     * @param passCodeIds 需要删除的通行码管理主键
     * @return 结果
     */
    @Override
    public int deletePassCodeByPassCodeIds(Long[] passCodeIds) {
        return passCodeMapper.deletePassCodeByPassCodeIds(passCodeIds);
    }

    /**
     * 删除通行码管理信息
     *
     * @param passCodeId 通行码管理主键
     * @return 结果
     */
    @Override
    public int deletePassCodeByPassCodeId(Long passCodeId) {
        return passCodeMapper.deletePassCodeByPassCodeId(passCodeId);
    }

    public void validateCaptcha(String username, String code, String uuid)
    {
        String verifyKey = Constants.CAPTCHA_CODE_KEY + uuid;
        String captcha = redisCache.getCacheObject(verifyKey);
        redisCache.deleteObject(verifyKey);
        if (captcha == null)
        {
            throw new CaptchaExpireException();
        }
        if (!code.equalsIgnoreCase(captcha))
        {
            throw new CaptchaException();
        }
    }
}
