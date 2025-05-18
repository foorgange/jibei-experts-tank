<template>
  <div>
  <div class="header">
    <div class="top">
      <img src="../assets/sdjz/sdjz.png">
      <img src="../assets/sdjz/sdjzwenzi.jpg">
    </div>
  </div>

  <div class="container">
    <img src="../assets/sdjz/06.jpg" alt="" srcset="">
  </div>

  <div class="body">
    <div class="center-box">
      <div class="left1">
        <div class="left-sidebar">
          <h2 class="left-title">成果展示</h2>
          <ul class="left-nav">
            <li class="left-nav-item">
              <!--              <a href="#" class="second-nav-item-text">成果总结报告</a>-->
              <router-link to="/displayReport" class="second-nav-item-text">成果总结报告</router-link>
            </li>
            <li class="left-nav-item1">
              <!--              <a href="#" class="second-nav-item-text">应用及支撑材料</a>-->
              <router-link to="/displayMaterials" class="second-nav-item-text" >应用及支撑材料</router-link>
            </li>
            <li class="left-nav-item2">
              <!--              <a href="#" class="second-nav-item-text">应用及支撑材料</a>-->
              <router-link to="/displayEducation" class="second-nav-item-text" >一心双环体系</router-link>
            </li>
          </ul>
        </div>
      </div>
      <div class="right-content">
        <embed :src="source" type="application/pdf" width="100%" height="1000px" />
      </div>
    </div>
  </div>

  <div class="footer">
    <p>山建大行业大数据中心@版权所有</p>
  </div>
  </div>
</template>

<script>

export default {
  data() {
    return {
      source: '/CAAI成果总结报告.pdf',
    }
  }
}
</script>

<style scoped>
* {
  margin: 0;
  padding: 0;
}

li {
  display: list-item;
  text-align: -webkit-match-parent;
}

body {
  background-color: #fafafa;
}

li {
  list-style: none;
}

.top {
  position: relative;
  top: 0;
  right: 0;
  left: 0;
  height: 160px;
  background-color: #003d87;
}

.top img {
  height: 70%;
  width: auto;
  /* 让图片宽度自适应高度 */
  display: inline-block;
  margin-right: 5px;
  /* 图片之间相距5px */
  margin-left: 100px;
  margin-top: 20px;
}

.top img:last-child {
  margin-left: 20px;
  margin-right: 0;
  /* 移除最后一个图片的右边距，避免多余的间距 */
}

.container {
  position: relative;
  height: 400px;
  width: 100%;
  text-align: center;
}

.container img {
  height: 100%;
  display: flex;
  margin: 0 auto;
  width: calc(100% - 180px);
  /* 左右各留px边距 */
  background-color: #ffffff;
  text-align: center;
}

.center-box {
  display: flex;
  margin: 0 auto;
  width: calc(100% - 180px);
  /* 左右各留px边距 */
  background-color: #ffffff;
  text-align: center;
}

.left1 {
  display: flex;
  /* 设置为 Flex 容器 */
}

.left-sidebar {
  /*float: left;*/
  flex: none;
  height: 400px;
  width: 240px;
  background-color: #003d87;
  position: relative;
  overflow: hidden;
}

.left-sidebar .left-nav-item{
  display: block;
  height: 54px;
  /*background-color: #eec88e;*/
  line-height: 54px;
  font-size: 16px;
  color: #ffffff;
  background-color: #eec88e;
  text-indent: 24px;
  position: relative;
  cursor: pointer;
  border: 0;
  text-decoration: none;
  text-align: center;
  /* 文本水平居中 */
}
.left-sidebar .left-nav-item1{
  display: block;
  height: 54px;
  /*background-color: #eec88e;*/
  line-height: 54px;
  font-size: 16px;
  color: #ffffff;
  text-indent: 24px;
  position: relative;
  cursor: pointer;
  border: 0;
  text-decoration: none;
  text-align: center;
  /* 文本水平居中 */
}
.left-sidebar .left-nav-item2{
  display: block;
  height: 54px;
  /*background-color: #eec88e;*/
  line-height: 54px;
  font-size: 16px;
  color: #ffffff;
  text-indent: 24px;
  position: relative;
  cursor: pointer;
  border: 0;
  text-decoration: none;
  text-align: center;
  /* 文本水平居中 */
}
.left-sidebar .left-title {
  font-size: 20px;
  display: flex;
  align-items: center;
  height: 66px;
  padding: 0 40px;
  font-size: 24px;
  line-height: 1;
  color: #eec88e;
  position: relative;
  text-align: center;
  border-bottom: 3px solid #eec88e;
  /* 2px粗，红色底边框 */
}

.left1 .left-nav {
  padding: 34px 18px 10px 18px;
  border-top: 4px solid #eec88e;
  background-color: #225088;
}

.right-content {
  width: 100%; /* 或者设置一个更大的宽度值 */
  margin-left: 20px;
  /* 留出左侧侧边栏的空间 */
  padding: 20px;
  height: 1000px; /* 设置盒子的高度 */
  /*overflow: auto; */
  /* 内容溢出时显示滚动条 */
}

.footer {
  height: 120px;
  background-color: #212425;
  margin-top: 60px;
  overflow: hidden;
}

.footer p {
  color: #888888;
  text-align: center;
  margin-top: 20px;
  font-size: 12px;
}

.vue-pdf-embed>div {
  margin-bottom: 8px;
  box-shadow: 0 2px 8px 4px rgba(0, 0, 0, 0.1);
}

</style>
