<!--饼图-->
<template>
  <div ref="expertNumProportionChart" style="width: 800px;height: 400px" />
</template>

<script>
import { getExpertNum } from '@/api/chart'

export default {
  name: 'Pie',
  props:['pie'],

  data() {
    return {
      // 版本号
      version: '3.7.0',
      expertNumList: null,
    }
  },
  created() {
  },
  mounted() {
    setTimeout(() => {
      this.drawExpertProportionChart()
    }, 500)
  },
  methods: {
    drawExpertProportionChart() {
      var expertNumProportionChart = this.$echarts.init(this.$refs.expertNumProportionChart);
      const option = this.pie;
      expertNumProportionChart.setOption(option);
    },

  }
}
</script>

<style scoped>

</style>
