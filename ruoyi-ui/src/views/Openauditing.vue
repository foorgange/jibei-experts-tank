<template>
  <div class="app-container">
    <el-button style="margin-bottom: 15px;margin-top: -20px" @click="back" v-hasPermi="['tec:tecachievement:back']">返 回</el-button>
    <div style="display: flex;width: 100%;height: 50px;background-color: rgba(248,248,249,1);margin-top: -10px">
      <div style="width: 5px;background-color: rgba(0,121,254,1)"></div>
      <div style="line-height: 50px"><span
        style="margin-left: 20px;font-size: 18px;font-weight: bold">成果基础信息</span></div>
    </div>
    <el-form ref="form" :model="form" label-width="80px">
      <div>
        <el-form-item label="成果名称" prop="achievementname" class="a1">
          <el-input v-model="form.achievementname" @input="change($event)" placeholder="请输入成果名称"
                    class="a2 inputDeep" readonly="readonly"/>
        </el-form-item>
      </div>
      <div>
        <el-form-item label="所属领域" class="a1">
          <el-checkbox-group @input="change($event)" v-model="form.field" class="a4">
            <el-checkbox
              style="padding-left: 33px"
              onclick="return false"
              v-for="dict in dict.type.sys_field"
              :key="dict.value"
              :label="dict.value"
              v-if="form.field.includes(dict.value)"
            >{{ dict.label }}
            </el-checkbox>
          </el-checkbox-group>
        </el-form-item>
      </div>
      <div>
        <el-form-item label="所属学院" prop="college" :style="{ whiteSpace: 'nowrap'}" class="a1">
          <el-select @input="change($event)" v-model="form.college" placeholder="请选择所属学院" class="a2"
                     :disabled="true" style="width: 580px"
          >
            <el-option
              v-for="dict in dict.type.school_xy"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value+''"
            ></el-option>
          </el-select>
        </el-form-item>
      </div>
      <div>
        <el-form-item label="合作方式" :style="{ whiteSpace: 'nowrap' }" class="a1">
          <el-checkbox-group v-model="form.way" class="a2" @input="change($event)">
            <el-checkbox
              onclick="return false"
              v-for="dict in dict.type.jd_way"
              :key="dict.value"
              :label="dict.value"
              v-if="form.way.includes(dict.value)"
            >{{ dict.label }}
            </el-checkbox>
          </el-checkbox-group>
        </el-form-item>
      </div>
      <div>
        <el-form-item label="成果类型" class="a1">
          <el-checkbox-group v-model="form.typesresults" class="a7" @input="change($event)">
            <el-checkbox
              onclick="return false"
              v-for="dict in dict.type.type_achievement"
              :key="dict.value"
              :label="dict.value"
              v-if="form.typesresults.includes(dict.value)"
              :class="{ 'special-item': dict.value === '7' }"
            >{{ dict.label }}
            </el-checkbox>
          </el-checkbox-group>
        </el-form-item>
      </div>
      <div style="display: flex;width: 100%;height: 50px;background-color: rgba(248,248,249,1);margin-top: -10px">
        <div style="width: 5px;background-color: rgba(0,121,254,1)"></div>
        <div style="line-height: 50px"><span style="margin-left: 20px;font-size: 18px;font-weight: bold">成果介绍</span>
        </div>
      </div>
      <div class="input-row">
        <el-form-item label="技术成熟度" prop="technologylevel" :style="{ whiteSpace: 'nowrap'}" class="input-field">
          <el-select v-model="form.technologylevel" placeholder="请选择技术成熟度" class="a6" @input="change($event)"
                     :disabled="true">
            <el-option
              v-for="dict in dict.type.technology_level"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value+''"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="先进度" prop="advancementleve" class="input-field3">
          <el-select v-model="form.advancementleve" placeholder="请选择先进度" @input="change($event)" :disabled="true">
            <el-option
              v-for="dict in dict.type.cutting_edge"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value+''"
            ></el-option>
          </el-select>
        </el-form-item>
      </div>

      <div>
        <el-form-item label="成果介绍" prop="introduction" class="a1">
          <el-input v-model="form.introduction"
                    placeholder="请输入成果介绍，提示信息需要包含依托基础研究课题、市场需求、政策导向等内容"
                    type="textarea" :rows="6" class="a2 inputDeep" @input="change($event)" style="width: 1000px"
                    readonly="readonly"/>

          <div style="margin-top: 20px; padding-left: 10px;">
            <a v-for="img in imgList" :key="img" :href="img" target="_blank" style="text-decoration: none;">
              <img :src="img" style="float: left; margin-right: 10px; padding-left: 20px;" width="160px">
            </a>
          </div>

        </el-form-item>
      </div>

      <div style="display: flex;width: 100%;height: 50px;background-color: rgba(248,248,249,1);margin-top: -10px">
        <div style="width: 5px;background-color: rgba(0,121,254,1)"></div>
        <div style="line-height: 50px"><span
          style="margin-left: 20px;font-size: 18px;font-weight: bold">研究背景与基础</span></div>
      </div>
      <div class="a1">
        <el-form-item label="研究背景与基础"
                      prop="background"
                      :style="{ whiteSpace: 'nowrap'}"
                      style="margin-left: -20px">
          <el-input v-model="form.background" placeholder="请输入研究背景与基础"
                    readonly="readonly"
                    type="textarea"
                    :rows="6"
                    class="a2 inputDeep"
                    @input="change($event)"
                    style="width: 1000px;margin-left: 30px"/>
        </el-form-item>
      </div>

      <div style="display: flex;width: 100%;height: 50px;background-color: rgba(248,248,249,1);margin-top: -10px">
        <div style="width: 5px;background-color: rgba(0,121,254,1)"></div>
        <div style="line-height: 50px"><span
          style="margin-left: 20px;font-size: 18px;font-weight: bold">知识产权情况</span></div>
      </div>
      <div class="a1">
        <el-form-item label="知识产权情况" prop="intellectualproperty" :style="{ whiteSpace: 'nowrap'}"
                      style="margin-left: -13px">
          <el-input v-model="form.intellectualproperty"
                    class="inputDeep"
                    readonly="readonly"
                    placeholder="请输入知识产权简介，提示：包含知识产权类型、名称、专利权人、发明人等信息"
                    type="textarea"
                    :rows="4"
                    @input="change($event)"
                    style="width: 1000px;margin-left: 23px"/>
        </el-form-item>
      </div>
      <div style="display: flex;width: 100%;height: 50px;background-color: rgba(248,248,249,1);margin-top: -10px">
        <div style="width: 5px;background-color: rgba(0,121,254,1)"></div>
        <div style="line-height: 50px"><span style="margin-left: 20px;font-size: 18px;font-weight: bold">获奖情况</span>
        </div>
      </div>
      <div>
        <el-form-item label="获得奖项" prop="award" class="a1">
          <el-input readonly="readonly" v-model="form.award" placeholder="请输入获得奖项" class="a2 inputDeep"
                    @input="change($event)" type="textarea" :rows="4" style="width: 1000px"/>
        </el-form-item>
      </div>
      <div style="display: flex;width: 100%;height: 50px;background-color: rgba(248,248,249,1);margin-top: -10px">
        <div style="width: 5px;background-color: rgba(0,121,254,1)"></div>
        <div style="line-height: 50px"><span style="margin-left: 20px;font-size: 18px;font-weight: bold">效益分析</span>
        </div>
      </div>
      <div>
        <el-form-item label="效益分析" prop="benefit" class="a1">
          <el-input readonly="readonly" v-model="form.benefit" placeholder="请输入效益分析，提示:包含社会效益和经济效益"
                    class="a2 inputDeep" type="textarea" :rows="6" @input="change($event)" style="width: 1000px"/>
        </el-form-item>
      </div>

      <div style="display: flex;width: 100%;height: 50px;background-color: rgba(248,248,249,1);margin-top: -10px">
        <div style="width: 5px;background-color: rgba(0,121,254,1)"></div>
        <div style="line-height: 50px"><span
          style="margin-left: 20px;font-size: 18px;font-weight: bold">成果负责人信息</span></div>
      </div>
      <div class="input-row" style="width:1069px">
        <el-form-item label="所属学院" prop="piCollege" class="input-field">
          <el-select v-model="tecpList.piCollege" @change="getSelectOne(tecpList.piCollege)"
                     placeholder="成果负责人所在学院"
                     :disabled="true"
                     class="a6" @input="change($event)">
            <el-option
              v-for="dict in dict.type.school_xy"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value+''"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="工号" prop="piStaffId" :style="{ whiteSpace: 'nowrap'}"
                      class="input-field3"
                      style="margin-left: 20px">
          <el-input readonly="readonly" class="inputDeep" v-model="tecpList.piStaffId"
                    placeholder="请输入工号"
                    @input="change($event)"/>
        </el-form-item>
        <el-form-item label="姓名" prop="piName" class="input-field3" style="margin-left: 20px">
          <el-select v-model="tecpList.piId" placeholder="请选择成果负责人"
                     :disabled="true"
                     @change="getSelectTwo(tecpList.piId)" @input="change($event)">
            <el-option
              v-for="item in nameList"
              :key="item.piId"
              :label="item.piName"
              :value="item.piId"
            ></el-option>
          </el-select>
        </el-form-item>
      </div>
      <div>
        <el-form-item label="个人简介" prop="piInformation" class="a1">
          <el-input readonly="readonly" v-model="tecpList.piInformation" placeholder="请输入成果负责人个人简介"
                    class="a2 inputDeep" type="textarea" :rows="4" @input="change($event)" style="width: 1000px"/>
        </el-form-item>
      </div>

      <div style="display: flex;width: 100%;height: 50px;background-color: rgba(248,248,249,1);margin-top: -10px">
        <div style="width: 5px;background-color: rgba(0,121,254,1)"></div>
        <div style="line-height: 50px"><span
          style="margin-left: 20px;font-size: 18px;font-weight: bold">联系人信息</span></div>
      </div>
      <div class="input-row" style="width: 1069px">
        <el-form-item label="联系人姓名" prop="contactname" :style="{ whiteSpace: 'nowrap'}" class="input-field"
                      style="margin-left: -41px;width: 30%">
          <el-input readonly="readonly" v-model="form.contactname" placeholder="请输入联系人姓名" class="a5 inputDeep"
                    @input="change($event)" style="margin-left: 10px"/>
        </el-form-item>
        <el-form-item label="联系人工号" prop="staffid" :style="{ whiteSpace: 'nowrap'}" class="input-field1 inputDeep"
                      style="width: 30%">
          <el-input readonly="readonly" class="" v-model="form.staffid" placeholder="请输入联系人工号"
                    @input="change($event)"/>
        </el-form-item>
        <el-form-item label="联系人邮箱" prop="email" :style="{ whiteSpace: 'nowrap'}" class="input-field1 inputDeep"
                      style="width: 30%">
          <el-input readonly="readonly" class="" v-model="form.email" placeholder="请输入联系人邮箱"
                    @input="change($event)"/>
        </el-form-item>
      </div>
      <div class="input-row" style="width: 1069px">
        <el-form-item label="联系电话" prop="phone" class="input-field1 inputDeep"
                      style="margin-left: -39px;width: 30%">
          <el-input readonly="readonly" class="" v-model="form.phone" placeholder="请输入联系电话"
                    @input="change($event)" style="padding-left: 10px"/>
        </el-form-item>
        <!--        <el-form-item label="通讯地址" prop="address" class="a1 inputDeep" style="width: 60%;padding-left: 26px">-->
        <!--          <el-input readonly="readonly" v-model="form.address" placeholder="请输入通讯地址" class="a2 "-->
        <!--                    @input="change($event)" style="margin-left: -2px;width: 625px"/>-->
        <!--        </el-form-item>-->
      </div>

      <div style="display: flex;width: 100%;height: 50px;background-color: rgba(248,248,249,1);margin-top: -10px">
        <div style="width: 5px;background-color: rgba(0,121,254,1)"></div>
        <div style="line-height: 50px"><span style="margin-left: 20px;font-size: 18px;font-weight: bold">团队介绍</span>
        </div>
      </div>
      <!--团队成员渲染区域-->
      <div>
        <el-form-item label="" style="padding-left: 110px ; width: 1190px">
          <el-table :data="tecTeamList" class="a3" :header-cell-style="customHeaderCellStyle">
            <el-table-column
              label="序号"
              type="index"
              prop="index"
              width="103px">
            </el-table-column>
            <el-table-column prop="teamStaffId" label="工号"></el-table-column>
            <el-table-column prop="teamName" label="姓名"></el-table-column>
            <el-table-column prop="teamSex" label="性别">
              <template slot-scope="scope">
                <dict-tag :options="dict.type.sys_user_sex" :value="scope.row.teamSex"/>
              </template>
            </el-table-column>
            <el-table-column prop="teamPhone" label="电话"></el-table-column>
            <el-table-column prop="teamEmail" label="邮箱"></el-table-column>
            <el-table-column prop="teamBirthday" label="出生日期"></el-table-column>
            <el-table-column prop="teamJobTitle" label="职务/职称"></el-table-column>
            <el-table-column prop="teamCommAddress" label="通讯地址"></el-table-column>
            <el-table-column prop="teamJobAddress" label="工作单位"></el-table-column>
          </el-table>
        </el-form-item>
      </div>

      <div style="display: flex;width: 100%;height: 50px;background-color: rgba(248,248,249,1);margin-top: -10px">
        <div style="width: 5px;background-color: rgba(0,121,254,1)"></div>
        <div style="line-height: 50px"><span style="margin-left: 20px;font-size: 18px;font-weight: bold">依托课题</span>
        </div>
      </div>
      <!--纵向课题渲染区域-->
      <div>
        <el-form-item style="padding-left: 110px ; width: 1190px">
          <el-table :data="tecVerticaltopicList" class="a3" :header-cell-style="customHeaderCellStyle">
            <el-table-column
              type="index"
              prop="index"
              label="序号"
              width="200px">
            </el-table-column>
            <el-table-column prop="topicCategory" label="课题大类">
              <template slot-scope="scope">
                <dict-tag :options="dict.type.topic_category" :value="scope.row.topicCategory"/>
              </template>
            </el-table-column>
            <el-table-column prop="topicSubcategory" label="课题子类">
              <template slot-scope="scope" >
                <template v-if="scope.row.topicCategory === '1'">
                  <dict-tag :options="dict.type.natural_sciences" :value="scope.row.topicSubcategory"/>
                </template>
                <template v-else-if="scope.row.topicCategory === '2'">
                  <dict-tag :options="dict.type.social_sciences" :value="scope.row.topicSubcategory"/>
                </template>
              </template>
            </el-table-column>
            <el-table-column prop="topicCode" label="课题编号"></el-table-column>
            <el-table-column prop="topicName" label="课题名称"></el-table-column>
          </el-table>
        </el-form-item>
      </div>

      <div class="dialog-footer">
        <el-button type="primary" @click="dialogFormVisible = true" v-if="achievementStatus !== 4"
                   v-hasPermi="['tec:tecachievement:reject']">驳 回
        </el-button>
        <el-button type="primary" @click="handleAudit(4)" v-if="achievementStatus !== 4"
                   v-hasPermi="['tec:tecachievement:permission']">通 过
        </el-button>
        <el-button @click="back" v-hasPermi="['tec:tecachievement:back']">返 回</el-button>
      </div>
    </el-form>
    <!--  驳回弹窗-->
    <el-dialog title="驳回" :visible.sync="dialogFormVisible">
      <el-form>
        <el-form-item label="驳回意见">
          <el-input v-model="rejection.rejectionInfo" class="inputDeep" autocomplete="off" type="textarea"
                    rows=3></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="handleAudit(2)">确 定</el-button>
      </div>
    </el-dialog>
  </div>

</template>

<script>
import {getToken} from "@/utils/auth";
import {
  listTecachievement,
  addTecachievement,
  updateTecachievement,
  uploadFile,
  updateTecStatus,
  getTecachievement
} from "@/api/tec/tecachievement";
import {MessageBox, Message} from 'element-ui';
import {uploadImg} from '@/api/tec/tecachievement';
import {adduploadImg} from '@/api/tec/tecachievement';
import {addTecteam} from "@/api/tec/tecteam";
import row from "element-ui/packages/row";
import {addTecpi, getTecpi, listTecpi, updateTecpi} from "@/api/tec/tecpi";
import {addtecrejection} from "@/api/tec/tecrejection";


export default {
  name: "Tecachievement",
  dicts: ['fare_status', 'school_xy', 'type_achievement', 'technology_level', 'cutting_edge', 'sys_user_sex', 'sys_field', 'jd_way','topic_category','social_sciences','natural_sciences'],

  data() {
    return {
      //成果状态，用于判断按钮你是否需要显示
      achievementStatus: '',
      //驳回弹窗
      dialogFormVisible: false,//默认不显示
      rejection: {
        rejectionInfo: '',//驳回原因
        achievementId: '',//成果id
      },
      formPi: {},
      table: {
        teamId: '',
        teamStaffId: '',
        teamName: '',
        teamSex: '',
        teamPhone: '',
        teamEmail: '',
        teamBirthday: '',
        teamJobTitle: '',
        teamCommAddress: '',
        teamJobAddress: '',
      },
      value1: '',
      attachFileOpen: false,
      form: {
        field: [],
        way: [],
        typesresults: []
      },
      // 图片列表
      imgList: [],
      // 判断是新增还是修改
      isEdit: false,
      //上传时存储文件的部分
      fileList: [],
      nameList: [],
      userRole: '',
      collegeList: [],
      categoryList: ['专利', '软著'],
      // 遮罩层
      loading: true,
      // 导出遮罩层
      exportLoading: false,
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 总条数
      total: 0,
      // 弹出层标题
      title: "",
      showInfo: 0,
      tecTeamList: [],
      tecVerticaltopicList: [],
      tecpList: [],
      dialogImageUrl: '',
      dialogVisible: false,
      tecpiList: [],
      // 表单参数
      tecAchieveForm: {
        achievementId: '',
        achievementName: '',
        college: '',
        field: '',
        category: '',
        contactName: '',
        phoneNumber: '',
        email: '',
        staff: '',
        cooperationMethods: '',
        attachFileName: '',
        registrationDate: '',
        archiveDate: '',
        pageNumber: '',
        background: '',
      },
      currentPage: 1,
    };
  },

  created() {
    this.currentPage = this.$route.query.page || 1; // 如果没有传递页面参数，默认页码为1
    console.log("Current Page:", this.currentPage);
  },
  async mounted() {
    // 从URL中获取achievementid
    const achievementIdFromUrl = this.$route.query.achievementid;
    const response = await getTecachievement(achievementIdFromUrl)
    localStorage.setItem('csData', JSON.stringify(response.data))
    const data = JSON.parse(localStorage.getItem('csData'))
    console.log('mounted--->data---->', data)

    this.$set(this.form, 'achievementid', achievementIdFromUrl)
    this.$set(this.form, 'achievementname', data.achievementname)
    this.$set(this.form, 'field', data.field.split(','))
    console.log("AAAA",typeof this.form.field)
    // this.form.field  = JSON.parse(`[${this.form.field.join(',')}]`)
    console.log("AAAA", this.form)
    if (data.tecTeamList !== undefined) {
      this.tecTeamList = data.tecTeamList;
    }
    if (data.tecVerticaltopicList !== undefined) {
      this.tecVerticaltopicList = data.tecVerticaltopicList;
    }
    this.$set(this.form, 'college', data.college)
    this.$set(this.form, 'way', data.way.split(','))
    this.$set(this.form, 'typesresults', data.typesresults.split(','))
    if (data.technologylevel != null) {
      this.$set(this.form, 'technologylevel', data.technologylevel + '')
    }
    if (data.advancementleve != null) {
      this.$set(this.form, 'advancementleve', data.advancementleve + '')
    }
    this.$set(this.form, 'introduction', data.introduction)
    this.$set(this.form, 'intellectualproperty', data.intellectualproperty)
    this.$set(this.form, 'contactname', data.contactname)
    this.$set(this.form, 'email', data.email)
    this.$set(this.form, 'staffid', data.staffid)
    this.$set(this.form, 'phone', data.phone)
    this.$set(this.form, 'address', data.address)
    this.$set(this.form, 'award', data.award)
    this.$set(this.form, 'benefit', data.benefit)
    this.$set(this.form, 'background', data.background)
    this.$set(this.form, 'piId', data.piId)
    this.$set(this.form, 'teamId', data.teamId)

    this.$set(this.form, 'introductionImg', data.introductionImg)
    // console.log('introductionImg', data.introductionImg)

    if (data.introductionImg !== null) {
      this.imgList = data.introductionImg.split(',');
      for (var i = 0; i < this.imgList.length; i++) {
        this.imgList[i] = process.env.VUE_APP_BASE_API + '/profile' + this.imgList[i];
      }
      console.log('this.imgList--->', this.imgList);
    }

    if (this.form.piId) {
      this.getCollage(this.form.piId);
    }
    //获取状态码
    this.getTecachievementStatus(achievementIdFromUrl)
  },
  methods: {
    //表头样式
    customHeaderCellStyle({column, rowIndex}) {
      // 自定义表头单元格样式
      if (rowIndex === 0) {
        return {
          'font-weight': 'bold', // 自定义字体粗细
          'font-family': '黑体',//字体
          'font-size': '14px',//字号
          height: '20px',//高度
          'background-color': 'rgba(248,248,249,0.7)'//背景颜色
        };
      } else {
        return {}; // 默认样式
      }
    },
    //解决输入框无法输入
    change() {
      this.$forceUpdate()
    },
    showInfo1() {
      this.showInfo = 1;
    },
    showInfo2() {
      this.showInfo = 2;
    },
    showInfo3() {
      this.showInfo = 3;
    },
    showInfo4() {
      this.showInfo = 4;
    },
    showInfo5() {
      this.showInfo = 5;
    },
    showInfo6() {
      this.showInfo = 6;
    },
    showInfo7() {
      this.showInfo = 7;
    },
    handleSuccess() {
      console.log('文件上传成功！')
    },
    //获取成果的状态，
    getTecachievementStatus(achievementid) {
      this.achievementid = this.form.achievementid
      getTecachievement(this.form.achievementid).then(response => {
        this.achievementStatus = response.data.status
        console.log(response.data.status)
      })
    },
    getCollage(piId) {
      getTecpi(piId).then(response => {
        this.tecpList = response.data
        this.getSelectOne(this.tecpList.piCollege)
      })
    },

    getSelectOne(data) {
      let getSelectOneQueryParams = {
        college: data
      }
      listTecpi(getSelectOneQueryParams).then(response => {
        this.nameList = response.rows
      });

    },
    getSelectTwo(data) {
      console.log('piId', data)
      this.form.piId = data;
    },
    // 上传预处理
    beforeUpload(file) {
      //获取最后文件类型
      const fileSuffix = file.name.substring(file.name.lastIndexOf(".") + 1);

      const whiteList = ["doc", "docx", "pdf", "jpg", "jpeg", "png"];

      if (whiteList.indexOf(fileSuffix) === -1) {
        this.$modal.msgError("上传的附件只能是 doc、docx、pdf、jpg、jpeg和png格式");
        return false;
      }

      if (file.size === 0) {
        this.$modal.msgError('文件不能为空');
        return false;
      }

      const reader = new FileReader();
      reader.readAsDataURL(file);
    },

    handleChange(file, fileList) {
      console.log('修改图片', file, fileList)
      fileList = [file]
      this.fileList = fileList
      console.log("handleChange----fileList", this.fileList)
    },
    handleRemove(file, fileList) {
      console.log('删除图片', file, fileList);
      this.fileList = []
      // this.fileResult = false
      // this.scenePicture = ''
    },
    handlePictureCardPreview(file) {
      this.dialogImageUrl = file.url;
      this.dialogVisible = true;
    },
    stringToList(str) {
      let list = [];
      list = str.split(',');
      return list;
    },

    listToString(list) {
      let str = '';
      if (list != null || list != '') {
        for (let i = 0; i < list.length; i++) {
          str += list[i].nickName;
          if (i != list.length - 1) {
            str += ','
          }
        }
      }
      return str;
    },

    typeFormatter(row, column) {
      let name;
      this.collegeList.forEach(function (item, index) {
        if (row.propertyType == item.propertyTypeId) {
          name = item.propertyTypeName;
        }
      })
      return name;
    },

    fareStatusFormatter(row, column) {
      let name;
      this.dict.type.fare_status.forEach(function (item, index) {
        if (row.fareStatus == item.value) {
          name = item.label;
        }
      })
      return name;
    },

    /** 处理审核操作 */
    handleAudit(action) {
      this.$refs["form"].validate(async valid => {
        if (valid) {
          console.log('handleAudit---->', this.form),
            this.dialogFormVisible = false //设置关闭弹窗
          if (this.form.achievementid != null) {
            updateTecStatus(this.form.achievementid, action).then(response => {
              //传递驳回信息
              this.rejection.achievementId = this.form.achievementid //为achievementid赋值
              addtecrejection(this.rejection)
              console.log('handleAudit---response--->', response)
              this.$router.push('tec/toBeAudited')
            })
          }
        }
      });
    },

    back() {
      if (this.achievementStatus === 4) {
        this.$router.push({
          path: 'tec/tecLibrary',
          query: {page: this.currentPage}
        });
      } else {
        this.$router.push('tec/toBeAudited')
      }
    }
  }
};
</script>

<style scoped>
.dialog-footer {
  display: flex;
  justify-content: center;
  margin-top: 20px;
}

.a1 {
  margin-top: 20px;
  margin-left: 20px;
}

.a2 {
  margin-left: 10px;
  width: 1000px;
  display: flex;
  flex-wrap: wrap;
}

.a2 .el-checkbox {
  padding-right: 8px;
  width: 20%;
  margin-bottom: 3px; /* 设置每行多选框之间的垂直间距 */
}

.a3 {
  margin-top: 20px;
  margin-left: -80px;
}

.a4 {
  margin-left: -22px;
  width: 1000px;
  display: flex;
  flex-wrap: wrap;
}

.a4 .el-checkbox {
  padding-right: 8px;
  width: 20%;
  margin-bottom: 3px; /* 设置每行多选框之间的垂直间距 */
}

.a5 {
  margin-right: 10px;
  margin-left: 40px;
}

.a6 {
  margin-left: 10px;
  width: 220px;
}

.a7 {
  margin-left: 10px;
  width: 1000px;

}

.a7 .el-checkbox {
  width: 20%;

}

.a8 {
  margin-left: 15px;
}

.a9 {
  margin-left: 14px;
}

.a10 {
  margin-left: 11px;
}

.a12 {
  margin-top: 20px;
  margin-right: 20px;
  margin-left: -38px;
}

.input-row {
  display: flex;
  margin-left: 60px;
  width: 1200px;
}

.a11 {
  margin-top: 10px;
  margin-left: 10px;
}

.a13 {
  margin-left: -50px;
}

.input-field {
  margin-top: 20px;
  margin-right: 10px;
  margin-left: -40px;
}

.input-field1 {
  margin-right: 20px;
  margin-top: 20px;
  margin-left: 70px;
}

.input-field3 {
  margin-right: 10px;
  margin-top: 20px;
  margin-left: 23px;
}

.inputDeep >>> .el-input__inner {
  border: 0;
}

/*特殊数据项*/
.special-item {
  display: block;
  /* 添加其他样式，如间距、边距等 */
}
</style>
