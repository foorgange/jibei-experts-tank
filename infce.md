# 接口文档

## 1. 专家管理接口 (`/expert/experts`)

### 1.1 查询专家列表（分页）
- **接口**：`GET /expert/experts/list`
- **权限**：`expert:experts:list`
- **功能**：查询专家属性列表，支持分页。
- **参数**：`ProjectExperts` 对象
- **返回**：`TableDataInfo`

### 1.2 查询所有专家列表
- **接口**：`GET /expert/experts/allList`
- **权限**：`expert:experts:allList`
- **功能**：查询所有专家属性列表。
- **参数**：`ProjectExperts` 对象
- **返回**：`AjaxResult`

### 1.3 导出专家信息
- **接口**：`GET /expert/experts/export`
- **权限**：`expert:experts:export`
- **功能**：导出专家属性列表为 Excel 文件。
- **参数**：`ProjectExperts` 对象
- **返回**：`AjaxResult`

### 1.4 获取专家详情
- **接口**：`GET /expert/experts/{userId}`
- **功能**：获取指定专家的详细信息。
- **路径参数**：`userId` (专家用户ID)
- **返回**：`AjaxResult`

### 1.5 获取个人信息
- **接口**：`GET /expert/experts/myInfo`
- **功能**：获取当前登录专家的详细信息。
- **返回**：`AjaxResult`

### 1.6 新增专家
- **接口**：`POST /expert/experts`
- **权限**：`expert:experts:add`
- **功能**：新增专家属性。
- **请求体**：`ProjectExperts` 对象
- **返回**：`AjaxResult`

### 1.7 专家审核
- **接口**：`POST /expert/experts/examineExperts`
- **功能**：处理专家审核申请。如果用户已存在则更新，不存在则新增。
- **请求体**：`ProjectExperts` 对象 (可选)
- **返回**：`Map<Integer, String>`

### 1.8 修改专家信息
- **接口**：`PUT /expert/experts`
- **权限**：`expert:experts:edit`
- **功能**：修改专家属性，并同步更新用户基本信息。
- **请求体**：`ProjectExperts` 对象
- **返回**：`AjaxResult`

### 1.9 删除专家
- **接口**：`DELETE /expert/experts/{userIds}`
- **权限**：`expert:experts:remove`
- **功能**：批量删除专家属性。
- **路径参数**：`userIds` (专家用户ID数组)
- **返回**：`AjaxResult`

## 2. 项目管理接口 (`/project/projects`)

### 2.1 查询项目列表（分页）
- **接口**：`GET /project/projects/list`
- **功能**：查询项目列表，支持分页。
- **参数**：`Project` 对象
- **返回**：`TableDataInfo`

### 2.2 查询所有项目列表
- **接口**：`GET /project/projects/allList`
- **功能**：查询所有项目列表。
- **参数**：`Project` 对象
- **返回**：`AjaxResult`

### 2.3 导出项目信息
- **接口**：`GET /project/projects/export`
- **功能**：导出项目列表为 Excel 文件。
- **参数**：`Project` 对象
- **返回**：`AjaxResult`

### 2.4 导出个人项目
- **接口**：`GET /project/projects/myexport`
- **功能**：导出当前用户申请的项目列表。
- **参数**：`Project` 对象
- **返回**：`AjaxResult`

### 2.5 获取项目详情
- **接口**：`GET /project/projects/{projectId}`
- **功能**：获取指定项目的详细信息。
- **路径参数**：`projectId` (项目ID)
- **返回**：`AjaxResult`

### 2.6 新增项目
- **接口**：`POST /project/projects`
- **功能**：新增项目，并记录操作日志。会自动设置项目状态为0（待审核），并检查项目名称是否重复。
- **请求体**：`Project` 对象
- **返回**：`AjaxResult`

### 2.7 修改项目
- **接口**：`PUT /project/projects`
- **功能**：修改项目信息，并记录操作日志。会同时更新相关任务状态。
- **请求体**：`Project` 对象
- **返回**：`AjaxResult`

## 3. 技术成果接口 (`/tec/tecachievement`)

### 3.1 统计技术领域数量
- **接口**：`GET /tec/tecachievement/field-counts`
- **功能**：统计技术成果各领域的数量。
- **返回**：`List<Map<String, Object>>`

### 3.2 分析领域占比
- **接口**：`GET /tec/tecachievement/field-percentages`
- **功能**：计算各领域占比并生成分析描述。
- **返回**：`Map<String, Object>`

### 3.3 分析学院统计
- **接口**：`GET /tec/tecachievement/college-statistics/analysis`
- **功能**：分析各学院的技术成果情况。
- **返回**：`Map<String, Object>`

### 3.4 统计技术成熟度
- **接口**：`GET /tec/tecachievement/TechnologyLevelCounts`
- **功能**：获取技术成熟度的统计信息。
- **返回**：`List<Map<String, Object>>`

### 3.5 分析技术成熟度
- **接口**：`GET /tec/tecachievement/TechnologyLevelAnalysis`
- **功能**：获取技术成熟度的分析报告。
- **返回**：`Map<String, Object>`

### 3.6 统计学院成果数量
- **接口**：`GET /tec/tecachievement/college-counts`
- **功能**：统计各学院的成果数量。
- **返回**：`List<Map<String, Object>>`

### 3.7 统计先进程度
- **接口**：`GET /tec/tecachievement/advancement-level-counts`
- **功能**：获取技术先进程度的统计信息。
- **返回**：`List<Map<String, Object>>`

### 3.8 分析先进程度
- **接口**：`GET /tec/tecachievement/advancement-level-analysis`
- **功能**：获取技术先进程度的分析报告。
- **返回**：`Map<String, Object>`

### 3.9 统计合作方式分布
- **接口**：`GET /tec/tecachievement/way-distribution`
- **功能**：获取合作方式的分布统计。
- **返回**：`List<Map<String, Object>>`

### 3.10 分析合作方式分布
- **接口**：`GET /tec/tecachievement/way-distribution/analysis`
- **功能**：获取合作方式的分布分析报告。
- **返回**：`Map<String, Object>`

## 4. 团队管理接口 (`/tec/tecteam`)

### 4.1 查询团队成员列表（分页）
- **接口**：`GET /tec/tecteam/list`
- **功能**：查询团队成员列表，支持分页。
- **参数**：`Tecteam` 对象
- **返回**：`TableDataInfo`

### 4.2 查询所有团队成员列表
- **接口**：`GET /tec/tecteam/allList`
- **功能**：查询所有团队成员列表。
- **参数**：`Tecteam` 对象
- **返回**：`AjaxResult`

### 4.3 导出团队成员
- **接口**：`GET /tec/tecteam/export`
- **功能**：导出团队成员列表为 Excel 文件。
- **参数**：`Tecteam` 对象
- **返回**：`AjaxResult`

### 4.4 获取团队成员详情
- **接口**：`GET /tec/tecteam/{teamId}`
- **功能**：获取指定团队成员的详细信息。
- **路径参数**：`teamId` (团队成员ID)
- **返回**：`AjaxResult`

### 4.5 新增团队成员
- **接口**：`POST /tec/tecteam`
- **功能**：批量新增团队成员。
- **请求体**：`JSONArray`，每个元素是包含团队成员信息的 `JSONObject`。
- **返回**：`AjaxResult`

### 4.6 修改团队成员
- **接口**：`PUT /tec/tecteam`
- **功能**：修改团队成员信息。
- **请求体**：`Tecteam` 对象
- **返回**：`AjaxResult`

### 4.7 删除团队成员
- **接口**：`DELETE /tec/tecteam/{teamIds}`
- **功能**：批量删除团队成员。
- **路径参数**：`teamIds` (团队成员ID数组)
- **返回**：`AjaxResult`

## 5. 专利管理接口 (`/api/patents`)

### 5.1 获取专利趋势分析摘要
- **接口**：`GET /api/patents/PatentTrendSummary`
- **功能**：获取专利趋势分析的季度总结。
- **返回**：`String`

### 5.2 根据名称查询专利详情
- **接口**：`GET /api/patents/get-by-name`
- **功能**：根据专利名称查询专利详情。
- **请求参数**：`patentName` (专利名称)
- **返回**：`Map<String, Object>`

### 5.3 查询发明人所有专利
- **接口**：`GET /api/patents/inventorPatentName`
- **功能**：获取指定发明人的所有专利。
- **请求参数**：`inventorName` (发明人姓名)
- **返回**：`List<Patent>`

### 5.4 统计发明人IPC分类
- **接口**：`GET /api/patents/ipc-distribution`
- **功能**：统计发明人专利的IPC分类首字母分布。
- **请求参数**：`inventorName` (发明人姓名)
- **返回**：`List<Map<String, Object>>`

### 5.5 分析IPC分类占比
- **接口**：`GET /api/patents/ipcCategoryProportions`
- **功能**：获取所有专利IPC分类的占比分析结果。
- **返回**：`Map<String, Object>`

### 5.6 统计发明人年度专利数
- **接口**：`POST /api/patents/countByYear`
- **功能**：统计发明人每年的专利申请数量。
- **请求参数**：`inventorName` (发明人姓名)
- **返回**：`List<Map<String, Object>>`

### 5.7 统计年月专利数
- **接口**：`GET /api/patents/PatentCountByYearMonth`
- **功能**：获取每年每月的专利申请数量统计。
- **返回**：`List<Map<String, Object>>`

### 5.8 新增专利信息
- **接口**：`POST /api/patents/addPatentInfo`
- **功能**：添加新的专利信息。
- **请求体**：`Map<String, Object>`
- **返回**：`ResponseEntity<Void>` (204 No Content)

### 5.9 新增专利统计数据
- **接口**：`POST /api/patents/addPatentData`
- **功能**：添加专利统计数据。
- **请求体**：`Map<String, Object>`
- **返回**：`String`

### 5.10 新增专利分类记录
- **接口**：`POST /api/patents/insertPatentClass`
- **功能**：插入一条专利分类记录。
- **请求体**：`Map<String, Object>`
- **返回**：`String`

### 5.11 删除专利信息
- **接口**：`DELETE /api/patents/{id}`
- **功能**：根据ID删除专利信息。
- **路径参数**：`id` (专利ID)
- **返回**：`String`

### 5.12 更新专利信息
- **接口**：`PUT /api/patents/{id}`
- **功能**：更新指定ID的专利信息。
- **路径参数**：`id` (专利ID)
- **请求参数**：`patentName`, `collaborator`, `operationType` (均为可选)
- **返回**：`String`

### 5.13 更新专利字段
- **接口**：`POST /api/patents/updatePatentFields`
- **功能**：更新专利的指定字段。
- **请求参数**：`id`, `field`, `fieldValue`, `countField`, `countValue` (均为可选)
- **返回**：`ResponseEntity<String>`

### 5.14 查询所有专利分类
- **接口**：`GET /api/patents/PatentClass`
- **功能**：查询所有专利分类信息。
- **返回**：`List<Map<String, Object>>`

## 6. 专利统计接口 (`/api/patentCounts`)

### 6.1 获取专利等级总数
- **接口**：`GET /api/patentCounts/grades/total`
- **功能**：获取A到E级专利的总数统计。
- **返回**：`Map<String, Object>`

### 6.2 获取总数统计
- **接口**：`GET /api/patentCounts/total-counts`
- **功能**：获取总数统计。
- **返回**：`Map<String, Object>`

### 6.3 获取所有专利统计
- **接口**：`GET /api/patentCounts`
- **功能**：获取所有专利数量的完整列表。
- **返回**：`ResponseEntity<List<PatentTotal>>`
  - teamBirthday (出生日期)
  - teamJobTitle (职称)
  - teamJobAddress (工作单位)

### 5.6 修改团队成员
- 接口：`PUT /tec/tecteam`
- 功能：修改团队成员信息

### 5.7 删除团队成员
- 接口：`DELETE /tec/tecteam/{teamIds}`
- 功能：批量删除团队成员

## 6. 知识产权类型管理接口

### 6.1 知识产权类型列表
- 接口：`GET /property/type/list`
- 功能：查询知识产权类型列表
- 分页：是

### 6.2 获取所有知识产权类型
- 接口：`GET /property/type/allList`
- 权限：`property:type:allList`
- 功能：查询所有知识产权类型列表
- 分页：否

### 6.3 导出知识产权类型
- 接口：`GET /property/type/export`
- 权限：`property:type:export`
- 功能：导出知识产权类型列表

### 6.4 获取知识产权类型详情
- 接口：`GET /property/type/{propertyTypeId}`
- 权限：`property:type:query`
- 功能：获取指定知识产权类型的详细信息

### 6.5 新增知识产权类型
- 接口：`POST /property/type`
- 权限：`property:type:add`
- 功能：新增知识产权类型

### 6.6 修改知识产权类型
- 接口：`PUT /property/type`
- 权限：`property:type:edit`
- 功能：修改知识产权类型信息

### 6.7 删除知识产权类型
- 接口：`DELETE /property/type/{propertyTypeIds}`
- 权限：`property:type:remove`
- 功能：批量删除知识产权类型

## 7. 学院管理接口

### 7.1 查询学院详细信息
- 接口：`POST /tec/getTecCollegeInfo/{tecCollegeID}`
- 功能：获取指定学院的详细信息

### 7.2 查询学院列表
- 接口：`POST /tec/getTecCollegeList`
- 功能：查询学院列表

## 8. 论文管理接口

### 8.1 新增论文
- 接口：`POST /api/Papers/addPaper`
- 功能：新增论文信息

### 8.2 删除论文
- 接口：`DELETE /api/Papers/delete/{id}`
- 功能：删除指定ID的论文信息

### 8.3 获取所有论文
- 接口：`GET /api/Papers/list`
- 功能：获取所有论文信息

### 8.4 根据条件查询论文
- 接口：`POST /api/Papers/getListByPapersQueryVo`
- 功能：根据查询条件获取论文信息
- 分页：是

## 9. 纵向课题接口

### 9.1 纵向课题列表
- 接口：`GET /system/verticaltopic/list`
- 功能：查询纵向课题列表
- 分页：是

### 9.2 获取所有纵向课题
- 接口：`GET /system/verticaltopic/allList`
- 功能：查询所有纵向课题列表
- 分页：否

### 9.3 导出纵向课题
- 接口：`GET /system/verticaltopic/export`
- 功能：导出纵向课题列表

### 9.4 获取纵向课题详情
- 接口：`GET /system/verticaltopic/{topicId}`
- 功能：获取指定纵向课题的详细信息

### 9.5 新增纵向课题
- 接口：`POST /system/verticaltopic`
- 功能：新增纵向课题

### 9.6 批量新增纵向课题
- 接口：`POST /system/verticaltopic/addTecVerticaltopicList`
- 功能：批量新增纵向课题

### 9.7 修改纵向课题
- 接口：`PUT /system/verticaltopic`
- 功能：修改纵向课题信息

### 9.8 批量修改纵向课题
- 接口：`PUT /system/verticaltopic/updateTecVerticaltopicList`
- 功能：批量修改纵向课题信息

### 9.9 删除纵向课题
- 接口：`DELETE /system/verticaltopic/{topicIds}`
- 功能：批量删除纵向课题

## 10. 知识产权管理接口

### 10.1 知识产权列表
- 接口：`GET /property/propertys/list`
- 功能：查询知识产权列表
- 分页：是

### 10.2 获取所有知识产权
- 接口：`GET /property/propertys/allList`
- 功能：查询所有知识产权列表
- 分页：否

### 10.3 导出知识产权
- 接口：`GET /property/propertys/export`
- 功能：导出知识产权列表

### 10.4 获取知识产权详情
- 接口：`GET /property/propertys/{propertyId}`
- 功能：获取指定知识产权的详细信息

### 10.5 新增知识产权
- 接口：`POST /property/propertys/addWithFile`
- 功能：新增知识产权（支持文件上传）