<template>
  <div class="table-container">
    <!-- 原有三个表格容器 -->
    <div class="tables-container">
      <!-- 左侧表格（3份） -->
      <div class="left-table-container">
        <h3>专利件数统计</h3>
        <el-table :data="tableData" style="width: 100%" class="styled-table" max-height="400">
          <el-table-column prop="name" label="名称" min-width="50%" class-name="center-aligned"></el-table-column>
          <el-table-column prop="value" label="数量" min-width="30%" class-name="center-aligned"></el-table-column>
          <el-table-column label="操作" min-width="20%" class-name="center-aligned">
            <template #default="scope">
              <el-button type="primary" size="mini" @click="handleEdit(scope.row)">修改</el-button>
            </template>
          </el-table-column>
        </el-table>
      </div>

      <!-- 中间表格（3份） -->
      <div class="middle-table-container">
        <h3>IPC领域统计</h3>
        <el-table :data="ipcStatisticsData" style="width: 100%" class="styled-table" max-height="500">
          <el-table-column prop="category" label="类别" min-width="30%" class-name="center-aligned"></el-table-column>
          <el-table-column prop="count" label="数量" min-width="26%" class-name="center-aligned"></el-table-column>
          <el-table-column label="操作" min-width="20%" class-name="center-aligned">
            <template #default="scope">
              <el-button type="primary" size="mini" @click="handleEditIpc(scope.row)">修改</el-button>
            </template>
          </el-table-column>
        </el-table>
      </div>
      <!-- 编辑对话框 -->
      <el-dialog :visible.sync="dialogVisible" title="修改数据" width="30%">
        <el-form :model="editForm" label-width="80px">
          <el-form-item label="名称">
            <el-input v-model="editForm.name" disabled></el-input>
          </el-form-item>
          <el-form-item label="新值">
            <el-input v-model="editForm.value" placeholder="请输入新值"></el-input>
          </el-form-item>
        </el-form>
        <template #footer>
          <span class="dialog-footer">
            <el-button @click="dialogVisible = false">取消</el-button>
            <el-button type="primary" @click="confirmEdit">确认</el-button>
          </span>
        </template>
      </el-dialog>

      <!-- 右侧表格（4份） -->
      <div class="right-table-container">
        <div class="header-with-button" style="margin-bottom: 1px;">
          <div class="title-container">
            <h3>专利信息展示</h3>
          </div>
        </div>
        <el-table :data="patentClassData" style="width: 100%" class="styled-table" max-height="360">
          <el-table-column prop="id" label="序号" min-width="12%" class-name="center-aligned"></el-table-column>
          <el-table-column prop="patentName" label="专利名称" min-width="18%" class-name="center-aligned"></el-table-column>
          <el-table-column prop="collaborator" label="合作方名称" min-width="18%"
            class-name="center-aligned"></el-table-column>
          <el-table-column prop="operationType" label="运营类型" min-width="18%"
            class-name="center-aligned"></el-table-column>
          <el-table-column label="操作" min-width="20%" class-name="center-aligned">
            <template #default="scope">
              <div class="button-container">
                <el-button type="primary" size="mini" @click="handlePatentClass(scope.row)">修改</el-button>
                <el-button type="primary" size="mini" @click="deletePatentClasss(scope.row)">删除</el-button>
              </div>
            </template>
          </el-table-column>
        </el-table>
        <!-- 新增按钮 -->
        <div class="add-button-container">
          <el-button type="primary" size="small" @click="showAddPatentDialog" style="width: 120px;">新增</el-button>
        </div>

        <!-- 新增弹窗 -->
        <el-dialog title="新增专利分类" :visible.sync="isAddPatentDialogVisible" width="30%">
          <el-form :model="newPatentForm" ref="addPatentFormRef" :rules="patentFormRules" label-width="100px">
            <el-form-item label="专利名称" prop="patentName">
              <el-input v-model="newPatentForm.patentName" placeholder="请输入专利名称"></el-input>
            </el-form-item>
            <el-form-item label="合作方名称" prop="collaborator">
              <el-input v-model="newPatentForm.collaborator" placeholder="请输入合作方名称"></el-input>
            </el-form-item>
            <el-form-item label="运营类型" prop="operationType">
              <el-input v-model="newPatentForm.operationType" placeholder="请输入运营类型"></el-input>
            </el-form-item>
          </el-form>
          <span slot="footer" class="dialog-footer">
            <el-button @click="closeAddPatentDialog">取消</el-button>
            <el-button type="primary" @click="submitNewPatent">确认</el-button>
          </span>
        </el-dialog>
      </div>

      <!-- 修改弹窗 -->
      <el-dialog title="修改专利信息" :visible.sync="PatentClassdialog" width="30%">
        <el-form :model="currentPatent" label-width="100px">
          <el-form-item label="序号">
            <el-input v-model="currentPatent.id" disabled></el-input>
          </el-form-item>
          <el-form-item label="专利名称">
            <el-input v-model="currentPatent.patentName"></el-input>
          </el-form-item>
          <el-form-item label="合作方名称">
            <el-input v-model="currentPatent.collaborator"></el-input>
          </el-form-item>
          <el-form-item label="运营类型">
            <el-input v-model="currentPatent.operationType"></el-input>
          </el-form-item>
        </el-form>
        <span slot="footer" class="dialog-footer">
          <el-button @click="PatentClassdialog = false">取消</el-button>
          <el-button type="primary" @click="confirmUpdate">确认</el-button>
        </span>
      </el-dialog>

    </div>



    <!-- 新增的第四个表格 -->
    <div class="new-table-container">
      <div class="header-with-button">
        <div class="title-container">
          <h3>专利类型统计</h3>
        </div>
        <div class="button-container">
          <el-button type="success" size="small" @click="isPatentDialogVisible = true"
            style="background-color: rgb(24, 144, 255); border-color: rgb(24, 144, 255); color: white;">
            新增
          </el-button>
        </div>
      </div>
      <el-table :data="sortedPatentData" style="width: 100%; overflow-x: auto;" class="styled-table" max-height="400">
        <el-table-column prop="year" label="年份" min-width="8%" class-name="center-aligned"></el-table-column>
        <el-table-column prop="applications" label="申请总数" min-width="10%" class-name="center-aligned"></el-table-column>
        <el-table-column prop="authorizedCounts" label="授权数" min-width="8%"
          class-name="center-aligned"></el-table-column>
        <el-table-column prop="publishedCounts" label="公开数" min-width="8%"
          class-name="center-aligned"></el-table-column>
        <el-table-column prop="grade_a" label="A等级" min-width="8%" class-name="center-aligned"></el-table-column>
        <el-table-column prop="grade_b" label="B等级" min-width="8%" class-name="center-aligned"></el-table-column>
        <el-table-column prop="grade_c" label="C等级" min-width="8%" class-name="center-aligned"></el-table-column>
        <el-table-column prop="grade_d" label="D等级" min-width="8%" class-name="center-aligned"></el-table-column>
        <el-table-column prop="grade_e" label="E等级" min-width="8%" class-name="center-aligned"></el-table-column>

        <el-table-column prop="transfers" label="专利转让" min-width="8%" class-name="center-aligned"></el-table-column>
        <el-table-column prop="licenses" label="专利许可" min-width="8%" class-name="center-aligned"></el-table-column>
        <el-table-column prop="pledges" label="专利质押" min-width="8%" class-name="center-aligned"></el-table-column>
        <el-table-column label="是否显示历年专利申请趋势" min-width="12%" class-name="center-aligned">
          <template #default="scope">
            {{ scope.row.state_one ? '显示' : '不显示' }}
          </template>
        </el-table-column>

        <el-table-column label="是否显示专利运营情况趋势" min-width="12%" class-name="center-aligned">
          <template #default="scope">
            {{ scope.row.state_two ? '显示' : '不显示' }}
          </template>
        </el-table-column>
        <el-table-column label="是否显示等级数" min-width="12%" class-name="center-aligned">
          <template #default="scope">
            {{ scope.row.state_three ? '显示' : '不显示' }}
          </template>
        </el-table-column>
        <el-table-column label="操作" min-width="10%" class-name="center-aligned">
          <template #default="scope">
            <div class="button-container">
              <el-button type="primary" size="mini" @click="handleEditType(scope.row)">修改</el-button>
            </div>
          </template>
        </el-table-column>
      </el-table>



    </div>

    <!-- 新增弹窗 -->
    <el-dialog :visible.sync="isPatentDialogVisible" title="新增专利数据" width="40%">
      <el-form :model="patentFormData" label-width="120px" ref="patentFormRef" :rules="patentFormRules">
        <el-form-item label="年份" prop="year">
          <el-input v-model.number="patentFormData.year" placeholder="请输入年份"></el-input>
        </el-form-item>
        <el-form-item label="申请总数" prop="applications">
          <el-input v-model.number="patentFormData.applications" placeholder="请输入申请总数"></el-input>
        </el-form-item>
        <el-form-item label="授权数" prop="authorizedCounts">
          <el-input v-model.number="patentFormData.authorizedCounts" placeholder="请输入授权数"></el-input>
        </el-form-item>
        <el-form-item label="公开数" prop="publishedCounts">
          <el-input v-model.number="patentFormData.publishedCounts" placeholder="请输入公开数"></el-input>
        </el-form-item>
        <el-form-item label="A等级" prop="grade_a">
          <el-input v-model.number="patentFormData.grade_a" placeholder="请输入A等级数量"></el-input>
        </el-form-item>
        <el-form-item label="B等级" prop="grade_b">
          <el-input v-model.number="patentFormData.grade_b" placeholder="请输入B等级数量"></el-input>
        </el-form-item>
        <el-form-item label="C等级" prop="grade_c">
          <el-input v-model.number="patentFormData.grade_c" placeholder="请输入C等级数量"></el-input>
        </el-form-item>
        <el-form-item label="D等级" prop="grade_d">
          <el-input v-model.number="patentFormData.grade_d" placeholder="请输入D等级数量"></el-input>
        </el-form-item>
        <el-form-item label="E等级" prop="grade_e">
          <el-input v-model.number="patentFormData.grade_e" placeholder="请输入E等级数量"></el-input>
        </el-form-item>
        <el-form-item label="专利转让" prop="transfers">
          <el-input v-model.number="patentFormData.transfers" placeholder="请输入专利转让数量"></el-input>
        </el-form-item>
        <el-form-item label="专利许可" prop="licenses">
          <el-input v-model.number="patentFormData.licenses" placeholder="请输入专利许可数量"></el-input>
        </el-form-item>
        <el-form-item label="专利质押" prop="pledges">
          <el-input v-model.number="patentFormData.pledges" placeholder="请输入专利质押数量"></el-input>
        </el-form-item>
        <el-form-item label="是否显示类型" prop="state_one">
          <el-select v-model="patentFormData.state_one" placeholder="请选择">
            <el-option label="显示" :value="true"></el-option>
            <el-option label="不显示" :value="false"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="是否显示统计数" prop="state_two">
          <el-select v-model="patentFormData.state_two" placeholder="请选择">
            <el-option label="显示" :value="true"></el-option>
            <el-option label="不显示" :value="false"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="是否显示等级数" prop="state_three">
          <el-select v-model="patentFormData.state_three" placeholder="请选择">
            <el-option label="显示" :value="true"></el-option>
            <el-option label="不显示" :value="false"></el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button @click="closePatentDialog">取消</el-button>
          <el-button type="primary" @click="submitPatentForm">确认</el-button>
        </div>
      </template>
    </el-dialog>


    <!-- 修改类型数据弹窗 -->
    <el-dialog title="修改类型数据" :visible.sync="dialogVisibleType" width="40%">
      <el-form :model="formData" label-width="150px">
        <el-form-item label="年份">
          <el-input v-model="formData.year" disabled></el-input>
        </el-form-item>
        <el-form-item label="申请总数">
          <el-input v-model.number="formData.applications"></el-input>
        </el-form-item>
        <el-form-item label="授权数">
          <el-input v-model.number="formData.authorizedCounts"></el-input>
        </el-form-item>
        <el-form-item label="公开数">
          <el-input v-model.number="formData.publishedCounts"></el-input>
        </el-form-item>
        <el-form-item label="A等级">
          <el-input v-model.number="formData.grade_a"></el-input>
        </el-form-item>
        <el-form-item label="B等级">
          <el-input v-model.number="formData.grade_b"></el-input>
        </el-form-item>
        <el-form-item label="C等级">
          <el-input v-model.number="formData.grade_c"></el-input>
        </el-form-item>
        <el-form-item label="D等级">
          <el-input v-model.number="formData.grade_d"></el-input>
        </el-form-item>
        <el-form-item label="E等级">
          <el-input v-model.number="formData.grade_e"></el-input>
        </el-form-item>
        <el-form-item label="专利转让">
          <el-input v-model.number="formData.transfers"></el-input>
        </el-form-item>
        <el-form-item label="专利许可">
          <el-input v-model.number="formData.licenses"></el-input>
        </el-form-item>
        <el-form-item label="专利质押">
          <el-input v-model.number="formData.pledges"></el-input>
        </el-form-item>
        <el-form-item label="是否显示类型">
          <el-select v-model="formData.state_one" placeholder="请选择">
            <el-option label="显示" :value="true"></el-option>
            <el-option label="不显示" :value="false"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="是否显示统计数">
          <el-select v-model="formData.state_two" placeholder="请选择">
            <el-option label="显示" :value="true"></el-option>
            <el-option label="不显示" :value="false"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="是否显示等级数">
          <el-select v-model="formData.state_three" placeholder="请选择">
            <el-option label="显示" :value="true"></el-option>
            <el-option label="不显示" :value="false"></el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="dialogVisibleType = false">取消</el-button>
        <el-button type="primary" @click="handleUpdate">确认</el-button>
      </span>
    </el-dialog>



    <!-- 新增的第五个和第六个表格容器 -->
    <div class="additional-tables-container">
      <!-- 第五个表格 -->
      <div class="additional-table-container additional-left-table-container">
        <h3>共同申请人排行</h3>
        <el-table :data="sortedApplicantData" style="width: 100%" class="styled-table" max-height="400">
          <el-table-column prop="index" label="序号" min-width="20%" class-name="center-aligned"></el-table-column>
          <el-table-column prop="companyName" label="公司名" min-width="20%" class-name="center-aligned"></el-table-column>
          <el-table-column prop="count" label="数量" min-width="20%" class-name="center-aligned"></el-table-column>
          <el-table-column label="操作" min-width="20%" class-name="center-aligned">
            <template #default="scope">
              <div class="button-container">
                <el-button type="primary" size="mini" @click="handlesortedApplicant(scope.row)">修改</el-button>
              </div>
            </template>
          </el-table-column>

        </el-table>
      </div>

      <!-- 第六个表格 -->
      <div class="additional-table-container additional-right-table-container">
        <h3>发明人专利排行</h3>
        <el-table :data="sortedInventorData" style="width: 100%" class="styled-table" max-height="400">
          <el-table-column prop="index" label="序号" min-width="20%" class-name="center-aligned"></el-table-column>
          <el-table-column prop="inventorName" label="发明人名称" min-width="20%"
            class-name="center-aligned"></el-table-column>
          <el-table-column prop="count" label="数量" min-width="20%" class-name="center-aligned"></el-table-column>
          <el-table-column label="操作" min-width="20%" class-name="center-aligned">
            <template #default="scope">
              <div class="button-container">
                <el-button type="primary" size="mini" @click="handlesortedInventor(scope.row)">修改</el-button>
              </div>
            </template>
          </el-table-column>
        </el-table>
      </div>

      <div>
        <!-- 修改弹窗 -->
        <el-dialog :visible.sync="isDialogOpen" title="修改数据" width="30%">
          <el-form ref="form" :model="editData" label-width="80px" v-show="isDialogOpen">
            <el-form-item label="名称">
              <el-input v-model="editData.name" placeholder="请输入名称"></el-input>
            </el-form-item>
            <el-form-item label="数量">
              <el-input-number v-model="editData.count" :min="0" placeholder="请输入数量"></el-input-number>
            </el-form-item>
          </el-form>
          <template #footer>
            <span class="dialog-footer">
              <el-button @click="isDialogOpen = false">取消</el-button>
              <el-button type="primary" @click="handleConfirm">确认</el-button>
            </span>
          </template>
        </el-dialog>
      </div>



    </div>



  </div>
</template>

<script>
import { ref } from 'vue';
import { getPatentStatistics, addPatentData, insertPatentClass, deletePatentClass, getPatentClass, updatePatentClassInfo, updatePatentFields, getPatentCountsByYear, getPatentList, updatePatentField, updatePatent } from '@/api/tec/patentScreen';
import { deletePatent } from '../../api/tec/patentScreen';
export default {
  data() {
    return {
      isPatentDialogVisible: false, // 控制弹窗显示
      patentFormData: {
        year: null,
        applications: null,
        authorizedCounts: null,
        publishedCounts: null,
        grade_a: null,
        grade_b: null,
        grade_c: null,
        grade_d: null,
        grade_e: null,
        transfers: null,
        licenses: null,
        pledges: null,
        state_one: true, // 默认显示
        state_two: true, // 默认显示
        state_three: true // 默认显示
      },
      patentFormRules: {
        year: [{ required: true, message: '请输入年份', trigger: 'blur' }],
        applications: [{ required: true, message: '请输入申请总数', trigger: 'blur' }],
        authorizedCounts: [{ required: true, message: '请输入授权数', trigger: 'blur' }],
        publishedCounts: [{ required: true, message: '请输入公开数', trigger: 'blur' }],
        grade_a: [{ required: true, message: '请输入A等级数量', trigger: 'blur' }],
        grade_b: [{ required: true, message: '请输入B等级数量', trigger: 'blur' }],
        grade_c: [{ required: true, message: '请输入C等级数量', trigger: 'blur' }],
        grade_d: [{ required: true, message: '请输入D等级数量', trigger: 'blur' }],
        grade_e: [{ required: true, message: '请输入E等级数量', trigger: 'blur' }],
        transfers: [{ required: true, message: '请输入专利转让数量', trigger: 'blur' }],
        licenses: [{ required: true, message: '请输入专利许可数量', trigger: 'blur' }],
        pledges: [{ required: true, message: '请输入专利质押数量', trigger: 'blur' }]
      },
      patentClassData: [], // 表格数据
      isAddPatentDialogVisible: false, // 控制新增弹窗显示
      newPatentForm: {
        patentName: '',
        collaborator: '',
        operationType: ''
      },
      patentFormRules: {
        patentName: [{ required: true, message: '请输入专利名称', trigger: 'blur' }],
        collaborator: [{ required: true, message: '请输入合作方名称', trigger: 'blur' }],
        operationType: [{ required: true, message: '请输入运营类型', trigger: 'blur' }]
      },

      PatentClassdialog: false, // 控制弹窗显示
      currentPatent: {
        id: null,
        patentName: '',
        collaborator: '',
        operationType: ''
      },
      patentClassData: [],
      editData: {
        name: "", // 名称
        count: null, // 数量
        index: null, // 序号
        id: null, // 数据库 ID
      },
      isDialogOpen: false, // 控制弹窗显示
      editDialogVisible: false, // 控制当前弹窗显示
      dialogVisible: false, // 控制弹窗显示
      inventorData: [], // 假设从后端获取的发明人数据
      applicantData: [], // 存储从后端获取的原始数据
      editFormData: {
        name: '',
        count: 0,
        id: null,
        field: '',
        countField: '',
      },
      patentData: [], // 存储从后端获取的原始数据
      fieldMapping: {
        '发明专利总量': 'inventionTotal',
        '实用新型总量': 'utilityModelTotal',
        '外观设计总量': 'designTotal',
        '专利授权总量(件)': 'totalpatentgranted',
        '发明授权总量(件)': 'totalinventiongranted',
        '专利申请总量(件)': 'applicationTotal',
        '有效专利总量(件)': 'valid_count',
        '专利转让(件)': 'totalTransfers',
        '专利许可(件)': 'totalLicenses',
        '专利质押(件)': 'totalPledges',
        '当年专利授权数量(件)': 'countYear',
        '发明专利': 'inventionPatent',
        '实用新型': 'utilityModelPatent',
        '外观设计': 'designPatent',
        'A类': 'a_class',
        'B类': 'b_class',
        'C类': 'c_class',
        'D类': 'd_class',
        'E类': 'e_class',
        'F类': 'f_class',
        'G类': 'g_class',
        'H类': 'h_class'
      },


      // 原有数据
      tableData: [
        { name: '发明专利总量', value: '' },
        { name: '实用新型总量', value: '' },
        { name: '外观设计总量', value: '' },
        { name: '专利申请总量(件)', value: '' },
        { name: '专利授权总量(件)', value: '' },
        { name: '发明授权总量(件)', value: '' },
        { name: '有效专利总量(件)', value: '' },
        { name: '当年专利授权数量(件)', value: '' },
        { name: '发明专利', value: '' },
        { name: '实用新型', value: '' },
        { name: '外观设计', value: '' }
      ],
      ipcStatisticsData: [
        { category: 'A类', count: '' },
        { category: 'B类', count: '' },
        { category: 'C类', count: '' },
        { category: 'D类', count: '' },
        { category: 'E类', count: '' },
        { category: 'F类', count: '' },
        { category: 'G类', count: '' },
        { category: 'H类', count: '' }
      ],
      dialogVisible: false,
      editForm: {
        id: 1,
        name: '',
        value: ''
      },

      dialogVisibleAnnual: false, // 控制第一个弹窗显示
      dialogVisibleType: false, // 控制第二个弹窗显示
      formData: {
        year: '',
        transfers: null,
        licenses: null,
        pledges: null,
        grade_a: null,
        grade_b: null,
        grade_c: null,
        grade_d: null,
        grade_e: null,
        applications: null,
        authorizedCounts: null,
        publishedCounts: null,
        state_one: null,
        state_two: null,
        state_three: null
      },
      form: {
        year: '',
        application: 0,
        license: 0,
        pledge: 0
      },
      rules: {
        year: [
          { required: true, message: '请输入年份', trigger: 'blur' },
          { pattern: /^\d{4}$/, message: '请输入四位数字年份', trigger: 'blur' }
        ],
        application: [
          { type: 'number', required: true, message: '请输入有效数字', trigger: 'blur' }
        ],
        license: [
          { type: 'number', required: true, message: '请输入有效数字', trigger: 'blur' }
        ],
        pledge: [
          { type: 'number', required: true, message: '请输入有效数字', trigger: 'blur' }
        ]
      }
    };
  },
  computed: {
    // 按数量从大到小排序后的数据
    sortedInventorData() {
      // 找到id为2的数据项
      const item = this.inventorData.find(item => item.id === 2);

      if (!item) return [];

      // 提取发明人名称和数量
      const inventors = [
        { inventorName: item.NumberOne, count: item.OneCount },
        { inventorName: item.NumberTwo, count: item.TwoCount },
        { inventorName: item.NumberThree, count: item.ThreeCount },
        { inventorName: item.NumberFour, count: item.FourCount },
        { inventorName: item.NumberFive, count: item.FiveCount },
        { inventorName: item.NumberSix, count: item.SixCount },
      ];

      // 不进行排序，直接添加序号
      return inventors.map((item, index) => ({
        ...item,
        index: index + 1,
      }));
    },

    // 按数量从大到小排序后的数据
    sortedApplicantData() {
      // 找到id为1的数据项
      const item = this.applicantData.find(item => item.id === 1);

      if (!item) return [];

      // 提取公司名和数量
      const applicants = [
        { companyName: item.NumberOne, count: item.OneCount },
        { companyName: item.NumberTwo, count: item.TwoCount },
        { companyName: item.NumberThree, count: item.ThreeCount },
        { companyName: item.NumberFour, count: item.FourCount },
        { companyName: item.NumberFive, count: item.FiveCount },
      ];

      // 不进行排序，直接添加序号
      return applicants.map((item, index) => ({
        ...item,
        index: index + 1,
      }));

    },


    // 按年份从小到大排序后的数据
    sortedPatentData() {
      return this.patentData.sort((a, b) => a.year - b.year);
    },


  },
  methods: {

    // 打开新增弹窗
    openAddPatentDialog() {
      this.isPatentDialogVisible = true;
    },
    // 关闭新增弹窗
    closePatentDialog() {
      this.isPatentDialogVisible = false;
      this.$refs.patentFormRef.resetFields(); // 清空表单
    },
    // 提交表单数据
    submitPatentForm() {
      this.$refs.patentFormRef.validate(async (valid) => {
        if (valid) {
          try {
            await addPatentData(this.patentFormData); // 调用后端接口
            this.$message.success('数据插入成功！');
            this.closePatentDialog(); // 关闭弹窗
            this.fetchData();
          } catch (error) {
            this.$message.error('数据插入失败：' + error.message);
          }
        } else {
          this.$message.warning('请检查表单输入是否正确！');
          return false;
        }
      });
    },




    // 显示新增弹窗
    showAddPatentDialog() {
      this.isAddPatentDialogVisible = true;
      this.resetPatentForm();
    },

    // 关闭新增弹窗
    closeAddPatentDialog() {
      this.isAddPatentDialogVisible = false;
      this.resetPatentForm();
    },

    // 提交新增专利分类
    submitNewPatent() {
      this.$refs.addPatentFormRef.validate((valid) => {
        if (valid) {
          insertPatentClass(this.newPatentForm)
            .then(response => {
              this.$message.success(response.data || '新增成功');
              this.closeAddPatentDialog(); // 关闭弹窗
              this.fetchData(); // 刷新表格数据
            })
            .catch(error => {
              this.$message.error('新增失败：' + (error.message || '未知错误'));
            });
        } else {
          this.$message.warning('请填写完整信息');
        }
      });
    },

    // 重置表单
    resetPatentForm() {
      this.newPatentForm = {
        patentName: '',
        collaborator: '',
        operationType: ''
      };
      this.$refs.addPatentFormRef && this.$refs.addPatentFormRef.clearValidate();
    },


    async deletePatentClasss(row) {
      try {
        // 弹出确认框
        await this.$confirm(`确定要删除专利 "${row.patentName}" 吗？`, '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        });

        // 调用删除 API
        await deletePatentClass(row.id);

        // 删除成功后，从表格数据中移除对应项
        this.fetchData(); // 刷新表格数据

        // 提示删除成功
        this.$message.success('删除成功');
      } catch (error) {
        if (error === 'cancel') {
          // 用户取消删除
          this.$message.info('已取消删除');
        } else {
          // 其他错误处理
          this.$message.error('删除失败，请稍后重试');
        }
      }
    },
    // 点击修改按钮时触发
    handlePatentClass(row) {
      this.currentPatent = { ...row }; // 深拷贝当前行数据
      this.PatentClassdialog = true; // 显示弹窗
    },
    // 点击确认按钮时触发
    async confirmUpdate() {
      try {
        const { id, patentName, collaborator, operationType } = this.currentPatent;
        await updatePatentClassInfo(id, patentName, collaborator, operationType); // 调用更新函数
        this.$message.success('更新成功'); // 提示成功
        this.PatentClassdialog = false; // 关闭弹窗
        this.fetchData(); // 刷新表格数据
      } catch (error) {
        this.$message.error('更新失败，请稍后再试'); // 提示失败
      }
    },


    handlesortedInventor(row) {
      this.openDialog(row, 2);
    },
    handlesortedApplicant(row) {
      //console.log("Current this in handlesortedApplicant:", this); // 打印 this
      //console.log("handlesortedApplicant called with row:", row);
      this.openDialog(row, 1);
    },



    openDialog(row, id) {
      console.log("openDialog called with row and id:", row, id);
      if (!row || !id) {
        console.error("Row or ID is undefined in openDialog");
        return;
      }
      this.editData = {
        name: row.companyName || row.inventorName,
        count: row.count,
        index: row.index,
        id: id,
      };
      this.isDialogOpen = true;
    },

    closeDialog() {
      console.log("Closing dialog...");
      try {
        if (this.$refs.form) {
          this.$refs.form.resetFields(); // 确保 form 存在后再调用 resetFields
        }
      } catch (error) {
        console.error("Error resetting form fields:", error);
      }
      this.isDialogOpen = false; // 关闭弹窗
    },

    async handleConfirm() {
      try {
        const { name, count, index, id } = this.editData;

        if (!name || !count || !index || !id) {
          this.$message.error("请填写完整信息！");
          return;
        }

        const fieldMap = {
          1: "NumberOne",
          2: "NumberTwo",
          3: "NumberThree",
          4: "NumberFour",
          5: "NumberFive",
          6: "NumberSix",
        };
        const countFieldMap = {
          1: "OneCount",
          2: "TwoCount",
          3: "ThreeCount",
          4: "FourCount",
          5: "FiveCount",
          6: "SixCount",
        };

        const field = fieldMap[index];
        const countField = countFieldMap[index];

        if (!field || !countField) {
          this.$message.error("字段映射失败，请检查序号！");
          return;
        }

        await updatePatentFields({
          id,
          field,
          fieldValue: name,
          countField,
          countValue: count,
        });

        this.$message.success("更新成功！");
        this.$emit("refresh"); // 刷新父组件数据
        await this.fetchData(); // 调用 fetchData 更新本地数据
      } catch (error) {
        console.error("Error in handleConfirm:", error);
        this.$message.error("更新失败，请稍后重试！");
      } finally {
        this.isDialogOpen = false;
      }
    },






    // 每年专利类型统计

    handleEditType(row) {
      this.formData = { ...row }; // 深拷贝行数据
      this.dialogVisibleType = true;
    },
    // 更新专利数据
    async handleUpdate() {
      try {
        const { year, ...updates } = this.formData; // 提取年份和其他字段
        await updatePatent(year, updates); // 调用更新接口
        this.$message.success('更新成功');
        this.dialogVisibleAnnual = false; // 关闭弹窗
        this.dialogVisibleType = false;
        this.fetchData(); // 刷新表格数据
      } catch (error) {
        this.$message.error(`更新失败：${error.message || '未知错误'}`);
      }
    },


    // 获取专利统计数据并排序
    // 获取专利统计数据并排序
    async fetchData() {
      try {
        const response = await getPatentClass();
        this.patentClassData = response; // 将后端返回的数据赋值给 patentClassData
      } catch (error) {
        console.error('获取专利数据失败:', error);
        this.$message.error('获取专利数据失败，请稍后再试！');
      }
      try {
        // 获取专利统计数据
        const response = await getPatentCountsByYear();
        if (response && Array.isArray(response)) {
          this.patentData = response; // 将原始数据赋值给 patentData
        } else {
          console.error('接口返回的数据格式不正确');
        }

        // 获取专利列表数据
        const listResponse = await getPatentList();
        if (listResponse && Array.isArray(listResponse)) {
          this.applicantData = listResponse.filter(item => item.id === 1); // 筛选申请人数据
          this.inventorData = listResponse.filter(item => item.id === 2); // 筛选发明人数据
        } else {
          console.error('获取专利列表失败');
        }
      } catch (error) {
        console.error('获取数据失败:', error);
        this.$message.error('获取数据失败，请稍后重试！');
      }
    },


    //专利件数统计
    async fetchPatentStatistics() {
      try {
        const response = await getPatentStatistics();
        const data = response[0]; // 假设后端返回的是一个数组，取第一个元素
        this.mapDataToTable(data); // 将数据映射到表格
        this.mapIpcDataToTable(data); // 将数据映射到表格
      } catch (error) {
        console.error('获取专利统计数据失败:', error);
      }
    },

    // 点击修改按钮时触发
    handleEdit(row) {
      this.editForm = { ...row, id: 1 }; // 固定 id 为 1
      this.dialogVisible = true;
    },

    handleEditIpc(row) {
      this.editForm = { ...row, id: 1, name: row.category, value: row.count }; // 固定 id 为 1
      this.dialogVisible = true;
    },






    // 映射数据到 tableData
    mapDataToTable(data) {
      this.tableData = this.tableData.map(item => {
        switch (item.name) {
          case '发明专利总量':
            item.value = data.inventionTotal || '';
            break;
          case '实用新型总量':
            item.value = data.utilityModelTotal || '';
            break;
          case '外观设计总量':
            item.value = data.designTotal || '';
            break;
          case '专利申请总量(件)':
            item.value = data.applicationTotal || '';
            break;
          case '专利授权总量(件)':
            item.value = data.totalpatentgranted || '';
            break;
          case '发明授权总量(件)':
            item.value = data.totalinventiongranted || '';
            break;
          case '有效专利总量(件)':
            item.value = data.valid_count || '';
            break;
          case '发明专利':
            item.value = data.inventionPatent || '';
            break;
          case '实用新型':
            item.value = data.utilityModelPatent || '';
            break;
          case '外观设计':
            item.value = data.designPatent || '';
            break;
          case '当年专利授权数量(件)':
            item.value = data.countYear || '';
            break;
          default:
            break;
        }
        return item;
      });
    },

    // 映射数据到 ipcStatisticsData
    mapIpcDataToTable(data) {
      this.ipcStatisticsData = this.ipcStatisticsData.map(item => {
        switch (item.category) {
          case 'A类':
            item.count = data.a_class || '';
            break;
          case 'B类':
            item.count = data.b_class || '';
            break;
          case 'C类':
            item.count = data.c_class || '';
            break;
          case 'D类':
            item.count = data.d_class || '';
            break;
          case 'E类':
            item.count = data.e_class || '';
            break;
          case 'F类':
            item.count = data.f_class || '';
            break;
          case 'G类':
            item.count = data.g_class || '';
            break;
          case 'H类':
            item.count = data.h_class || '';
            break;
          default:
            break;
        }
        return item;
      });
    },


    // 确认修改
    async confirmEdit() {
      try {
        const { id, name, value } = this.editForm;

        console.log('editForm:', { id, name, value }); // 打印 editForm 以进行调试
        console.log('fieldMapping:', this.fieldMapping); // 确认 fieldMapping 是否正确加载

        // 清理 name 的值（去除首尾空格）
        const cleanName = name.trim();
        console.log('Cleaned name:', cleanName); // 打印清理后的 name

        // 使用映射表获取对应的 field
        const field = this.fieldMapping[cleanName];

        if (!field) {
          console.error('未找到对应的 field:', cleanName);
          this.$message.error(`未找到对应的字段: ${cleanName}，请稍后重试！`);
          return;
        }

        // 确保 id 是数字类型
        const numericId = Number(id);

        // 打印传入后端的参数
        console.log('传入后端的参数:', { id: numericId, field, value });

        // 调用后端接口，确保传递了正确的参数名称
        await updatePatentField(numericId, field, value);

        // 更新本地数据
        if (this.tableData.some(item => item.name === name)) {
          this.tableData = this.tableData.map(item =>
            item.name === name ? { ...item, value } : item
          );
        } else if (this.ipcStatisticsData.some(item => item.category === name)) {
          this.ipcStatisticsData = this.ipcStatisticsData.map(item =>
            item.category === name ? { ...item, count: value } : item
          );
        }

        this.dialogVisible = false;
        this.$message.success('修改成功！');
      } catch (error) {
        console.error('修改失败:', error);
        this.$message.error('修改失败，请稍后重试！');
      }
    },


    handleAdd() {
      this.dialogVisible = true;
      this.$nextTick(() => {
        this.$refs.annualForm.resetFields();
      });
    },

    closeDialog() {
      this.$refs.annualForm.resetFields();
    },


  },

  mounted() {
    //专利类型统计
    this.fetchData(); // 在组件挂载时调用方法获取数据
    //专利件数统计
    this.fetchPatentStatistics(); // 在组件挂载时获取数据
  }
};
</script>




<style scoped>
.table-container {
  display: flex;
  flex-direction: column;
  gap: 20px;
  position: absolute;
  top: 0;
  left: 0;
  width: 90vw;
  height: calc(100vh - 100px);
  padding: 10px;
  background-color: #fff;
  border: 2px solid #409eff;
  border-radius: 8px;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.1);
  box-sizing: border-box;
  overflow-y: auto;
}

.tables-container {
  display: flex;
  gap: 10px;
  margin-bottom: 2px;
}

.left-table-container {
  flex: 0 0 24%;
}

.middle-table-container {
  flex: 0 0 20%;
}

.right-table-container {
  flex: 0 0 46%;
}

.new-table-container,
.additional-table-container {
  width: 95%;
  padding: 10px;
  background-color: #f5f7fa;
  border: 1px solid #ebeef5;
  border-radius: 4px;
  box-sizing: border-box;
}

.additional-tables-container {
  display: flex;
  justify-content: space-between;
  gap: 10px;
  margin-bottom: 10px;
  width: 90%;
}

.additional-table-container {
  flex: 0 0 50%;
}

@media (max-width: 1024px) {
  .tables-container {
    flex-direction: column;
  }

  .left-table-container,
  .middle-table-container,
  .right-table-container {
    width: 100%;
    margin: 10px 0;
  }

  .additional-tables-container {
    flex-direction: column;
  }

  .additional-table-container {
    width: 100%;
    flex: 0 0 100%;
    margin-right: 0;
  }
}

h3 {
  margin: 0 0 5px;
  font-size: 1.1rem;
  color: #409eff;
  text-align: center;
}

.styled-table {
  border: 1px solid #ddd;
  font-size: 0.9rem;
  margin-bottom: 2px;
}

.styled-table td,
.styled-table th {
  border: 1px solid #ddd;
  padding: 6px;
}

.center-aligned .cell {
  text-align: center;
}

.styled-table th {
  background-color: #f5f7fa;
  color: #606266;
}

.el-button--mini {
  padding: 5px 10px;
  font-size: 0.8rem;
}

.right-table-container .el-button {
  display: block;
  margin: 10px 0;
  width: 100%;
}

.button-container {
  display: flex;
  justify-content: center;
  gap: 5px;
}

.header-with-button {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 10px;
}

.title-container {
  flex: 1;
  display: flex;
  justify-content: center;
}

.add-button-container {
  display: flex;
  justify-content: center;
  margin-top: 0px;
}
</style>