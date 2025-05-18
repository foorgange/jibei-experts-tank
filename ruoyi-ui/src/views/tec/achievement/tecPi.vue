<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="70px">
      <el-form-item label="工号" prop="piStaffId">
        <el-input
          v-model="queryParams.piStaffId"
          placeholder="请输入工号"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="姓名" prop="piName">
        <el-input
          v-model="queryParams.piName"
          placeholder="请输入姓名"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="性别" prop="piSex">
        <el-select v-model="queryParams.piSex" placeholder="请选择性别" clearable size="small">
          <el-option
            v-for="dict in dict.type.sys_user_sex"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="所属学院" prop="piCollege">
        <el-select v-model="queryParams.piCollege" placeholder="请选择所属学院" clearable size="small">
          <el-option
            v-for="dict in dict.type.school_xy"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="职称" prop="piJobTitle">
        <el-input
          v-model="queryParams.piJobTitle"
          placeholder="请输入职称"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="邮箱" prop="piEmail">
        <el-input
          v-model="queryParams.piEmail"
          placeholder="请输入邮箱"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="电话" prop="piPhone">
        <el-input
          v-model="queryParams.piPhone"
          placeholder="请输入电话"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="通讯地址" prop="piCommAddress">
        <el-input
          v-model="queryParams.piCommAddress"
          placeholder="请输入通讯地址"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
<!--      <div>-->
<!--        <el-form-item>-->
<!--          <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>-->
<!--          <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>-->
<!--        </el-form-item>-->
<!--      </div>-->
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5" style="padding-right: 40px">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['tec:tecpi:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-col>
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="primary"-->
<!--          plain-->
<!--          icon="el-icon-plus"-->
<!--          size="mini"-->
<!--          @click="handleAdd"-->
<!--          v-hasPermi="['tec:tecpi:add']"-->
<!--        >新增</el-button>-->
<!--      </el-col>-->
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="success"-->
<!--          plain-->
<!--          icon="el-icon-edit"-->
<!--          size="mini"-->
<!--          :disabled="single"-->
<!--          @click="handleUpdate"-->
<!--          v-hasPermi="['tec:tecpi:edit']"-->
<!--        >修改</el-button>-->
<!--      </el-col>-->
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="warning"-->
<!--          plain-->
<!--          icon="el-icon-download"-->
<!--          size="mini"-->
<!--          :loading="exportLoading"-->
<!--          @click="handleExport"-->
<!--          v-hasPermi="['tec:tecpi:export']"-->
<!--        >导出</el-button>-->
<!--      </el-col>-->
<!--      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>-->
    </el-row>

    <el-table v-loading="loading" :data="tecpiList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="工号" align="center" prop="piStaffId" />
      <el-table-column label="姓名" align="center" prop="piName">
        <template scope="scope">
          <div @click="toTecLibrary(scope.row)" class="click_name">
            {{ scope.row.piName }}
          </div>
        </template>
      </el-table-column>>
      <el-table-column label="性别" align="center" prop="piSex">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_user_sex" :value="scope.row.piSex"/>
        </template>
      </el-table-column>
      <el-table-column label="所属学院" align="center" prop="piCollege">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.school_xy" :value="scope.row.piCollege"/>
        </template>
      </el-table-column>
      <el-table-column label="职称" align="center" prop="piJobTitle" />
      <el-table-column label="邮箱" align="center" prop="piEmail" />
      <el-table-column label="电话" align="center" prop="piPhone" />
      <el-table-column label="通讯地址" align="center" prop="piCommAddress" />
      <el-table-column label="简介" align="center" prop="piInformation" :show-overflow-tooltip="true" />
      <el-table-column label="照片" align="center" prop="piImg" >
        <template slot-scope="scope">
          <a :href="scope.row.piImg" target="_blank" style="text-decoration: none; display: inline-block;">
            <div class="pi-img1">
              <img :src="scope.row.piImg" class="pi-img2" />
            </div>
          </a>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-piName="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['tec:tecpi:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['tec:tecpi:remove']"
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

    <!-- 添加或修改成果负责人增删改查对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="工号" prop="piStaffId">
          <el-input v-model="form.piStaffId" placeholder="请输入工号" />
        </el-form-item>
        <el-form-item label="姓名" prop="piName">
          <el-input v-model="form.piName" placeholder="请输入姓名" />
        </el-form-item>
        <el-form-item label="性别" prop="piSex">
          <el-select v-model="form.piSex" placeholder="请选择性别">
            <el-option
              v-for="dict in dict.type.sys_user_sex"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="所属学院" prop="piCollege">
          <el-select v-model="form.piCollege" placeholder="请选择所属学院">
            <el-option
              v-for="dict in dict.type.school_xy"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="职称" prop="piJobTitle">
          <el-input v-model="form.piJobTitle" placeholder="请输入职称" />
        </el-form-item>
        <el-form-item label="邮箱" prop="piEmail">
          <el-input v-model="form.piEmail" placeholder="请输入邮箱" />
        </el-form-item>
        <el-form-item label="电话" prop="piPhone">
          <el-input v-model="form.piPhone" placeholder="请输入电话" />
        </el-form-item>
        <el-form-item label="通讯地址" prop="piCommAddress">
          <el-input v-model="form.piCommAddress" placeholder="请输入通讯地址" />
        </el-form-item>
        <el-form-item label="简介" prop="piInformation">
          <el-input v-model="form.piInformation" type="textarea" placeholder="请输入内容" :rows="6" />
        </el-form-item>
        <el-upload
          :action="uploadUrl"
          :ref="upload"
          :on-remove="pihandleRemove"
          :on-change="pihandleChange"
          :on-success="handleSuccess"
          :on-preview="pihandlePictureCardPreview"
          multiple
          enctype="multipart/form-data"
          :limit="10"
          list-type="picture-card"
          accept=".jpg,.png,.jpeg"
          :headers="upload.headers"
          :file-list="pifileList"
          style="margin-left:80px "
        >点击上传照片
        </el-upload>
        <el-dialog :visible.sync="dialogVisible">
          <img width="100%" :src="dialogImageUrl" alt="">
        </el-dialog>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" :disabled="disabled1" @click="submitForm">确定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listTecpi, getTecpi, delTecpi, addTecpi, updateTecpi, exportTecpi } from "@/api/tec/tecpi";
import {getTecAchiListByPiId, uploadFiles} from "@/api/tec/tecachievement";
import current from "element-ui/packages/table/src/store/current";
import {getToken} from "@/utils/auth";

export default {
  piName: "Tecpi",
  dicts: ['sys_user_sex', 'school_xy'],
  data() {
    return {
      uploadUrl: process.env.VUE_APP_BASE_API + "/property/propertys/testUploadFile",
      upload: {
        headers: {Authorization: "Bearer " + getToken()},
      },
      //照片
      pifileList: [],
      dialogVisible: false,
      dialogImageUrl: '',
      currentId: null,
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
      // 成果负责人增删改查表格数据
      tecpiList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      //启动提交按钮
      disabled1: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        piStaffId: null,
        piName: null,
        piSex: null,
        piCollege: null,
        piJobTitle: null,
        piEmail: null,
        piPhone: null,
        piCommAddress: null,
        piInformation: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        piId: [
          { max: 11, message: "成果负责人id长度不能超过11", trigger: "blur" },
        ],
        piStaffId: [
          { max: 11, message: "工号长度不能超过11", trigger: "blur" },
        ],
        piName: [
          { max: 255, message: "姓名长度不能超过255", trigger: "blur" },
        ],
        piSex: [],
        piCollege: [],
        piJobTitle: [
          { max: 255, message: "职称长度不能超过255", trigger: "blur" },
        ],
        piEmail: [
          { max: 255, message: "邮箱长度不能超过255", trigger: "blur" },
        ],
        piPhone: [
          { max: 255, message: "电话长度不能超过255", trigger: "blur" },
        ],
        piCommAddress: [
          { max: 255, message: "通讯地址长度不能超过255", trigger: "blur" },
        ],
        piInformation: []
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询成果负责人增删改查列表 */
    getList() {
      this.loading = true;
      listTecpi(this.queryParams).then(response => {
        this.tecpiList = response.rows;
        this.total = response.total;
        this.loading = false;
        // 在获取到数据后对图片链接进行处理
        this.tecpiList.forEach(item => {
          if (item.piImg) {
            item.piImg = process.env.VUE_APP_BASE_API+'/profile' + item.piImg; // 假设图片字段为piImg
          }
        });
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },

    //点击姓名进行搜索
    toTecLibrary(val) {
      // this.currentId = val.piId;
      // console.log(this.currentId);
      // this.$router.push('/tec/tecLibrary');
      // // this.$router.push({ path: `/tecPi/${val.piId}` })
    console.log("toTecLibrary------->");
     this.$router.push({
      path: '/tec/tecLibrary',
      query: {
        currentId: val.piId,
        piName: val.piName
      }
    });
    },

    handleSuccess() {
      console.log('文件上传成功！')
    },

    pihandleChange(pifile, pifileList) {
      this.pifileList = pifileList
    },

    pihandleRemove(pifile, pifileList) {
      this.pifileList = pifileList
    },

    pihandlePictureCardPreview(pifile) {
      this.dialogImageUrl = pifile.url;
      this.dialogVisible = true;
    },

    // 表单重置
    reset() {
      this.form = {
        piId: null,
        piStaffId: null,
        piName: null,
        piSex: null,
        piCollege: null,
        piJobTitle: null,
        piEmail: null,
        piPhone: null,
        piCommAddress: null,
        piInformation: null
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
      this.ids = selection.map(item => item.piId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加成果负责人增删改查";
      // 启用提交按钮
      this.disabled1 = false;
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      //清空照片缓存
      this.pifileList = [];

      this.reset();
      const piId = row.piId || this.ids
      getTecpi(piId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改成果负责人";
      });
    },
    /** 提交按钮 */
    async submitForm() {
      // 禁用提交按钮
      this.disabled1 = true;
      //照片上传
      let pifile = [];
      for (var i = 0; i < this.pifileList.length; i++) {
        pifile.push((this.pifileList[i] || {}).raw)
      }
      //处理文件
      const piformData = new FormData();
      if (pifile.length !== 0) {
        for (var i = 0; i < pifile.length; i++) {
          piformData.append('avatarfile', pifile[i]);
        }
        await uploadFiles(piformData).then(res => {
          console.log('uploadFile---res', res)
          this.form.piImg = res.data
          console.log(this.form.piImg)
        })
      }

      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.piId != null) {
            updateTecpi(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            }).finally(() => {
              // 启用提交按钮
              this.disabled1 = false;
            });
          } else {
            addTecpi(this.form).then(response => {
              this.reset();
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            }).finally(() => {
              // 禁用提交按钮
              this.disabled1 = true;
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const piIds = row.piId || this.ids;
      this.$modal.confirm('是否确认删除成果负责人？').then(function() {
        return delTecpi(piIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$modal.confirm('是否确认导出所有成果负责人？').then(() => {
        this.exportLoading = true;
        return exportTecpi(queryParams);
      }).then(response => {
        this.$download.piName(response.msg);
        this.exportLoading = false;
      }).catch(() => {});
    }
  }
};
</script>

<style scoped>
.click_name{
  border-bottom: #4176e7 solid 1px;
  background-color: #eef8ff;
}
.click_name:hover{
  color: #00afff;
  cursor:pointer;
}
.click_name:active{
  color: #3A71A8;
}
.pi-img1 {
  width: 80px;
  height: 80px;
  overflow: hidden;
  position: relative;
}
.pi-img2 {
  max-width: 100%;
  max-height: 100%;
  width: auto;
  height: auto;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}
</style>
