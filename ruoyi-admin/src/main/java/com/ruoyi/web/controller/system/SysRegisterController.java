package com.ruoyi.web.controller.system;

import com.jb.expert.domain.PassCode;
import com.jb.expert.service.IPassCodeService;
import com.ruoyi.common.core.domain.entity.SysRole;
import com.ruoyi.system.service.ISysUserService;
import com.ruoyi.system.service.impl.SysRoleServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.model.RegisterBody;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.framework.web.service.SysRegisterService;
import com.ruoyi.system.service.ISysConfigService;

/**
 * 注册验证
 * 
 * @author ruoyi
 */
@RestController
public class SysRegisterController extends BaseController
{
    @Autowired
    private SysRegisterService registerService;

    @Autowired
    private ISysConfigService configService;

    @Autowired
    private IPassCodeService iPassCodeService;

    @Autowired
    private SysRoleServiceImpl sysRoleService;

    @Autowired
    private ISysUserService iSysUserService;

    @PostMapping("/register")
    public AjaxResult register(@RequestBody RegisterBody user)
    {

        if (!("true".equals(configService.selectConfigByKey("sys.account.registerUser"))))
        {
            return error("当前系统没有开启注册功能！");
        }
        user.setDeptId(1L);
        String msg = registerService.register(user);
        if (msg == ""){
            PassCode passCode = new PassCode();
            passCode.setUserName(user.getNickName());
            iPassCodeService.usePassCode(passCode);
            Long userId = iSysUserService.selectUserByUserName(user.getUsername()).getUserId();
            sysRoleService.addUserRole(2L,userId);
        }
        return StringUtils.isEmpty(msg) ? success() : error(msg);
    }
}
