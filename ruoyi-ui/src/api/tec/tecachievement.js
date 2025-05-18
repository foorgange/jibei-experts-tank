import request from '@/utils/request'
import current from "element-ui/packages/table/src/store/current";

// 查询科技成果增删改查列表
export function listTecachievement(query) {
  return request({
    url: '/tec/tecachievement/list',
    method: 'get',
    params: query
  })
}

// 通过TecachievementVO查询科技成果列表
export function getListByTecachievementVO(data) {
  return request({
    url: '/tec/tecachievement/getListByTecachievementVO?pageNum='+data.pageNum +'&pageSize='+data.pageSize,
    method: 'post',
    data: data
  })
}

// 查询科技成果增删改查详细
export function getTecachievement(achievementid) {
  return request({
    url: '/tec/tecachievement/getTecachievement',
    method: 'get',
    params: {achievementid}
  })
}

// 新增科技成果增删改查
export function addTecachievement(data) {
  return request({
    url: '/tec/tecachievement/addTecachievement',
    method: 'post',
    data: data,
  })
}

// 修改科技成果增删改查
export function updateTecachievement(data) {
  return request({
    url: '/tec/tecachievement/updateTecachievement',
    method: 'post',
    data: data
  })
}

// 删除科技成果增删改查
export function delTecachievement(achievementid) {
  return request({
    url: '/tec/tecachievement/delTecachievement',
    method: 'get',
    params: {achievementid}
  })
}

// 导出科技成果增删改查
export function exportTecachievement(query) {
  return request({
    url: '/tec/tecachievement/export',
    method: 'get',
    params: query
  })
}
// export function exportTaskWord(data) {
//   return request({
//     url: '/tec/tecachievement/exportTaskWord',
//     method: 'post',
//     data: data
//   })
// }

export function exportTaskWord(tecachieveIdArray) {
  return request({
    url: '/tec/tecachievement/exportTaskWord/' + tecachieveIdArray,
    method: 'post',
  })
}

export function uploadImg(data, achievementid) {
  return request({
    url:'/tec/tecachievement/uploadImg/' + achievementid,
    method:'post',
    data: data
  })
}
export function adduploadImg(data) {
  return request({
    url:'/tec/tecachievement/adduploadImg/',
    method:'post',
    data: data
  })
}
export function uploadFile(data) {
  return request({
    url: '/tec/tecachievement/upload/',
    method: 'post',
    data: data
  })
}

export function uploadFiles(data) {
  return request({
    url: '/tec/tecachievement/uploadFiles/',
    method: 'post',
    data: data
  })
}

//修改单个成果状态
export function updateTecStatus(achievementid, action) {
  return request({
    url: '/tec/tecachievement/updateTecachievementStatus/' + achievementid + '/' + action,
    method: 'get'
  })
}
//修改多个成果状态
export function updateBatchTecStatus(achievementids, action) {
  return request({
    url: '/tec/tecachievement/updateBatchTecachievementStatus/' + achievementids+ '/' + action,
    method: 'post',
  })
}

export function getTecAchiListByPiId(piId){
  return request({
    url: '/tec/tecachievement/getTecAchiListByPiId',
    method: 'get',
    params: {piId},
  })
}


// 查询科技成果way各合作方式的数量
export function listWayDistribution(query) {
  return request({
    url: '/tec/tecachievement/way-distribution',
    method: 'get',
    params: query
  })
}

// 查询科技成果各先进度的数量
export function listAdvancementLevel(query) {
  return request({
    url: '/tec/tecachievement/advancement-level-counts',
    method: 'get',
    params: query
  })
}

// 查询科技成果各所属学院的数量
export function listCollegeCounts(query) {
  return request({
    url: '/tec/tecachievement/college-counts',
    method: 'get',
    params: query
  })
}

// 查询科技成果各技术成熟度的数量
export function listTechnologyLevelCounts(query) {
  return request({
    url: '/tec/tecachievement/TechnologyLevelCounts',
    method: 'get',
    params: query
  })
}

// 查询科技成果各所属领域的数量
export function listFieldCounts(query) {
  return request({
    url: '/tec/tecachievement/field-counts',
    method: 'get',
    params: query
  })
}


/**
 * 查询合作方式分布及占比分析数据
 * 调用后端接口 /tec/tecachievement/way-distribution/analysis
 *
 * @returns {Promise} 返回包含以下字段的响应：
 * - data: 合作方式数组，每个元素包含：
 *   - value: 原始值（如 "6"）
 *   - name: 中文名称（如 "技术服务"）
 *   - count: 数量
 *   - percentage: 占比百分比（保留两位小数）
 * - total: 总记录数
 * - description: 自然语言描述语句
 */
export function getWayDistributionAnalysis() {
  return request({
    url: '/tec/tecachievement/way-distribution/analysis',
    method: 'get'
  })
}

// 获取学院申请量统计信息（包括总数、各学院分布、分析文本）
export function getCollegeStatistics() {
  return request({
    url: '/tec/tecachievement/college-statistics/analysis',
    method: 'get'
  })
}

// 获取技术成熟度分析报告（包含占比和自然语言描述）
export function getTechnologyLevelAnalysis() {
  return request({
    url: '/tec/tecachievement/TechnologyLevelAnalysis', // 假设这是后端接口的访问路径
    method: 'get'
  });
}

// 获取技术先进度分析数据（自然语言描述 + 占比详情）
export function getAdvancementLevelAnalysis() {
  return request({
    url: '/tec/tecachievement/advancement-level-analysis', // 注意路径是否匹配你的 controller 路由
    method: 'get'
  })
}

// 新增接口：获取各领域的占比数据和描述
export function getFieldPercentages() {
  return request({
    url: '/tec/tecachievement/field-percentages', // 根据实际路径修改
    method: 'get'
  })
}

