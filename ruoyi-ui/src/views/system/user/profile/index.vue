<template>
  <div class="app-container">
    <el-row :gutter="20">

      <el-col :span="24" :xs="24">
        <el-card>
          <div slot="header" class="clearfix">
            <span>基本资料</span>
          </div>
          <el-tabs v-model="activeTab">
            <el-tab-pane label="个人资料" name="userinfo">
              <userInfo :user="user"/>
            </el-tab-pane>
<!--            <el-tab-pane label="专家详细信息" name="expertInfo">-->
<!--              <expertInfo :expertInfo="user" :key="new Date().getTime()"/>-->
<!--            </el-tab-pane>-->
            <el-tab-pane label="修改密码" name="resetPwd">
              <resetPwd :user="user"/>
            </el-tab-pane>
          </el-tabs>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import userAvatar from "./userAvatar";
import userInfo from "./userInfo";
import resetPwd from "./resetPwd";
import expertInfo from "./expertInfo";
import {getUserProfile} from "@/api/system/user";
import {getMyInfo} from "@/api/expert/experts";


export default {
  name: "Profile",
  components: {userAvatar, userInfo, resetPwd, expertInfo},
  data() {
    return {
      isShow:false,
      user: {},
      roleGroup: {},
      postGroup: {},
      activeTab: "userinfo",
    };
  },
  created() {
    this.getUser();
  },
  methods: {
    getUser() {
      getUserProfile().then(response => {
        this.user = response.data;
        this.user.roleGroup = response.roleGroup;
        this.user.postGroup = response.postGroup;
        this.$store.commit('set_uid', this.user.userId);
        this.$store.commit('set_nickName', this.user.nickName)
      });
    }
  }
};
</script>
