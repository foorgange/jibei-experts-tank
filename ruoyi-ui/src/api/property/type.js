import request from '@/utils/request'

// 查询知识产权类型管理列表
export function listType(query) {
  return request({
    url: '/property/type/list',
    method: 'get',
    params: query
  })
}

// 查询知识产权类型管理详细
export function getType(propertyTypeId) {
  return request({
    url: '/property/type/' + propertyTypeId,
    method: 'get'
  })
}

// 新增知识产权类型管理
export function addType(data) {
  return request({
    url: '/property/type',
    method: 'post',
    data: data
  })
}

// 修改知识产权类型管理
export function updateType(data) {
  return request({
    url: '/property/type',
    method: 'put',
    data: data
  })
}

// 删除知识产权类型管理
export function delType(propertyTypeId) {
  return request({
    url: '/property/type/' + propertyTypeId,
    method: 'delete'
  })
}

// 导出知识产权类型管理
export function exportType(query) {
  return request({
    url: '/property/type/export',
    method: 'get',
    params: query
  })
}
