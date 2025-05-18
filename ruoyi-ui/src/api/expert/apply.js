import request from '@/utils/request'

// 查询申请记录列表
export function listApply(query) {
  return request({
    url: '/expert/apply/list',
    method: 'get',
    params: query
  })
}

// 查询审核备注
export function Mes(name) {
  return request({
    url: '/expert/apply/mes/'+name,
    method: 'get'
  })
}

// 查询申请记录详细
export function getApply(applyId) {
  return request({
    url: '/expert/apply/' + applyId,
    method: 'get'
  })
}

// 新增申请记录
export function addApply(data) {
  return request({
    url: '/expert/apply',
    method: 'post',
    data: data
  })
}

// 修改申请记录
export function updateApply(data) {
  return request({
    url: '/expert/apply',
    method: 'put',
    data: data
  })
}

// 删除申请记录
export function delApply(applyId) {
  return request({
    url: '/expert/apply/' + applyId,
    method: 'delete'
  })
}

// 导出申请记录
export function exportApply(query) {
  return request({
    url: '/expert/apply/export',
    method: 'get',
    params: query
  })
}
