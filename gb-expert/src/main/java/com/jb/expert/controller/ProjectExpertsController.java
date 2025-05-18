package com.jb.expert.controller;

import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import com.alibaba.fastjson.JSON;
import com.jb.expert.domain.ProjectUserApply;
import com.jb.expert.service.IProjectUserApplyService;
import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.core.domain.entity.SysRole;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.SysUserRole;
import com.ruoyi.system.service.ISysRoleService;
import com.ruoyi.system.service.ISysUserService;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.jb.expert.domain.ProjectExperts;
import com.jb.expert.service.IProjectExpertsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 专家属性Controller
 *
 * @author ruoyi
 * @date 2022-02-21
 */
@RestController
@RequestMapping("/expert/experts")
public class ProjectExpertsController extends BaseController {
    @Autowired
    private IProjectExpertsService projectExpertsService;

    @Autowired
    private ISysUserService userService;

    @Autowired
    private IProjectUserApplyService projectUserApplyService;

    @Autowired
    private ISysRoleService sysRoleService;

    @Autowired
    ISysUserService sysUserService;
    /**
     * 查询专家属性列表
     */
    @PreAuthorize("@ss.hasPermi('expert:experts:list')")
    @GetMapping("/list")
    public TableDataInfo list(ProjectExperts projectExperts) {
        startPage();
        List<ProjectExperts> list = projectExpertsService.selectProjectExpertsList(projectExperts);
        return getDataTable(list);
    }

    /**
     * 查询所有专家属性列表
     */
    @PreAuthorize("@ss.hasPermi('expert:experts:allList')")
    @GetMapping("/allList")
    public AjaxResult allList(ProjectExperts projectExperts) {
        List<ProjectExperts> list = projectExpertsService.selectProjectExpertsList(projectExperts);
        return AjaxResult.success(list);
    }


    /**
     * 导出专家属性列表
     */
    @PreAuthorize("@ss.hasPermi('expert:experts:export')")
    @Log(title = "专家属性", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(ProjectExperts projectExperts) {
        List<ProjectExperts> list = projectExpertsService.selectProjectExpertsList(projectExperts);
        ExcelUtil<ProjectExperts> util = new ExcelUtil<ProjectExperts>(ProjectExperts.class);
        return util.exportExcel(list, "专家属性数据");
    }

    /**
     * 获取专家属性详细信息
     */
    @GetMapping(value = "/{userId}")
    public AjaxResult getInfo(@PathVariable("userId") Long userId) {

        return AjaxResult.success(projectExpertsService.selectProjectExpertsByUserId(userId));
    }

    /**
     * 获取专家属性详细信息
     */
    @GetMapping(value = "/myInfo")
    public AjaxResult getMyInfo() {
        LoginUser loginUser = getLoginUser();
        Long userId = loginUser.getUserId();

        return AjaxResult.success(projectExpertsService.selectProjectExpertsByUserId(userId));
    }

    /**
     * 新增专家属性
     */
    @PreAuthorize("@ss.hasPermi('expert:experts:add')")
    @Log(title = "专家属性", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ProjectExperts projectExperts) {
        return toAjax(projectExpertsService.insertProjectExperts(projectExperts));
    }

    /**
     * 添加审核
     */
    @PostMapping("/examineExperts")
    public Map<Integer, String> examineExperts(@RequestBody(required = false) ProjectExperts projectExperts) {
        Map<Integer, String> map = new HashMap<>();
        if (projectExperts.getUserId() == null) {
            map.put(99, "非法申请");
            return map;
        } else {
            ProjectExperts projectExperts1 = projectExpertsService.selectProjectExpertsByUserId(projectExperts.getUserId());
            if (null == projectExperts1) {
                projectExperts.setCreateTime(DateUtils.getNowDate());
                projectExperts.setUserStatus(0L);
                int result = projectExpertsService.insertProjectExperts(projectExperts);
                if (result > 0) {
                    map.put(101, "申请成功");
                    return map;
                }
                map.put(102, "申请失败,联系管理员");
                return map;

            }
            projectExperts.setCreateTime(DateUtils.getNowDate());
            projectExperts.setUserStatus(0L);
            int result = projectExpertsService.updateProjectExperts(projectExperts);
            if (result > 0) {
                map.put(100, "重新申请成功");
                return map;
            }
            map.put(102, "申请失败,联系管理员");
            return map;
        }

    }

    /**
     * 修改专家属性
     */
    @PreAuthorize("@ss.hasPermi('expert:experts:edit')")
    @Log(title = "专家属性", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ProjectExperts projectExperts) {

        SysUser user = new SysUser();
        SysUser oldUser = userService.selectUserById(projectExperts.getUserId());

        user.setUserId(projectExperts.getUserId());
        user.setAvatar(projectExperts.getAvatar());
        user.setEmail(projectExperts.getEmail());
        user.setNickName(projectExperts.getNickName());
        user.setPhonenumber(projectExperts.getPhoneNumber());
        user.setDeptId(projectExperts.getDeptId());

        user.setPostIds(oldUser.getPostIds());
        user.setRoleIds(oldUser.getRoleIds());

        userService.checkUserAllowed(user);
        if (StringUtils.isNotEmpty(user.getPhonenumber())
                && UserConstants.NOT_UNIQUE.equals(userService.checkPhoneUnique(user))) {
            return AjaxResult.error("修改用户'" + user.getUserName() + "'失败，手机号码已存在");
        } else if (StringUtils.isNotEmpty(user.getEmail())
                && UserConstants.NOT_UNIQUE.equals(userService.checkEmailUnique(user))) {
            return AjaxResult.error("修改用户'" + user.getUserName() + "'失败，邮箱账号已存在");
        }
        user.setUpdateBy(getUsername());
        int i = userService.updateUser(user);
        if (i > 0) {
            return toAjax(projectExpertsService.updateProjectExperts(projectExperts));
        } else {
            return AjaxResult.error("修改用户'" + user.getUserName() + "'失败，修改用户基本信息出错,请联系管理员");
        }
    }

    /**
     * 删除专家属性
     */
    @PreAuthorize("@ss.hasPermi('expert:experts:remove')")
    @Log(title = "专家属性", businessType = BusinessType.DELETE)
    @DeleteMapping("/{userIds}")
    public AjaxResult remove(@PathVariable Long[] userIds) {
        return toAjax(projectExpertsService.deleteProjectExpertsByUserIds(userIds));
    }

    /**
     * 通过审核按钮
     */
    @Log(title = "专家属性", businessType = BusinessType.UPDATE)
    @PutMapping("/examine")
    public Map<Integer, String> editExpertInfo(@RequestBody ProjectExperts projectExperts) {
        Map<Integer, String> map = new HashMap<>();
        if (projectExperts.getUserStatus() == null) {
            map.put(99, "非法请求");
            return map;
        } else {
            int res = projectExpertsService.updateProjectExperts(projectExperts);
            // 0 未审核 1 审核通过
            SysUserRole isExist = sysRoleService.getUserRole(3L, projectExperts.getUserId());


            // 如果审核状态为通过
            if (projectExperts.getUserStatus() == 1) {
                if (isExist == null) {
                    sysRoleService.addUserRole(3L, projectExperts.getUserId());
                }
                //审核状态为驳回
            } else if (projectExperts.getUserStatus() == 0) {
                if (isExist != null) {
                    sysRoleService.deleteAuthUser(isExist);
                }
            } else {

            }
            LoginUser loginUser = getLoginUser();
            Long userId = loginUser.getUserId();
            if (res > 0) {
                // 根据修改后的专家来查找其相关信息
                ProjectExperts ps = projectExpertsService.selectProjectExpertsByUserId(projectExperts.getUserId());

                ProjectUserApply projectUserApply = new ProjectUserApply();
                projectUserApply.setUserId(ps.getNickName());
                projectUserApply.setExamineStatus(ps.getUserStatus());
                projectUserApply.setExamineTime(DateUtils.getNowDate());
                projectUserApply.setCreateTime(ps.getCreateTime());
                projectUserApply.setExamineUserId(userId);
                projectUserApply.setExamineRemark(projectExperts.getExamineRemark());

                // 添加审核记录
                int a = projectUserApplyService.insertProjectUserApply(projectUserApply);

                map.put(100, "请求成功");
                return map;
            }
            map.put(101, "请求失败联系管理员");
            return map;
        }
    }

    // 获取专家等级比例的方法
    @GetMapping("/expertProportionData")
    @ResponseBody
    public Map<String, List> getExpertProportion(){
        Map<String,List> list = projectExpertsService.selectExpertNumByStar();
        list.put("length", Collections.singletonList(list.size()));
        return list;
    }

    // 获取新增专家的方法
    @GetMapping("/newExpertNumData")
    @ResponseBody
    public Map<String,List> getNewExpertInOneWeek(){
        // 根据range返回对应天数的数据
        Map<String, List> resultMap = projectExpertsService.selectNewExpertByRange(7);
        return resultMap;
    }

}

