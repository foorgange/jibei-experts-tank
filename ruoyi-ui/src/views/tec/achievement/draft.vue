<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="78px">
      <el-form-item label="成果名称" prop="achievementname" :style="{ whiteSpace: 'nowrap'}">
        <el-input
          v-model="queryParams.achievementname"
          placeholder="请输入科技成果名称"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
          class="w1"
        />
      </el-form-item>
      <el-form-item label="所属学院" prop="college"  >
        <el-select v-model="queryParams.college" placeholder="请选择所属学院" clearable size="small" class="w1">
          <el-option label="请选择所属学院"
                     v-for="dict in dict.type.school_xy"
                     :key="dict.value"
                     :label="dict.label"
                     :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="成果类型" prop="typesresults">
        <el-select v-model="queryParams.typesresults" placeholder="请选择成果类型" clearable size="small"  class="w1">
          <el-option
            v-for="dict in dict.type.type_achievement"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="技术成熟度" prop="technologylevel" :style="{ whiteSpace: 'nowrap'}" >
        <el-select   v-model="queryParams.technologylevel" placeholder="请选择技术成熟度" clearable size="small" class="w1">
          <el-option
            v-for="dict in dict.type.technology_level"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="先进度" prop="advancementleve">
        <el-select v-model="queryParams.advancementleve" placeholder="请选择先进度" clearable size="small" class="w1">
          <el-option
            v-for="dict in dict.type.cutting_edge"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>

      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="goToNewPage"
          v-hasPermi="['tec:tecachievement:add']"
        >新增成果</el-button>
      </el-col>
    </el-row>

    <el-table v-loading="loading" :data="tecachievementList" @selection-change="handleSelectionChange"  >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="成果名称" align="center" prop="achievementname" />
      <el-table-column label="所属领域" align="center" prop="fieldDeatil"/>
      <el-table-column label="所属学院" align="center" prop="college" >
      <template slot-scope="scope">
        <dict-tag :options="dict.type.school_xy" :value="scope.row.college"/>
      </template>
      </el-table-column>
      <el-table-column label="合作方式" align="center" prop="wayDeatil" />
      <el-table-column label="成果类型" align="center" prop="typesresultsDeatil" width="120" />
      <el-table-column label="技术成熟度" align="center" prop="technologylevel" width="90">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.technology_level" :value="scope.row.technologylevel"/>
        </template>
      </el-table-column>
      <el-table-column label="先进度" align="center" prop="advancementleve">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.cutting_edge" :value="scope.row.advancementleve"/>
        </template>
      </el-table-column>
      <el-table-column prop="introduction" label="成果介绍" align="center" :show-overflow-tooltip="true" />
      <el-table-column prop="intellectualproperty" label="知识产权" align="center" :show-overflow-tooltip="true" />
      <el-table-column label="联系人" align="center" prop="contactname" />
      <el-table-column label="邮箱" align="center" prop="email" />
      <el-table-column label="联系电话" align="center" prop="phone" />
      <el-table-column label="通讯地址" align="center" prop="address" />
      <el-table-column prop="award" label="获奖情况" align="center"  :show-overflow-tooltip="true" />
      <el-table-column prop="benefit" label="效益分析" align="center" :show-overflow-tooltip="true"/>
      <el-table-column label="研究背景与基础" align="center" prop="background" :show-overflow-tooltip="true" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleEdit(scope.row)"
            v-hasPermi="['tec:tecachievement:edit']"
          >编辑</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['tec:tecachievement:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

<!--    <pagination-->
<!--      v-show="total>0"-->
<!--      :total="total"-->
<!--      :page.sync="queryParams.pageNum"-->
<!--      :limit.sync="queryParams.pageSize"-->
<!--      @pagination="getList"-->
<!--    />-->

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="tecachievementVO.pageNum"
      :limit.sync="tecachievementVO.pageSize"
      @pagination="getListByTecachievementV"
    />

  </div>
</template>

<script>
import {
  listTecachievement,
  getTecachievement,
  delTecachievement,
  addTecachievement,
  updateTecachievement,
  getListByTecachievementVO,
} from "@/api/tec/tecachievement";
import {delTecteam} from "@/api/tec/tecteam";

export default {
  name: "Tecachievement",
  dicts: ['type_achievement', 'technology_level', 'cutting_edge','sys_field','school_xy','jd_way'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 导出遮罩层
      exportLoading: false,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 科技成果增删改查表格数据
      tecachievementList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        achievementid: null,
        achievementname: null,
        field: null,
        college: null,
        way: null,
        typesresults: null,
        technologylevel: null,
        advancementleve: null,
        introduction: null,
        intellectualproperty: null,
        contactname: null,
        email: null,
        phone: null,
        address: null,
        award: null,
        benefit: null,
        background: null,
        piId: null,
        teamId: null,
        introductionImg: null,
        status: null
      },

      tecachievementVO: {
        pageNum: 1,
        pageSize: 10,
        achievementid: null,
        achievementname: null,
        field: null,
        college: null,
        way: null,
        typesresults: null,
        technologylevel: null,
        advancementleve: null,
        introduction: null,
        intellectualproperty: null,
        contactname: null,
        email: null,
        phone: null,
        address: null,
        award: null,
        benefit: null,
        background: null,
        piId: null,
        teamId: null,
        introductionImg: null,
        status: null,
        tecTeamList: [],
        tecVerticaltopicList: [],
        tecpi :{
        },
        tecVerticaltopic: {
          topicId: null,
          achievementid: null,
          topicCode: null,
          topicName: null,
          topicCategory: null,
          topicSubcategory: null,
        }
      },


      // 表单参数
      form: {},
      // 表单校验
      rules: {
      }
    };
  },
  created() {
    // this.getList();
    this.getListByTecachievementV();
  },
  methods: {
    /** 查询科技成果增删改查列表 */
    getList() {
      this.loading = true;
      this.queryParams.status = 1;
      console.log('this.queryParams---', this.queryParams)

      listTecachievement(this.queryParams).then(response => {
        this.tecachievementList = response.rows;
        console.log('旧',this.tecachievementList)
        this.total = response.total;
        this.loading = false;
      });
    },

    /** 查询科技成果增删改查列表 */
    getListByTecachievementV() {
      this.loading = true;
      this.tecachievementVO.status = 1;
      console.log('this.tecachievementVO---', this.tecachievementVO)
      if(this.queryParams.achievementname!=null){
      this.tecachievementVO.achievementname=this.queryParams.achievementname;}
      if(this.queryParams.college!=null){
      this.tecachievementVO.college=this.queryParams.college;}
      if(this.queryParams.typesresults!=null){
      this.tecachievementVO.typesresults=this.queryParams.typesresults;}
      if(this.queryParams.technologylevel!=null){
      this.tecachievementVO.technologylevel=this.queryParams.technologylevel;}
      if(this.queryParams.advancementleve!=null){
      this.tecachievementVO.advancementleve=this.queryParams.advancementleve;}
      getListByTecachievementVO(this.tecachievementVO).then(response => {
        this.tecachievementList = response.rows;
        console.log('新',this.tecachievementList)
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        achievementid: null,
        achievementname: null,
        field: [],
        college: null,
        way: [],
        typesresults: 0,
        technologylevel: null,
        advancementleve: null,
        introduction: null,
        intellectualproperty: null,
        contactname: null,
        email: null,
        phone: null,
        address: null,
        award: null,
        benefit: null,
        background: null,
        piId: null,
        teamId: null,
        introductionImg: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.achievementid)
      this.single = selection.length!==1
      this.multiple = !selection.length

    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加科技成果增删改查";
    },
    /** 修改按钮操作 */
    handleEdit(row) {
      this.reset();
      getTecachievement(row.achievementid).then(response => {
        this.form = response.data;
        this.title = "修改科技成果增删改查";
        this.$router.push({
          path:'/cs',
          query:response.data
        });
        localStorage.setItem('csData', JSON.stringify(response.data))
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          this.form.field = this.form.field
          this.form.way = this.form.way;
          if (this.form.achievementid != null) {
            updateTecachievement(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addTecachievement(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      console.log(row)
      this.$modal.confirm('是否确认删除本条草稿？').then
      (() => Promise.all([delTecachievement(row.achievementid),delTecteam(row.teamId)])).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },

    goToNewPage() {
      localStorage.setItem('csData', '')
      this.$router.push('/tec/cs') // 编程式导航到新页面
    },
  },

};
</script>
<style>
.w1 {
  width: 200px;
}
</style>
