import request from '@/utils/request'

// 查询成果负责人增删改查列表
export function listTecpi(query) {
  return request({
    url: '/tec/tecpi/list',
    method: 'get',
    params: query
  })
}

// 查询成果负责人增删改查详细
export function getTecpi(piId) {
  return request({
    url: '/tec/tecpi/' + piId,
    method: 'get'
  })
}

// 新增成果负责人增删改查
export function addTecpi(data) {
  return request({
    url: '/tec/tecpi',
    method: 'post',
    data: data
  })
}

// 修改成果负责人增删改查
export function updateTecpi(data) {
  return request({
    url: '/tec/tecpi',
    method: 'put',
    data: data
  })
}

// 删除成果负责人增删改查
export function delTecpi(piId) {
  return request({
    url: '/tec/tecpi/' + piId,
    method: 'delete'
  })
}

// 导出成果负责人增删改查
export function exportTecpi(query) {
  return request({
    url: '/tec/tecpi/export',
    method: 'get',
    params: query
  })
}
