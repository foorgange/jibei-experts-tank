<template>
  <el-form ref="form" :model="user" :rules="rules" label-width="80px">
    <el-form-item label="旧密码" prop="oldPassword">
      <el-input v-model="user.oldPassword" placeholder="请输入旧密码" type="password" show-password/>
    </el-form-item>
    <el-form-item label="新密码" prop="newPassword">
      <el-input v-model="user.newPassword" placeholder="请输入新密码" type="password" show-password/>
    </el-form-item>
    <el-form-item label="确认密码" prop="confirmPassword">
      <el-input v-model="user.confirmPassword" placeholder="请确认密码" type="password" show-password/>
    </el-form-item>
    <el-form-item>
      <el-button type="primary" size="mini" @click="submit">保存</el-button>
      <el-button type="danger" size="mini" @click="close">关闭</el-button>
    </el-form-item>
    <el-dialog :visible.sync="isDisplay" title="密码修改成功请重新登录！"width="35%">
      密码修改成功请重新登录
      <el-button type="primary" @click="goToLogin" class="change">重新登录</el-button>
    </el-dialog>
  </el-form>


</template>

<script>
import { updateUserPwd } from "@/api/system/user";
import {setToken} from "@/utils/auth";
import {encrypt} from "@/utils/jsencrypt";
import {getPublicKey} from "@/api/login";
import redirect from "@/views/redirect.vue";

export default {
  data() {
    const equalToPassword = (rule, value, callback) => {
      if (this.user.newPassword !== value) {
        callback(new Error("两次输入的密码不一致"));
      } else {
        callback();
      }
    };
    return {
      test: "1test",
      isDisplay:false,
      user: {
        oldPassword: undefined,
        newPassword: undefined,
        confirmPassword: undefined
      },
      // 表单校验
      rules: {
        oldPassword: [
          { required: true, message: "旧密码不能为空", trigger: "blur" }
        ],
        newPassword: [
          { required: true, message: "新密码不能为空", trigger: "blur" },
          { min: 8, max: 20, message: "长度在 8 到 20 个字符", trigger: "blur" },
          {
            trigger: "blur",
            validator:(rule, value, callback) => {
              let passwordReg =  /^(?![a-zA-Z]+$)(?![A-Z0-9]+$)(?![A-Z\W_!@#$%^&*`~()-+=]+$)(?![a-z0-9]+$)(?![a-z\W_!@#$%^&*`~()-+=]+$)(?![0-9\W_!@#$%^&*`~()-+=]+$)[a-zA-Z0-9\W_!@#$%^&*`~()-+=]{8,20}$/
              let valid = passwordReg.test(this.user.newPassword.trim())
              if (valid != true) {
                callback(new Error("新密码必须包含大小写字母，符号，数字"));
              } else {
                callback();
              }
            }
          }
        ],
        confirmPassword: [
          { required: true, message: "确认密码不能为空", trigger: "blur" },
          { required: true, validator: equalToPassword, trigger: "blur" }
        ]
      }
    };  },

  methods: {
    // getPublicKey() {
    //   return new Promise((resolve, reject) => {
    //     getPublicKey()
    //       .then(res => {
    //         resolve(res)
    //       })
    //       .catch(error => {
    //         reject(error)
    //       })
    //   })
    // },
submit() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          var token=localStorage.getItem('reset_token')
          console.log(token)
          setToken(token)
          getPublicKey().then(res=>{
            let publicKey = res.publicKey
            console.log("res.publicKey",res.publicKey)
            const oldPassword = encrypt(this.user.oldPassword, publicKey)
            const newPassword = encrypt(this.user.newPassword, publicKey)
            updateUserPwd(oldPassword, newPassword).then(
              response => {
                this.$modal.msgSuccess("修改成功");
                this.isDisplay = true;
                this.loading = false;
              }
            );
          })        }
      });
    },
    goToLogin() {
      setToken("")
      //重新登录
      this.$router.push('/login');
    },
    close() {
      this.$store.dispatch("tagsView/delView", this.$route);
      this.$router.push({ path: "/index" });
    }
  }
};
</script>
