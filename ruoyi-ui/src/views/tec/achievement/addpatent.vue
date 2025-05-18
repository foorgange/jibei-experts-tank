<template>
  <div class="app-container">
    <!-- 标题栏 -->
    <div class="header">
      <div class="header-line"></div>
      <span class="header-title">专利基础信息</span>
    </div>

    <!-- 表单 -->
    <el-form ref="form" :model="form" label-width="120px" :rules="rules" class="form-container">
      <el-form-item label="发明名称" prop="achievementname">
        <el-input v-model="form.achievementname" placeholder="请输入发明名称" />
      </el-form-item>
      <el-form-item label="代理机构" prop="agency">
        <el-input v-model="form.agency" placeholder="请输入代理机构" />
      </el-form-item>
      <el-form-item label="公开号" prop="publicationNumber">
        <el-input v-model="form.publicationNumber" placeholder="请输入公开号" />
      </el-form-item>
      <el-form-item label="申请号" prop="applicationNumber">
        <el-input v-model="form.applicationNumber" placeholder="请输入申请号" />
      </el-form-item>

      <!-- 发明人 -->
      <el-form-item label="发明人" prop="inventor">
        <div v-for="(inventor, index) in form.inventors" :key="'inventor-' + index" class="dynamic-input">
          <el-input v-model="form.inventors[index]" placeholder="请输入发明人" />
          <el-button v-if="index === form.inventors.length - 1" type="text" icon="el-icon-plus"
            @click="addInventor"></el-button>
          <el-button v-if="index > 0" type="text" icon="el-icon-minus" @click="removeInventor(index)"></el-button>
        </div>
      </el-form-item>

      <!-- 申请人 -->
      <el-form-item label="申请人" prop="applicant">
        <div v-for="(applicant, index) in form.applicants" :key="'applicant-' + index" class="dynamic-input">
          <el-input v-model="form.applicants[index]" placeholder="请输入申请人" />
          <el-button v-if="index === form.applicants.length - 1" type="text" icon="el-icon-plus"
            @click="addApplicant"></el-button>
          <el-button v-if="index > 0" type="text" icon="el-icon-minus" @click="removeApplicant(index)"></el-button>
        </div>
      </el-form-item>

      <el-form-item label="国家/地区/组织" prop="applicantCountry">
        <el-input v-model="form.applicantCountry" placeholder="请输入申请人所在国家/地区/组织" />
      </el-form-item>
      <el-form-item label="IPC分类号" prop="ipcClassification">
        <el-input v-model="form.ipcClassification" placeholder="请输入IPC分类号" />
      </el-form-item>
      <el-form-item label="申请日" prop="applicationDate">
        <el-date-picker v-model="form.applicationDate" type="date" placeholder="请选择申请日" value-format="yyyy-MM-dd"
          style="width: 100%;" />
      </el-form-item>

      <!-- 主权力要求 -->
      <el-form-item label="主权力要求" prop="mainClaim">
        <el-input v-model="form.mainClaim" type="textarea" :rows="4" placeholder="请输入主权力要求" />
      </el-form-item>

      <!-- 摘要 -->
      <el-form-item label="摘要" prop="intellectualproperty">
        <el-input v-model="form.intellectualproperty" type="textarea" :rows="4" placeholder="请输入摘要" />
      </el-form-item>

      <!-- 公开日期范围 -->
      <el-form-item label="公开日期范围" prop="publicationDateRange">
        <el-date-picker v-model="form.publicationDateRange" type="daterange" range-separator="至"
          start-placeholder="开始日期" end-placeholder="结束日期" value-format="yyyy-MM-dd" style="width: 100%;" />
      </el-form-item>

      <el-form-item label="简要说明" prop="briefDescription">
        <el-input v-model="form.briefDescription" type="textarea" :rows="4" placeholder="请输入简要说明" />
      </el-form-item>
    </el-form>

    <!-- 按钮区域 -->
    <div class="dialog-footer">
      <el-button type="primary" @click="handleSubmit">提 交</el-button>
      <el-button @click="cancel">取 消</el-button>
    </div>
  </div>
</template>

<script>
import { addPatent } from '@/api/tec/patent';

export default {
  name: "PatentForm",
  data() {
    return {
      form: {
        achievementname: null,
        intellectualproperty: null,
        agency: null,
        publicationNumber: null,
        applicationNumber: null,
        inventors: [""], // 发明人数组
        applicants: [""], // 申请人数组
        applicantCountry: null,
        ipcClassification: null,
        applicationDate: null, // 申请日字段
        mainClaim: null, // 主权力要求
        briefDescription: null,
        status: null, // 状态字段
        publicationDateRange: [], // 公开日期范围
      },
      rules: {}, // 验证规则
    };
  },
  methods: {

    // 处理表单提交
    handleSubmit() {
      // 校验表单（如果需要）
      if (!this.validateForm()) {
        this.$message.error("请填写完整信息！");
        return;
      }

      // 格式化表单数据
      const formattedData = this.formatFormData();

      // 调用新增专利接口
      addPatent(formattedData)
        .then(() => {
          this.$message.success("专利信息添加成功！");
          // 清除表单数据
          this.resetForm();
        })
        .catch((error) => {
          this.$message.error("专利信息添加失败：" + error.message);
        });
    },

    // 重置表单数据
    resetForm() {
      this.form = {
        achievementname: null,
        intellectualproperty: null,
        agency: null,
        publicationNumber: null,
        applicationNumber: null,
        inventors: [""], // 发明人数组
        applicants: [""], // 申请人数组
        applicantCountry: null,
        ipcClassification: null,
        applicationDate: null, // 申请日字段
        mainClaim: null, // 主权力要求
        briefDescription: null,
        status: null, // 状态字段
        publicationDateRange: [], // 公开日期范围
      };
    },

    // 校验表单是否完整
    validateForm() {
      const { achievementname, applicationDate, publicationDateRange } = this.form;
      return (
        !!achievementname &&
        !!applicationDate &&
        publicationDateRange.length === 2
      );
    },

    // 格式化表单数据
    formatFormData() {
      const {
        achievementname,
        intellectualproperty,
        agency,
        publicationNumber,
        applicationNumber,
        inventors,
        applicants,
        applicantCountry,
        ipcClassification,
        applicationDate,
        mainClaim,
        briefDescription,
        publicationDateRange,
      } = this.form;

      // 处理发明人和申请人，使用分号拼接
      const formattedInventors = inventors.filter(Boolean).join(";");
      const formattedApplicants = applicants.filter(Boolean).join(";");

      // 处理公开日期范围，格式为 "2006.12.27==2007.12.26"
      const [startDate, endDate] = publicationDateRange;
      const formattedPublicationDateRange = `${startDate.replace(/-/g, ".")}==${endDate.replace(
        /-/g,
        "."
      )}`;

      // 返回格式化后的数据
      return {
        patentName: achievementname,
        abstractText: intellectualproperty,
        agency,
        publicationNumber,
        applicationNumber,
        inventors: formattedInventors,
        applicants: formattedApplicants,
        applicantCountry,
        ipcClass: ipcClassification,
        applicationDate, // 格式为 "2006-09-25"
        mainClaim,
        briefStatement: briefDescription,
        publicationDate: formattedPublicationDateRange,
      };
    },

    // 动态添加发明人
    addInventor() {
      this.form.inventors.push(""); // 添加新的发明人输入框
    },
    removeInventor(index) {
      if (this.form.inventors.length > 1) {
        this.form.inventors.splice(index, 1); // 删除指定的发明人输入框
      }
    },

    // 动态添加申请人
    addApplicant() {
      this.form.applicants.push(""); // 添加新的申请人输入框
    },
    removeApplicant(index) {
      if (this.form.applicants.length > 1) {
        this.form.applicants.splice(index, 1); // 删除指定的申请人输入框
      }
    },

    cancel() {
      console.log("取消操作");
    },
  },
};
</script>

<style scoped>
/* 容器样式 */
.app-container {
  padding: 20px;
  background-color: #fff;
  border-radius: 8px;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.1);
}

/* 标题栏样式 */
.header {
  display: flex;
  align-items: center;
  margin-bottom: 20px;
}

.header-line {
  width: 5px;
  height: 20px;
  background-color: #0079fe;
  margin-right: 10px;
}

.header-title {
  font-size: 18px;
  font-weight: bold;
}

/* 表单容器样式 */
.form-container {
  max-width: 600px;
  /* 限制表单宽度 */
  margin: 0 auto;
  /* 居中 */
}

/* 动态输入框样式 */
.dynamic-input {
  display: flex;
  align-items: center;
  margin-bottom: 10px;
}

.dynamic-input .el-input {
  flex: 1;
  margin-right: 10px;
}

.dynamic-input .el-button {
  padding: 5px;
}

/* 按钮区域样式 */
.dialog-footer {
  display: flex;
  justify-content: center;
  margin-top: 30px;
}

.dialog-footer .el-button {
  margin: 0 10px;
}
</style>