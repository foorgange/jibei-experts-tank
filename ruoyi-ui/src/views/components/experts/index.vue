<!--测试组件用-->
<template>
  <div>
    <button @click="logopen=true">按钮</button>

    <el-dialog :title="title" :visible.sync="open" width="800px" append-to-body>
      <expert-info :expertForm="form" :isExamine="isExamine" :title="title" :dataLists="getDataLists"/>

    </el-dialog>

    <el-dialog
      title="提示"
      :visible.sync="logopen"
      width="30%">
      <span>这是一段信息</span>
      <span slot="footer" class="dialog-footer">
    <el-button type="primary" @click="openlog(true)">审 核</el-button>
    <el-button type="primary" @click="openlog(false)">修 改</el-button>
  </span>
    </el-dialog>
  </div>

</template>

<script>
import ExpertInfo from './expertInfo.vue'
import {getExperts} from "@/api/expert/experts";
import {listDept, treeselect} from "@/api/system/dept";
import {listClass} from "@/api/expert/class";
import {listMajor} from "@/api/expert/major";
import {listPosition} from "@/api/expert/position";
import {listTitle} from "@/api/expert/title";

export default {
  name: "index",
  dicts: ['user_status', 'expert_star', 'expert_property', 'area', 'education'],
  components: {
    'expert-info': ExpertInfo
  },
  data() {
    return {
      logopen:false,
      open: false,
      form: {},
      title: '',
      isExamine: false,
      // 职位管理表格数据
      positionList: [],
      // 职称管理表格数据
      titleList: [],
      // 专业管理表格数据
      majorList: [],
      // 专家类别管理表格数据
      classList: [],
      // 部门列表
      deptList: [],
      deptOptions:[]
    }
  },
  methods: {
    init(){
      this.getDeptList()
      this.getTitleList()
      this.getMajorList()
      this.getClassList()
      this.getPositionList()
      this.getTreeselect()
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
    openlog(isExamine) {
      this.isExamine = isExamine;
      this.title = isExamine==true?'查看专家信息':'修改专家信息';
      this.getExpert();
    },
    getExpert() {
      getExperts(134).then(response => {
        console.log(response)
        this.form = response.data

        /* 获取的数据为num型，需手动转为string型，才能被下拉框的option*/
        this.form.expertProperties != null ? this.form.expertProperties = this.form.expertProperties.toString() : this.form.expertProperties = ''

        this.form.expertStar != null ? this.form.expertStar = this.form.expertStar.toString() : this.form.expertStar = ''
        // this.form.city !=null ? this.form.city = JSON.parse(this.form.city) : null;
        if (this.form.userStatus !== null) {
          this.form.userStatus = this.form.userStatus.toString()
        }
        // this.form.expertProperties=this.form.expertProperties.toString();
        // this.form.expertStar=this.form.expertStar.toString();
        // this.form.city=this.form.city.toString();
        // this.form.userStatus=this.form.userStatus.toString();
        this.open = true;
      })
    }
  },
  computed:{
    getDataLists() {
      let lists = {
        positionList: this.positionList,
        // 职称管理表格数据
        titleList: this.titleList,
        // 专业管理表格数据
        majorList: this.majorList,
        // 专家类别管理表格数据
        classList: this.classList,
        // 部门列表
        deptList: this.deptList,
        // 部门树选择
        deptOptions: this.deptOptions,
        // 审核状态
        user_status: this.dict.type.user_status,
        // 专家星级
        expert_star: this.dict.type.expert_star,
        // 专家性质
        expert_property: this.dict.type.expert_property,
        // 地区
        area: this.dict.type.area,
        // 学历
        education: this.dict.type.education
      };
      return lists;
    }
  },
  created() {
    this.init()
  }
}
</script>

<style scoped>

</style>
