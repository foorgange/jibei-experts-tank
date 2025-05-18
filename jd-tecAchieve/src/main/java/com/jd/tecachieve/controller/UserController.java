package com.jd.tecachieve.controller;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.SecurityUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/user")
public class UserController extends BaseController {

    @GetMapping("/getDeptId")
    public AjaxResult deptId(){
        return AjaxResult.success(SecurityUtils.getLoginUser().getDeptId());
    }
}
