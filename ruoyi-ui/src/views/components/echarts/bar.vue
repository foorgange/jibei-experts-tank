<!--柱状图-->
<template>
  <div>
    <div ref="barcharts" :style="barStyle" />
  </div>
</template>

<script>
export default {
  name: 'Bar',
  /**
   * dataSeries 数据集合及类型，为一个名为data的number数组和名为type的字符串
   * xAxis 横坐标参数及显示数据，为一个对象，只有名为type的字符串一个属性
   * yAxis 纵坐标参数及数据，为一个对象，包括名为type的字符串和data的字符串数组
   */
  props:['dataSeries','xAxis','yAxis','width','height'],
  data() {
    return {
      barStyle:{
        width:this.width,
        height:this.height
      }
    }
  },
  mounted() {
    this.myCharts()
  },
  methods: {
    myCharts() {
      var barcharts = this.$echarts.init(this.$refs.barcharts)

      var option = {
        xAxis: this.xAxis,
        yAxis: this.yAxis,
        series: this.dataSeries
      }
      barcharts.setOption(option)
    }
  }
}
</script>

<style scoped>

</style>
