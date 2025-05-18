import request from '@/utils/request'

// 查询纵向课题列表
export function listVerticaltopic(query) {
  return request({
    url: '/system/verticaltopic/list',
    method: 'get',
    params: query
  })
}

// 查询纵向课题详细
export function getVerticaltopic(topicId) {
  return request({
    url: '/system/verticaltopic/' + topicId,
    method: 'get'
  })
}

// 新增纵向课题
export function addVerticaltopic(data) {
  return request({
    url: '/system/verticaltopic',
    method: 'post',
    data: data
  })
}

// 新增纵向课题
export function addTecVerticaltopicList(data) {
  return request({
    url: '/system/verticaltopic/addTecVerticaltopicList',
    method: 'post',
    data: data
  })
}

// 修改纵向课题
export function updateVerticaltopic(data) {
  return request({
    url: '/system/verticaltopic',
    method: 'put',
    data: data
  })
}

// 修改纵向课题
export function updateTecVerticaltopicList(data) {
  return request({
    url: '/system/verticaltopic/updateTecVerticaltopicList',
    method: 'post',
    data: data
  })
}

// 删除纵向课题
export function delVerticaltopic(topicId) {
  return request({
    url: '/system/verticaltopic/' + topicId,
    method: 'delete'
  })
}

// 导出纵向课题
export function exportVerticaltopic(query) {
  return request({
    url: '/system/verticaltopic/export',
    method: 'get',
    params: query
  })
}
