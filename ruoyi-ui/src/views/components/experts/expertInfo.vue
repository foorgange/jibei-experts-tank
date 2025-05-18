<!--专家信息展示，包括账号信息及专家信息-->
<template>
  <!-- 添加或修改专家属性对话框 -->
  <div>
    <el-form ref="form" :model="form" :rules="rules" label-width="80px" v-if="isExamine">
      <el-row :gutter="20">
        <el-col :span="12" :xs="24" style="height: 200px">
          <el-form-item>
            <el-avatar shape="square" :size="200" border fit="fill" v-if=" this.form.avatar !== '' || this.form.avatar == undefined"
                       :src="avatarUrl"/>
            <el-avatar v-else fit="fill" :size="200" :src="require('@/assets/images/profile.jpg')"/>
          </el-form-item>
        </el-col>
        <el-col :span="12" :xs="24">
          <el-form-item label="专家姓名" prop="nickName">
            <div>{{ form.nickName }}</div>
          </el-form-item>
        </el-col>
        <el-col :span="12" :xs="24">
          <el-form-item label="所属部门" prop="deptId">
            <div>{{ form.deptName }}</div>
          </el-form-item>
        </el-col>
        <el-col :span="12" :xs="24">
          <el-form-item label="用户邮箱" prop="email">
            <div>{{ form.email }}</div>
          </el-form-item>
        </el-col>
        <el-col :span="12" :xs="24">
          <el-form-item label="手机号码" prop="email">
            <div>{{ form.phoneNumber }}</div>
          </el-form-item>
        </el-col>
        <el-col :span="12" :xs="24">
          <el-form-item label="专家性质" prop="expertProperties">
            <div>{{ form.expertProperties == 0 ? '非正式' : form.expertProperties == 1 ? '正式' : '其他' }}</div>
          </el-form-item>
        </el-col>
        <el-col :span="12" :xs="24">
          <el-form-item label="专家星级" prop="expertStar">
            <div>
              <span v-if="form.expertStar==null"/>
              <span v-for="num in parseInt(form.expertStar)" v-else :key="num">★</span>
            </div>
          </el-form-item>
        </el-col>
<!--        <el-col :span="12" :xs="24">-->
<!--          <el-form-item label="审核状态" prop="userStatus">-->
<!--            <div> {{ dict.type.user_status [form.userStatus].label }}</div>-->
<!--          </el-form-item>-->
<!--        </el-col>-->
        <el-col :span="12" :xs="24">
          <el-form-item label="地区" prop="area">
            <div>
              <div v-if="form.area ==null || form.area==''"/>
              <div v-else>{{ dict.type.area[form.area - 1].label }}</div>
            </div>
          </el-form-item>
        </el-col>
        <el-col :span="12" :xs="24">
          <el-form-item label="城市" prop="city">

            <div>
              <div v-if="form.city == null || form.city == ''"/>
              <div v-else>{{ getCityName(form.city) }}</div>
            </div>
          </el-form-item>
        </el-col>

        <el-col :span="24" :xs="24">
          <el-form-item label="地址" prop="address">
            <div> {{ form.address }}</div>
          </el-form-item>
        </el-col>
        <el-col :span="12" :xs="24">
          <el-form-item label="出生日期" prop="birthday">

            <div>
              <div v-if="form.birthday == null || form.birthday == ''"/>
              <div v-else>{{ form.birthday.slice(0, 10) }}</div>
            </div>
          </el-form-item>
        </el-col>
        <el-col :span="12" :xs="24">
          <el-form-item label="毕业时间" prop="graduateDate">
            <div>
              <div v-if="form.graduateDate == null || form.graduateDate == ''"/>
              <div v-else>{{ form.graduateDate.slice(0, 10) }}</div>
            </div>
          </el-form-item>
        </el-col>
        <el-col :span="12" :xs="24">
          <el-form-item label="学历" prop="education">
            <div> {{ dict.type.education[form.education - 1].label }}</div>
          </el-form-item>
        </el-col>
        <el-col :span="12" :xs="24">
          <el-form-item label="毕业院校" prop="graduateSchool">
            <div>{{ form.graduateSchool }}</div>
          </el-form-item>
        </el-col>
        <el-col :span="24" :xs="24">
          <el-form-item label="身份证号" prop="idNumber">
            <div>{{ form.idNumber }}</div>
          </el-form-item>
        </el-col>
        <el-col :span="24" :xs="24">
          <el-form-item label="工作单位" prop="workPlace">
            <div>{{ form.workPlace }}</div>
          </el-form-item>
        </el-col>
        <el-col :span="12" :xs="24">
          <el-form-item label="职位" prop="positionId">

            <div>{{ positionList[(form.positionId-1).toString()].positionName }}</div>
          </el-form-item>
        </el-col>
        <el-col :span="12" :xs="24">
          <el-form-item label="职称" prop="titleId">

            <div>{{ titleList[(form.titleId-1).toString()].titleName }}</div>
          </el-form-item>
        </el-col>
        <el-col :span="12" :xs="24">
          <el-form-item label="专业" prop="majorId">
            <div>{{ majorList[(form.majorId-1).toString()].majorName }}</div>
          </el-form-item>
        </el-col>
        <el-col :span="12" :xs="24">
          <el-form-item label="专家类别1" prop="expertClassId1">
            <div>{{ classList[form.expertClassId1.toString()].className }}</div>
          </el-form-item>
        </el-col>
        <el-col :span="12" :xs="24">
          <el-form-item label="专家类别2" prop="expertClassId2">
            <div>{{ classList[form.expertClassId2.toString()].className }}</div>
          </el-form-item>
        </el-col>
        <el-col :span="12" :xs="24">
          <el-form-item label="专家类别3" prop="expertClassId3">
            <div>{{ classList[form.expertClassId3.toString()].className }}</div>
          </el-form-item>
        </el-col>
        <el-col :span="12" :xs="24">
          <el-form-item label="传真" prop="fax">
            <div>{{ form.fax }}</div>
          </el-form-item>
        </el-col>
        <el-col :span="12" :xs="24">
          <el-form-item label="邮编" prop="postcodes">
            <div>{{ form.postcodes }}</div>
          </el-form-item>
        </el-col>
      </el-row>
      <el-form-item label="工程业绩" prop="workPerformance">
        <div v-html="form.workPerformance!==null?form.workPerformance.replace(/\n|\r\n/g, '<br>'):'无内容'" class="el-textarea__inner"></div>
      </el-form-item>
      <el-form-item label="工作简历" prop="workResume">
        <div v-html="form.workResume!==null?form.workResume.replace(/\n|\r\n/g, '<br>'):'无内容'" class="el-textarea__inner"></div>
      </el-form-item>
      <el-form-item label="主要著作" prop="mainProperty">
        <div v-html="form.mainProperty!==null?form.mainProperty.replace(/\n|\r\n/g, '<br>'):'无内容'" class="el-textarea__inner"></div>
      </el-form-item>
    </el-form>

    <el-form ref="form" :model="form" :rules="rules" label-width="80px" v-else>
      <el-row :gutter="20">
        <el-col :span="12" :xs="24" style="height: 200px">
          <el-form-item>

            <el-avatar shape="square" :size="200" border fit="fill" v-if=" this.form.avatar !== '' || this.form.avatar == undefined"
                       :src="avatarUrl"/>
            <el-avatar v-else fit="fill" :size="200" :src="require('@/assets/images/profile.jpg')"/>
          </el-form-item>
        </el-col>
        <el-col :span="12" :xs="24">
          <el-form-item label="专家姓名" prop="nickName">
            <el-input v-model="form.nickName"/>
          </el-form-item>
        </el-col>
        <el-col :span="12" :xs="24">
          <el-form-item label="所属部门" prop="deptId">
            <treeselect v-model="form.deptId" :options="deptOptions" :show-count="true" placeholder="请选择归属部门"/>
          </el-form-item>
        </el-col>
        <el-col :span="12" :xs="24">
          <el-form-item label="用户邮箱" prop="email">
            <el-input v-model="form.email"/>
          </el-form-item>
        </el-col>
        <el-col :span="12" :xs="24">
          <el-form-item label="手机号码" prop="email">
            <el-input v-model="form.phoneNumber" v-if="!isExamine"/>
          </el-form-item>
        </el-col>
        <el-col :span="12" :xs="24">
          <el-form-item label="专家性质" prop="expertProperties">
            <el-select v-model="form.expertProperties" placeholder="请选择专家性质">
              <el-option
                v-for="dict in dict.type.expert_property"
                :key="dict.value"
                :label="dict.label"
                :value="dict.value"
              />
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :span="12" :xs="24">
          <el-form-item label="专家星级" prop="expertStar">
            <el-select v-model="form.expertStar" placeholder="请选择专家星级">
              <el-option
                v-for="dict in dict.type.expert_star"
                :key="dict.value"
                :label="dict.label"
                :value="dict.value"
              />
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :span="12" :xs="24">
          <el-form-item label="审核状态" prop="userStatus">
            <el-select v-model="form.userStatus" placeholder="请选择审核状态">
              <el-option
                v-for="dict in dict.type.user_status"
                :key="dict.value"
                :label="dict.label"
                :value="dict.value"
              />
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :span="12" :xs="24">
          <el-form-item label="地区" prop="area">
            <el-select v-model="form.area" placeholder="请选择地区">
              <el-option
                v-for="dict in dict.type.area"
                :key="dict.value"
                :label="dict.label"
                :value="dict.value"
              />
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :span="12" :xs="24">
          <el-form-item label="城市" prop="city">
            <el-cascader
              size="large"
              :options="options"
              v-model="form.city"
              @change="handleChange">
            </el-cascader>
          </el-form-item>
        </el-col>
        <el-col :span="24" :xs="24">
          <el-form-item label="地址" prop="address">
            <el-input v-model="form.address" placeholder="请输入地址"/>
          </el-form-item>
        </el-col>
        <el-col :span="12" :xs="24">
          <el-form-item label="出生日期" prop="birthday">
            <el-date-picker clearable size="small"
                            v-model="form.birthday"
                            type="date"
                            value-format="yyyy-MM-dd"
                            placeholder="选择出生日期">
            </el-date-picker>
          </el-form-item>
        </el-col>
        <el-col :span="12" :xs="24">
          <el-form-item label="毕业时间" prop="graduateDate">
            <el-date-picker clearable size="small"
                            v-model="form.graduateDate"
                            type="date"
                            value-format="yyyy-MM-dd"
                            placeholder="选择毕业时间">
            </el-date-picker>
          </el-form-item>
        </el-col>
        <el-col :span="12" :xs="24">
          <el-form-item label="学历" prop="education">
            <el-select v-model="form.education" placeholder="请选择学历">
              <el-option
                v-for="dict in dict.type.education"
                :key="dict.value"
                :label="dict.label"
                :value="dict.value"
              />
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :span="12" :xs="24">
          <el-form-item label="毕业院校" prop="graduateSchool">
            <el-input v-model="form.graduateSchool" placeholder="请输入毕业院校"/>
          </el-form-item>
        </el-col>
        <el-col :span="24" :xs="24">
          <el-form-item label="身份证号" prop="idNumber">
            <el-input v-model="form.idNumber" placeholder="请输入身份证号"/>
          </el-form-item>
        </el-col>
        <el-col :span="24" :xs="24">
          <el-form-item label="工作单位" prop="workPlace">
            <el-input v-model="form.workPlace" placeholder="请输入工作单位"/>
          </el-form-item>
        </el-col>
        <el-col :span="12" :xs="24">
          <el-form-item label="职位" prop="positionId">
            <el-select v-model="form.positionId" placeholder="请选择职位">
              <el-option
                v-for="dict in positionList"
                :key="dict.positionId"
                :label="dict.positionName"
                :value="dict.positionId"
              />
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :span="12" :xs="24">
          <el-form-item label="职称" prop="titleId">
            <el-select v-model="form.titleId" placeholder="请选择职称">
              <el-option
                v-for="dict in titleList"
                :key="dict.titleId"
                :label="dict.titleName"
                :value="dict.titleId"
              />
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :span="12" :xs="24">
          <el-form-item label="专业" prop="majorId">
            <el-select v-model="form.majorId" placeholder="请选择专业">
              <el-option
                v-for="dict in majorList"
                :key="dict.majorId"
                :label="dict.majorName"
                :value="dict.majorId"
              />
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :span="12" :xs="24">
          <el-form-item label="专家类别1" prop="expertClassId1">
            <el-select v-model="form.expertClassId1" placeholder="请选择专家类别">
              <el-option
                v-for="dict in classList"
                :key="dict.classId"
                :label="dict.className"
                :value="dict.classId"
              />
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :span="12" :xs="24">
          <el-form-item label="专家类别2" prop="expertClassId2">
            <el-select v-model="form.expertClassId2" placeholder="请选择专家类别">
              <el-option
                v-for="dict in classList"
                :key="dict.classId"
                :label="dict.className"
                :value="dict.classId"
              />
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :span="12" :xs="24">
          <el-form-item label="专家类别3" prop="expertClassId3">
            <el-select v-model="form.expertClassId3" placeholder="请选择专家类别">
              <el-option
                v-for="dict in classList"
                :key="dict.classId"
                :label="dict.className"
                :value="dict.classId"
              />
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :span="12" :xs="24">
          <el-form-item label="传真" prop="fax">
            <el-input v-model="form.fax" placeholder="请输入传真"/>
          </el-form-item>
        </el-col>
        <el-col :span="12" :xs="24">
          <el-form-item label="邮编" prop="postcodes">
            <el-input v-model="form.postcodes" placeholder="请输入邮编"/>
          </el-form-item>
        </el-col>
      </el-row>
      <el-form-item label="工程业绩" prop="workPerformance">
        <el-input v-model="form.workPerformance" type="textarea"/>
      </el-form-item>
      <el-form-item label="工作简历" prop="workResume">
        <el-input v-model="form.workResume" type="textarea"/>
      </el-form-item>
      <el-form-item label="主要著作" prop="mainProperty">
        <el-input v-model="form.mainProperty" type="textarea" autosize/>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
import {CodeToText, provinceAndCityData} from 'element-china-area-data'
import '@riophae/vue-treeselect/dist/vue-treeselect.css'
import {listDept, treeselect} from "@/api/system/dept";
import {listClass} from "@/api/expert/class";
import {listMajor} from "@/api/expert/major";
import {listPosition} from "@/api/expert/position";
import {listTitle} from "@/api/expert/title";
import Treeselect from "@riophae/vue-treeselect";

export default {
  // eslint-disable-next-line quotes
  name: "ExpertInfo",
  components:{ Treeselect },
  dicts: ['user_status', 'expert_star', 'expert_property', 'area', 'education'],
  props: ['expertForm', 'title', 'isExamine'],
  data() {
    return {
      avatarUrl: process.env.VUE_APP_BASE_API + this.expertForm.avatar,
      options: provinceAndCityData,
      selectedOptions: [],
      // 部门树选项
      deptOptions: [],
      // 部门名称
      deptName: undefined,
      // 表单参数
      form: this.expertForm,
      // 表单校验
      rules: {
        userId: [
          {max: 20, message: '用户id长度不能超过20', trigger: 'blur'}
        ],
        expertProperties: [],
        expertStar: [],
        birthday: [],
        area: [],
        city: [],
        address: [
          {max: 255, message: '地址长度不能超过255', trigger: 'blur'}

        ],
        education: [],
        graduateSchool: [
          {max: 255, message: '毕业院校长度不能超过255', trigger: 'blur'}

        ],
        graduateDate: [],
        idNumber: [
          {max: 18, message: '身份证号长度不能超过18', trigger: 'blur'}

        ],
        userStatus: [],
        workPlace: [
          {max: 255, message: '工作单位长度不能超过255', trigger: 'blur'}

        ],
        positionId: [],
        titleId: [],
        majorId: [],
        expertClassId1: [],
        expertClassId2: [],
        expertClassId3: [],
        fax: [
          {max: 255, message: '传真长度不能超过255', trigger: 'blur'}

        ],
        postcodes: [
          {max: 255, message: '邮编长度不能超过255', trigger: 'blur'}

        ],
        workPerformance: [],
        workResume: [],
        mainProperty: []
      },
      // 职位管理表格数据
      positionList: [],
      // 职称管理表格数据
      titleList: [],
      // 专业管理表格数据
      majorList: [],
      // 专家类别管理表格数据
      classList: [],
      // 部门列表
      deptList: []
    }
  },
  methods:{
    getCityName(cityId){
      let provinceId = cityId.toString().slice(0,2) + '0000';
      return CodeToText[provinceId] + ' / ' + CodeToText[cityId];
    },
    handleChange(value) {
      console.log(value)
      this.form.city = value[1]
    },
    /** 查询部门下拉树结构 */
    getTreeselect() {
      treeselect().then(response => {
        this.deptOptions = response.data
      })
    },
    getDeptList() {
      this.loading = true
      listDept(this.queryParams).then(response => {
        this.deptList = response.data
        this.loading = false
      })
    },
    getClassList() {
      this.loading = true
      listClass(this.queryParams).then(response => {
        this.classList = response.rows // rows表示response是数组或者集合
        this.total = response.total
        this.loading = false
      })
    },
    /** 查询专业管理列表 */
    getMajorList() {
      this.loading = true
      listMajor(this.queryParams).then(response => {
        this.majorList = response.rows
        this.total = response.total
        this.loading = false
      })
    },
    /** 查询职位管理列表 */
    getPositionList() {
      this.loading = true
      listPosition(this.queryParams).then(response => {
        this.positionList = response.rows
        this.total = response.total
        this.loading = false
      })
    },
    /** 查询职称管理列表 */
    getTitleList() {
      this.loading = true
      listTitle(this.queryParams).then(response => {
        this.titleList = response.rows
        this.total = response.total
        this.loading = false
      })
    },
  },
  created() {
    this.getDeptList()
    this.getTitleList()
    this.getMajorList()
    this.getClassList()
    this.getPositionList()
    this.getTreeselect()
  }
}

</script>

<style scoped>

</style>
