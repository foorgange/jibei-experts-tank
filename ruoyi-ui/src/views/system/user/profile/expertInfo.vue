<template>
  <div class="app-container">
    <el-form  :disabled="isdisabledFn" :rules="rules" v-loading="loading" label-width="100px" ref="projectExpert"
              :model="projectExpert">
      <el-row :gutter="20">
        <el-col :span="6" :xs="24">
          <el-form-item label="地区" prop="area">
            <el-select  v-model="projectExpert.area" placeholder="">
              <el-option
                v-for="dict in dict.type.area"
                :key="dict.value"
                :label="dict.label"
                :value="dict.value"
              />
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :span="6" :xs="24">
          <el-form-item label="城市" prop="city">
            <el-cascader
              :options="options"
              v-model="projectExpert.city"
              @change="handleChange"
              placeholder="">
            </el-cascader>
          </el-form-item>
        </el-col>
        <el-col :span="6" :xs="24">
          <el-form-item label="地址" prop="address">
            <el-input v-model="projectExpert.address" placeholder=""/>
          </el-form-item>
        </el-col>
        <el-col :span="6" :xs="24">
          <el-form-item label="出生时间" prop="birthday">
            <el-date-picker v-model="projectExpert.birthday"/>
          </el-form-item>
        </el-col>
        <el-col :span="6" :xs="24">
          <el-form-item label="身份证号" prop="idNumber">
            <el-input v-model="projectExpert.idNumber"/>
          </el-form-item>
        </el-col>
        <el-col :span="6" :xs="24">

          <el-form-item label="学历" prop="education">
            <el-select v-model="projectExpert.education" placeholder="">
              <el-option
                v-for="dict in dict.type.education"
                :key="dict.value"
                :label="dict.label"
                :value="dict.value"
              />
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :span="6" :xs="24">
          <el-form-item label="毕业院校" prop="graduateSchool">
            <el-input v-model="projectExpert.graduateSchool"/>
          </el-form-item>
        </el-col>
        <el-col :span="6" :xs="24">
          <el-form-item label="毕业时间" prop="graduateDate">
            <el-date-picker v-model="projectExpert.graduateDate"/>
          </el-form-item>
        </el-col>
        <el-col :span="6" :xs="24">
          <el-form-item label="从事专业" prop="majorId">
            <el-select v-model="projectExpert.majorId">
              <el-option
                v-for="dict in majorList"
                :key="dict.majorId"
                :label="dict.majorName"
                :value="dict.majorId"
              />
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :span="6" :xs="24">
          <el-form-item label="专家类别一" prop="expertClassId1">
            <el-select v-model="projectExpert.expertClassId1">
              <el-option
                v-for="dict in classList"
                :key="dict.classId"
                :label="dict.className"
                :value="dict.classId"
              />
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :span="6" :xs="24">
          <el-form-item label="专家类别二" prop="expertClassId2">
            <el-select v-model="projectExpert.expertClassId2">
              <el-option
                v-for="dict in classList"
                :key="dict.classId"
                :label="dict.className"
                :value="dict.classId"
              />
            </el-select>
          </el-form-item>
        </el-col>

        <el-col :span="6" :xs="24">
          <el-form-item label="专家类别三" prop="expertClassId3">
            <el-select v-model="projectExpert.expertClassId3">
              <el-option
                v-for="dict in classList"
                :key="dict.classId"
                :label="dict.className"
                :value="dict.classId"
              />
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :span="6" :xs="24">
          <el-form-item label="专家星级" prop="expertStar">
            <!--            <el-input v-model="projectExpert.expertStar"/>-->
            <el-select v-model="projectExpert.expertStar" placeholder="请选择专家星级">
              <el-option
                v-for="dict in dict.type.expert_star"
                :key="dict.value"
                :label="dict.label"
                :value="dict.value"
              />
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :span="6" :xs="24">
          <el-form-item label="工作单位" prop="workPlace">
            <el-input v-model="projectExpert.workPlace"/>
          </el-form-item>
        </el-col>
        <el-col :span="6" :xs="24">
          <el-form-item label="职位" prop="positionId">
            <el-select v-model="projectExpert.positionId">
              <el-option
                v-for="dict in positionList"
                :key="dict.positionId"
                :label="dict.positionName"
                :value="dict.positionId"
              />
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :span="6" :xs="24">
          <el-form-item label="职称" prop="titleId">
            <el-select v-model="projectExpert.titleId">
              <el-option
                v-for="dict in titleList"
                :key="dict.titleId"
                :label="dict.titleName"
                :value="dict.titleId"
              />
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :span="6" :xs="24">
          <el-form-item label="传真" prop="fax">
            <el-input v-model="projectExpert.fax"/>
          </el-form-item>
        </el-col>
        <el-col :span="6" :xs="24">
          <el-form-item label="邮编" prop="postCodes">
            <el-input v-model="projectExpert.postCode"/>
          </el-form-item>
        </el-col>
        <el-col :span="20" :xs="24">
          <el-form-item label="工作简历" prop="workResume">
            <el-input type="textarea" autosize v-model="projectExpert.workResume"/>
          </el-form-item>
        </el-col>
        <el-col :span="20" :xs="24">
          <el-form-item label="工程业绩" prop="workPerformance">
            <el-input type="textarea" autosize v-model="projectExpert.workPerformance"/>
          </el-form-item>
        </el-col>
        <el-col :span="20" :xs="24">
          <el-form-item label="主要著作" prop="mainProperty">
            <el-input type="textarea" autosize v-model="projectExpert.mainProperty"/>
          </el-form-item>
        </el-col>

      </el-row>
      <el-form-item>
        <el-row :gutter="20">
          <el-col :span="6">
            <el-button type="primary" v-show="projectExpert.userStatus == null" @click="examineExpert">提交审核</el-button>
          </el-col>
          <el-col :span="6">
            <el-button type="primary" v-show="projectExpert.userStatus == 2 " @click="examineExpert">重新提交审核</el-button>
          </el-col>
          <el-col :span="18">
            <h2>审核提示:{{mes}}</h2>
          </el-col>
        </el-row>
      </el-form-item>
    </el-form>
  </div>
</template>


<script>
import {examineExpert,getMyInfo, updateExperts} from "@/api/expert/experts";
import {Mes} from "@/api/expert/apply";
import {listPosition} from "@/api/expert/position";
import {listClass} from "@/api/expert/class";
import {listTitle} from "@/api/expert/title";
import {listMajor} from "@/api/expert/major";
import {provinceAndCityData, CodeToText} from "element-china-area-data";

export default {
  name: "expertInfo",
  props: {
    expertInfo: {
      type: Object
    }
  },
  dicts: ['jb_expert_apply', 'user_status', 'expert_star', 'expert_property', 'area', 'education'],
  data() {
    return {
      loading:false,
      user:this.expertInfo,
      isdisabledFn: false,
      uid: sessionStorage.getItem('uid'),
      mes: '',
      input: false,
      cinput: false,
      options: provinceAndCityData,
      projectExpert: {},
      // 职位管理表格数据
      positionList: [],
      // 职称管理表格数据
      titleList: [],
      // 专业管理表格数据
      majorList: [],
      // 专家类别管理表格数据
      classList: [],
      rules: {
        education: [
          {required: true, trigger: "blur", message: "学历不能为空"},
        ],
        majorId: [
          {required: true, trigger: "blur", message: "专业不能为空"},
        ],
        expertStar: [
          {required: true, trigger: "blur", message: "专家星级不能为空"},
        ],
        expertClassId1: [
          {required: true, trigger: "blur", message: "专家类别一不能为空"},
        ],
        expertClassId2: [
          {required: true, trigger: "blur", message: "专家类别二不能为空"},
        ],
        expertClassId3: [
          {required: true, trigger: "blur", message: "专家类别二不能为空"},
        ],
        positionId: [
          {required: true, trigger: "blur", message: "职位不能为空"},
        ],
        titleId: [
          {required: true, trigger: "blur", message: "职称不能为空"},
        ],
      }
    }
  },
  mounted() {
    this.getList();
  },
  methods: {
    x(status){
      if(status == 1){//审核通过
        this.isdisabledFn = true,
        this.input = false;
        this.cinput = false;
        this.mes = "恭喜您审核通过"
      }else if(status == 2){//审核驳回
        this.isdisabledFn = false,
        this.input = false;
        this.cinput = true;
          Mes(this.$store.state.nickName).then(response => {
            if (response == "非法请求"){
              this.mes = "系统错误请联系管理员！"
            }else{
              this.mes = "非常抱歉审核被驳回，原因："+response+"，请更正后重新提交审核！"
            }
          });
      }
      else if (status == 0){//待审核
        this.isdisabledFn = true;
        this.input = false;
        this.cinput = false;
        this.mes = "审核中，请耐心等待"
      }
      else if (status == null | status == ''){//未提交
        this.isdisabledFn = false,
        this.input = true;
        this.cinput = false;
        this.mes = "请补全信息并提交审核"
      }else{//系统错误
        this.input = false;
        this.cinput = false;
        this.mes = "系统错误，请联系管理员"
      }
    },
    handleChange(value) {
      this.projectExpert.city = value[1];
    },
    getList() {
      this.getProjectExperts();
      this.getClassList();
      this.getMajorList();
      this.getpositionList();
      this.getTitleList();
    },
    getProjectExperts() {
      let uid = Number(this.uid)
      this.loading = true;
      getMyInfo().then(response => {
        if (response.data != null) {
          this.projectExpert = response.data;
          this.x(response.data.userStatus);
          /* 获取的数据为num型，需手动转为string型，才能被下拉框的option识别*/
          if (this.projectExpert.expertStar != null) {
            this.projectExpert.expertStar = this.projectExpert.expertStar.toString()
          }
        }else{
          this.projectExpert.userId = this.user.userId;
          this.x(null);
        }
        this.loading = false;
      });
    },
    getClassList() {
      this.loading = true;
      listClass(this.queryParams).then(response => {
        this.classList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    //审核方法
    examineExpert() {
      this.$refs["projectExpert"].validate(valid => {
        if (valid) {
          examineExpert(this.projectExpert).then(response => {
            if (response[99] == '非法申请') {
              this.$alert('非法申请99', '提示', {
                confirmButtonText: '确定',
                callback: action => {
                }
              }, this.getList());
            } else if (response[100] == "重新申请成功") {
              this.isdisabledFn = false,
                this.$alert('重新申请成功', '提示', {
                  confirmButtonText: '确定',
                  callback: action => {
                  }
                }, this.getList());
            } else if (response[101] == "申请成功") {
              this.isdisabledFn = false,
                this.$alert('申请成功', '提示', {
                  confirmButtonText: '确定',
                  callback: action => {
                  }
                }, this.getList());
            } else {
              this.$alert('非法申请', '提示', {
                confirmButtonText: '确定',
                callback: action => {
                }
              }, this.getList());
            }
          }).then(()=>{
            // this.$router.go(0);
          });
        }
        }
      )
    },
    /** 查询专业管理列表 */
    getMajorList() {
      this.loading = true;
      listMajor(this.queryParams).then(response => {
        this.majorList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    /** 查询职位管理列表 */
    getpositionList() {
      this.loading = true;
      listPosition(this.queryParams).then(response => {
        this.positionList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    /** 查询职称管理列表 */
    getTitleList() {
      this.loading = true;
      listTitle(this.queryParams).then(response => {
        this.titleList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
  }
}
</script>

<style scoped>
/deep/ .el-input__inner {
  width:120px;
}
.el-date-picker {
  width: 120px;
}
.el-form {
  position: relative;
  left: -20px;
}
</style>
