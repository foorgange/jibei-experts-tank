import request from '@/utils/request'

// 按条件查询自评互评任务列表
export function listCheck(query) {
  return request({
    url: '/project/check/list',
    method: 'get',
    params: query
  })
}
// 单个项目评价汇总
export function listSumCheck(query) {
  return request({
    url: '/project/check/sumlist',
    method: 'get',
    params: query
  })
}


// 查询所有自评互评任务列表
export function listAllCheck(query) {
  return request({
    url: '/project/check/allList',
    method: 'get',
    params: query
  })
}

// 查询自评互评任务详细
export function getCheck(checkTaskId) {
  return request({
    url: '/project/check/' + checkTaskId,
    method: 'get'
  })
}

// 新增自评互评任务
export function addCheck(data) {
  return request({
    url: '/project/check',
    method: 'post',
    data: data
  })
}

// 修改自评互评任务
export function updateCheck(data) {
  return request({
    url: '/project/check',
    method: 'put',
    data: data
  })
}

// 删除自评互评任务
export function delCheck(checkTaskId) {
  return request({
    url: '/project/check/' + checkTaskId,
    method: 'delete'
  })
}

// 导出自评互评任务
export function exportCheck(query) {
  return request({
    url: '/project/check/export',
    method: 'get',
    params: query
  })
}
