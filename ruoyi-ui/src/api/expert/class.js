import request from '@/utils/request'

// 查询专家类别管理列表
export function listClass(query) {
  return request({
    url: '/expert/class/list',
    method: 'get',
    params: query
  })
}

// 查询专家类别管理详细
export function getClass(classId) {
  return request({
    url: '/expert/class/' + classId,
    method: 'get'
  })
}

// 新增专家类别管理
export function addClass(data) {
  return request({
    url: '/expert/class',
    method: 'post',
    data: data
  })
}

// 修改专家类别管理
export function updateClass(data) {
  return request({
    url: '/expert/class',
    method: 'put',
    data: data
  })
}

// 删除专家类别管理
export function delClass(classId) {
  return request({
    url: '/expert/class/' + classId,
    method: 'delete'
  })
}

// 导出专家类别管理
export function exportClass(query) {
  return request({
    url: '/expert/class/export',
    method: 'get',
    params: query
  })
}
