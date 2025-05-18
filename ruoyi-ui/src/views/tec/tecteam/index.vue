<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="团队id" prop="teamid">
        <el-input
          v-model="queryParams.teamid"
          placeholder="请输入团队id"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="姓名" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入姓名"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="性别" prop="sex">
        <el-select v-model="queryParams.sex" placeholder="请选择性别" clearable size="small">
          <el-option label="请选择字典生成" value="" />
        </el-select>
      </el-form-item>
      <el-form-item label="出生日期" prop="birthday">
        <el-input
          v-model="queryParams.birthday"
          placeholder="请输入出生日期"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="职务" prop="jobtitle">
        <el-input
          v-model="queryParams.jobtitle"
          placeholder="请输入职务"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="工号" prop="staffid">
        <el-input
          v-model="queryParams.staffid"
          placeholder="请输入职务"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="工作单位" prop="jobaddress">
        <el-input
          v-model="queryParams.jobaddress"
          placeholder="请输入工作单位"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
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
          @click="handleAdd"
          v-hasPermi="['tec:tecteam:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['tec:tecteam:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['tec:tecteam:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          :loading="exportLoading"
          @click="handleExport"
          v-hasPermi="['tec:tecteam:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="tecteamList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="团队id" align="center" prop="teamid" />
      <el-table-column label="姓名" align="center" prop="name" />
      <el-table-column label="性别" align="center" prop="sex" />
      <el-table-column label="工号" align="center" prop="staffid" />
      <el-table-column label="出生日期" align="center" prop="birthday" />
      <el-table-column label="职务" align="center" prop="jobtitle" />
      <el-table-column label="工作单位" align="center" prop="jobaddress" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['tec:tecteam:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['tec:tecteam:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改团队成员增删改查对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="工号" prop="staffid">
          <el-input v-model="form.staffid" placeholder="请输入工号" />
        </el-form-item>
        <el-form-item label="姓名" prop="name">
          <el-input v-model="form.name" placeholder="请输入姓名" />
        </el-form-item>
        <el-form-item label="性别" prop="sex">
          <el-select v-model="form.sex" placeholder="请选择性别">
            <el-option label="" value="" />
          </el-select>
        </el-form-item>
        <el-form-item label="出生日期" prop="birthday">
          <el-input v-model="form.birthday" placeholder="请输入出生日期" />
        </el-form-item>
        <el-form-item label="职务" prop="jobtitle">
          <el-input v-model="form.jobtitle" placeholder="请输入职务" />
        </el-form-item>
        <el-form-item label="工作单位" prop="jobaddress">
          <el-input v-model="form.jobaddress" placeholder="请输入工作单位" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listTecteam, getTecteam, delTecteam, addTecteam, updateTecteam, exportTecteam } from "@/api/tec/tecteam";

export default {
  name: "Tecteam",
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
      // 团队成员增删改查表格数据
      tecteamList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        teamid: null,
        name: null,
        sex: null,
        staffid:null,
        birthday: null,
        jobtitle: null,
        jobaddress: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        // teamid: [
        //   { max: 11, message: "团队id长度不能超过11", trigger: "blur" },
        //
        // ],
        // name: [
        //   { max: 255, message: "姓名长度不能超过255", trigger: "blur" },
        //
        // ],
        // sex: [
        //
        // ],
        // birthday: [
        //   { max: 255, message: "出生日期长度不能超过255", trigger: "blur" },
        //
        // ],
        // jobtitle: [
        //   { max: 255, message: "职务长度不能超过255", trigger: "blur" },
        //
        // ],
        // jobaddress: [
        //   { max: 255, message: "工作单位长度不能超过255", trigger: "blur" },
        //
        // ]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询团队成员增删改查列表 */
    getList() {
      this.loading = true;
      listTecteam(this.queryParams).then(response => {
        this.tecteamList = response.rows;
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
        teamid: null,
        name: null,
        sex: null,
        staffid:null,
        birthday: null,
        jobtitle: null,
        jobaddress: null
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
      this.ids = selection.map(item => item.teamid)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加团队成员增删改查";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const teamid = row.teamid || this.ids
      getTecteam(teamid).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改团队成员增删改查";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.teamid != null) {
            updateTecteam(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addTecteam(this.form).then(response => {
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
      const teamids = row.teamid || this.ids;
      this.$modal.confirm('是否确认删除团队成员增删改查编号为"' + teamids + '"的数据项？').then(function() {
        return delTecteam(teamids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$modal.confirm('是否确认导出所有团队成员增删改查数据项？').then(() => {
        this.exportLoading = true;
        return exportTecteam(queryParams);
      }).then(response => {
        this.$download.name(response.msg);
        this.exportLoading = false;
      }).catch(() => {});
    }
  }
};
</script>
