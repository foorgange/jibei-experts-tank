<template>
  <div class="register">
    <el-form ref="passCode" :model="passCode" :rules="passCodeRules" class="register-form">
      <h3 class="title">科技成果管理系统<br>通行验证</h3>

      <el-form-item prop="userNamee">
        <el-input v-model.trim="passCode.userName" type="text" auto-complete="off" placeholder="专家姓名">
          <svg-icon slot="prefix" icon-class="user" class="el-input__icon input-icon"/>
        </el-input>
      </el-form-item>

      <el-form-item prop="passCodeValue">
        <el-input v-model.trim="passCode.passCodeValue" type="text" auto-complete="off" placeholder="通行码">
          <svg-icon slot="prefix" icon-class="lock" class="el-input__icon input-icon"/>
        </el-input>
      </el-form-item>

      <el-form-item prop="code" v-if="captchaOnOff">
        <el-input
          v-model.trim="passCode.code"
          auto-complete="off"
          placeholder="验证码"
          style="width: 63%"
          @keyup.enter.native="handleRegister"
        >
          <svg-icon slot="prefix" icon-class="validCode" class="el-input__icon input-icon"/>
        </el-input>
        <div class="register-code">
          <img :src="codeUrl" @click="getCode" class="register-code-img"/>
        </div>
      </el-form-item>

      <el-form-item style="width:100%;">
        <el-button
          :loading="loading"
          size="medium"
          type="primary"
          style="width:100%;"
          @click.native.prevent="handleRegister"
        >
          <span v-if="!loading">通 行</span>
          <span v-else>通 行 中...</span>
        </el-button>
        <div style="float: right;">
          <router-link class="link-type" :to="'/login'">使用已有账户登录</router-link>
        </div>
      </el-form-item>

    </el-form>
    <!--  底部  -->
    <div class="el-register-footer">
      <span>Copyright © 2018-2021 ruoyi.vip All Rights Reserved.</span>
    </div>
  </div>
</template>

<script>
import {getCodeImg, expertCode} from "@/api/login";

export default {
  name: "Register",
  data() {
    return {
      codeUrl: "",
      passCode: {
        userName: '',
        passCodeValue: '',
        code: "",
        uuid: ""
      },
      passCodeRules: {
        username: [
          {required: true, trigger: "blur", message: "请输入您的姓名"},
          {min: 2, max: 20, message: '专家姓名长度必须介于 2 和 20 之间', trigger: 'blur'}

        ],
        passCodeValue: [
          {required: true, trigger: "blur", message: "请输入您的通行码"},
          {
            validator: function (rule, value, callback) {
              if (/^\d+$|^\d+[.]?\d+$/.test(value) == false) {
                callback(new Error("请输入合法的通行码"));
              } else {
                //校验通过
                callback();
              }
            },
            trigger: "blur"
          },
          {min: 5, max: 9, message: '通行码长度必须介于 5 和 9 之间', trigger: 'blur'}
        ],
        code: [{required: true, trigger: "change", message: "请输入验证码"}]
      },
      loading: false,
      captchaOnOff: true
    };
  },
  created() {
    this.getCode();
  },
  methods: {
    getCode() {
      getCodeImg().then(res => {
        this.captchaOnOff = res.captchaOnOff === undefined ? true : res.captchaOnOff;
        if (this.captchaOnOff) {
          this.codeUrl = "data:image/gif;base64," + res.img;
          this.passCode.uuid = res.uuid;
        }
      });
    },
    handleRegister() {
      this.$refs.passCode.validate(valid => {
        if (valid) {
          this.loading = true;
          expertCode(this.passCode).then(res => {
            if (res["101"] == "该通行码不存在") {
              this.$alert("<font color='red'>该通行码不存在！</font>", '系统提示', {
                dangerouslyUseHTMLString: true
              }).then(() => {
                this.loading = false;
                if (this.captchaOnOff) {
                  this.getCode();
                }
              }).catch(() => {
              });
            } else if (res["105"] == "通行码已使用") {
              this.$alert("<font color='red'>该通行码已被使用！</font>", '系统提示', {
                dangerouslyUseHTMLString: true
              }).then(() => {
                this.loading = false;
                if (this.captchaOnOff) {
                  this.getCode();
                }
              }).catch(() => {
              });
            } else if (res["104"] == "该通行码以过期") {
              this.$alert("<font color='red'>该通行码已过期，请联系管理员！</font>", '系统提示', {
                dangerouslyUseHTMLString: true
              }).then(() => {
                this.loading = false;
                if (this.captchaOnOff) {
                  this.getCode();
                }
              }).catch(() => {
              });
            } else if (res["102"] == "专家姓名与通行码不匹配") {
              this.$alert("<font color='red'>专家姓名与通行码不匹配！</font>", '系统提示', {
                dangerouslyUseHTMLString: true
              }).then(() => {
                this.loading = false;
                if (this.captchaOnOff) {
                  this.getCode();
                }
              }).catch(() => {
              });
            } else if (res["103"] == "通行成功") {
              let username = this.passCode.userName;
              // 将通过密钥保存到vuex中
              this.$store.commit('set_uucode', this.passCode.passCodeValue);
              this.$store.commit('set_username', this.passCode.userName);
              this.$alert("<font color='red'>尊敬的" + username + "专家，恭喜你，成功通行！</font>", '系统提示', {
                dangerouslyUseHTMLString: true
              }).then(() => {
                this.$router.push("/registerend");
              }).catch(() => {
              });
            } else {
              this.$alert("<font color='red'>请联系管理员！</font>", '系统提示', {
                dangerouslyUseHTMLString: true
              }).then(() => {
                this.loading = false;
                if (this.captchaOnOff) {
                  this.getCode();
                }
              }).catch(() => {
              });
            }
          }).catch(() => {
            this.loading = false;
            if (this.captchaOnOff) {
              this.getCode();
            }
          })
        }
      });
    }
  }
};
</script>

<style rel="stylesheet/scss" lang="scss">
.register {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100%;
  background-image: url("../assets/images/login-background.jpg");
  background-size: cover;
}

.title {
  margin: 0px auto 30px auto;
  text-align: center;
  color: #707070;
}

.register-form {
  border-radius: 6px;
  background: #ffffff;
  width: 400px;
  padding: 25px 25px 5px 25px;

  .el-input {
    height: 38px;

    input {
      height: 38px;
    }
  }

  .input-icon {
    height: 39px;
    width: 14px;
    margin-left: 2px;
  }
}

.register-tip {
  font-size: 13px;
  text-align: center;
  color: #bfbfbf;
}

.register-code {
  width: 33%;
  height: 38px;
  float: right;

  img {
    cursor: pointer;
    vertical-align: middle;
  }
}

.el-register-footer {
  height: 40px;
  line-height: 40px;
  position: fixed;
  bottom: 0;
  width: 100%;
  text-align: center;
  color: #fff;
  font-family: Arial;
  font-size: 12px;
  letter-spacing: 1px;
}

.register-code-img {
  height: 38px;
}
</style>
