<!--折线图-->
<template>
  <div id="expertNumChart" :style="lineStyle" />
</template>

<script>

export default {
  name: 'Line',
  props:['dataSeries','xAxis','yAxis','width','height'],
  data() {
    return {
      // 版本号
      version: '3.7.0',
      newExpertNum: null,
      newExpertDate: null,
      lineStyle:{
        width:this.width,
        height:this.height
      }
    }
  },
  created() {
  },
  mounted() {
    setTimeout(() => {
      this.drawExpertIncreasedNumChart()
    }, 500)
  },
  methods: {
    goTarget(href) {
      window.open(href, '_blank')
    },

    loadChart(data, containerId) {
      this.Chart = this.$echarts.init(document.getElementById(containerId))
      this.Chart.setOption(data)
    },
    drawExpertIncreasedNumChart() {
      const option = {
        title: {
          text: '新增专家'
        },
        tooltip: {
          trigger: 'axis'
        },
        legend: {
          data: ['Email', 'Union Ads', 'Video Ads', 'Direct', 'Search Engine']
        },
        grid: {
          left: '3%',
          right: '4%',
          bottom: '3%',
          containLabel: true
        },
        toolbox: {
          feature: {
            saveAsImage: {}
          }
        },
        xAxis: this.xAxis,
        yAxis: this.yAxis,
        series: this.dataSeries
      }
      option.xAxis = this.xAxis;
      option.series = this.dataSeries;
      this.loadChart(option, 'expertNumChart')
    }
  }
}
</script>

<style scoped>

</style>
