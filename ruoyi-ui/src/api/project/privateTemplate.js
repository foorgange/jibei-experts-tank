import request from '@/utils/request'

// 查询用户私有模板列表
export function listPrivateTemplate(query) {
  return request({
    url: '/project/privateTemplate/list',
    method: 'get',
    params: query
  })
}

// 查询用户私有模板详细
export function getPrivateTemplate(templateId) {
  return request({
    url: '/project/privateTemplate/' + templateId,
    method: 'get'
  })
}

// 新增用户私有模板
export function addPrivateTemplate(data) {
  return request({
    url: '/project/privateTemplate',
    method: 'post',
    data: data
  })
}

// 修改用户私有模板
export function updatePrivateTemplate(data) {
  return request({
    url: '/project/privateTemplate',
    method: 'put',
    data: data
  })
}

// 删除用户私有模板
export function delPrivateTemplate(templateId) {
  return request({
    url: '/project/privateTemplate/' + templateId,
    method: 'delete'
  })
}

// 导出用户私有模板
export function exportPrivateTemplate(query) {
  return request({
    url: '/project/privateTemplate/export',
    method: 'get',
    params: query
  })
}

// 上传任务书模板
export function uploadTemplate(file) {
  return request({
    url: '/project/privateTemplate/uploadTemplate',
    method: 'post',
    data: file
  })
}

