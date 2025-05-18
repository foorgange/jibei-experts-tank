<template>
  <div class="visualization-screen">
    <!-- 头部 -->
    <el-row class="header">
      <el-col :span="24">
        <h1 class="YouSheBiaoTiHei-font"
          style="margin-top: .6rem; margin-bottom: .6rem; font-size: .45rem;font-weight: normal;line-height: .58rem;letter-spacing: 0px;color: #FFFFFF;">
          科技成果管理</h1>
        <div class="header-date AlibabaPuHuiTi-font">
          <span> {{ networkTime }} 星期{{ networkDay }}</span>
          <img src="./image/形状.png" class="header-button" @click="goToIndex" />


        </div>
      </el-col>
    </el-row>
    <!-- 主体内容 -->
    <el-row class="main-content">
      <!-- 左侧区域 -->
      <el-col :span="6">
        <div class="left-section">

          <!-- 专利分类统计 -->
          <div class="statistic-item">
            <div class="statistic-item-title">
              <span style="width: 8px; height: 100%; background-color: #1977E5;"></span>
              <!--              <span style="width: 6px; height: 6px; background-image: url('');  background-size: cover;background-repeat: no-repeat;"></span>-->
              <img src="./image/三角形-正.png" alt="">
              <span class="YouSheBiaoTiHei-font statistic-item-title-text">专利分类统计</span>
              <!--              <span style="background-image: url('./image/三角形-反.png');"></span>-->
              <img src="./image/三角形-反.png" alt="">
            </div>

            <div style="display: flex;justify-content:space-around; text-align: center">
              <div>
                <p style="font-size: .16rem; color: rgba(255, 255, 255, 1);">发明专利总量</p>
                <div style="margin-top: 12px; position: relative;">
                  <p
                    style="width: 1.05rem; position: relative;font-size: .28rem;font-weight: 250; color: rgba(225, 245, 3, 1); z-index: 1">
                    {{ patentData.inventionTotal }}</p>
                  <img style="width: 1.05rem; position: absolute; top: 10px; left: -.03rem" src="./image/专利分类统计-矩形.png"
                    alt="">
                </div>
              </div>
              <div>
                <p style="font-size: .16rem; color: rgba(255, 255, 255, 1);">实用新型总量</p>
                <div style="margin-top: 12px; position: relative;">
                  <p
                    style="width: 1.05rem; position: relative;font-size: .28rem;font-weight: 250; color: rgba(225, 245, 3, 1); z-index: 1">
                    {{ patentData.utilityModelTotal }}</p>
                  <img style="width: 1.05rem; position: absolute; top: 10px; left: -.03rem" src="./image/专利分类统计-矩形.png"
                    alt="">
                </div>
              </div>
              <div>
                <p style="font-size: .16rem; color: rgba(255, 255, 255, 1);">外观设计总量</p>
                <div style="margin-top: 12px; position: relative;">
                  <p
                    style="width: 1.05rem; position: relative;font-size: .28rem;font-weight: 250; color: rgba(225, 245, 3, 1); z-index: 1">
                    {{ patentData.designTotal }}</p>
                  <img style="width: 1.05rem; position: absolute; top: 10px; left: -.03rem" src="./image/专利分类统计-矩形.png"
                    alt="">
                </div>
              </div>
            </div>
          </div>


          <!-- 当年专利授权数量 -->
          <div class="statistic-item">
            <div class="statistic-item-title">
              <img src="./image/三角形-正.png" alt="">
              <span class="YouSheBiaoTiHei-font statistic-item-title-text">当年专利授权数量</span>
              <img src="./image/三角形-反.png" alt="">
            </div>
            <div>
              <div style="position: relative; margin-top: 12px; height: .6rem">
                <span
                  style="position: absolute; top: .07rem; left: .5rem; z-index: 2; font-size: .16rem">当年专利授权数量</span>
                <span class="AlibabaPuHuiTi-font"
                  style="position: absolute; top: 2px; z-index: 2; right: .6rem; font-size: .24rem; color: rgba(225, 245, 3, 1)">{{
                    patentData.currentYearGranted
                  }}</span>
                <img style="width: 100%; position: absolute; top: 0;" src="./image/当年专利授权数量-矩形.png" alt="">
              </div>

            </div>

            <div style="display: flex; justify-content: space-around;">
              <div
                style="display: flex; padding: .06rem;background: linear-gradient(180deg, rgba(64, 100, 182, 0) 0%, #091423 100%);box-shadow: inset 0px -22px 44px 0px #174A94; border-radius: 8px;">
                <div>
                  <p style="font-size: .14rem; margin: 0">发明专利</p>
                  <p style="font-size: .14rem; margin-bottom: 0"> {{ patentData.inventionPatent }}%</p>
                </div>
                <div style="margin-left: 10px">
                  <el-progress type="circle" :percentage="formattedInventionPatent" :width="progressWidth"
                    color="rgba(134, 117, 255, 1)" :format="(value) => { return value + '%' }"></el-progress>
                </div>
              </div>

              <div
                style="display: flex; padding: .06rem;background: linear-gradient(180deg, rgba(64, 100, 182, 0) 0%, #091423 100%);box-shadow: inset 0px -22px 44px 0px #174A94; border-radius: 8px;">
                <div>
                  <p style="font-size: .14rem; margin: 0">实用新型</p>
                  <p style="font-size: .14rem; margin-bottom: 0">{{ patentData.utilityModelPatent }}%</p>
                </div>
                <div style="margin-left: 10px">
                  <el-progress type="circle" :percentage="formattedUtilityModelPatent" :width="progressWidth"
                    color="rgba(134, 117, 255, 1)"></el-progress>
                </div>
              </div>

              <div
                style=" display: flex; padding: .06rem;background: linear-gradient(180deg, rgba(64, 100, 182, 0) 0%, #091423 100%);box-shadow: inset 0px -22px 44px 0px #174A94; border-radius: 8px;">
                <div>
                  <p style="font-size: .14rem; margin: 0">外观设计</p>
                  <p style="font-size: .14rem; margin-bottom: 0">{{ patentData.designPatent }}%</p>
                </div>
                <div style="margin-left: 10px">
                  <el-progress type="circle" :percentage="formattedDesignPatent" :width="progressWidth"
                    color="rgba(134, 117, 255, 1)"></el-progress>
                </div>
              </div>

            </div>

            <!--            <div class="chart-container" id="yearlyGrantedChart"></div>-->
          </div>
          <!-- 历年专利申请趋势分析 -->
          <div class="statistic-item">
            <div class="statistic-item-title">
              <span style="width: 8px; height: 100%; background-color: #1977E5;"></span>
              <img src="./image/三角形-正.png" alt="">
              <span class="YouSheBiaoTiHei-font statistic-item-title-text">历年专利申请趋势分析<span class="YouSheBiaoTiHei-font"
                  style="font-size: .18rem;margin-left: .08rem">历年专利申请类别趋势</span></span>
            </div>
            <div class="chart-container" id="applicationTrendChart" style="width: 100%; height: 2rem"></div>

          </div>

          <!-- IPC领域统计 -->
          <div class="statistic-item">
            <div class="statistic-item-title">
              <span style="width: 8px; height: 100%; background-color: #1977E5;"></span>
              <img src="./image/三角形-正.png" alt="">
              <span class="YouSheBiaoTiHei-font statistic-item-title-text">IPC领域统计</span>
              <img src="./image/三角形-反.png" alt="">
            </div>
            <div class="chart-container" id="ipcChart" style="height: 2rem">
            </div>
          </div>

        </div>
      </el-col>
      <!-- 中间区域 -->
      <el-col :span="11">
        <div class="middle-section">
          <div style="text-align: center; display: flex; justify-content: space-between; margin-bottom: 26px">
            <div
              style="width: 24%; background: linear-gradient(180deg, rgba(64, 100, 182, 0) 0%, #091423 100%); border: 2px solid;border-image: linear-gradient(0deg, rgba(136, 213, 255, 0) 26%, #10D6E1 110%) 2; border-radius: 8px;box-shadow: inset 0px 22px 44px 0px #174A94;">
              <p class="AlibabaPuHuiTi-font" style="font-size: .30rem;color: rgba(225, 245, 3, 1); margin: 10px 0">
                {{ patentData.applicationTotal }}
              </p>
              <p class="AlibabaPuHuiTi-font" style="font-size: .17rem;color: #EEECEC; margin-bottom: 10px">专利申请总量(件)</p>
            </div>

            <div
              style="width: 24%; background: linear-gradient(180deg, rgba(64, 100, 182, 0) 0%, #091423 100%); border: 2px solid;border-image: linear-gradient(0deg, rgba(136, 213, 255, 0) 26%, #10D6E1 110%) 2; border-radius: 8px;box-shadow: inset 0px 22px 44px 0px #174A94;">
              <p class="AlibabaPuHuiTi-font" style="font-size: .30rem;color: rgba(225, 245, 3, 1); margin: 10px 0">{{
                patentData.grantTotal }}
              </p>
              <p class="AlibabaPuHuiTi-font" style="font-size: .17rem;color: #EEECEC; margin-bottom: 10px">专利授权总量(件)</p>
            </div>

            <div
              style="width: 24%; background: linear-gradient(180deg, rgba(64, 100, 182, 0) 0%, #091423 100%); border: 2px solid;border-image: linear-gradient(0deg, rgba(136, 213, 255, 0) 26%, #10D6E1 110%) 2; border-radius: 8px;box-shadow: inset 0px 22px 44px 0px #174A94;">
              <p class="AlibabaPuHuiTi-font" style="font-size: .30rem;color: rgba(225, 245, 3, 1); margin: 10px 0">{{
                patentData.inventionGrantTotal }}
              </p>
              <p class="AlibabaPuHuiTi-font" style="font-size: .17rem;color: #EEECEC; margin-bottom: 10px">发明授权总量(件)</p>
            </div>

            <div
              style="width: 24%; background: linear-gradient(180deg, rgba(64, 100, 182, 0) 0%, #091423 100%); border: 2px solid;border-image: linear-gradient(0deg, rgba(136, 213, 255, 0) 26%, #10D6E1 110%) 2; border-radius: 8px;box-shadow: inset 0px 22px 44px 0px #174A94;">
              <p class="AlibabaPuHuiTi-font" style="font-size: .30rem;color: rgba(225, 245, 3, 1); margin: 10px 0"> {{
                patentData.validPatentTotal }}
              </p>
              <p class="AlibabaPuHuiTi-font" style="font-size: .17rem;color: #EEECEC; margin-bottom: 10px">有效专利总量(件)</p>
            </div>

          </div>
          <!-- 专利分级统计 -->
          <div style="display: flex;justify-content: space-between">


            <div class="statistic-item" style="width: 49%">
              <div class="statistic-item-title">
                <span style="width: 8px; height: 100%; background-color: #1977E5;"></span>
                <img src="./image/三角形-正.png" alt="">
                <span class="YouSheBiaoTiHei-font statistic-item-title-text">专利分级统计</span>
                <img src="./image/三角形-反.png" alt="">
              </div>

              <div id="gradeClassificationChart" ref="gradeClassificationChart" style="height:100%;"></div>

            </div>



            <div class="statistic-item" style="width: 49%; z-index: 1000;">
              <div class="statistic-item-title">
                <span style="width: 8px; height: 100%; background-color: #1977E5;"></span>
                <img src="./image/三角形-正.png" alt="">
                <span class="YouSheBiaoTiHei-font statistic-item-title-text">专利评级分布</span>
                <img src="./image/三角形-反.png" alt="">
              </div>
              <div class="chart-container" id="gradeChart" style="height: 3rem; z-index: 1000;">
                <Donut3D :optionData="chartData" :key="componentKey" style="z-index: 1000;" />
              </div>


            </div>

          </div>
          <div>
            <!-- 共同申请人排行 -->
            <div class="statistic-item" style="float: left;width: 48%;height: auto;">
              <div class="statistic-item-title">
                <span style="width: 8px; height: 100%; background-color: #1977E5;"></span>
                <img src="./image/三角形-正.png" alt="">
                <span class="YouSheBiaoTiHei-font statistic-item-title-text">共同申请人排行</span>
                <img src="./image/三角形-反.png" alt="">
              </div>
              <!--              <div class="chart-container" id="coApplicantChart">-->
              <div class="enterprise-layout">
                <div v-for="(item, index) in enterpriseList" :key="index" class="enterprise-item">
                  <div class="enterprise-image">
                    <img :src="item.image" :alt="item.image">
                  </div>
                  <div class="content-rows">
                    <div class="top-row">
                      <div class="enterprise-name">{{ item.name }}</div>
                      <div class="enterprise-number">{{ item.value }}</div>
                    </div>
                    <div class="bottom-row">
                      <div class="progress-bar">
                        <div class="progress-fill" :style="{
                          width: (item.value / maxValue * 100) + '%',
                          background: item.gradient
                        }">
                        </div>
                      </div>
                    </div>
                  </div>
                </div>


              </div>


              <!--              </div>-->
            </div>
            <!-- 发明人专利排行 -->
            <div class="statistic-item" style="float: right;width: 48%;">
              <div class="statistic-item-title">
                <span style="width: 8px; height: 100%; background-color: #1977E5;"></span>
                <img src="./image/三角形-正.png" alt="">
                <span class="YouSheBiaoTiHei-font statistic-item-title-text">发明人专利排行</span>
                <img src="./image/三角形-反.png" alt="">
              </div>
              <div class="chart-container" id="inventorChart" style="width: 100%; height: 3rem"></div>


            </div>
          </div>
        </div>
      </el-col>
      <!-- 右侧区域 -->
      <el-col :span="7">
        <div class="right-section">

          <!-- 专利运营转化情况 -->
          <div class="statistic-item">
            <div class="statistic-item-title">
              <span style="width: 8px; height: 100%; background-color: #1977E5;"></span>
              <img src="./image/三角形-正.png" alt="">
              <span class="YouSheBiaoTiHei-font statistic-item-title-text">专利运营转化情况</span>
              <img src="./image/三角形-反.png" alt="">
            </div>

            <div style="position: relative; margin-top: 10px; height: .73rem; padding-top: .05rem">
              <img style="width: 100%; position: absolute; top: -8%" src="./image/专利运营转化情况-梯形背景.png" alt="">
              <div style="display: flex; justify-content: space-around;">
                <div style=" z-index: 2;">
                  <span style="font-size: .16rem">专利转让</span><br>
                  <span style="font-size: .24rem;color: rgba(225, 245, 3, 1)">{{ patentData.transferCount }}<span
                      style="font-size: .18rem">件</span></span>
                </div>
                <div style="z-index: 2">
                  <span style="font-size: .16rem">专利许可</span><br>
                  <span style="font-size: .24rem;color: rgba(225, 245, 3, 1)">{{ patentData.licenseCount }} <span
                      style="font-size: .18rem">件</span></span>
                </div>
                <div style="z-index: 2">
                  <span style="font-size: .16rem">专利质押</span><br>
                  <span style="font-size: .24rem;color: rgba(225, 245, 3, 1)">{{ patentData.pledgeCount }} <span
                      style="font-size: .18rem">件</span></span>
                </div>
              </div>
            </div>

            <div style="padding: 10px; height: 170px; overflow-y: auto;" ref="tableContainer">
              <el-table :data="visiblePatents" header-row-class-name="patent-conversion-table-header"
                :row-class-name="patentConversionTableRowClassName" :cell-style="{ padding: '0' }"
                :row-style="{ height: '.28rem', fontSize: '.14rem' }"
                :header-row-style="{ height: '.28rem', fontSize: '.14rem' }"
                :header-cell-style="{ padding: '0', height: '.28rem' }" style="width: 100%">

                <el-table-column prop="patentName" label="专利名">
                  <template slot-scope="scope">
                    <el-tooltip class="item" effect="dark" :content="scope.row.patentName" placement="top">
                      <div class="ellipsis">{{ scope.row.patentName }}</div>
                    </el-tooltip>
                  </template>
                </el-table-column>

                <!-- 合作方 -->
                <el-table-column prop="collaborator" label="合作方">
                  <template slot-scope="scope">
                    <el-tooltip class="item" effect="dark" :content="scope.row.collaborator" placement="top">
                      <div class="ellipsis">{{ scope.row.collaborator }}</div>
                    </el-tooltip>
                  </template>
                </el-table-column>

                <!-- 运营类型 -->
                <el-table-column prop="operationType" label="运营类型">
                  <template slot-scope="scope">
                    <el-tooltip class="item" effect="dark" :content="scope.row.operationType" placement="top">
                      <div class="ellipsis">{{ scope.row.operationType }}</div>
                    </el-tooltip>
                  </template>
                </el-table-column>


              </el-table>
            </div>

          </div>



          <!-- 专利运营情况趋势 -->
          <div class="statistic-item">
            <div class="statistic-item-title">
              <span style="width: 8px; height: 100%; background-color: #1977E5;"></span>
              <img src="./image/三角形-正.png" alt="">
              <span class="YouSheBiaoTiHei-font statistic-item-title-text">专利运营情况趋势</span>
              <img src="./image/三角形-反.png" alt="">
            </div>

            <div class="chart-container" id="operationTrendChart" style="width: 100%; height: 2.6rem"></div>
          </div>


          <!-- 知产百科 -->
          <div class="statistic-item">
            <div class="statistic-item-title">
              <span style="width: 8px; height: 100%; background-color: #1977E5;"></span>
              <img src="./image/三角形-正.png" alt="">
              <span class="YouSheBiaoTiHei-font statistic-item-title-text">知产百科</span>
              <img src="./image/三角形-反.png" alt="">
            </div>
            <img src="./image/知识百科.png" alt="知产百科图片" style="width: 100%; height: 2rem">
          </div>


        </div>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import * as echarts from 'echarts';
import { getPatentStatistics, getMonthlyCounts, getCurrentTime, getPatentClass, getPatentStats, getPatentApplicationTotal, getPatentValidStats, getPatentAuthorizes, getIpcClass, gettopInventors, getTotalCounts, getTopFive, getGradesTotal, getPatentCountsByYear } from '@/api/tec/patentScreen';
import Donut3D from './Donut3D.vue'  // 确保路径正确
export default {
  components: {
    Donut3D  // 注册组件
  },
  props: {
  },
  data() {
    return {
      patents: [], // 存储所有专利数据
      currentIndex: 0, // 当前显示的起始索引
      visibleRowCount: 5, // 每次显示的行数

      // 初始化专利运营统计数据为空对象
      patentOperationStats: {
        operationTotal: [],
        transfers: [],
        licenses: [],
        pledges: [],
        years: []
      },
      // 初始化专利申请趋势统计数据
      patentApplicationStats: {
        applications: [],
        authorizedCounts: [],
        publishedCounts: [],
        years: []
      },
      //3D饼图
      chartData: [],  // 初始化为空数组
      componentKey: 0,  // 用于强制组件重新渲染
      chartHeight: '3rem', // 初始高度

      //专利运营转化状况
      patentConversionTable: [
        {
          id: 1,
          name: '一种风管连接结构及风管',
          partners: '山东格瑞德集团有限公司',
          operationType: '权力转移'
        },
        {
          id: 1,
          name: '一种串联式辐射地板与新风复合空调控制系统及控制方法',
          partners: '优士科技发展有限公司',
          operationType: '权力转移'
        },
        {
          id: 1,
          name: '一种气凝胶道路养护用空隙修复机',
          partners: '山东省高速养护集团有限公司',
          operationType: '权力转移'
        },
        {
          id: 1,
          name: '一种可视化平行节理类围岩试件的制备装置',
          partners: '中铁二十一局集团轨道交通工程有限公司',
          operationType: '权力转移'
        },
        {
          id: 1,
          name: '一种棱镜与棋盘标组合的高精度点云配准辅助装置',
          partners: '山东高速建设管理集团有限公司',
          operationType: '权力转移'
        },
      ],
      patentData: {
        inventionTotal: '0',     //发明专利总量
        utilityModelTotal: '0',  //实用新型总量
        designTotal: '0',        //外观设计总量
        applicationTotal: '0',      //专利申请总量（件）
        grantTotal: '6087',           //专利授权总量
        inventionGrantTotal: '3467',  //发明专利授权总量
        validPatentTotal: '2855',
        transferCount: '1277',       //专利转让
        licenseCount: '188',         //专利许可
        pledgeCount: '0',            //专利质押
        invention: '0',            //2024年发明专利
        design: '0',                //2024年外观设计专利
        utility: '0',              //2024年实用专利
        totalyear: '0',            //2024年授权专利
        currentYearGranted: '422',      //当年专利授权数量(件)
        inventionPatent: '0',
        utilityModelPatent: '0',
        designPatent: '0'
      },
      maxValue: 20,
      enterpriseList: [
        {
          name: '企业1',
          value: 20,
          image: require('./image/enterprise1.png'),
          gradient: 'linear-gradient(90deg, rgba(241, 159, 22, 0) -1%, #FFA818 100%)'
        },
        {
          name: '企业2',
          value: 16,
          image: require('./image/enterprise2.png'),
          gradient: 'linear-gradient(90deg, rgba(171, 214, 223, 0) -1%, #B7DDE4 100%)'
        },
        {
          name: '企业3',
          value: 13,
          image: require('./image/enterprise3.png'),
          gradient: 'linear-gradient(91deg, rgba(224, 135, 82, 0) 3%, #E28C57 99%)'
        },
        {
          name: '企业4',
          value: 10,
          image: require('./image/enterprise4.png'),
          gradient: 'linear-gradient(270deg, #088BFF 0%, rgba(8, 139, 255, 0.1) 99%)'
        },
        {
          name: '企业5',
          value: 8,
          image: require('./image/enterprise5.png'),
          gradient: 'linear-gradient(270deg, #088BFF 0%, rgba(8, 139, 255, 0.1) 99%)'
        }
      ],
      networkDate: '',
      networkTime: '',
      networkDay: '',
      //ipc领域
      chart: null,
      //发明人专利排行
      inventorsChart: null,
      progressWidth: 51,
      applicationTrendChart: null,
      operationTrendChart: null,
      gradeClassificationChart: null,
    };
  },

  computed: {
    // 计算当前需要显示的专利数据
    visiblePatents() {
      const start = this.currentIndex;
      const end = start + this.visibleRowCount;
      return this.patents.slice(start, end);
    },
    /**
 * 格式化 inventionPatent 数据，确保其为数值类型
 */
    formattedInventionPatent() {
      const value = parseFloat(this.patentData.inventionPatent);
      return isNaN(value) ? 0 : value;
    },
    /**
     * 格式化 utilityModelPatent 数据，确保其为数值类型
     */
    formattedUtilityModelPatent() {
      const value = parseFloat(this.patentData.utilityModelPatent);
      return isNaN(value) ? 0 : value;
    },
    /**
     * 格式化 designPatent 数据，确保其为数值类型
     */
    formattedDesignPatent() {
      const value = parseFloat(this.patentData.designPatent);
      return isNaN(value) ? 0 : value;
    }
  },

  mounted() {
    //当年专利授权数量
    // 在组件挂载时调用方法获取数据
    this.fetchPatentStatistics();
    this.fetchPatents().then(() => {
      this.autoScroll(); // 数据加载完成后开始自动滚动
    });
    //动态计算rem
    document.querySelector("html").style.fontSize = "100px";
    document.querySelector("body").style.fontSize = "16px";
    (function (doc, win) {
      var docEI = doc.documentElement,
        resizeEvt = 'orientationchange' in window ? 'orientataionchange' : 'resize',
        recalc = function () {
          var clientWidth = docEI.clientWidth;
          if (!clientWidth) return;
          //100是字体大小，1536是开发时浏览器窗口的宽度，等比计算
          docEI.style.fontSize = 100 * (clientWidth / 1820) + 'px';
        }

      if (!doc.addEventListener) return;
      win.addEventListener(resizeEvt, recalc, false);
      doc.addEventListener('DOMContentLoaded', recalc, false);
      recalc();
    })(document, window);

    window.addEventListener('resize', () => {
      this.progressWidth = parseInt(document.querySelector('html').style.fontSize) * 0.5135;
    });


    //专利分级统计
    // 在组件挂载后初始化图表，并获取数据填充图表
    this.getPatentDataAndInitializeChart();
    //历年专利申请趋势
    this.updateApplicationTrendChartWithPatentData();
    //专利运营情况趋势
    this.updateChartWithPatentData();
    //
    this.fetchGradesData();  // 在组件创建时调用此方法
    //合作前五的单位
    this.fetchAndSetEnterpriseData();


    //专利转让，专利质押，专利许可
    this.fetchPatentCounts();
    //
    const echartsConfig = require('./echartsConfig/echarts.json');
    echarts.registerTheme('chalk', echartsConfig);





    //发明人专利排行
    // 页面加载完成后调用initInventorsChart函数
    this.initInventorsChart();

    // 监听窗口大小变化以重新调整图表大小
    window.addEventListener('resize', this.updateChartSize);
    this.updateChartSize(); // 初始化时调用一次
    //ipc领域
    this.initChart()
    // window.addEventListener('resize', this.handleResize)

    //ipc领域
    this.fetchAllPatentData();


    // 当组件挂载时获取网络时间
    this.fetchNetworkTime();

    // 每隔一段时间刷新时间（可选）
    setInterval(() => {
      this.fetchNetworkTime();
    }, 60000); // 每分钟更新一次

    // // 初始化当年专利授权数量图表
    // const yearlyGrantedChart = echarts.init(document.getElementById('yearlyGrantedChart'));
    // // 配置图表数据和样式，此处为示例，需根据实际数据调整
    // const yearlyGrantedOption = {
    //   // 具体配置项
    // };
    // yearlyGrantedChart.setOption(yearlyGrantedOption);





    // // 初始化共同申请人排行图表
    // const coApplicantChart = echarts.init(document.getElementById('coApplicantChart'));
    // const coApplicantOption = {
    //   // 具体配置项
    // };
    // coApplicantChart.setOption(coApplicantOption);
    //
    // // 初始化发明人专利排行图表
    // const inventorChart = echarts.init(document.getElementById('inventorChart'));
    // const inventorOption = {
    //   // 具体配置项
    // };
    // inventorChart.setOption(inventorOption);
    //
    // // 初始化专利评级分布图表
    // const ratingChart = echarts.init(document.getElementById('ratingChart'));
    // const ratingOption = {
    //   // 具体配置项
    // };
    // ratingChart.setOption(ratingOption);



  },
  beforeDestroy() {
    window.removeEventListener('resize', this.handleResize)
    window.removeEventListener('resize', this.updateChartSize);
    if (this.chart) {
      this.chart.dispose()
      this.chart = null
    }
    if (this.inventorsChart) {
      this.inventorsChart.dispose()
      this.inventorsChart = null
    }
  },

  methods: {
    //当年专利授权数量
    /**
 * 获取专利统计数据并更新到 patentData 中
 */
    async fetchPatentStatistics() {
      try {
        //console.log('开始调用后端接口获取专利统计数据...');

        // 调用后端接口
        const response = await getPatentStatistics();

        //console.log('后端返回的原始数据:', response);

        // 检查返回的数据是否为空
        if (!response || response.length === 0) {
          //console.error('后端返回的数据为空');
          return;
        }

        // 提取数组中的第一个对象
        const responseData = response[0];

        // 检查提取的对象是否存在
        if (!responseData) {
          //console.error('后端返回的数据格式不正确，无法提取对象');
          return;
        }

        // 将后端返回的数据映射到 patentData
        this.patentData.currentYearGranted = responseData.countYear || '422'; // 如果有固定值可以保留默认值
        this.patentData.inventionPatent = responseData.inventionPatent || '0';
        this.patentData.utilityModelPatent = responseData.utilityModelPatent || '0';
        this.patentData.designPatent = responseData.designPatent || '0';

        //console.log('更新后的 patentData 数据:', this.patentData);
      } catch (error) {
        console.error('获取专利统计数据失败:', error);
      }
    },

    // 获取专利数据
    async fetchPatents() {
      try {
        const response = await getPatentClass(); // 调用接口获取数据
        this.patents = response; // 假设返回的数据直接是数组
      } catch (error) {
        console.error('获取专利数据失败:', error);
      }
    },
    // 自动滚动逻辑
    autoScroll() {
      setInterval(() => {
        if (this.currentIndex + this.visibleRowCount >= this.patents.length) {
          this.currentIndex = 0; // 回到顶部
        } else {
          this.currentIndex++; // 向下滚动一行
        }
        // 手动触发滚动容器的滚动
        this.$nextTick(() => {
          this.$refs.tableContainer.scrollTop = this.currentIndex * 40; // 假设每行高度为40px
        });
      }, 1000); // 每秒滚动一次
    },




    //专利分级统计
    initializeChart(gradeData) {
      const chartDom = this.$refs.gradeClassificationChart;
      if (!chartDom) return; // 确保DOM元素已加载
      this.gradeClassificationChart = echarts.init(chartDom, "chalk");

      if (!Array.isArray(gradeData) || gradeData.length === 0) {
        console.warn('No grade data available for chart.');
        // 可选：设置一个空图表或默认数据
        this.gradeClassificationChart.setOption({
          title: {
            text: '无数据',
            left: 'center'
          }
        });
        return;
      }

      // 过滤出state_three为true的年份的数据
      const filteredGradeData = gradeData.filter(item => item.state_three === true);

      // 如果过滤后没有数据，则显示提示
      if (filteredGradeData.length === 0) {
        this.gradeClassificationChart.setOption({
          title: {
            text: '无符合条件的数据',
            left: 'center'
          }
        });
        return;
      }

      const option = {
        tooltip: {
          trigger: 'axis',
          axisPointer: {
            type: 'shadow'
          }
        },
        legend: {},
        grid: {
          left: '3%',
          right: '4%',
          bottom: '3%',
          containLabel: true
        },
        xAxis: [
          {
            type: 'category',
            data: filteredGradeData.map(item => item.year.toString()), // 只显示符合条件的年份
            axisLine: {
              show: true,
              lineStyle: { type: 'solid' }
            }
          }
        ],
        yAxis: [
          {
            type: 'value',
            axisLine: {
              show: true,
              lineStyle: { type: 'solid' }
            },
            splitLine: {
              show: true,
              lineStyle: { type: 'dashed' }
            }
          }
        ],
        series: [
          {
            name: 'A等级',
            type: 'bar',
            stack: '总量',
            data: filteredGradeData.map(item => item.grade_a)
          },
          {
            name: 'B等级',
            type: 'bar',
            stack: '总量',
            data: filteredGradeData.map(item => item.grade_b)
          },
          {
            name: 'C等级',
            type: 'bar',
            stack: '总量',
            data: filteredGradeData.map(item => item.grade_c)
          },
          {
            name: 'D等级',
            type: 'bar',
            stack: '总量',
            data: filteredGradeData.map(item => item.grade_d)
          },
          {
            name: 'E等级',
            type: 'bar',
            stack: '总量',
            data: filteredGradeData.map(item => item.grade_e)
          }
        ]
      };

      this.gradeClassificationChart.setOption(option);
    },
    getPatentDataAndInitializeChart() {
      getPatentCountsByYear()
        .then(response => {
          console.log('API Response:', response); // 打印整个API响应以供调试
          if (response && Array.isArray(response)) {
            this.initializeChart(response);
          } else {
            console.error('No data found in the API response or incorrect data format.', response);
          }
        })
        .catch(error => {
          console.error("Failed to fetch patent counts by year", error);
        });
    },




    // 历年专利申请趋势
    updateApplicationTrendChartWithPatentData() {
      getPatentCountsByYear().then(applicationData => { // 使用你定义的接口获取数据
        let applications = [];
        let authorizedCounts = [];
        let publishedCounts = [];
        let years = []; // 初始化 years 数组


        // 遍历数据，填充对应的字段

        // 遍历数据，填充对应的字段，并检查 state_one 是否为 true
        applicationData.forEach(item => {
          if (item.state_one === true) { // 只处理 state_one 为 true 的数据
            years.push(item.year); // 添加符合条件的年份
            applications.push(item.applications); // 总申请数
            authorizedCounts.push(item.authorizedCounts); // 授权数
            publishedCounts.push(item.publishedCounts); // 公开总数

          }
        });

        // 将提取的数据存储到组件的状态中
        this.patentApplicationStats = {
          applications,
          authorizedCounts,
          publishedCounts,
          years
        };

        // 调用更新图表的方法
        this.updateApplicationTrendChart();
      }).catch(error => {
        console.error("Failed to fetch patent application data:", error);
      });
    },
    updateApplicationTrendChart() {
      //console.log("Updating application trend chart with the following data:", this.patentApplicationStats);
      this.applicationTrendChart = echarts.init(document.getElementById('applicationTrendChart'), 'chalk');
      const applicationTrendOption = {
        grid: {
          left: '3%',
          right: '4%',
          bottom: '3%',
          containLabel: true
        },
        title: {
          text: ''
        },
        tooltip: {
          trigger: 'axis'
        },
        legend: {
          data: ['申请总数', '授权数', '公开总数']
        },
        xAxis: {
          type: 'category',
          data: this.patentApplicationStats.years,
          boundaryGap: false, // 让数据点紧贴Y轴
        },
        yAxis: {
          type: 'value'
        },
        series: [
          {
            name: '申请总数',
            type: 'line',
            data: this.patentApplicationStats.applications,
            areaStyle: { // 设置线下方的背景色
              color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                offset: 0,
                color: 'rgba(255, 173, 177, 0.5)' // 颜色可以自定义
              }, {
                offset: 1,
                color: 'rgba(255, 173, 177, 0)'
              }])
            },
          },
          {
            name: '授权数',
            type: 'line',
            data: this.patentApplicationStats.authorizedCounts,
            areaStyle: {
              color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                offset: 0,
                color: 'rgba(166, 242, 193, 0.5)' // 颜色可以自定义
              }, {
                offset: 1,
                color: 'rgba(166, 242, 193, 0)'
              }])
            },
          },
          {
            name: '公开总数',
            type: 'line',
            data: this.patentApplicationStats.publishedCounts,
            areaStyle: {
              color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                offset: 0,
                color: 'rgba(150, 210, 255, 0.5)' // 颜色可以自定义
              }, {
                offset: 1,
                color: 'rgba(150, 210, 255, 0)'
              }])
            },
          }
        ]
      };
      this.applicationTrendChart.setOption(applicationTrendOption);
      //console.log("Application Trend Chart has been updated.");
    },
    //专利运营情况趋势
    updateChartWithPatentData() {
      getPatentCountsByYear().then(patentData => {
        // 准备存储每种类型的数据
        let operationTotal = [];
        let transfers = [];
        let licenses = [];
        let pledges = [];
        let years = []; // 初始化 years 数组

        // 计算每一年的运营总数、转移、许可和质押的数量
        patentData.forEach(item => {
          if (item.state_two === true) { // 只处理 state_two 为 true 的数据
            years.push(item.year); // 添加符合条件的年份
            transfers.push(item.transfers);
            licenses.push(item.licenses);
            pledges.push(item.pledges);
            operationTotal.push(item.transfers + item.licenses + item.pledges);
          }
        });

        // 更新data中的patentOperationStats
        this.patentOperationStats = {
          operationTotal,
          transfers,
          licenses,
          pledges,
          years
        };

        // 调试：输出patentOperationStats以检查赋值是否成功
        //console.log("Patent Operation Stats:", this.patentOperationStats);

        // 更新图表
        this.updateChart();
      }).catch(error => {
        console.error("Failed to fetch patent data:", error);
      });
    },
    updateChart() {
      this.operationTrendChart = echarts.init(document.getElementById('operationTrendChart'), 'chalk');
      const operationTrendOption = {
        tooltip: {
          trigger: 'axis',
          axisPointer: {
            type: 'cross'
          }
        },
        grid: {
          left: '3%',
          right: '4%',
          bottom: '3%',
          containLabel: true
        },
        xAxis: {
          type: 'category',
          data: this.patentOperationStats.years
        },
        yAxis: {
          type: 'value',
          splitLine: {
            lineStyle: {
              type: 'dashed'
            },
            show: true
          }
        },
        legend: {},
        series: [
          {
            data: this.patentOperationStats.operationTotal,
            type: 'line',
            smooth: true,
            name: "运营总数"
          },
          {
            data: this.patentOperationStats.transfers,
            type: 'line',
            smooth: true,
            name: "转移"
          },
          {
            data: this.patentOperationStats.licenses,
            type: 'line',
            smooth: true,
            name: "许可"
          },
          {
            data: this.patentOperationStats.pledges,
            type: 'line',
            smooth: true,
            name: "质押"
          }
        ],
      };
      this.operationTrendChart.setOption(operationTrendOption);
    },
    //专利分级统计
    async fetchGradesData() {
      try {
        //console.log('开始请求数据...');
        const response = await getGradesTotal();  // 获取后端数据
        //console.log('成功获取数据:', response);

        if (response && typeof response === 'object') {
          //console.log('正在处理数据...');
          let rawData = [
            { name: 'A等级', value: response.total_grade_a, itemStyle: { color: '#19E7CF' } },
            { name: 'B等级', value: response.total_grade_b, itemStyle: { color: '#FFF99F' } },
            { name: 'C等级', value: response.total_grade_c, itemStyle: { color: '#5CCAFF' } },
            { name: 'D等级', value: response.total_grade_d, itemStyle: { color: '#00EBFF' } },
            { name: 'E等级', value: response.total_grade_e, itemStyle: { color: '#3AB4FF' } }
          ];

          // 将响应式对象转换为普通对象
          this.chartData = JSON.parse(JSON.stringify(rawData));
          //console.log('处理完成的数据:', this.chartData);
          this.componentKey += 1; // 强制组件重新渲染
          //console.log('组件已更新');
        } else {
          console.error('响应数据格式不正确:', response);
        }
      } catch (error) {
        console.error('请求或处理过程中出现错误:', error);
      }
    },


    //共同申请人合作前五的单位
    async fetchAndSetEnterpriseData() {
      try {
        const response = await getTopFive();
        this.enterpriseList = response.map((item, index) => ({
          name: item.Applicant,
          value: item.Count,
          // 直接在这里为每个企业设定对应的图片和渐变颜色
          image: require(`./image/enterprise${index + 1}.png`), // 根据索引或其它逻辑选择合适的图片路径
          gradient: [
            'linear-gradient(90deg, rgba(241, 159, 22, 0) -1%, #FFA818 100%)',
            'linear-gradient(90deg, rgba(171, 214, 223, 0) -1%, #B7DDE4 100%)',
            'linear-gradient(91deg, rgba(224, 135, 82, 0) 3%, #E28C57 99%)',
            'linear-gradient(270deg, #088BFF 0%, rgba(8, 139, 255, 0.1) 99%)',
            'linear-gradient(270deg, #088BFF 0%, rgba(8, 139, 255, 0.1) 99%)'
          ][index] // 确保数组长度与enterpriseList匹配
        }));
        // 设置maxValue为enterpriseList中第一个元素的value
        if (this.enterpriseList.length > 0) {
          this.maxValue = this.enterpriseList[0].value;
        } else {
          this.maxValue = 0; // 或者设置为你认为合适的默认值
        }
      } catch (error) {
        console.error('Failed to fetch top five enterprises:', error);
      }
    },

    async fetchAllPatentData() {
      try {
        // 并行请求所有需要的数据，包括专利授权数据
        const [statsResponse, totalResponse, validStatsResponse, authorizesResponse] = await Promise.all([
          getPatentStats(),
          getPatentApplicationTotal(),
          getPatentValidStats(),
          getPatentAuthorizes() // 调用获取专利授权总数和发明专利授权总数的API
        ]);

        //console.log(totalResponse);

        // 更新专利统计数据
        if (statsResponse && typeof statsResponse === 'object') {
          this.patentData.inventionTotal = statsResponse.inventionTotal || 0;
          this.patentData.utilityModelTotal = statsResponse.utilityModelTotal || 0;
          this.patentData.designTotal = statsResponse.designTotal || 0;
        }

        // 更新专利申请总量
        if (totalResponse !== undefined) {
          //console.log(this.patentData.applicationTotal);
          this.patentData.applicationTotal = totalResponse; // 直接赋值，因为返回的是单个数值
          //console.log(this.patentData.applicationTotal);
        } else {
          //console.error("No data received for application total");
        }

        // 更新有效专利总量
        if (validStatsResponse && typeof validStatsResponse === 'object') {
          this.patentData.validPatentTotal = validStatsResponse.valid_count || 0;
        } else {
          console.error("Unexpected response format or no valid count received");
        }

        // 更新专利授权总量和发明专利授权总量
        if (authorizesResponse && typeof authorizesResponse === 'object') {
          this.patentData.grantTotal = authorizesResponse.totalpatentgranted || 0;
          this.patentData.inventionGrantTotal = authorizesResponse.totalinventiongranted || 0;
        } else {
          console.error("Unexpected response format or no authorize counts received");
        }
      } catch (error) {
        console.error("Failed to fetch patent data:", error);
      }
    },
    goToIndex() {
      this.$router.push({ name: 'Index' });
    },
    fetchNetworkTime() {
      getCurrentTime()
        .then(response => {
          this.networkDate = response.currentDate;
          this.networkTime = response.currentTime;
          this.networkDay = this.convertDayOfWeek(response.currentDayOfWeek);
        })
        .catch(error => {
          console.error("无法获取网络时间:", error);
        });
    },
    convertDayOfWeek(dayOfWeek) {
      const dayMap = {
        MONDAY: '一',
        TUESDAY: '二',
        WEDNESDAY: '三',
        THURSDAY: '四',
        FRIDAY: '五',
        SATURDAY: '六',
        SUNDAY: '日'
      };
      return dayMap[dayOfWeek] || '';
    },

    //ipc领域
    async initChart() {
      const chartDom = document.getElementById('ipcChart');
      this.chart = echarts.init(chartDom, "chalk");

      // 获取并渲染IPC数据
      await this.fetchAndRenderIpcData();
    },

    async fetchAndRenderIpcData() {
      try {
        // 使用定义的函数获取数据
        const response = await getIpcClass();
        //console.log("Fetched IPC data:", response); // 打印获取的数据

        // 确保response和response.data都存在并且是对象
        if (!response || !response || typeof response !== 'object') {
          throw new Error('Invalid data received from server.');
        }

        const ipcData = response;

        // 检查ipcData是否为空对象
        if (Object.keys(ipcData).length === 0) {
          console.warn("No IPC data available.");
          return;
        }

        const ipcCategories = Object.keys(ipcData).map(cat => `${cat}类`);
        const ipcCounts = Object.values(ipcData);

        // 计算最大值（动态设置 yAxis.max）
        const maxValue = Math.max(...ipcCounts);
        const yAxisMax = Math.ceil(maxValue * 1.2); // 增加 20% 的缓冲区，避免柱状图顶到顶部

        const option = {
          grid: {
            top: '6%',
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
          },
          xAxis: {
            type: 'category',
            data: ipcCategories,
            axisLabel: { color: '#fff' }
          },
          yAxis: {
            type: 'value',
            max: yAxisMax,
            splitLine: { lineStyle: { color: 'rgba(255, 255, 255, 0.1)' } },
            axisLabel: { color: '#fff' }
          },
          series: [
            {
              data: ipcCounts,
              type: 'bar',
              label: { show: true, position: 'top', color: '#fff', fontSize: 12, offset: [0, 0] },
              barWidth: 8,
              itemStyle: {
                color: {
                  type: 'linear',
                  x: 0, y: 0, x2: 0, y2: 1,
                  colorStops: [{ offset: 0, color: '#00ffff' }, { offset: 1, color: 'rgba(0,255,255,0.1)' }]
                },
                shadowColor: '#00ffff',
                shadowBlur: 10,
                opacity: 0.9
              }
            },
            {
              data: ipcCounts,
              type: 'bar',
              barWidth: 4,
              itemStyle: { color: '#00ffff', opacity: 0.5 },
              barGap: '-100%'
            },
            {//顶部
              data: ipcCounts,
              type: 'pictorialBar',
              symbol: 'diamond', // 图形符号为菱形
              symbolSize: [7, 8], // 符号大小（对角线长度）
              symbolOffset: [2, -4], // 符号偏移量（左右、上下）
              symbolPosition: 'end', // 符号放置在柱状图顶部
              symbolRotate: -90, // 符号逆时针旋转 100 度
              itemStyle: {
                color: '#00ffff', // 符号颜色
                opacity: 1, // 不透明度
                shadowColor: '#00ffff', // 阴影颜色
                shadowBlur: 10 // 阴影模糊程度
              },
              barGap: '-100%', // 和其他柱状图重叠
              z: 2 // 层级，数值越大越靠前
            }
          ]
        };

        this.chart.setOption(option);
      } catch (error) {
        console.error("Failed to fetch or render IPC data:", error);
      }
    },
    // 创建网格纹理
    createGridPattern() {
      const canvas = document.createElement('canvas')
      canvas.width = 10
      canvas.height = 10
      const ctx = canvas.getContext('2d')

      // 绘制网格
      ctx.strokeStyle = 'rgba(0, 255, 255, 0.3)'
      ctx.lineWidth = 0.5
      ctx.beginPath()
      ctx.moveTo(0, 0)
      ctx.lineTo(10, 0)
      ctx.moveTo(0, 0)
      ctx.lineTo(0, 10)
      ctx.stroke()

      return canvas.toDataURL()
    },


    // 发明人专利排行初始化
    async initInventorsChart() {
      const chartDom = document.getElementById('inventorChart');
      this.inventorsChart = echarts.init(chartDom, "chalk");

      try {
        // 使用定义的函数获取数据
        const response = await gettopInventors();
        //console.log("Fetched top inventors data:", response); // 打印获取的数据

        // 确保response和response.data都存在并且是对象
        if (!response || typeof response !== 'object') {
          throw new Error('Invalid data received from server.');
        }

        const topInventorsData = response;

        // 检查返回的数据是否有效
        if (!Array.isArray(topInventorsData) || topInventorsData.length === 0) {
          console.warn("No inventor data available.");
          return;
        }

        const xAxisData = topInventorsData.map(item => item.inventor);
        const seriesData = topInventorsData.map(item => item.patentCount);

        const option = {
          grid: {
            top: '5%',
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
          },
          xAxis: {
            type: 'category',
            data: xAxisData,
            axisLabel: {
              color: '#fff',
              textStyle: {
                fontSize: 10
              },
            }
          },
          yAxis: {
            type: 'value',
            max: (() => {
              const maxValue = Math.max(...seriesData);
              return maxValue + maxValue * 0.3; // 增加最大值的5%作为余量
            })(),
            splitLine: { lineStyle: { color: 'rgba(255, 255, 255, 0.1)' } },
            axisLabel: { color: '#fff' }
          },
          series: [
            {
              data: seriesData,
              type: 'bar',
              label: { show: true, position: 'top', color: '#fff', fontSize: 12, offset: [0, 0] },
              barWidth: 8,
              itemStyle: {
                color: {
                  type: 'linear',
                  x: 0, y: 0, x2: 0, y2: 1,
                  colorStops: [{ offset: 0, color: '#088BFF' }, { offset: 1, color: 'rgba(0,255,255,0.1)' }]
                },
                shadowColor: '#088BFF',
                shadowBlur: 10,
                opacity: 0.9
              }
            },
            {
              data: seriesData,
              type: 'bar',
              barWidth: 4,
              itemStyle: {
                color: '#088BFF',
                opacity: 0.5
              },
              barGap: '-100%'
            },
            // 修改旋转的菱形 ↓↓↓
            // 重新调整菱形 ↓↓↓
            {
              data: seriesData,
              type: 'pictorialBar',
              symbol: 'diamond',
              symbolSize: [7, 8], // 调整菱形大小与柱宽匹配
              symbolOffset: [2, -4], // 调整位置确保完美衔接
              symbolPosition: 'end',
              symbolRotate: -90, // 保持45度旋转
              itemStyle: {
                color: '#088BFF',
                opacity: 1,
                borderColor: '#ffffff', // 边框颜色（白色）
                shadowColor: '#088BFF',
                shadowBlur: 10
              },
              barGap: '-100%',
              z: 2 // 确保菱形在最上层
            }
            // 如果需要添加其他系列，请复制上面的对象并调整数据和其他属性
          ]
        };

        this.inventorsChart.setOption(option);
      } catch (error) {
        console.error("Failed to fetch or render top inventors data:", error);
      }
    },

    handleResize() {
      this.inventorsChart && this.inventorsChart.resize();
    },
    //专利运营转化情况
    patentConversionTableRowClassName({ row, rowIndex }) {
      if (rowIndex % 2 === 0) {
        return 'patent-conversion-table-row-double';
      } else {
        return 'patent-conversion-table-row-single';
      }
    },
    //专利转让，专利质押，专利许可
    fetchPatentCounts() {
      getTotalCounts().then(response => {
        // 假设response结构与后端返回的数据格式一致
        this.patentData.transferCount = response.totalTransfers;
        this.patentData.licenseCount = response.totalLicenses;
        this.patentData.pledgeCount = response.totalPledges;
      }).catch(error => {
        console.error("Failed to fetch patent counts", error);
      });
    },

    updateChartSize() {
      this.chart && this.chart.resize()
      this.inventorsChart && this.inventorsChart.resize();
      this.applicationTrendChart && this.applicationTrendChart.resize();
      this.operationTrendChart && this.operationTrendChart.resize();
      this.gradeClassificationChart && this.gradeClassificationChart.resize();
      // 根据窗口大小调整图表高度或其他尺寸
      const newHeight = window.innerHeight * 0.1 + 'px'; // 例如，设置为窗口高度的10%
      this.chartHeight = newHeight;
      this.componentKey += 1; // 强制组件重新渲染
    }
  },


};

</script>

<style lang="scss" scoped>
.visualization-screen {
  min-height: 100vh;
  width: 100%;
  display: flex;
  flex-direction: column;
  background: #071231;
  color: white;
}

.header {
  background-color: #003366;
  background-image: url("./image/HeaderBox.png");
  background-size: 100% .70rem;
  background-repeat: no-repeat;
  width: 100%;
  height: .70rem;
  text-align: center;
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: .18rem;
}

.header-date {
  position: absolute;
  right: 20px;
  top: 9px;
  height: .54rem;
  line-height: .54rem;
  opacity: 1;
  display: flex;
  font-size: .16rem;
  color: rgba(255, 255, 255, 1);
}

.header-button {
  background-image: url("./image/编组 5备份 3.png");
  background-size: .54rem .54rem;
  background-repeat: no-repeat;
  width: .54rem;
  height: .54rem;
  padding: 17px;
  margin-left: 20px;
}

.main-content {
  flex: 1;
  display: flex;
  /*padding: 20px;*/
}



.left-section,
.middle-section,
.right-section {
  margin: 0 3px;
  /*background-color: rgba(0, 0, 0, 0.5);*/
  border-radius: 5px;
  padding: 5px;
  height: 100%;
}

.statistic-item {
  margin-bottom: 10px;
  border-radius: 5px;
}

.statistic-item-title {
  height: .36rem;
  display: flex;
  flex-direction: row;
  line-height: .36rem;
  background-color: rgba(21, 77, 160, 0.3);
}

.statistic-item-title-text {
  color: #D8F0FF;
  text-shadow: 0px 0px 9px #D8F0FF;
  background-image: url('./image/炫光.png');
  background-size: 100% 100%;
  background-repeat: no-repeat;
  font-size: .20rem;
}

.chart-container {
  /*height: 200px;*/
  margin-top: .1rem;
}

.YouSheBiaoTiHei-font {
  font-family: 'YouSheBiaoTiHei-2', sans-serif;
}

.AlibabaPuHuiTi-font {
  font-family: 'AlibabaPuHuiTi-2', sans-serif;
}

@font-face {
  font-family: 'YouSheBiaoTiHei-2';
  src: url('./font/YouSheBiaoTiHei-2.ttf') format('truetype');
}

@font-face {
  font-family: 'AlibabaPuHuiTi-2';
  src: url('./font/AlibabaPuHuiTi-2-45-Light.ttf') format('truetype');
}

.enterprise-layout {
  padding: 4px;
  display: flex;
  flex-direction: column;
  gap: 8px;
}

.enterprise-item {
  display: flex;
  gap: 1px;
  padding: 2px;
  border-radius: 1px;
}

.enterprise-image {
  width: .39rem;
  height: 100%;
  flex-shrink: 0;
}

.enterprise-image img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  border-radius: 4px;
}

.content-rows {
  flex: 1;
  display: flex;
  flex-direction: column;
  gap: 10px;
}

.top-row {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.enterprise-name {
  color: #ffffff;
  font-size: .12rem;
  font-weight: 500;
}

.enterprise-number {
  color: #00CCFF;
  font-size: .12rem;
  font-weight: bold;
  font-family: 'DIN', Arial, sans-serif;
}

.bottom-row {
  flex: 1;
  display: flex;
  align-items: center;
}

.progress-bar {
  width: 100%;
  height: .12rem;
  background: rgba(0, 24, 62, 0.5);
  border-radius: 6px;
  overflow: hidden;
}

.progress-fill {
  height: 100%;
  background: linear-gradient(90deg, #0066CC, #00CCFF);
  border-radius: 6px;
  transition: width 0.3s ease;
}

/*!* 响应式设计 *!*/
/*@media (max-width: 768px) {*/
/*  .enterprise-item {*/
/*    padding: 10px;*/
/*    gap: 15px;*/
/*  }*/

/*  .enterprise-image {*/
/*    width: 60px;*/
/*    height: 60px;*/
/*  }*/

/*  .enterprise-name,*/
/*  .enterprise-number {*/
/*    font-size: 14px;*/
/*  }*/
/*}*/

/* ipc领域 */
.chart-container-ipc {
  width: 100%;
  height: 3rem;
  position: relative;
  background-color: #001326;
}

/* 专利运营转化情况 */
::v-deep .patent-conversion-table-header {
  background: linear-gradient(90deg, rgba(8, 139, 255, 0) 0%, rgba(8, 139, 255, 0.2) 18%, rgba(8, 139, 255, 0.2) 80%, rgba(8, 139, 255, 0) 99%);
  background-color: #071231;
  border: 1px solid;
}

::v-deep .patent-conversion-table-header th {
  border-bottom: none !important;
  background: transparent;
  color: #FFFFFF;
  font-size: 14px;
  font-family: 'AlibabaPuHuiTi-2', sans-serif;
}

::v-deep .patent-conversion-table-row-single {
  background: linear-gradient(90deg, rgba(8, 139, 255, 0) 0%, rgba(8, 139, 255, 0.15) 16%, rgba(8, 139, 255, 0.15) 79%, rgba(8, 139, 255, 0) 100%);
  background-color: #071231;
}

::v-deep .patent-conversion-table-row-double {
  background-color: #071231;
}

::v-deep .patent-conversion-table-row-single td,
::v-deep .patent-conversion-table-row-double td {
  border-bottom: none !important;
  background: transparent;
  color: #FFFFFF;
  font-size: 14px;
  font-family: 'AlibabaPuHuiTi-2', sans-serif;
}

::v-deep .el-table tbody tr:hover>td {
  background: transparent !important;
}

::v-deep .el-table--border::after,
::v-deep .el-table--group::after,
::v-deep .el-table::before {
  background-color: transparent;
}

::v-deep .el-progress-circle {
  svg>path:nth-child(1) {
    stroke: rgba(55, 79, 226, 0.2); // #write 此处的id就是定义的svg标签id 做替换即可
  }
}

::v-deep .el-progress__text {
  color: #FFFFFF;
  font-size: .16rem;
}


.ellipsis {
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  max-width: 200px;
  /* 根据实际需求调整宽度 */
}
</style>
