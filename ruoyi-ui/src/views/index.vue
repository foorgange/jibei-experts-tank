<template>
  <div class="app-container home">
    <div>
      <panel-group/>
      <div v-if="isNewExpert" style="font-size: 2em">请前往个人中心完善信息</div>
<!--      <el-card>-->
<!--        <el-row>-->
<!--          <el-col :md="12" :sm="24">-->
<!--            <el-row>-->
<!--              <el-col :span="24" style="text-align: center;font-weight:bold;font-size: 17px">-->
<!--                当前专家人数比例-->
<!--              </el-col>-->
<!--              <el-col :span="24">-->
<!--                <piechart :pie="pie"/>-->
<!--              </el-col>-->
<!--            </el-row>-->
<!--          </el-col>-->

<!--          <el-col :span="12">-->
<!--            <linechart :data-series="line.series" :x-axis="line.xAxis" :y-axis="line.yAxis" width="700px" height="400px"/>-->
<!--          </el-col>-->

<!--          &lt;!&ndash;        <el-col :span="12">&ndash;&gt;-->
<!--          &lt;!&ndash;          <barchart :data-series="bar.barSeries" :x-axis="bar.barXAxis" :y-axis="bar.barYAxis" width="700px" height="400px"/>&ndash;&gt;-->
<!--          &lt;!&ndash;        </el-col>&ndash;&gt;-->

<!--        </el-row>-->

<!--      </el-card>-->
    </div>

  </div>
</template>

<script>
import piechart from '../views/components/echarts/pie.vue'
import linechart from '../views/components/echarts/line.vue'
import barchart from '../views/components/echarts/bar.vue'
import {getExpertNum, getNewExpertNum} from "@/api/chart";
import PanelGroup from "@/views/dashboard/PanelGroup";
export default {
  name: 'Index',
  components: {PanelGroup, barchart, linechart, piechart },
  data() {
    return{
      bar:{
        barXAxis: {
          type: 'category',
          data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
        },
        barYAxis: {
          type: 'value'
        },
        barSeries:{
          data: [120, 200, 150, 80, 70, 110, 130],
          type: 'bar'
        }
      },
      line:{
        xAxis: {
          type: 'category',
          boundaryGap: false,
          data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
        },
        yAxis: {
          type: 'value',
          minInterval: 1
        },
        series: [
          {
            name: '1星专家',
            type: 'line',
            data: [1, 0, 0, 0, 0, 0, 0]
          },
          {
            name: '2星专家',
            type: 'line',
            data: [0, 2, 1, 4, 0, 0, 0]
          },
          {
            name: '3星专家',
            type: 'line',
            data: [0, 2, 1, 4, 0, 0, 0]
          }
        ]
      },
      pie:{
        tooltip: {
          trigger: 'item'
        },
        legend: {
          top: '5%',
          left: 'center'
        },
        series: [
          {
            name: '当前专家人数比例',
            type: 'pie',
            radius: ['40%', '70%'],
            avoidLabelOverlap: false,
            itemStyle: {
              borderRadius: 10,
              borderColor: '#fff',
              borderWidth: 2
            },
            label: {
              show: false,
              position: 'center'
            },
            emphasis: {
              label: {
                show: true,
                fontSize: '40',
                fontWeight: 'bold'
              }
            },
            labelLine: {
              show: false
            },
            data: [
              { value: 1048, name: 'Search Engine' },
              { value: 735, name: 'Direct' },
              { value: 580, name: 'Email' },
              { value: 484, name: 'Union Ads' },
              { value: 300, name: 'Video Ads' }
            ]
          }
        ]
      },
      adminLinkList:[
        {icon: 'form', name:'审核项目'},

      ]
    }
  },
  methods:{
    // 获取每日新增专家数目
    getNewExpertNumData() {
      getNewExpertNum().then(res => {
        const numList = []
        const dateList = []

        for (let i = 6; i >= 0; i--) {
          numList.push(res[i].sum)
          dateList.push(res[i].date)
        }

        this.line.series = {
          name: '新增专家',
          type: 'line',
          data: numList
        }
        this.line.xAxis.data = dateList
      })
    },
    getExpertProportionChartData() {
      let expertNumList = new Map()
      getExpertNum().then((res) => {
        for (let i = 0; i < res['length']; i++) {
          const item = {
            value: res[i + 1].num,
            name: res[i + 1].expert_star + '星'
          }
          expertNumList.set((i + 1).toString(), item)
          this.pie.series[0].data = []
          for (let i = 0; i < expertNumList.size; i++) {
            this.pie.series[0].data.push(expertNumList.get((i + 1).toString()))
          }
        }
      })

    }
  },
  created() {
    // this.getNewExpertNumData();
    // this.getExpertProportionChartData();
  },
  computed:{
    isNewExpert(){
      return this.$store.getters.roles.indexOf('common')>=0 && this.$store.getters.roles.length == 1
    }
  }
}
</script>

<style scoped lang="scss">
.home {
  blockquote {
    padding: 10px 20px;
    margin: 0 0 20px;
    font-size: 17.5px;
    border-left: 5px solid #eee;
  }
  hr {
    margin-top: 20px;
    margin-bottom: 20px;
    border: 0;
    border-top: 1px solid #eee;
  }
  .col-item {
    margin-bottom: 20px;
  }

  ul {
    padding: 0;
    margin: 0;
  }

  font-family: "open sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
  font-size: 13px;
  color: #676a6c;
  overflow-x: hidden;

  ul {
    list-style-type: none;
  }

  h4 {
    margin-top: 0px;
  }

  h2 {
    margin-top: 10px;
    font-size: 26px;
    font-weight: 100;
  }

  p {
    margin-top: 10px;

    b {
      font-weight: 700;
    }
  }

  .update-log {
    ol {
      display: block;
      list-style-type: decimal;
      margin-block-start: 1em;
      margin-block-end: 1em;
      margin-inline-start: 0;
      margin-inline-end: 0;
      padding-inline-start: 40px;
    }
  }
}
</style>

