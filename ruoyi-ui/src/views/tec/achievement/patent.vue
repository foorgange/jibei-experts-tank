<template>
  <div class="app-container">
    <p>{{ $route.params.currentId }}</p>
    <el-form :model="patentVO" ref="queryForm" :inline="true" v-show="showSearch" label-width="78px">
      <el-form-item label="代理机构" prop="agency" :style="{ whiteSpace: 'nowrap' }">
        <el-input v-model="patentVO.agency" placeholder="请输入代理机构名称" clearable size="small"
          @keyup.enter.native="handleQuery" class="w1" />
      </el-form-item>
      <el-form-item label="发明名称" prop="patentName" :style="{ whiteSpace: 'nowrap' }">
        <el-input v-model="patentVO.patentName" placeholder="请输入发明名称" clearable size="small"
          @keyup.enter.native="handleQuery" class="w1" />
      </el-form-item>
      <el-form-item label="申请人" prop="applicants" :style="{ whiteSpace: 'nowrap' }">
        <el-input v-model="patentVO.applicants" placeholder="请输入申请人姓名" clearable size="small"
          @keyup.enter.native="handleQuery" class="w1" />
      </el-form-item>
      <el-form-item label="发明人" prop="inventors" :style="{ whiteSpace: 'nowrap' }">
        <el-input v-model="patentVO.inventors" placeholder="请输入发明人姓名" clearable size="small"
          @keyup.enter.native="handleQuery" class="w1" />
      </el-form-item>
      <el-form-item label="IPC号" prop="ipcClass" :style="{ whiteSpace: 'nowrap' }">
        <el-input v-model="patentVO.ipcClass" placeholder="请输入IPC号" clearable size="small"
          @keyup.enter.native="handleQuery" class="w1" />
      </el-form-item>
      <el-form-item label-width="100px" label="申请人所在地" prop="applicantCountry" :style="{ whiteSpace: 'nowrap' }">
        <el-input v-model="patentVO.applicantCountry" placeholder="请输入申请人所在地" clearable size="small"
          @keyup.enter.native="handleQuery" class="w1" />
      </el-form-item>
      <el-form-item label="公开号" prop="publicationNumber" :style="{ whiteSpace: 'nowrap' }">
        <el-input v-model="patentVO.publicationNumber" placeholder="请输入公开号" clearable size="small"
          @keyup.enter.native="handleQuery" class="w1" />
      </el-form-item>
      <el-form-item label="申请号" prop="applicantNumber" :style="{ whiteSpace: 'nowrap' }">
        <el-input v-model="patentVO.applicantNumber" placeholder="请输入申请号" clearable size="small"
          @keyup.enter.native="handleQuery" class="w1" />
      </el-form-item>
    </el-form>


    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-col>
    </el-row>

    <el-table v-loading="loading" :data="patentList" @selection-change="handleSelectionChange">
      <el-table-column label="发明名称" align="center" prop="patentName" />
      <el-table-column label="代理机构" align="center" prop="agency" />
      <el-table-column label="公开号" align="center" prop="publicationNumber" />
      <el-table-column label="申请号" align="center" prop="applicationNumber" />
      <el-table-column label="申请日" align="center" prop="applicationDate" />
      <el-table-column label="简要说明" align="center" prop="briefStatement" />
      <el-table-column label="摘要" align="center" prop="abstractText" :show-overflow-tooltip="true" />
      <el-table-column label="主权力要求" align="center" prop="mainClaim" :show-overflow-tooltip="true" />
      <el-table-column label="发明人" align="center" prop="inventors" />
      <el-table-column label="申请人" align="center" prop="applicants" />
      <el-table-column label="申请人所在国家/地区/组织" align="center" prop="applicantCountry" />
      <el-table-column label="公开日期" align="center" prop="publicationDate" />
      <el-table-column label="IPC分类号" align="center" prop="ipcClass" :show-overflow-tooltip="true" />
      <el-table-column label="创建时间" align="center" prop="createTime" />



      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button size="mini" type="text" icon="el-icon-view" @click="handleShow(scope.row)">查看</el-button>
          <el-button size="mini" type="text" icon="el-icon-delete" @click="handleDelete(scope.row)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>


    <!-- 弹窗 -->
    <el-dialog title="查看详情" :visible.sync="dialogVisible" width="50%" :before-close="handleClose">
      <el-form :model="currentRow" label-width="150px">
        <el-form-item label="代理机构">
          <el-input v-model="currentRow.agency" readonly></el-input>
        </el-form-item>
        <el-form-item label="公开号">
          <el-input v-model="currentRow.publicationNumber" readonly></el-input>
        </el-form-item>
        <el-form-item label="申请号">
          <el-input v-model="currentRow.applicationNumber" readonly></el-input>
        </el-form-item>
        <el-form-item label="申请日">
          <el-input v-model="currentRow.applicationDate" readonly></el-input>
        </el-form-item>
        <el-form-item label="发明名称">
          <el-input v-model="currentRow.patentName" readonly></el-input>
        </el-form-item>
        <el-form-item label="简要说明">
          <el-input type="textarea" :rows="3" v-model="currentRow.briefStatement" readonly></el-input>
        </el-form-item>
        <el-form-item label="摘要">
          <el-input type="textarea" :rows="4" v-model="currentRow.abstractText" readonly></el-input>
        </el-form-item>
        <el-form-item label="主权力要求">
          <el-input type="textarea" :rows="5" v-model="currentRow.mainClaim" readonly></el-input>
        </el-form-item>
        <el-form-item label="发明人">
          <el-input type="textarea" :rows="3" v-model="currentRow.inventors" readonly></el-input>
        </el-form-item>
        <el-form-item label="申请人">
          <el-input type="textarea" :rows="3" v-model="currentRow.applicants" readonly></el-input>
        </el-form-item>
        <el-form-item label="申请人所在国家/地区/组织" class="custom-label">
          <el-input v-model="currentRow.applicantCountry" readonly></el-input>
        </el-form-item>
        <el-form-item label="公开日期">
          <el-input v-model="currentRow.publicationDate" readonly></el-input>
        </el-form-item>
        <el-form-item label="IPC分类号">
          <el-input type="textarea" :rows="3" v-model="currentRow.ipcClass" readonly></el-input>
        </el-form-item>
        <el-form-item label="创建时间">
          <el-input v-model="currentRow.createTime" readonly></el-input>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible = false">关闭</el-button>
      </span>
    </el-dialog>



    <pagination v-show="total > 0" :total="total" :page.sync="patentVO.pageNum" :limit.sync="patentVO.pageSize"
      @pagination="getListByPatentV" v-if="total != 0" />
  </div>
</template>

<script>
import { listPatents, removePatent } from '@/api/tec/patent';

export default {
  name: "Patent",
  data() {
    return {
      dialogVisible: false, // 控制弹窗显示
      currentRow: {}, // 当前选中的行数据
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
      // 专利库增删改查表格数据
      patentList: [],
      selectedRows: [], // 已选中的行数据
      tecVerticaltopicList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      pidataList: [],
      // 查询参数
      queryParams: {},
      startAndEndTime: null,
      pickerOptions: {
        shortcuts: [{
          text: '最近一周',
          onClick(picker) {
            const end = new Date();
            const start = new Date();
            start.setTime(start.getTime() - 3600 * 1000 * 24 * 7);
            picker.$emit('pick', [start, end]);
          }
        }, {
          text: '最近一个月',
          onClick(picker) {
            const end = new Date();
            const start = new Date();
            start.setTime(start.getTime() - 3600 * 1000 * 24 * 30);
            picker.$emit('pick', [start, end]);
          }
        }, {
          text: '最近三个月',
          onClick(picker) {
            const end = new Date();
            const start = new Date();
            start.setTime(start.getTime() - 3600 * 1000 * 24 * 90);
            picker.$emit('pick', [start, end]);
          }
        }]
      },
      patentVO: {
        pageNum: 1, // 当前页码
        pageSize: 10, // 每页显示条数
        agency: '',
        patentName: '',
        inventor: '',
        ipcClass: '',
        applicantCountry: '',
        publicationNumber: '',
        applicantNumber: '',
      },
      searchParams: {},
      exportParams: {},
      // 表单参数
      form: {},
      // 登录用户的部门ID
      deptId: null,
      currentId: null,
    };
  },
  created() {
    this.getListByPatentV();
  },
  methods: {
    handleShow(row) {
      this.currentRow = row; // 设置当前行数据
      this.dialogVisible = true; // 显示弹窗
    },
    getListByPatentV() {
      this.loading = true;
      listPatents(this.patentVO).then(response => {
        // 格式化时间的辅助函数
        const formatDateTime = (dateTimeString) => {
          if (!dateTimeString) return ''; // 如果时间为空，返回空字符串
          const date = new Date(dateTimeString);
          const year = date.getFullYear();
          const month = String(date.getMonth() + 1).padStart(2, '0'); // 月份从0开始，需要+1
          const day = String(date.getDate()).padStart(2, '0');
          const hours = String(date.getHours()).padStart(2, '0');
          const minutes = String(date.getMinutes()).padStart(2, '0');
          const seconds = String(date.getSeconds()).padStart(2, '0');
          return `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`;
        };

        // 格式化日期的辅助函数
        const formatDate = (dateString) => {
          if (!dateString) return ''; // 如果日期为空，返回空字符串
          const date = new Date(dateString);
          const year = date.getFullYear();
          const month = String(date.getMonth() + 1).padStart(2, '0');
          const day = String(date.getDate()).padStart(2, '0');
          return `${year}-${month}-${day}`;
        };

        // 格式化专利列表中的时间和日期
        this.patentList = response.rows.map(item => ({
          ...item,
          createTime: formatDateTime(item.createTime), // 格式化创建时间为 YYYY-MM-DD HH:mm:ss
          applicationDate: formatDate(item.applicationDate) // 格式化申请日期为 YYYY-MM-DD
        }));

        this.total = response.total;

        console.log("1", this.patentList);
        this.loading = false;
      }).catch(error => {
        console.error('Failed to fetch patent list:', error);
        this.loading = false;
        this.patentList = [];
        this.total = 0;
      });
    },
    mounted() {
      // 页面加载时自动调用一次getListByPatentV方法
      this.getListByPatentV();
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {};
      this.resetForm("form");
    },

    /** 搜索按钮操作 */
    handleQuery() {
      this.patentVO.pageNum = 1;
      console.log("2312321", this.patentVO);
      this.getListByPatentV();
    },

    /** 重置按钮操作 */
    resetQuery() {
      // 使用 resetFields 方法重置表单
      this.$refs.queryForm.resetFields();
    },





    handleDelete(row) {
      console.log(row.id, "213123");

      // 显示确认弹窗
      this.$modal.confirm('是否确认删除本条科技成果？').then(() => {
        // 用户点击确定按钮后执行删除操作
        return removePatent(row.id);
      }).then(() => {
        // 删除成功后的处理
        this.getListByPatentV(); // 刷新列表数据
        this.$modal.msgSuccess("删除成功"); // 显示成功消息
      }).catch((error) => {
        if (error !== 'cancel') {
          // 如果不是用户取消操作，则可能是删除失败
          console.error("删除操作失败", error); // 错误处理
          this.$modal.msgError("删除失败，请重试"); // 显示错误消息给用户
        } else {
          // 用户点击取消按钮后的处理
          this.$message({
            type: 'info',
            message: '已取消删除'
          });
        }
      });
    },

    /** 导出按钮操作 */
    handleToWord() {
      console.log('Exporting to Word');
      // 这里可以添加具体的导出逻辑
    },

    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.achievementid)
      this.single = selection.length !== 1
      this.multiple = !selection.length
      this.selectedRows = selection;
    },

    /** 返回按钮操作 */
    handleReturn(row) {
      console.log('Returning row:', row);
      // 这里可以添加具体的退回逻辑
    },
  },
};
</script>

<style scoped>
.w1 {
  width: 200px;
}
.custom-label .el-form-item__label {
  width: 100px; /* 设置你想要的宽度 */
  white-space: normal; /* 允许文本换行 */
  line-height: 1.5; /* 调整行高 */
}

</style>
