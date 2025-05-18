package com.jb.expert.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.jb.expert.domain.PassCode;
import com.jb.expert.service.IPassCodeService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 通行码管理Controller
 *
 * @author ruoyi
 * @date 2022-02-21
 */
@RestController
@RequestMapping("/expert/code")
public class PassCodeController extends BaseController
{
    @Autowired
    private IPassCodeService passCodeService;

    /**
     * 查询通行码管理列表
     */
    @PreAuthorize("@ss.hasPermi('expert:code:list')")
    @GetMapping("/list")
    public TableDataInfo list(PassCode passCode)
    {
        startPage();
        List<PassCode> list = passCodeService.selectPassCodeList(passCode);
        return getDataTable(list);
    }

    /**
     * 通行码验证
     */
    @PostMapping("/register")
    public Map<Integer, String> register(@RequestBody PassCode passCode)
    {
        return passCodeService.register(passCode);
    }

    /**
     * 查询所有通行码管理列表
     */
    @PreAuthorize("@ss.hasPermi('expert:code:allList')")
    @GetMapping("/allList")
    public AjaxResult allList(PassCode passCode)
    {
        List<PassCode> list = passCodeService.selectPassCodeList(passCode);
        return AjaxResult.success(list);
    }



    /**
     * 导出通行码管理列表
     */
    @PreAuthorize("@ss.hasPermi('expert:code:export')")
    @Log(title = "通行码管理", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(PassCode passCode)
    {
        List<PassCode> list = passCodeService.selectPassCodeList(passCode);
        ExcelUtil<PassCode> util = new ExcelUtil<PassCode>(PassCode.class);
        return util.exportExcel(list, "通行码");
    }

    /**
     * 获取通行码管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('expert:code:query')")
    @GetMapping(value = "/{passCodeId}")
    public AjaxResult getInfo(@PathVariable("passCodeId") Long passCodeId)
    {
        return AjaxResult.success(passCodeService.selectPassCodeByPassCodeId(passCodeId));
    }

    /**
     * 新增通行码管理
     */
    @PreAuthorize("@ss.hasPermi('expert:code:add')")
    @Log(title = "通行码管理", businessType = BusinessType.INSERT)
    @PostMapping
    public Map<String,Integer> add(@RequestBody PassCode passCode)
    {
        Map<String,Integer> map = new HashMap<>();

        PassCode passCodeValue1 = new PassCode();
        PassCode passCodeValue2 = new PassCode();

        //验证通行码或者专家名称是否有重复
        passCodeValue1.setPassCodeValue(passCode.getPassCodeValue());
        passCodeValue2.setUserName(passCode.getUserName());

        List<PassCode> passCodes1 = passCodeService.selectPassCodeList(passCodeValue1);
        List<PassCode> passCodes2 = passCodeService.selectPassCodeList(passCodeValue2);

//        System.out.println(passCodes1+"List");
//        System.out.println(null == passCodes || passCodes.size() ==0);

        //对通行码和姓名的查询都为空的情况，说明表中没有相同的名字或通行码
        if((null == passCodes1 || passCodes1.size() ==0) && (null == passCodes2 || passCodes2.size() ==0)){
            int res = passCodeService.insertPassCode(passCode);
            if(res>0){
                map.put("101",101);//该通行码成功添加
                return map;
            }
            map.put("102",102);//未知错误
            return map;
        }
        map.put("103",103);//该通行码或专家名称已存在
        return map;
    }

    /**
     * 修改通行码管理
     */
    @PreAuthorize("@ss.hasPermi('expert:code:edit')")
    @Log(title = "通行码管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody PassCode passCode)
    {
        return toAjax(passCodeService.updatePassCode(passCode));
    }

    /**
     * 删除通行码管理
     */
    @PreAuthorize("@ss.hasPermi('expert:code:remove')")
    @Log(title = "通行码管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{passCodeIds}")
    public AjaxResult remove(@PathVariable Long[] passCodeIds)
    {
        return toAjax(passCodeService.deletePassCodeByPassCodeIds(passCodeIds));
    }

}
