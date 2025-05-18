<template>
  <el-row :gutter="20">

  <el-col :span="6" :xs="24">
    <el-card class="box-card">
      <div slot="header" class="clearfix">
        <span>个人信息</span>
      </div>
      <div>
        <div class="text-center">
          <userAvatar :user="user"/>
        </div>
        <ul class="list-group list-group-striped">
          <li class="list-group-item">
            <svg-icon icon-class="user"/>
            用户名称
            <div class="pull-right">{{ user.userName }}</div>
          </li>
          <li class="list-group-item">
            <svg-icon icon-class="phone"/>
            手机号码
            <div class="pull-right">{{ user.phonenumber }}</div>
          </li>
          <li class="list-group-item">
            <svg-icon icon-class="email"/>
            用户邮箱
            <div class="pull-right">{{ user.email }}</div>
          </li>
          <li class="list-group-item">
            <svg-icon icon-class="tree"/>
            所属部门
            <div class="pull-right" v-if="user.dept">{{ user.dept.deptName }} / {{ user.postGroup }}</div>
          </li>
          <li class="list-group-item">
            <svg-icon icon-class="peoples"/>
            所属角色
            <div class="pull-right">{{ user.roleGroup }}</div>
          </li>
          <li class="list-group-item">
            <svg-icon icon-class="date"/>
            创建日期
            <div class="pull-right">{{ user.createTime }}</div>
          </li>
        </ul>
      </div>
    </el-card>
  </el-col>

    <el-col :span="18">
  <el-form ref="form" :model="user" :rules="rules" label-width="80px">
    <el-form-item label="用户昵称" prop="nickName">
      <el-input v-model="user.nickName" maxlength="30" />
    </el-form-item>
    <el-form-item label="手机号码" prop="phonenumber">
      <el-input v-model="user.phonenumber" maxlength="11" />
    </el-form-item>
    <el-form-item label="邮箱" prop="email">
      <el-input v-model="user.email" maxlength="50" />
    </el-form-item>
    <el-form-item label="性别">
      <el-radio-group v-model="user.sex">
        <el-radio label="0">男</el-radio>
        <el-radio label="1">女</el-radio>
      </el-radio-group>
    </el-form-item>
    <el-form-item>
      <el-button type="primary" size="mini" @click="submit">保存</el-button>
      <el-button type="danger" size="mini" @click="close">关闭</el-button>
    </el-form-item>
  </el-form>
    </el-col>
  </el-row>

</template>

<script>
import {getUserProfile, updateUserProfile} from "@/api/system/user";
import userAvatar from "@/views/system/user/profile/userAvatar";

export default {
  props: {
    user: {
      type: Object
    }
  },
  components: {userAvatar},
  data() {
    return {
      // 表单校验
      rules: {
        nickName: [
          { required: true, message: "用户昵称不能为空", trigger: "blur" }
        ],
        email: [
          { required: true, message: "邮箱地址不能为空", trigger: "blur" },
          {
            type: "email",
            message: "'请输入正确的邮箱地址",
            trigger: ["blur", "change"]
          }
        ],
        phonenumber: [
          { required: true, message: "手机号码不能为空", trigger: "blur" },
          {
            pattern: /^1[3|4|5|6|7|8|9][0-9]\d{8}$/,
            message: "请输入正确的手机号码",
            trigger: "blur"
          }
        ]
      }
    };
  },
  methods: {
    submit() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          updateUserProfile(this.user).then(response => {
            this.$modal.msgSuccess("修改成功");
          });
        }
      });
    },
    close() {
      this.$store.dispatch("tagsView/delView", this.$route);
      this.$router.push({ path: "/index" });
    },
    // getUser() {
    //   getUserProfile().then(response => {
    //     this.user = response.data;
    //     this.roleGroup = response.roleGroup;
    //     this.postGroup = response.postGroup;
    //   });
    // },
  },
  created() {
    // this.getUser();
  }
};
</script>
