# 吉北专家库系统（jibei-experts-tank）

## 项目概述

吉北专家库系统（jibei-experts-tank）是一个集专家资源管理、项目任务协作、专利数据统计与分析于一体的综合性平台。系统基于 Java Spring 生态开发，提供了丰富的功能模块，支持多维度数据统计分析、项目全生命周期管理及专家资源高效调配，旨在为科研机构、企业提供专业化的专家与项目管理解决方案。

## 核心模块详解

### 1. 专利数据统计与分析模块（jd-tecAchieve）

#### 1.1 功能亮点

- **多维度专利数据分析**：支持按技术领域、技术先进度、合作方式等维度进行统计分析
- **自然语言报告生成**：自动生成可视化分析报告，包含占比统计、趋势解读及建议
- **时间序列分析**：提供专利申请 / 授权的月度分布统计

#### 1.2 核心组件

- **PatentTrendAnalyzer**：专利趋势分析工具类
  java

  运行

  ```java
  // 领域占比分析示例
  public Map<String, Object> analyzeFieldPercentages(List<Map<String, Object>> fieldCounts) {
      // 计算总记录数
      // 生成各领域占比统计
      // 生成自然语言描述（包含top3领域、最高/最低占比领域分析）
  }
  ```

    - 支持 13 个技术领域（电子信息、先进制造等）的占比分析
    - 技术先进度等级（国内领先、国际先进等 6 级）分布分析
    - 合作方式（技术转让、专利许可等 9 种）分布统计
- **核心实体与 VO**

    - `PatentTotal`：存储专利总数统计（申请量、授权量等）
    - `PatentQueryVo`：专利查询参数封装（公开号、申请人等）
    - `PatentCountByMonth`：专利月度统计数据模型

#### 1.3 关键接口

| 接口地址 | 方法 | 功能描述         | 返回示例                     |
| ---------- | ------ | ------------------ | ------------------------------ |
| `/tec/tecachievement/field-percentages`         | GET  | 技术领域占比分析 | `{"total": 120, "percentages": [{"field": "电子信息", "percentage": "35.50%"}], "description": "..."}`                             |
| `/tec/tecachievement/advancement-level-analysis`         | GET  | 技术先进度分析   | 包含各级别占比及自然语言解读 |
| `/tec/tecachievement/way-distribution/analysis`         | GET  | 合作方式分布分析 | 合作方式占比及趋势分析       |
| `/patent/`         | GET  | 获取所有专利信息 | 专利列表数据                 |

### 2. 项目任务管理模块（gb-project）

#### 2.1 功能亮点

- **项目全流程管理**：支持项目创建、编辑、删除、状态跟踪
- **任务书管理**：支持任务书上传、更新及版本控制
- **团队协作**：专家加入 / 退出项目、角色权限管理
- **操作日志**：记录项目关键操作（创建、修改、加入等）

#### 2.2 核心功能实现

- **任务书上传**
  java

  运行

  ```java
  @PostMapping("/uploadBook")
  public AjaxResult uploadBook(@RequestParam("file") MultipartFile file, 
                              @RequestParam("task") String task) throws IOException {
      // 解析任务信息
      // 上传文件到指定路径（RuoYiConfig.getBookPath()）
      // 记录操作日志
      // 更新任务状态
  }
  ```
- **项目状态管理**

    - 支持项目状态流转（待审核→组建中→组建完成等）
    - 提供任务完成状态批量查询：`selectProjectStatusByProjectId`
- **项目成员管理**

    - 支持专家加入项目（含人数限制校验）
    - 按专家级别（高级 / 中级 / 初级）统计团队组成

#### 2.3 关键接口

| 接口地址 | 方法 | 功能描述         |
| ---------- | ------ | ------------------ |
| `/project/projects`         | POST | 创建新项目       |
| `/project/projects/{projectId}`         | GET  | 获取项目详情     |
| `/project/task/uploadBook`         | POST | 上传任务书       |
| `/project/projects/joinProject`         | POST | 加入项目         |
| `/project/checkTask/{checkTaskId}`         | GET  | 获取审核任务详情 |

### 3. 专家管理模块（gb-expert）

#### 3.1 核心功能

- **专家信息管理**：个人信息查询、专业领域管理
- **专家类别管理**：支持专家分类查询与维护
- **项目关联**：专家参与项目记录与状态跟踪

#### 3.2 关键接口

| 接口地址 | 方法 | 功能描述         |
| ---------- | ------ | ------------------ |
| `/expert/projectExperts/myInfo`         | GET  | 获取当前专家信息 |
| `/expert/major/{majorId}`         | GET  | 获取专业详情     |
| `/expert/class/{classId}`         | GET  | 获取专家类别详情 |

### 4. 系统核心模块（ruoyi-common）

- **配置管理**：系统路径配置（`RuoYiConfig.getBookPath()` 等）
- **安全工具**：用户认证与权限控制（`LoginUser` 类）
- **通用组件**：文件处理、HTML 过滤等工具类

### 5. 后台管理模块（ruoyi-admin）

- **用户管理**：用户信息维护、角色权限分配
- **字典管理**：系统参数配置与查询
- **接口文档**：集成 Swagger 生成 API 文档

## 技术架构详解

- **后端框架**：Spring Boot + Spring Security
- **数据访问**：MyBatis（通过 Mapper 接口实现数据库操作）
- **API 风格**：RESTful 接口设计，统一返回`AjaxResult`格式
- **数据格式**：JSON（前后端数据交互标准）
- **权限控制**：基于`@PreAuthorize`注解的方法级权限控制
- **文件存储**：本地文件系统（通过`FileUploadUtils`管理）

## 快速开始指南

### 环境要求

- JDK 1.8+
- Maven 3.6+
- MySQL 8.0+
- 浏览器：Chrome 80+ / Firefox 75+

### 部署步骤

1. **克隆代码仓库**
   bash

    ```bash
    git clone [仓库地址]
    cd jibei-experts-tank
    ```
2. **配置数据库**

    - 创建数据库：`CREATE DATABASE jibei_experts DEFAULT CHARACTER SET utf8mb4;`
    - 修改配置文件：`ruoyi-admin/src/main/resources/application-druid.yml`
      yaml

      ```yaml
      spring:
        datasource:
          driver-class-name: com.mysql.cj.jdbc.Driver
          url: jdbc:mysql://localhost:3306/jibei_experts?useUnicode=true&characterEncoding=utf8&serverTimezone=Asia/Shanghai
          username: root
          password: your_password
      ```
3. **编译项目**
   bash

    ```bash
    mvn clean package -Dmaven.test.skip=true
    ```
4. **启动应用**
   bash

    ```bash
    # 后台启动
    nohup java -jar ruoyi-admin/target/ruoyi-admin.jar &
    # 查看日志
    tail -f nohup.out
    ```
5. **访问系统**

    - 系统地址：`http://localhost:8080`
    - 默认账号：admin/admin123

## 功能使用示例

### 1. 专利数据分析流程

1. 调用`/tec/tecachievement/field-counts`获取各领域专利数量
2. 系统自动通过`PatentTrendAnalyzer`计算占比
3. 调用`/tec/tecachievement/field-percentages`获取分析报告
4. 报告示例：
   plaintext

    ```plaintext
    在所有记录中，我们观察到如下领域分布情况：
    本次分析涵盖了总共 150 条记录。
    电子信息领域占总数的35.33%（53条记录）。
    ...
    其中，占比最高的领域是电子信息，占据了53条记录，占比为35.33%；而占比最低的是海洋，仅有2条记录，占比为1.33%。
    ```

### 2. 项目创建与任务分配

1. 通过`/project/projects`接口创建项目
2. 分配专家加入项目（`/project/projects/joinProject`）
3. 上传任务书（`/project/task/uploadBook`）
4. 系统自动记录操作日志并更新任务状态

## 系统演示

| 功能模块 | 演示截图                                                                                              |
| ---------- | ------------------------------------------------------------------------------------------------------- |
| 项目管理 | \<img src\="https://oscimg.oschina.net/oscnet/cd1f90be5f2684f4560c9519c0f2a232ee8.jpg"/\>    |
| 专家管理 | \<img src\="https://oscimg.oschina.net/oscnet/1cbcf0e6f257c7d3a063c0e3f2ff989e4b3.jpg"/\>    |
| 专利分析 | \<img src\="https://oscimg.oschina.net/oscnet/up-8074972883b5ba0622e13246738ebba237a.png"/\> |
| 任务管理 | \<img src\="https://oscimg.oschina.net/oscnet/up-9f88719cdfca9af2e58b352a20e23d43b12.png"/\> |

## 注意事项

1. 文件上传大小限制：默认 50MB，可通过`application.yml`调整
2. 权限控制：部分接口需要特定角色权限（通过`@PreAuthorize`控制）
3. 数据备份：建议定期备份 MySQL 数据库
4. 日志管理：系统操作日志可通过`ProjectOperationLog`表查询

*注：本系统基于若依 (RuoYi) 框架开发，部分基础功能继承自该框架。*