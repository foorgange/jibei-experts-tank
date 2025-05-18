import request from '@/utils/request'

// 查询专家信息列表列表
export function listExpertInfo(query) {
  return request({
    url: '/expert/expertInfo/list',
    method: 'get',
    params: query
  })
}

// 查询专家信息列表详细
export function getExpertInfo(userId) {
  return request({
    url: '/expert/expertInfo/' + userId,
    method: 'get'
  })
}

// 新增专家信息列表
export function addExpertInfo(data) {
  return request({
    url: '/expert/expertInfo',
    method: 'post',
    data: data
  })
}

// 修改专家信息列表
export function updateExpertInfo(data) {
  return request({
    url: '/expert/expertInfo',
    method: 'put',
    data: data
  })
}

// 删除专家信息列表
export function delExpertInfo(userId) {
  return request({
    url: '/expert/expertInfo/' + userId,
    method: 'delete'
  })
}

// 导出专家信息列表
export function exportExpertInfo(query) {
  return request({
    url: '/expert/expertInfo/export',
    method: 'get',
    params: query
  })
}
// 查询sysUser列表
export function allListSysUser(query) {
  return request({
    url: '/system/user/allList',
    method: 'get',
    params: query
  })
}
// 查询projectPosition列表
export function allListProjectPosition(query) {
  return request({
    url: '/expert/position/allList',
    method: 'get',
    params: query
  })
}
// 查询projectTitle列表
export function allListProjectTitle(query) {
  return request({
    url: '/expert/title/allList',
    method: 'get',
    params: query
  })
}
// 查询expertMajor列表
export function allListExpertMajor(query) {
  return request({
    url: '/expert/major/allList',
    method: 'get',
    params: query
  })
}
// 查询expertClass列表
export function allListExpertClass(query) {
  return request({
    url: '/expert/class/allList',
    method: 'get',
    params: query
  })
}
