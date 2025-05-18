<template>
  <div class="container">
    <!-- 第一行 -->
    <div class="row">
      <!-- 合作方式饼状图 -->
      <div class="chart-container one-third-width">
        <div class="chart-header">
          <h3>合作方式饼状图</h3>
          <button class="data-analysis-button" @click="handleDataAnalysis('cooperation')">数据分析</button>
        </div>
        <div ref="cooperationChart" class="chart"></div>
      </div>

      <!-- 所属学院柱形图 -->
      <div class="chart-container two-third-width">
        <div class="chart-header">
          <h3>所属学院柱形图</h3>
          <button class="data-analysis-button" @click="handleDataAnalysis('college')">数据分析</button>
        </div>
        <div ref="collegeChartRef" class="chart"></div>
      </div>
    </div>

    <!-- 第二行 -->
    <div class="row">
      <!-- IPC领域饼状图 -->
      <div class="chart-container one-third-width">
        <div class="chart-header">
          <h3>IPC领域饼状图</h3>
          <button class="data-analysis-button" @click="handleDataAnalysis('ipc')">数据分析</button>
        </div>
        <div ref="ipcChart" class="chart"></div>
      </div>

      <!-- 技术成熟度饼状图 -->
      <div class="chart-container one-third-width">
        <div class="chart-header">
          <h3>技术成熟度饼状图</h3>
          <button class="data-analysis-button" @click="handleDataAnalysis('maturity')">数据分析</button>
        </div>
        <div ref="techMaturityRoseChart" class="chart"></div>
      </div>

      <!-- 技术先进度柱形图 -->
      <div class="chart-container one-third-width">
        <div class="chart-header">
          <h3>技术先进度柱形图</h3>
          <button class="data-analysis-button" @click="handleDataAnalysis('advancement')">数据分析</button>
        </div>
        <div ref="techAdvancementChart" class="chart"></div>
      </div>
    </div>

    <!-- 第三行 -->
    <div class="row">
      <!-- 所属领域柱形图 -->
      <div class="chart-container half-width">
        <div class="chart-header">
          <h3>所属领域柱形图</h3>
          <button class="data-analysis-button" @click="handleDataAnalysis('field')">数据分析</button>
        </div>
        <div ref="fieldChart" class="chart"></div>
      </div>

      <!-- 申请日期曲线图 -->
      <div class="chart-container half-width">
        <div class="chart-header">
          <h3>申请日期曲线图</h3>
          <div class="select-and-button-container">
            <select v-model="selectedYear" @change="loadPatentData"
              :class="{ 'custom-select': true, 'all-selected': selectedYear === null }">
              <option :value="null">最近十年</option>
              <option v-for="year in availableYears" :key="year" :value="year">{{ year }}</option>
            </select>
            <button class="data-analysis-button" @click="handleDataAnalysis('applicationDate')">数据分析</button>
          </div>
        </div>
        <div ref="patentChartContainer" class="chart"></div>
      </div>
    </div>

    <!-- 第四行：搜索框 -->
    <div class="row search-row">
      <div class="search-container">
        <input type="text" v-model="inventorName" placeholder="请输入发明人名称" class="search-input" />
        <button class="search-button" @click="searchCountByYear">搜索</button>
      </div>
    </div>

    <!-- 第五行 -->
    <div class="row">
      <!-- 申请日期曲线图 -->
      <div class="chart-container one-third-width">
        <div class="chart-header">
          <h3>申请日期曲线图</h3>
        </div>
        <div ref="applicationDateChart" class="chart"></div>
      </div>

      <!-- ipc类别柱形图 -->
      <div class="chart-container one-third-width">
        <div class="chart-header">
          <h3>ipc类别柱形图</h3>
        </div>
        <div ref="ipcCategoryChart" class="chart"></div>
      </div>

      <!-- 专利名称滚动图 -->
      <div class="chart-container one-third-width">
        <div class="chart-header">
          <h3>专利名称滚动图</h3>
        </div>
        <div ref="patentNameChart" class="chart"></div>
      </div>
    </div>

    <!-- 弹窗 -->
    <el-dialog title="查看详情" :visible.sync="dialogVisible" width="50%">
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
          <el-input v-model="currentRow.inventors" readonly></el-input>
        </el-form-item>
        <el-form-item label="申请人">
          <el-input v-model="currentRow.applicants" readonly></el-input>
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
        <el-form-item label="更新时间">
          <el-input v-model="currentRow.updateTime" readonly></el-input>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible = false">关闭</el-button>
      </span>
    </el-dialog>


    <!-- 数据分析结果弹窗 -->
    <el-dialog title="专利申请趋势分析" :visible.sync="isAnalysisDialogVisible" width="60%">
      <div v-if="analysisTexts.length > 0" style="white-space: pre-wrap; line-height: 1.8;">
        <div v-for="(text, index) in analysisTexts" :key="index" class="analysis-item">
          {{ text }}
        </div>
      </div>
      <div v-else>
        <p>暂无分析数据。</p>
      </div>
    </el-dialog>

    <!-- 弹窗：合作方式分布分析 -->
    <el-dialog title="合作方式分布分析" :visible.sync="isWayDistributionDialogVisible" width="60%" :before-close="handleClose">
      <div v-if="wayDistributionAnalysisData">
        <p><strong>总记录数：</strong>{{ wayDistributionAnalysisData.total }}</p>
        <pre style="white-space: pre-wrap;">{{ wayDistributionAnalysisData.description }}</pre>
        <div v-if="wayDistributionAnalysisData.data && wayDistributionAnalysisData.data.length">
          <h4>详细数据分布：</h4>
          <ul>
            <li v-for="(item, index) in wayDistributionAnalysisData.data" :key="index">
              {{ item.name }} - 数量：{{ item.count }} - 占比：{{ item.percentage }}%
            </li>
          </ul>
        </div>
      </div>
      <div v-else>
        <p>正在加载数据...</p>
      </div>
    </el-dialog>


    <!-- 学院统计分析弹窗 -->
    <el-dialog title="学院专利申请分析" :visible.sync="isCollegeAnalysisDialogVisible" width="60%"
      :before-close="handleCloseCollegeAnalysis" center>
      <div class="analysis-content">
        <!-- 关键改动在这里 -->
        <pre class="formatted-text">{{ analysisText }}</pre>
      </div>
      <span slot="footer" class="dialog-footer">
        <el-button @click="handleCloseCollegeAnalysis">关闭</el-button>
      </span>
    </el-dialog>

    <!-- IPC领域占比分析弹窗 -->
    <el-dialog title="IPC领域占比分析" :visible.sync="isIpcAnalysisDialogVisible" width="50%"
      :before-close="handleCloseIpcAnalysis">
      <div>
        <p><strong>总记录数：</strong>{{ ipcTotal }}</p>
        <p><strong>描述信息：</strong></p>
        <pre class="analysis-description">{{ ipcAnalysisDescription }}</pre>

        <h4>IPC分类占比：</h4>
        <ul>
          <li v-for="(value, key) in ipcProportions" :key="key">
            {{ key }}: {{ value.toFixed(2) }}%
          </li>
        </ul>
      </div>
      <span slot="footer" class="dialog-footer">
        <el-button @click="handleCloseIpcAnalysis">关 闭</el-button>
      </span>
    </el-dialog>


    <!-- 技术成熟度分析弹窗 -->
    <el-dialog title="技术成熟度分析" :visible.sync="isMaturityAnalysisDialogVisible" @close="handleCloseMaturityAnalysis"
      width="80%">
      <div v-if="maturityAnalysisData">
        <p><strong>总记录数：</strong>{{ maturityTotal }}</p>
        <p><strong>分析描述：</strong></p>
        <pre style="background-color: #f5f5f5; padding: 10px;">{{ maturityAnalysisDescription }}</pre>
        <!-- 使用 <pre> 标签保留格式 -->

        <h4>各技术成熟度等级占比：</h4>
        <ul>
          <li v-for="(value, key) in maturityProportions" :key="key">
            {{ levelMapping[key] || key }}:{{ value }} 条({{ ((value / maturityTotal) * 100).toFixed(2) }}%)
          </li>
        </ul>
      </div>
      <div v-else>
        <p>正在加载数据...</p>
      </div>
    </el-dialog>

    <!-- 技术先进度分析弹窗 -->
    <el-dialog title="技术先进度分析报告" :visible.sync="isAdvancementAnalysisDialogVisible"
      @close="handleCloseAdvancementAnalysis" width="70%">
      <div class="analysis-content">
        <pre style="white-space: pre-wrap;">{{ advancementAnalysisDescription }}</pre>
      </div>
    </el-dialog>


    <!-- 领域分析弹窗 -->
    <el-dialog title="领域分布分析报告" :visible.sync="isFieldAnalysisDialogVisible" width="70%"
      @close="handleCloseFieldAnalysis">
      <div v-if="fieldAnalysisDescription" style="white-space: pre-line;">
        {{ fieldAnalysisDescription }}
      </div>

      <el-table :data="fieldPercentageList"  style="margin-top: 20px;">
        <el-table-column prop="field" label="领域名称"></el-table-column>
        <el-table-column prop="percentage" label="占比"></el-table-column>
      </el-table>


    </el-dialog>



  </div>
</template>


<script>
import * as echarts from "echarts";
import { getFieldPercentages, getAdvancementLevelAnalysis, getTechnologyLevelAnalysis, getCollegeStatistics, listFieldCounts, listWayDistribution, listAdvancementLevel, listCollegeCounts, listTechnologyLevelCounts, getWayDistributionAnalysis } from '@/api/tec/tecachievement';
import { getIpcClass, getCountByYear, getIpcCategoryProportions } from '@/api/tec/patentScreen';
import { getPatentTrendSummary, getPatentByName, getPatentsByInventor, getIpcDistributionByInventor, getPatentCountByYearMonth } from '@/api/tec/patentScreen';


export default {
  name: "Dashboard",
  data() {
    return {
      // 领域分析相关
      isFieldAnalysisDialogVisible: false,
      fieldAnalysisDescription: "",
      fieldPercentageList: [],
      fieldChartData: [], // 用于 ECharts 图表数据
      fieldPieChartInstance: null,
      // 技术先进度分析相关数据
      isAdvancementAnalysisDialogVisible: false,
      advancementAnalysisData: null, // 存储 getAdvancementLevelAnalysis 返回的数据
      advancementAnalysisDescription: '', // 分析描述文本
      advancementTotal: 0, // 总项目数
      advancementValidProjects: 0, // 有效项目数（不含未定义）
      advancementUndefinedProjects: 0, // 未定义级别数量
      // 新增：技术成熟度分析相关数据
      isMaturityAnalysisDialogVisible: false,
      maturityAnalysisData: null, // 存储 getTechnologyLevelAnalysis 返回的原始数据
      maturityAnalysisDescription: '', // 分析描述文本
      maturityTotal: 0, // 总量
      maturityProportions: {}, // 各等级占比对象
      // 新增：IPC领域占比分析相关数据
      isIpcAnalysisDialogVisible: false,
      ipcAnalysisData: null, // 存储从 getIpcCategoryProportions 获取的数据
      ipcAnalysisDescription: '', // 描述信息
      ipcTotal: 0, // 总数
      ipcProportions: {}, // 占比对象
      // 新增：学院统计分析相关数据
      analysisText: '', // ← 用于保存后端返回的完整 analysis 字符串
      isCollegeAnalysisDialogVisible: false,
      collegeAnalysisData: null,
      analysisLines: [],
      // 新增数据项：用于合作方式分布分析弹窗
      isWayDistributionDialogVisible: false,
      wayDistributionAnalysisData: null,
      //申请日期数据分析
      isAnalysisDialogVisible: false,
      analysisTexts: [],

      //发明人专利
      currentRow: {
        agency: '',
        publicationNumber: '',
        applicationNumber: '',
        applicationDate: '',
        patentName: '',
        briefStatement: '',
        abstractText: '',
        mainClaim: '',
        inventors: '',
        applicants: '',
        applicantCountry: '',
        publicationDate: '',
        ipcClass: '',
        createTime: '',
        updateTime: ''
      },
      dialogVisible: false,
      //发明人发明名称
      inventorPatentNameList: [], // 新增字段：用于存储专利名称列表
      //发明人ipc
      ipcInventorChartInstance: null,
      ipcInventorData: [], //
      //发明人申请日期趋势
      inventorName: '王军',
      countByYearData: [], // 使用 countByYearData 
      countByYearChartInstance: null, // 使用 countByYearChartInstance 
      //申请日期
      myChartInstance: null, // 更改chart为myChartInstance
      selectedYear: '2024', // 默认选中2024年
      allPatentData: [], // 更改allData为allPatentData
      availableYears: [], // 可选年份列表

      //所属领域
      echartInstance: null, // ECharts 图表实例
      fieldData: [], // 存储从后端获取的数据
      FIELD_MAP: {
        '1': '电子信息',
        '2': '先进制造',
        '3': '生物、医药和医疗器械',
        '4': '化工',
        '5': '纺织',
        '6': '新材料',
        '7': '新能源与高效节能',
        '8': '环境保护与资源综合利用',
        '9': '海洋',
        '10': '农业',
        '11': '现代交通',
        '12': '城市建设与社会发展',
        '13': '其它'
      },
      //技术成熟度
      techMaturityChartInstance: null, // ECharts 实例
      technologyLevelData: [], // 后端返回的统计数据
      levelMapping: {
        "1": "正在研发",
        "2": "已有样品",
        "3": "通过小试",
        "4": "通过中试",
        "5": "可以量产",
        "6": "其他",
      }, // 数字到中文的映射表
      //ipc领域统计
      chart: null, // 存储 ECharts 实例
      ipcData: {}, // 存储后端返回的数据
      //所属学院
      chartInstanceRef: null, // 图表实例
      collegeMap: {
        '1': '计算机学院',
        '2': '法学院',
        '3': '土木学院',
        '4': '管理学院',
        '5': '热能学院',
        '6': '市政学院',
        '7': '建筑学院',
        '8': '材料学院',
        '9': '交通学院',
        '10': '商学院',
        '11': '理学院',
        '13': '外国语学院',
        '14': '马克思学院',
        '15': '测绘学院',
        '16': '信电学院',
        '17': '机电学院'
      },
      //先进度
      chartInstance: null,
      advancementLevelData: [], // 存储后端返回的数据
      wayMapping: {
        "1": "技术转让",
        "2": "专利许可",
        "3": "委托开发",
        "4": "合作开发",
        "5": "技术咨询",
        "6": "技术服务",
        "7": "技术入股",
        "8": "股权投资",
        "9": "其他"
      }
    };
  },
  mounted() {
    //申请人ipc
    // 页面加载后初始化图表实例
    if (this.$refs.ipcCategoryChart) {
      this.ipcInventorChartInstance = echarts.init(this.$refs.ipcCategoryChart);
    } else {
      console.error('ipcCategoryChart ref 在 mounted 阶段不存在');
    }

    // 默认查询“王军”的专利统计信息
    this.inventorName = '王军';
    this.searchCountByYear(); // 自动触发搜索
    //申请日期
    this.setupPatentChart(); // 更改initChart为setupPatentChart
    this.retrieveAllPatentData(); // 更改fetchAllData为retrieveAllPatentData
    //所属领域
    this.initializeEchart();
    this.fetchFieldCounts();
    //技术成熟度
    this.fetchTechnologyLevelCounts();
    //ipc领域统计
    this.fetchIpcData(); // 页面加载时获取数据
    //所属学院数量
    this.fetchCollegeCounts();
    //技术先进度
    this.fetchAdvancementLevelData(); // 页面加载时获取数据

    this.initCharts();
    //合作方式
    this.fetchData();
  },
  methods: {
    async handleDataAnalysis(chartType) {
      if (chartType === 'cooperation') {
        this.isWayDistributionDialogVisible = true;
        if (!this.wayDistributionAnalysisData) {
          try {
            const res = await getWayDistributionAnalysis();
            this.wayDistributionAnalysisData = res;
          } catch (error) {
            console.error("获取合作方式分布数据分析失败:", error);
            this.wayDistributionAnalysisData = { description: "无法获取数据，请稍后再试。", total: 0, data: [] };
          }
        }
      } else if (chartType === 'applicationDate') {
        try {
          const response = await getPatentTrendSummary();
          this.analysisTexts = response.split('\n').filter(line => line.trim() !== '');
          this.isAnalysisDialogVisible = true;
        } catch (error) {
          console.error('获取专利趋势摘要失败:', error);
          this.$message.error('获取数据分析失败');
        }
      } else if (chartType === 'college') {
        this.isCollegeAnalysisDialogVisible = true;
        if (!this.collegeAnalysisData) {
          try {
            const res = await getCollegeStatistics();
            this.collegeAnalysisData = res;
            this.analysisText = res.analysis || '';
          } catch (error) {
            console.error("获取学院统计分析失败:", error);
            this.analysisText = "无法加载学院分析数据，请稍后再试。";
          }
        }
      } else if (chartType === 'ipc') {
        this.isIpcAnalysisDialogVisible = true;
        if (!this.ipcAnalysisData) {
          try {
            const res = await getIpcCategoryProportions(); // 调用新API
            this.ipcAnalysisData = res;
            this.ipcAnalysisDescription = res.description || '暂无描述';
            this.ipcTotal = res.total || 0;
            this.ipcProportions = res.proportions || {};
          } catch (error) {
            console.error("获取IPC分类占比数据分析失败:", error);
            this.ipcAnalysisDescription = "无法加载IPC分析数据，请稍后再试。";
            this.ipcTotal = 0;
            this.ipcProportions = {};
          }
        }
      } else if (chartType === 'maturity') {
        this.isMaturityAnalysisDialogVisible = true;
        if (!this.maturityAnalysisData) {
          try {
            const res = await getTechnologyLevelAnalysis();
            console.log("获取的技术成熟度分析数据:", res);

            const levels = res.levels || [];
            const total = levels.reduce((sum, item) => sum + parseInt(item.count || 0), 0);
            const proportions = {};
            levels.forEach(item => {
              proportions[item.level] = parseInt(item.count);
            });

            this.maturityAnalysisData = {
              description: res.description,
              total,
              proportions
            };
            this.maturityAnalysisDescription = res.description || '暂无描述';
            this.maturityTotal = total;
            this.maturityProportions = proportions;

          } catch (error) {
            console.error("获取技术成熟度分析数据失败:", error);
            this.maturityAnalysisDescription = "无法加载技术成熟度分析数据，请稍后再试。";
            this.maturityTotal = 0;
            this.maturityProportions = {};
          }
        }
      } else if (chartType === 'advancement') {
        this.isAdvancementAnalysisDialogVisible = true;
        if (!this.advancementAnalysisData) {
          try {
            const res = await getAdvancementLevelAnalysis();
            console.log("获取的技术先进度分析数据:", res);

            this.advancementAnalysisData = res;
            this.advancementAnalysisDescription = res.naturalDescription || '暂无描述';
            this.advancementTotal = res.totalProjects || 0;
            this.advancementValidProjects = res.validProjects || 0;
            this.advancementUndefinedProjects = res.undefinedProjects || 0;

          } catch (error) {
            console.error("获取技术先进度分析数据失败:", error);
            this.advancementAnalysisDescription = "无法加载技术先进度分析数据，请稍后再试。";
            this.advancementTotal = 0;
            this.advancementValidProjects = 0;
            this.advancementUndefinedProjects = 0;
          }
        }
      } else if (chartType === 'field') {
        this.isFieldAnalysisDialogVisible = true;
        if (!this.fieldPercentageList.length) {
          try {
            const res = await getFieldPercentages();
            console.log("获取的领域分析数据:", res);

            this.fieldAnalysisDescription = res.description || '';
            this.fieldPercentageList = res.percentages || [];

          } catch (error) {
            console.error("获取领域分析失败:", error);
            this.fieldAnalysisDescription = "无法加载领域分析数据，请稍后再试。";
            this.fieldPercentageList = [];
          }
        }
      } else {
        alert(`暂未实现 ${chartType} 的数据分析功能`);
      }
    },

    handleCloseFieldAnalysis(done = () => { }) {
      this.isFieldAnalysisDialogVisible = false;
      if (this.fieldPieChartInstance) {
        this.fieldPieChartInstance.dispose();
        this.fieldPieChartInstance = null;
      }
      done();
    },

    // 关闭技术先进度分析弹窗
    handleCloseAdvancementAnalysis(done = () => { }) {
      this.isAdvancementAnalysisDialogVisible = false;
      done();
    },
    // 关闭技术成熟度分析弹窗
    handleCloseMaturityAnalysis(done = () => { }) {
      this.isMaturityAnalysisDialogVisible = false;
      done();
    },

    // 关闭合作方式弹窗
    handleClose(done) {
      this.isWayDistributionDialogVisible = false;
      done();
    },

    // 关闭日期分析弹窗
    handleCloseApplicationDateAnalysis(done) {
      this.isAnalysisDialogVisible = false;
      done();
    },

    // 关闭学院统计分析弹窗
    handleCloseCollegeAnalysis(done = () => { }) {
      this.isCollegeAnalysisDialogVisible = false;
      done();
    },

    // 关闭IPC分析弹窗
    handleCloseIpcAnalysis(done = () => { }) {
      this.isIpcAnalysisDialogVisible = false;
      done();
    },


    //发明人ipc
    updateIpcCategoryChart() {


      if (!this.ipcInventorChartInstance) {
        if (this.$refs.ipcCategoryChart) {
          this.ipcInventorChartInstance = echarts.init(this.$refs.ipcCategoryChart);

        } else {

          return;
        }
      }

      // 使用响应式数据
      const data = this.ipcInventorData;

      // 数据合法性校验
      if (!Array.isArray(data)) {

        return;
      }



      // 构造饼图需要的数据格式： { name: 'E', value: 64 }
      const seriesData = data.map(item => ({
        name: item.first_letter,
        value: item.count
      }));


      // 颜色列表，用于不同类别的区分
      const colors = ['#5470C6', '#91CC75', '#FAC858', '#EE6666', '#73C0DE', '#3BA272', '#CA8622'];

      // 饼图配置项
      const option = {
        tooltip: {
          trigger: 'item',
          formatter: '{a}<br/>{b}: {c} (件) {d}%'
        },
        legend: {
          orient: 'vertical',
          left: 'right',
          top: 'center',
          data: seriesData.map(d => d.name)
        },
        series: [{
          name: '专利分布',
          type: 'pie',
          radius: '50%',
          data: seriesData,
          emphasis: {
            itemStyle: {
              shadowBlur: 10,
              shadowOffsetX: 0,
              shadowColor: 'rgba(0, 0, 0, 0.5)'
            }
          },
          itemStyle: {
            borderRadius: 5,
            borderColor: '#fff',
            borderWidth: 2
          },
          label: {
            show: true,
            position: 'outside',
            formatter: '{b}: {c} ({d}%)'
          },
          color: colors
        }]
      };



      // 设置图表选项
      this.ipcInventorChartInstance.setOption(option, true); // 强制刷新

    },

    //发明人申请日期趋势
    // 搜索与 countByYear 相关的数据

    // 更新搜索函数，确保使用正确的参数名
    async searchCountByYear() {
      const inventorName = this.inventorName.trim();
      if (!inventorName) {
        this.$message.warning('请输入发明人名称');
        return;
      }

      try {
        console.log('⏳ 开始请求 inventorName =', inventorName); // 打印当前发明人名称

        const yearData = await getCountByYear(inventorName);

        // 过滤掉没有 "year" 属性的记录
        const filteredYearData = yearData.filter(item => item.year != null);

        console.log('📊 getCountByYear 返回的数据 (过滤后):', filteredYearData); // 查看过滤后的 yearData 内容

        const ipcData = await getIpcDistributionByInventor(inventorName);
        const patentList = await getPatentsByInventor(inventorName);

        this.inventorPatentNameList = patentList.map(item => item.patent_name);
        this.countByYearData = filteredYearData; // 使用过滤后的数据
        this.ipcInventorData = ipcData;

        this.renderCountByYearChart();
        this.updateIpcCategoryChart();
        this.renderInventorPatentNameScroll();

      } catch (error) {
        console.error("❌ 请求过程中发生错误：", error);
        this.$message.error('获取数据失败，请稍后再试');
      }
    },



    renderInventorPatentNameScroll() {
      const container = this.$refs.patentNameChart;
      if (!container) {
        console.warn('容器未找到或未正确初始化');
        return;
      }

      // 清空原有内容
      container.innerHTML = '';


      // 设置容器样式
      container.style.overflowY = 'auto'; // 允许垂直滚动
      container.style.height = '200px';   // 固定高度，可以根据实际需要调整


      // 创建 ul 元素
      const ul = document.createElement('ul');
      ul.style.listStyleType = 'none';
      ul.style.padding = '0';
      ul.style.margin = '0';

      // 动态生成 li 和 查看按钮
      this.inventorPatentNameList.forEach((name, index) => {
        const li = document.createElement('li');
        li.style.display = 'flex';
        li.style.justifyContent = 'space-between';
        li.style.alignItems = 'center';
        li.style.padding = '8px 16px';
        li.style.borderBottom = '1px solid #ddd';
        li.style.fontSize = '14px';
        li.style.whiteSpace = 'nowrap';
        li.style.overflow = 'hidden';
        li.style.textOverflow = 'ellipsis';

        const nameLabel = document.createElement('span');
        nameLabel.textContent = name;
        nameLabel.title = name; // 当鼠标悬停时显示完整名称作为提示
        nameLabel.style.maxWidth = 'calc(100% - 70px)'; // 根据按钮宽度和间距调整
        nameLabel.style.overflow = 'hidden';
        nameLabel.style.textOverflow = 'ellipsis';
        nameLabel.style.whiteSpace = 'nowrap';

        const viewButton = document.createElement('button');
        viewButton.textContent = '查看';
        viewButton.classList.add('search-button'); // 应用 .search-button 样式
        viewButton.onclick = () => this.onViewButtonClick(name, index); // 绑定点击事件

        li.appendChild(nameLabel);
        li.appendChild(viewButton);
        ul.appendChild(li);
      });

      container.appendChild(ul);
      console.log('已将所有专利名称列表项添加至容器');
    },

    async onViewButtonClick(patentName, index) {
      console.log(`"查看" 按钮被点击，专利名称: ${patentName}, 索引: ${index}`);
      if (!patentName) {
        console.error('未提供有效的专利名称');
        return;
      }

      try {
        console.log(`正在通过专利名称 "${patentName}" 获取专利详情`);
        const res = await getPatentByName(patentName);

        if (res) { // 直接检查 data 是否存在
          console.log(`成功获取专利 "${patentName}" 的详情`);
          const data = res;

          // 根据接口返回的数据结构映射赋值给 currentRow
          this.currentRow = {
            agency: res.agency || '',
            publicationNumber: res.publication_number || '', // 注意这里应与模板中的 v-model 保持一致
            applicationNumber: res.application_number || '',
            applicationDate: res.application_date || '',
            patentName: res.patent_name || '',
            briefStatement: '', // 如果接口中没有对应字段，留空或补充说明
            abstractText: res.abstract || '',
            mainClaim: res.main_claim || '',
            inventors: res.inventors || '',
            applicants: res.applicants || '',
            applicantCountry: res.applicant_country || '',
            publicationDate: res.publication_date?.split('==')[1] || '', // 取第二个日期作为公开日
            ipcClass: res.ipc_class || '',
            createTime: res.create_time || '',
            updateTime: res.update_time || ''
          };

          this.dialogVisible = true; // 显示弹窗
          console.log('专利详情已更新，并显示了查看详情对话框');
        } else {
          console.warn('从服务器接收到的响应中缺少"data"字段:', res);
          this.$message.error('未找到相关专利');
        }
      } catch (err) {
        console.error('请求失败，请重试', err);
        this.$message.error('请求失败，请重试');
      }
    },


    // 渲染与 countByYear 相关的图表
    renderCountByYearChart() {
      const years = this.countByYearData.map(item => item.year);
      const counts = this.countByYearData.map(item => item.count);

      if (!this.countByYearChartInstance) {
        this.countByYearChartInstance = echarts.init(this.$refs.applicationDateChart);
      }

      const option = {
        tooltip: {
          trigger: 'axis'
        },
        grid: {
          top: '8%',
          left: '8%',
          right: '3%',
          bottom: '15%'
        },
        xAxis: {
          type: 'category',
          data: years,
          axisLabel: {
            margin: 10,
            align: 'center', // 标签水平居中对齐
          }
        },
        yAxis: {
          type: 'value'
        },
        series: [{
          name: '专利数量',
          type: 'line',
          data: counts,
          smooth: true
        }]
      };

      this.countByYearChartInstance.setOption(option, true);
    },
    //申请日期
    async retrieveAllPatentData() {
      try {
        const res = await getPatentCountByYearMonth();
        this.allPatentData = res;
        this.extractAvailableYears();
        this.loadPatentData(); // 加载默认年份数据
      } catch (error) {
        console.error('获取专利数据失败:', error);
      }
    },
    extractAvailableYears() {
      const years = [...new Set(this.allPatentData.map(item => item.year))].sort();
      this.availableYears = years;
    },
    loadPatentData() {
      if (this.selectedYear === null) {
        // 处理“全部”情况，仅统计最近十年的总数
        const currentYear = new Date().getFullYear();
        const recentYearsData = this.allPatentData.filter(item =>
          item.year >= currentYear - 10 && item.year <= currentYear);

        const yearlyTotals = this.calculateTotalCountsByYear(recentYearsData);

        // 转换为数组格式并排序
        const chartData = Object.entries(yearlyTotals)
          .map(([year, count]) => ({ year, count }))
          .sort((a, b) => a.year.localeCompare(b.year));

        const years = chartData.map(item => item.year);
        const counts = chartData.map(item => item.count);

        this.renderBarChart(years, counts); // 渲染柱状图
      } else {
        // 处理单年情况，显示每月趋势
        const yearlyData = this.allPatentData.filter(item => item.year === this.selectedYear);

        const fullData = Array.from({ length: 12 }, (_, i) => {
          const month = (i + 1).toString().padStart(2, '0');
          const found = yearlyData.find(d => d.month === month);
          return { month, count: found ? found.count : 0 };
        });

        const months = fullData.map(item => item.month);
        const counts = fullData.map(item => item.count);

        this.renderLineChart(months, counts); // 渲染折线图
      }
    },

    calculateTotalCountsByYear(data) {
      const result = {};
      data.forEach(item => {
        const year = item.year;
        const count = item.count || 0;

        if (!result[year]) {
          result[year] = 0;
        }

        result[year] += count;
      });

      return result;
    },
    setupPatentChart() {
      this.myChartInstance = echarts.init(this.$refs.patentChartContainer); // 初始化图表实例
    },
    renderLineChart(months, counts) {
      const option = {
        tooltip: {
          trigger: 'axis'
        },
        grid: {
          left: '10%',
          right: '10%',
          bottom: '15%',
          top: '20%'
        },
        xAxis: {
          type: 'category',
          boundaryGap: false,
          data: months
        },
        yAxis: {
          type: 'value'
        },
        series: [{
          name: '专利数量',
          type: 'line',
          data: counts,
          smooth: true,
          itemStyle: { color: '#409EFF' },
          areaStyle: { color: 'rgba(64, 158, 255, 0.2)' }
        }]
      };

      this.myChartInstance.setOption(option, true);
    },

    renderBarChart(years, counts) {
      const option = {
        tooltip: {
          trigger: 'axis',
          axisPointer: {
            type: 'shadow'
          }
        },
        grid: {
          left: '5%',
          right: '2%',
          bottom: '15%',
          top: '20%'
        },
        xAxis: {
          type: 'category',
          data: years,
          axisLabel: {
            fontSize: 12 // 设置x轴标签的字体大小为10px，您可以根据需要调整这个值
          },
        },
        yAxis: {
          type: 'value'
        },
        series: [{
          name: '年度专利总数',
          type: 'bar',
          data: counts,
          itemStyle: { color: '#409EFF' }
        }]
      };

      this.myChartInstance.setOption(option, true);
    },
    //所属领域
    /**
  * 初始化 ECharts 实例
  */
    initializeEchart() {
      const chartDom = this.$refs.fieldChart;
      // 注意这里直接使用 echarts.init 而不是 this.$echarts.init
      this.echartInstance = echarts.init(chartDom);
    },


    /**
     * 获取 field 出现次数数据
     */
    async fetchFieldCounts() {
      try {
        const response = await listFieldCounts(); // 调用接口获取原始数据

        this.fieldData = response
          .filter(item => item.num !== '13') // 过滤掉 "其它"
          .map(item => ({
            name: this.FIELD_MAP[item.num] || `未知(${item.num})`,
            value: item.count
          }));

        this.renderEchart();
      } catch (error) {
        console.error('获取领域统计失败：', error);
      }
    },

    /**
     * 渲染柱形图
     */
    renderEchart() {
      if (!this.echartInstance) return;
      const option = {
        tooltip: {
          trigger: 'axis',
          axisPointer: {
            type: 'shadow'
          }
        },
        grid: {
          left: '3%',
          right: '3%',
          bottom: '5%',
          top: '6%',
          containLabel: true
        },
        xAxis: {
          type: 'category',
          data: this.fieldData.map(d => d.name),
          axisLabel: {
            interval: 0,
            formatter: function (value) {
              const len = value.length;
              const rowNum = 4; // 每行显示几个字
              let rows = Math.ceil(len / rowNum);
              let str = '';
              for (let i = 0; i < rows; i++) {
                str += value.substring(i * rowNum, (i + 1) * rowNum) + '\n';
              }
              return str.trim();
            },
            textStyle: {
              fontSize: 10 // 设置x轴标签的字体大小
            }
          }
        },
        yAxis: {
          type: 'value', // 数值轴，显示数量
          boundaryGap: [0, 0.01] // 可选
        },
        series: [
          {
            name: '数量',
            type: 'bar',
            data: this.fieldData.map(d => d.value),
            itemStyle: {
              color: '#409EFF'
            }
          }
        ]
      };

      this.echartInstance.setOption(option);
      window.addEventListener('resize', () => this.echartInstance.resize());
    },
    //技术成熟度
    async fetchTechnologyLevelCounts() {
      try {
        // 调用后端接口获取数据
        const response = await listTechnologyLevelCounts();
        this.technologyLevelData = response;

        // 初始化并渲染南丁格尔玫瑰图
        this.initTechMaturityRoseChart();
      } catch (error) {
        console.error('获取技术成熟度统计失败:', error);
      }
    },
    initTechMaturityRoseChart() {
      // 确保 DOM 已加载
      if (!this.$refs.techMaturityRoseChart) return;

      // 初始化 ECharts 实例
      this.techMaturityRoseChartInstance = echarts.init(this.$refs.techMaturityRoseChart);

      // 准备图表数据，将数字映射为中文描述
      const chartData = this.technologyLevelData.map(item => ({
        value: item.count,
        name: this.levelMapping[item.technologyLevel.toString()] || '未知', // 使用映射表
      }));

      // 配置项
      const option = {
        grid: {
          top: '1%',
          left: '1%',
          right: '1%',
          bottom: '5%',
          containLabel: true
        },

        tooltip: {
          trigger: 'item',
          formatter: '{a} <br/>{b} : {c} ({d}%)',
        },
        legend: {
          left: 'center',
          top: 'top',
          data: chartData.map(item => item.name), // 图例使用中文描述
        },
        toolbox: {
          show: true,
        },
        series: [
          {
            name: '技术成熟度',
            type: 'pie',
            radius: [12, 100],
            center: ['50%', '50%'], // 居中显示
            roseType: 'area', // 或者使用 'radius'
            itemStyle: {
              borderRadius: 5,
            },
            label: {
              show: false,
            },
            data: chartData, // 数据使用中文描述
          },
        ],
      };

      // 设置配置项并渲染图表
      this.techMaturityRoseChartInstance.setOption(option);
    },
    //ipc领域统计
    async fetchIpcData() {
      try {
        const response = await getIpcClass(); // 调用后端接口获取数据
        this.ipcData = response; // 假设后端返回的数据格式与示例一致
        this.initializeipcChart(); // 初始化图表
      } catch (error) {
        console.error('获取 IPC 数据失败:', error);
      }
    },
    initializeipcChart() {
      // 确保 DOM 元素存在
      if (!this.$refs.ipcChart) {
        console.error('图表容器未找到');
        return;
      }

      // 如果已有实例，销毁后再重新创建
      if (this.ipcChartInstance) {
        this.ipcChartInstance.dispose();
      }

      // 初始化 ECharts 实例
      this.ipcChartInstance = echarts.init(this.$refs.ipcChart);

      // 处理数据，将对象转换为 ECharts 所需的格式
      const chartData = Object.keys(this.ipcData).map((key) => ({
        name: key,
        value: this.ipcData[key],
      }));

      // 设置图表配置项
      const option = {
        tooltip: {
          trigger: 'item',
          formatter: '{a} <br/>{b}: {c} ({d}%)',
        },
        legend: {
          orient: 'vertical',
          left: 'left',
          data: Object.keys(this.ipcData), // 图例数据
        },
        series: [
          {
            name: 'IPC 分类',
            type: 'pie',
            radius: '70%',
            data: chartData, // 使用处理后的数据
            emphasis: {
              itemStyle: {
                shadowBlur: 10,
                shadowOffsetX: 0,
                shadowColor: 'rgba(0, 0, 0, 0.5)',
              },
            },
          },
        ],
      };

      // 设置配置并渲染图表
      this.ipcChartInstance.setOption(option);
    },
    //获取所属学院数据

    async fetchCollegeCounts() {
      try {
        const response = await listCollegeCounts();
        const collegeData = response.map(item => ({
          value: item.count,
          name: this.collegeMap[item.college] || `未知学院(${item.college})`
        }));

        this.setupChart(collegeData); // 调用重命名后的方法
      } catch (error) {
        console.error('获取学院统计数据失败:', error);
      }
    },
    setupChart(data) { // 方法重命名为 setupChart
      const chartDom = this.$refs.collegeChartRef; // 使用新的 ref 名称
      this.chartInstanceRef = echarts.init(chartDom); // 初始化图表实例

      const option = {
        tooltip: {
          trigger: 'axis',
          axisPointer: {
            type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
          }
        },
        grid: {
          top: '3%',
          left: '1%',
          right: '1%',
          bottom: '10%',
          containLabel: true
        },
        xAxis: [
          {
            type: 'category',
            data: data.map(item => item.name),
            axisTick: {
              alignWithLabel: true
            },
            axisLabel: {
              align: 'center', // 标签水平居中对齐
              rotate: 20, // 旋转角度，可根据需要调整
              margin: 25, // 增加这个值以将标签下移，你可以根据需要调整
              textStyle: {
                fontSize: 12 // 调整这里的值以改变字体大小
              }
            }
          }
        ],
        yAxis: [
          {
            type: 'value'
          }
        ],
        series: [
          {
            name: '数量',
            type: 'bar', // 将类型更改为柱状图
            barWidth: '90%',
            data: data.map(item => item.value)
          }
        ]
      };

      this.chartInstanceRef.setOption(option); // 设置图表配置
    },

    // 获取技术先进度统计数据
    fetchAdvancementLevelData() {
      listAdvancementLevel().then((response) => {
        this.advancementLevelData = response.filter(item => item.level !== 6); // 过滤掉 level 为 6 的数据
        this.initializeChart(); // 初始化图表（重命名后的方法）
      });
    },
    // 初始化 ECharts 图表（重命名后的方法）
    initializeChart() {
      // 将 level 转换为对应的中文描述
      const levelMap = {
        1: '国内领先',
        2: '国内先进',
        3: '国际领先',
        4: '国际先进',
        5: '其他',
      };

      // 提取 x 轴数据和 y 轴数据
      const xAxisData = this.advancementLevelData.map((item) => levelMap[item.level]);
      const seriesData = this.advancementLevelData.map((item) => item.count);

      // 初始化 ECharts 实例
      this.chart = echarts.init(this.$refs.techAdvancementChart);

      // 配置项
      const option = {
        grid: {
          top: '3%',
          left: '1%',
          right: '1%',
          bottom: '10%',
          containLabel: true
        },
        tooltip: {
          trigger: 'axis',
          axisPointer: {
            type: 'shadow',
          },
        },
        xAxis: {
          type: 'category',
          data: xAxisData, // X 轴显示中文描述
          axisLabel: {
            rotate: 45, // 如果文字过长，可以旋转
          },
        },
        yAxis: {
          type: 'value',
        },
        series: [
          {
            name: '数量',
            data: seriesData, // Y 轴显示数量
            type: 'bar',
            barWidth: '60%', // 柱子宽度
            itemStyle: {
              color: '#4CAF50', // 柱子颜色
            },
          },
        ],
      };

      // 设置配置项并渲染图表
      this.chart.setOption(option);
    },
    // 获取后端数据合作方式
    fetchData() {
      listWayDistribution({}).then(response => {
        const data = response;
        this.initChart(data);
      }).catch(error => {
        console.error("获取数据失败", error);
      });
    },
    // 初始化图表
    initChart(data) {
      // 将数据转换为适合 ECharts 的格式
      const chartData = data.map(item => ({
        name: this.wayMapping[item.way_value],
        value: item.count
      }));

      // 初始化 ECharts 实例
      this.chartInstance = echarts.init(this.$refs.cooperationChart);

      // 配置项
      const option = {
        tooltip: {
          trigger: 'item',
          formatter: '{a} <br/>{b}: {c} ({d}%)'
        },
        legend: {
          orient: 'vertical',
          left: 'left',
          data: chartData.map(item => item.name)
        },
        series: [
          {
            name: '合作方式占比',
            type: 'pie',
            radius: ['50%', '70%'],
            avoidLabelOverlap: false,
            label: {
              show: false,
              position: 'center'
            },
            emphasis: {
              label: {
                show: true,
                fontSize: '20',
                fontWeight: 'bold'
              }
            },
            labelLine: {
              show: false
            },
            data: chartData
          }
        ]
      };

      // 设置配置项并渲染图表
      this.chartInstance.setOption(option);
    },


    initCharts() {
      // 初始化所有图表
      const charts = [

      ];

      charts.forEach(({ ref, option }) => {
        const chart = echarts.init(this.$refs[ref]);
        chart.setOption(option);
      });
    },
    getPieOption(title) {
      return {
        title: { text: title, left: "center" },
        tooltip: { trigger: "item" },
        series: [
          {
            type: "pie",
            radius: "50%",
            data: [{ value: 1, name: "示例" }],
            emphasis: { itemStyle: { shadowBlur: 10, shadowOffsetX: 0, shadowColor: "rgba(0, 0, 0, 0.5)" } },
          },
        ],
      };
    },
    getBarOption(title) {
      return {
        title: { text: title, left: "center" },
        tooltip: { trigger: "axis" },
        xAxis: { type: "category", data: ["示例"] },
        yAxis: { type: "value" },
        series: [{ data: [1], type: "bar" }],
      };
    },
    getLineOption(title) {
      return {
        title: { text: title, left: "center" },
        tooltip: { trigger: "axis" },
        xAxis: { type: "category", data: ["示例"] },
        yAxis: { type: "value" },
        series: [{ data: [1], type: "line", smooth: true }],
      };
    },
    getScrollOption(title) {
      return {
        title: { text: title, left: "center" },
        tooltip: { trigger: "item" },
        series: [
          {
            type: "scrollList",
            data: ["示例"],
          },
        ],
      };
    },
  },
  beforeDestroy() {
    // 销毁 ECharts 实例，避免内存泄漏
    if (this.chartInstance) {
      this.chartInstance.dispose();
    }
  }
};
</script>

<style>
.container {
  padding: 20px;
  font-family: Arial, sans-serif;
}

.row {
  display: flex;
  justify-content: space-between;
  margin-bottom: 20px;
}

.chart-container {
  border: 1px solid #eee;
  padding: 5px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  position: relative;
  display: flex;
  flex-direction: column;
}

.one-third-width {
  width: 32%;
}

.two-third-width {
  width: 66%;
}

.half-width {
  width: 49%;
}

.chart {
  width: 100%;
  height: 184px;
}

.search-row {
  justify-content: center;
}

.search-container {
  display: flex;
  align-items: center;
}

.search-input {
  padding: 8px;
  width: 300px;
  border: 1px solid #ccc;
  border-radius: 4px;
}

.search-button {
  padding: 8px 16px;
  margin-left: 10px;
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

.search-button:hover {
  background-color: #0056b3;
}

.custom-select {
  appearance: none;
  background-color: #fff;
  border: 1px solid #dcdfe6;
  border-radius: 4px;
  color: #606266;
  font-size: 14px;
  padding: 8px 30px 8px 10px;
  width: 150px;
  height: 36px;
  line-height: 1.5;
  outline: none;
  transition: border-color .2s cubic-bezier(.645, .045, .355, 1);
  background: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 4 5'%3E%3Cpath fill='%23333' d='M2 0L0 2h4zm0 5L0 3h4z'/%3E%3C/svg%3E") no-repeat right 10px center / 8px 10px;
}

.custom-select:focus {
  border-color: #409eff;
  outline: none;
  box-shadow: 0 0 0 2px rgba(64, 158, 255, .2);
}

.data-analysis-button {
  padding: 8px 16px;
  background-color: #28a745;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  transition: background-color .3s ease;
  margin-left: auto;
  margin-right: 20px;
  /* 让按钮靠右 */
}

.data-analysis-button:hover {
  background-color: #218838;
}

.chart-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 10px;
}

.select-and-button-container {
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 10px;
}

.analysis-item {
  padding: 10px 0;
  border-bottom: 1px solid #eee;
}

.analysis-content {
  font-family: monospace;
  white-space: pre-line;
  /* 允许按原样换行，但不会多个空格变一个 */
  background-color: #f9f9f9;
  padding: 15px;
  border-radius: 6px;
  max-height: 500px;
  overflow-y: auto;
}

.formatted-text {
  margin: 0;
  font-size: 14px;
  line-height: 1.6;
}

.analysis-description {
  white-space: pre-line;
  word-break: break-all;
  max-height: 300px;
  overflow-y: auto;
  background-color: #f9f9f9;
  padding: 10px;
  border-radius: 4px;
  font-size: 14px;
  line-height: 1.6;
}
</style>