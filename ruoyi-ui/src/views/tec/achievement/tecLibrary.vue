<template>
  <div class="app-container">
    <p>{{ $route.params.currentId }}</p>
    <el-form :model="tecachievementVO" ref="queryForm" :inline="true" v-show="showSearch" label-width="78px">
      <el-form-item label="成果名称" prop="achievementname" :style="{ whiteSpace: 'nowrap'}">
        <el-input
          v-model="tecachievementVO.achievementname"
          placeholder="请输入科技成果名称"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
          class="w1"
        />
      </el-form-item>
      <el-form-item label="所属领域" prop="fieldDeatil" :style="{ whiteSpace: 'nowrap'}">
        <el-select v-model="searchParams.fieldDeatil" placeholder="请选择所属领域" clearable size="small" class="w1">
          <el-option
            v-for="dict in dict.type.sys_field"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="技术成熟度" prop="technologylevel" :style="{ whiteSpace: 'nowrap'}">
        <el-select v-model="tecachievementVO.technologylevel" placeholder="请选择技术成熟度" clearable size="small" class="w1">
          <el-option
            v-for="dict in dict.type.technology_level"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="成果类型" prop="typesresults">
        <el-select v-model="tecachievementVO.typesresults" placeholder="请选择成果类型" clearable size="small" class="w1">
          <el-option
            v-for="dict in dict.type.type_achievement"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="先进度" prop="advancementleve">
        <el-select v-model="tecachievementVO.advancementleve" placeholder="请选择先进度" clearable size="small" class="w1">
          <el-option
            v-for="dict in dict.type.cutting_edge"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="成果学院" prop="college">
        <el-select v-model="tecachievementVO.college" @change="getSelectOne(tecachievementVO.college)"
                   placeholder="请选择成果学院" clearable size="small" class="w1">
          <el-option label="请选择成果学院"
                     v-for="dict in dict.type.school_xy"
                     :key="dict.value"
                     :label="dict.label"
                     :value="dict.value"/>
        </el-select>
      </el-form-item>
<!--      <el-form-item label="负责人学院" prop="piCollege" :style="{ whiteSpace: 'nowrap'}">-->
<!--        <el-select v-model="tecachievementVO.piCollege" @change="getSelectOne(tecachievementVO.piCollege)"-->
<!--                   placeholder="请选择负责人学院" clearable size="small" class="w1">-->
<!--          <el-option label="请选择负责人学院"-->
<!--                     v-for="dict in dict.type.school_xy"-->
<!--                     :key="dict.value"-->
<!--                     :label="dict.label"-->
<!--                     :value="dict.value"/>-->
<!--        </el-select>-->
<!--      </el-form-item>-->
      <el-form-item label="成果负责人" prop="piId" :style="{ whiteSpace: 'nowrap'}">
        <el-select v-model="tecachievementVO.piId" :placeholder="placeholderText" clearable size="small" class="w1">
          <el-option
            v-for="item in nameList"
            :key="item.piId"
            :label="item.piName"
            :value="item.piId"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="课题大类" prop="topicCategory">
        <el-select v-model="tecachievementVO.tecVerticaltopic.topicCategory" @change="handleSelect"
                   placeholder="请选择课题大类" clearable size="small" class="w1">
          <el-option
            v-for="dict in dict.type.topic_category"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item  v-if="natural" label="课题子类" prop="naturalSciences">
        <el-select v-model="tecachievementVO.tecVerticaltopic.topicSubcategory" placeholder="请选择具体课题类别"
                   clearable size="small" class="w1">
          <el-option
            v-for="dict in dict.type.natural_sciences"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item v-if="social" label="课题子类" prop="socialSciences">
        <el-select v-model="tecachievementVO.tecVerticaltopic.topicSubcategory" placeholder="请选择具体课题类别"
                   clearable size="small" class="w1">
          <el-option
            v-for="dict in dict.type.social_sciences"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          ></el-option>
        </el-select>
      </el-form-item>

      <!--创建时间-->
      <el-form-item label="创建时间" prop="startAndEndTime">
        <el-date-picker
          v-model="startAndEndTime"
          type="datetimerange"
          align="right"
          unlink-panels
          range-separator="至"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
          :picker-options="pickerOptions">
        </el-date-picker>
      </el-form-item>
      <!--创建时间-->

    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="warning"
          icon="el-icon-download"
          size="mini"
          @click="handleToWord"
        >导出
        </el-button>
      </el-col>
      <el-col :span="1.5"  style="padding-right: 40px">
        <el-button
          type="danger"
          icon="el-icon-circle-close"
          size="mini"
          @click="handleBatchReturn"
          v-hasPermi="['tec:tecachievementLibrary:remove']"
        >批量退回
        </el-button>
      </el-col>
      <el-col :span="1.5" >
        <el-button type="primary" icon="el-icon-search"size="mini" @click="handleQuery">搜索
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-col>
    </el-row>

    <el-table v-loading="loading" :data="tecachievementList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center"/>
      <el-table-column label="成果名称" align="center" prop="achievementname"/>
      <el-table-column label="所属领域" align="center" prop="fieldDeatil" width="90"/>
      <el-table-column label="所属学院" align="center" prop="college">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.school_xy" :value="scope.row.college"/>
        </template>
      </el-table-column>
      <el-table-column label="合作方式" align="center" prop="wayDeatil"/>
      <el-table-column label="成果类型" align="center" prop="typesresultsDeatil" width="120"/>
      <el-table-column label="技术成熟度" align="center" prop="technologylevel" width="100">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.technology_level" :value="scope.row.technologylevel"/>
        </template>
      </el-table-column>
      <el-table-column label="先进度" align="center" prop="advancementleve">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.cutting_edge" :value="scope.row.advancementleve"/>
        </template>
      </el-table-column>
      <el-table-column prop="introduction" label="成果介绍" align="center" width="150" :show-overflow-tooltip="true"/>
      <el-table-column prop="intellectualproperty" label="知识产权" align="center" :show-overflow-tooltip="true"/>
<!--      <el-table-column label="联系人" align="center" prop="contactname"/>-->
<!--      <el-table-column label="邮箱" align="center" prop="email"/>-->
<!--      <el-table-column label="联系电话" align="center" prop="phone"/>-->
      <el-table-column label="负责人" align="center" prop="piName"/>
      <el-table-column label="邮箱" align="center" prop="piEmail"/>
      <el-table-column label="联系电话" align="center" prop="piPhone"/>
      <!--      <el-table-column label="通讯地址" align="center" prop="address"/>-->
      <el-table-column prop="award" label="获奖情况" align="center" :show-overflow-tooltip="true"/>
      <el-table-column prop="benefit" label="效益分析" align="center" :show-overflow-tooltip="true"/>
      <el-table-column label="研究背景与基础" align="center" prop="background" :show-overflow-tooltip="true"/>
      <el-table-column prop="topicCategory" label="依托课题" width="150" :show-overflow-tooltip="true" >
        <template slot-scope="scope">
          <div v-for="(topicList, index) in scope.row.tecVerticaltopicList" :key="index">
            <dict-tag :options="dict.type.topic_category" :value="topicList.topicCategory"/>
            <template v-if="topicList.topicCategory === '1'">
              <template v-if="topicList.topicSubcategory">
                <dict-tag :options="[dict.type.natural_sciences.find(category => category.value === topicList.topicSubcategory)]"
                          :value="topicList.topicSubcategory" style="overflow: hidden;text-overflow: ellipsis;white-space: nowrap;"/>
              </template>
              <template v-else>
                <!-- 显示默认提示或空值 -->
              </template>
            </template>
            <template v-else-if="topicList.topicCategory === '2'">
              <template v-if="topicList.topicSubcategory">
                <dict-tag :options="[dict.type.social_sciences.find(category => category.value === topicList.topicSubcategory)]"
                          :value="topicList.topicSubcategory" style="overflow: hidden;text-overflow: ellipsis;white-space: nowrap;"/>
              </template>
              <template v-else>
                <!-- 显示默认提示或空值 -->
              </template>
            </template>
          </div>
        </template>
      </el-table-column>
      //添加创建时间字段
      <el-table-column label="创建时间" align="center" prop="createTime" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-view"
            @click="handleShow(scope.row)"
          >查看
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['tec:tecachievementLibrary:remove']"
          >删除
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-circle-close"
            @click="handleReturn(scope.row)"
            v-hasPermi="['tec:tecachievementLibrary:remove']"
          >退回
          </el-button>
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
      v-if="total != 0"
      @pagination="getListByTecachievementV"
    />
  </div>
</template>

<script>
import {
  listTecachievement,
  getTecachievement,
  delTecachievement,
  exportTaskWord,
  getTecAchiListByPiId, getListByTecachievementVO, updateTecachievement, updateTecStatus,updateBatchTecStatus,
} from "@/api/tec/tecachievement";
import {delTecteam} from "@/api/tec/tecteam";
import {getDeptId} from "@/api/tec/user";
import {listVerticaltopic} from "@/api/tec/verticaltopic";
import current from "element-ui/packages/table/src/store/current";
import {delTecpi, getTecpi, listTecpi} from "@/api/tec/tecpi";
import log from "@/views/monitor/job/log.vue";

export default {
  name: "Tecachievement",
  dicts: ['type_achievement', 'technology_level', 'cutting_edge', 'sys_field', 'school_xy', 'jd_way','topic_category','natural_sciences','social_sciences'],
  data() {
    return {
      //子类课题
      natural : false,
      social : false,
      nameList: [],
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
      selectedRows: [], // 已选中的行数据
      tecVerticaltopicList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      pidataList: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        achievementid: null,
        achievementname: null,
        field: null,
        piCollege: null,
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
        topicCategory: null,
        topicSubcategory: null,
      },
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

      tecachievementVO: {
        pageNum: 1,
        pageSize: 10,
        achievementid: null,
        achievementname: null,
        field: null,
        college: null,
        piCollege: null,
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
        },
        endTime:null,
        startTime:null,
      },
      searchParams:{
        fieldDeatil:null,
      },
      exportParams: {
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
      },
      // 表单参数
      form: {},
      //登录用户的部门ID
      deptId: null,
      currentId: null,
    };
  },
  created() {
    this.getCurrentPiid();
    // this.getList();
    this.getDeptId();
    // this.getListByTecachievementV();
    if (this.tecachievementVO.pageNum ) {
      this.tecachievementVO.pageNum = this.$route.query.page || 1;
      this.getListByTecachievementV();
      console.log('本页面的this.$route.query.page',this.$route.query.page)
    }
  },
  computed: {
    placeholderText() {
      if (this.$route.query.piName) {
        return `成果负责人: ${this.$route.query.piName}`;
      } else {
        return '请输入成果负责人';
      }
    }
  },
  methods: {
    //课题搜索框变更
    handleSelect(){
      if (this.tecachievementVO.tecVerticaltopic.topicCategory === '1') {
        this.natural = true;
        this.social = false;
        // this.tecachievementVO.socialSciences = '';
        console.log('选择大类->1自然');
      } else if (this.tecachievementVO.tecVerticaltopic.topicCategory === '2') {
        this.natural = false;
        this.social = true;
        // this.tecachievementVO.naturalSciences = '';
        console.log('选择大类->2社会');
      } else {
        this.natural = false;
        this.social = false;
        this.tecachievementVO.tecVerticaltopic.topicSubcategory = '';
      }
    },

    /** 查询科技成果增删改查列表 */
    getListByTecachievementV() {
      console.log('执行了列表',this.tecachievementVO.pageNum)
      this.loading = true;
      this.tecachievementVO.status = 4;
      console.log('状态',this.tecachievementVO.status)
      console.log('this.tecachievementVO---', this.tecachievementVO)
      if (this.currentId != null) {
        getTecAchiListByPiId(this.currentId).then(response => {
          console.log('id',this.currentId)
          const promises = response.rows.map(item => {
            return getTecpi(item.piId).then(piResponse => {
              // 将获取到的pi数据直接合并到原始数据中
              return {
                ...item, // 保留原始数据的其他字段
                piId1: piResponse.data.piId,
                piName: piResponse.data.piName,
                piPhone: piResponse.data.piPhone,
                piEmail: piResponse.data.piEmail
              };
            });
          });
          // 等待所有请求完成
          Promise.all(promises).then(results => {
            // results 数组包含了所有数据条目及其关联的pi数据
            console.log(results);
            this.tecachievementList = results;
            console.log('根据名字获取到的数组',this.tecachievementList)
            this.total = response.total;
            this.loading = false;
            console.log('回显成果数组新', this.tecachievementList);
          });
        }).catch((error) => {
          console.log(error);
        })
      }else {
        // this.tecachievementVO = [];
        console.log('搜索的条件',this.tecachievementVO)
        getListByTecachievementVO(this.tecachievementVO).then(response => {
          const promises = response.rows.map(item => {
            return getTecpi(item.piId).then(piResponse => {
              // 将获取到的pi数据直接合并到原始数据中
              return {
                ...item, // 保留原始数据的其他字段
                piId1: piResponse.data.piId,
                piName: piResponse.data.piName,
                piPhone: piResponse.data.piPhone,
                piEmail: piResponse.data.piEmail
              };
            });
          });
          // 等待所有请求完成
          Promise.all(promises).then(results => {
            // 遍历 results，格式化 createTime
            results.forEach(result => {
              if (result.createTime) {
                // 将 ISO 格式的日期字符串转换为 Date 对象
                const date = new Date(result.createTime);

                // 格式化日期为更易读的格式，例如 "YYYY-MM-DD HH:mm:ss"
                result.createTime = `${date.getFullYear()}-${String(date.getMonth() + 1).padStart(2, '0')}-${String(date.getDate()).padStart(2, '0')} ${String(date.getHours()).padStart(2, '0')}:${String(date.getMinutes()).padStart(2, '0')}:${String(date.getSeconds()).padStart(2, '0')}`;
              }
            });

            // 更新数据
            this.tecachievementList = results;
            console.log('新', this.tecachievementList);
            this.total = response.total;
            this.loading = false;
            console.log('回显成果数组新', this.tecachievementList);
          });
        });
      }
      // 删除路由中的 page 参数
      const { page, ...queryWithoutPage } = this.$route.query;
      this.$router.replace({ query: queryWithoutPage });
    },

    /** 查询科技成果增删改查列表 */
    getList() {
      this.loading = true;
      this.queryParams.status = 4;
      if (this.currentId != null) {
        getTecAchiListByPiId(this.currentId).then(response => {
          // console.log(this.currentId)
          this.tecachievementList = response.rows;
          this.total = response.total;
          this.loading = false;
        }).catch((error) => {
          console.log(error);
        })
      } else {
        this.tecachievementList = [];
        listTecachievement(this.queryParams).then(response => {
          console.log('旧',this.tecachievementList )
          this.tecachievementList = response.rows;
          this.total = response.total;
          this.loading = false;

          // // 搜索topicCategory值
          //   const searchedTopicCategory = this.queryParams.topicCategory;
          //   if (searchedTopicCategory) {
          //     this.tecachievementList = this.tecachievementList.filter(item => {
          //       return item.tecVerticaltopicList.some(topic => topic.topicCategory === searchedTopicCategory);
          //     });
          //     console.log('搜索结果筛选大类', this.tecachievementList);
          //   }
          // // 搜索topicSubcategory值
          //   const searchedtopicSubcategory = this.queryParams.topicSubcategory;
          //   if (searchedtopicSubcategory) {
          //     this.tecachievementList = this.tecachievementList.filter(item => {
          //       return item.tecVerticaltopicList.some(topic => topic.topicSubcategory === searchedtopicSubcategory);
          //     });
          //     console.log('搜索结果筛选小类', this.tecachievementList);
          //   }
        });
      }
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
        introductionImg: null,
      };
      this.resetForm("form");
    },

    /** 搜索按钮操作 */
    handleQuery() {
      // if (this.tecachievementVO.piCollege) {
      //   // 如果存在学院，则检查成果负责人是否为空
      //   if (!this.tecachievementVO.piId) {
      //     // 如果成果负责人为空，报告错误并返回
      //     this.$message.error('请选择成果负责人');
      //     return;
      //   }
      // }

      //将范围时间赋值给tecachievementVO
      if (this.startAndEndTime!=null){
        if (this.startAndEndTime[0]!=null){
          this.tecachievementVO.startTime = this.$moment(this.startAndEndTime[0]).format("YYYY-MM-DD HH:mm:ss")
        }
        if (this.startAndEndTime[1]!=null){
          this.tecachievementVO.endTime = this.$moment(this.startAndEndTime[1]).format("YYYY-MM-DD HH:mm:ss")
        }
      }else {
        this.tecachievementVO.startTime=null
        this.tecachievementVO.endTime=null
      }

      this.currentId = null;
      this.tecachievementVO.pageNum = 1;
      this.tecachievementVO.field = this.searchParams.fieldDeatil
      // this.getList();
      this.getListByTecachievementV();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.tecachievementVO.piId = '',
        this.searchParams.fieldDeatil = '',
        this.tecachievementVO.tecVerticaltopic.topicCategory = '',
        this.tecachievementVO.tecVerticaltopic.topicSubcategory = '',
        this.natural = false,
        this.social = false,
        this.tecachievementVO.startTime='',
        this.tecachievementVO.endTime='',
        this.startAndEndTime = null,
        this.handleQuery();

    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.achievementid)
      this.single = selection.length !== 1
      this.multiple = !selection.length
      this.selectedRows = selection;
    },

    /** 查看按钮操作 */
    handleShow(row) {
      // 1. 拿到请求参数的achievementid
      // 2. 根据拿到的achievementid调用getTecachievement方法获取数据
      getTecachievement(row.achievementid).then(response => {
        this.form = response.data;
        this.title = "科技成果审核";
        this.$router.push({
          path: '/auditing',
          query: { page: this.tecachievementVO.pageNum }
        });
        // console.log('handleShow--->',response.data)
        localStorage.setItem('csData', JSON.stringify(response.data))
      });
    },
    // 没有currentId传全部的，有传当前的
    getCurrentPiid() {
      console.log('$route.query.currentId----->',this.$route.query.currentId);
      this.currentId = this.$route.query.currentId;
    },
    showListByPiid() {
      if (this.currentId != null) {
        getTecAchiListByPiId(this.currentId).then(response => {
          this.form = response.data;
        })
      }
    },
    /** 退回按钮操作 */
    handleReturn(row) {
      console.log('退回时，本行数据',row);
      if (this.deptId == 103) {
        this.$modal.confirm('是否确认退回本条科技成果？').then(() => {
          const action = '5';
          const achievementid = row.achievementid; // 获取id属性值
          return updateTecStatus(achievementid,action); // 更新成果状态
        }).then(() => {
          this.getListByTecachievementV(); // 刷新列表
          this.$modal.msgSuccess("退回成功");
        }).catch(() => {
          // 处理错误
        });
      } else {
        alert("没有操作权限");
      }
    },
    /** 批量退回按钮操作-接口 */
    handleBatchReturn() {
      const action = '5';
      if (this.deptId == 103) {
        if (this.ids.length === 0) {
          this.$message.warning('请先选择要退回的科技成果');
          return;
        }
        this.$modal.confirm('是否确认批量退回所选科技成果？').then(() => {
          console.log('删除的主键集合为：.ids--->', this.ids)
          return updateBatchTecStatus(this.ids,action) // 更新成果状态
        }).then(() => {
          this.getListByTecachievementV(); // 刷新列表
          this.$modal.msgSuccess("退回成功");
        }).catch(() => {
          // 处理错误
        });
      } else {
        alert("没有操作权限");
      }
    },
    /** 批量退回按钮操作-逐个 */
    // handleBatchReturn() {
    //   if (this.deptId == 103) {
    //   if (this.selectedRows.length === 0) {
    //     this.$message.warning('请先选择要退回的科技成果');
    //     return;
    //   }
    //   this.$modal.confirm('是否确认批量退回所选科技成果？').then(() => {
    //     const promises = this.selectedRows.map(row => {
    //       const action = '5';
    //       const achievementid = row.achievementid; // 获取id属性值
    //       return updateTecStatus(achievementid,action); // 返回更新成果状态的Promise对象
    //     });
    //     Promise.all(promises).then(() => {
    //       this.getListByTecachievementV(); // 刷新列表
    //       this.$message.success('批量退回成功');
    //     }).catch(() => {
    //       this.$message.error('批量退回失败');
    //     });
    //   }).catch(() => {
    //   });
    //   } else {
    //     alert("没有操作权限");
    //   }
    // },

    /** 删除按钮操作 */
    handleDelete(row) {
      console.log(row)
      if (this.deptId == 103) {
        this.$modal.confirm('是否确认删除本条科技成果？').then
        (() => Promise.all([delTecachievement(row.achievementid), delTecteam(row.teamId)])).then(() => {
          this.getListByTecachievementV();
          this.$modal.msgSuccess("删除成功");
        }).catch(() => {
        });
      } else {
        alert("没有操作权限")
      }
    },

    /** 导出按钮操作 */
    handleToWord() {
      if (this.ids.length === 0) {
        this.$message({
          type: 'warning',
          message: '请选择要导出的数据项'
        });
        return; // 如果没有选择项，则直接返回，不执行后续操作
      }
      this.$modal.confirm('是否确认导出所有科技成果？').then(() => {
        console.log('导出的主键集合为：.ids--->', this.ids)
        return exportTaskWord(this.ids).then(response => {
          this.$download.name(response.msg);
        }).catch(() => {
        });
      });
    },

    //查询成果负责人
    getDeptId() {
      getDeptId().then(response => {
        this.deptId = response.data
        console.log('getDeptId--->response--->', response)
        console.log('getDeptId--->this.deptId--->', this.deptId)
      })
    },

    getSelectOne(data) {
      // console.log("调用事件")
      this.tecachievementVO.piId = null
      let getSelectOneQueryParams = {
        piCollege: data
      }
      console.log('getSelectOneQueryParams',getSelectOneQueryParams)
      if (this.tecachievementVO.college !== '') {
        listTecpi(getSelectOneQueryParams).then(response => {
          this.nameList = response.rows
          console.log('response',response)
          console.log("学院有数据", this.nameList)
        });
      } else {
        // console.log("学院无数据")
        this.nameList = null
      }
    },
  },
};
</script>
<style>
.w1 {
  width: 200px;
}
</style>
