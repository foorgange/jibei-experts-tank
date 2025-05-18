<template>
  <el-row :gutter="40" class="panel-group">
    <el-col :xs="24" :sm="12" :lg="6" class="card-panel-col" >
      <div class="card-panel" @click="goto('/tec/cs')">
        <div class="card-panel-icon-wrapper icon-message">
          <svg-icon icon-class="documentation" class-name="card-panel-icon" />
        </div>
        <div class="card-panel-description">
          <div class="card-panel-text">
            新增成果
          </div>
        </div>
      </div>
    </el-col>

    <el-col :xs="24" :sm="12" :lg="6" class="card-panel-col" >
      <div class="card-panel" @click="goto('/tec/tecPi')">
        <div class="card-panel-icon-wrapper icon-people">
          <svg-icon icon-class="peoples" class-name="card-panel-icon" />
        </div>
        <div class="card-panel-description">
          <div class="card-panel-text">
            专家库
          </div>
        </div>
      </div>
    </el-col>

    <el-col :xs="24" :sm="12" :lg="6" class="card-panel-col" >
      <div class="card-panel" @click="goto('tec/tecLibrary')">
        <div class="card-panel-icon-wrapper icon-money">
          <svg-icon icon-class="nested" class-name="card-panel-icon" />
        </div>
        <div class="card-panel-description">
          <div class="card-panel-text">
            科技成果库
          </div>
        </div>
      </div>
    </el-col>

    <el-col :xs="24" :sm="12" :lg="6" class="card-panel-col" >
      <div class="card-panel" @click="goto('/PatentScreen')">
        <div class="card-panel-icon-wrapper icon-money">
          <svg-icon icon-class="nested" class-name="card-panel-icon" />
        </div>
        <div class="card-panel-description">
          <div class="card-panel-text">
            科技成果大屏
          </div>
        </div>
      </div>
    </el-col>

    <el-col :xs="24" :sm="12" :lg="6" class="card-panel-col" >
      <div class="card-panel" @click="goto('/PatentScreenbackup')">
        <div class="card-panel-icon-wrapper icon-money">
          <svg-icon icon-class="nested" class-name="card-panel-icon" />
        </div>
        <div class="card-panel-description">
          <div class="card-panel-text">
            科技成果大屏2
          </div>
        </div>
      </div>
    </el-col>

<!--    <el-col :xs="24" :sm="12" :lg="6" class="card-panel-col" v-if="expertPermission || adminPermission">-->
<!--      <div class="card-panel" @click="goto('/project/projects')">-->
<!--        <div class="card-panel-icon-wrapper icon-message">-->
<!--          <svg-icon icon-class="documentation" class-name="card-panel-icon" />-->
<!--        </div>-->
<!--        <div class="card-panel-description">-->
<!--          <div class="card-panel-text">-->
<!--            项目管理-->
<!--          </div>-->
<!--        </div>-->
<!--      </div>-->
<!--    </el-col>-->

<!--    <el-col :xs="24" :sm="12" :lg="6" class="card-panel-col" v-if="expertPermission || adminPermission">-->
<!--      <div class="card-panel" @click="goto('property/propertys')">-->
<!--        <div class="card-panel-icon-wrapper icon-money">-->
<!--          <svg-icon icon-class="nested" class-name="card-panel-icon" />-->
<!--        </div>-->
<!--        <div class="card-panel-description">-->
<!--          <div class="card-panel-text">-->
<!--            知识产权管理-->
<!--          </div>-->
<!--        </div>-->
<!--      </div>-->
<!--    </el-col>-->


  </el-row>
</template>

<script>
import CountTo from 'vue-count-to'

export default {
  components: {
    CountTo
  },
  methods: {
    handleSetLineChartData(type) {
      this.$emit('handleSetLineChartData', type)
    },
    goto(url){
      this.$router.push(url);
    }
  },
  computed:{
    adminPermission(){
      return this.$store.getters.roles.indexOf('admin')>=0 || this.$store.getters.roles.indexOf('sysadmin')>=0
    },
    expertPermission(){
      return this.$store.getters.roles.indexOf('expert')>=0
    },
  }
}
</script>

<style lang="scss" scoped>
.panel-group {
  margin-top: 18px;

  .card-panel-col {
    margin-bottom: 32px;
  }

  .card-panel {
    height: 108px;
    cursor: pointer;
    font-size: 12px;
    position: relative;
    overflow: hidden;
    color: #666;
    background: #fff;
    box-shadow: 4px 4px 40px rgba(0, 0, 0, .05);
    border-color: rgba(0, 0, 0, .05);

    &:hover {
      .card-panel-icon-wrapper {
        color: #fff;
      }

      .icon-people {
        background: #40c9c6;
      }

      .icon-message {
        background: #36a3f7;
      }

      .icon-money {
        background: #f4516c;
      }

      .icon-shopping {
        background: #34bfa3
      }
    }

    .icon-people {
      color: #40c9c6;
    }

    .icon-message {
      color: #36a3f7;
    }

    .icon-money {
      color: #f4516c;
    }

    .icon-shopping {
      color: #34bfa3
    }

    .card-panel-icon-wrapper {
      float: left;
      margin: 14px 0 0 14px;
      padding: 16px;
      transition: all 0.38s ease-out;
      border-radius: 6px;
    }

    .card-panel-icon {
      float: left;
      font-size: 48px;
    }

    .card-panel-description {
      float: right;
      font-weight: bold;
      margin: 26px;
      margin-left: 0px;

      .card-panel-text {
        line-height: 18px;
        color: rgba(0, 0, 0, 0.45);
        font-size: 16px;
        margin-bottom: 12px;
      }

      .card-panel-num {
        font-size: 20px;
      }
    }
  }
}

@media (max-width:550px) {
  .card-panel-description {
    display: none;
  }

  .card-panel-icon-wrapper {
    float: none !important;
    width: 100%;
    height: 100%;
    margin: 0 !important;

    .svg-icon {
      display: block;
      margin: 14px auto !important;
      float: none !important;
    }
  }
}
</style>
