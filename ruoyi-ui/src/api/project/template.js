import request from '@/utils/request'

// 查询模板管理列表
export function listTemplate(query) {
  return request({
    url: '/project/template/list',
    method: 'get',
    params: query
  })
}

// 查询模板管理详细
export function getTemplate(templateId) {
  return request({
    url: '/project/template/' + templateId,
    method: 'get'
  })
}

// 新增模板管理
export function addTemplate(data) {
  return request({
    url: '/project/template',
    method: 'post',
    data: data
  })
}

// 修改模板管理
export function updateTemplate(data) {
  return request({
    url: '/project/template',
    method: 'put',
    data: data
  })
}

// 删除模板管理
export function delTemplate(templateId) {
  return request({
    url: '/project/template/' + templateId,
    method: 'delete'
  })
}

// 导出模板管理
export function exportTemplate(query) {
  return request({
    url: '/project/template/export',
    method: 'get',
    params: query
  })
}

// 上传任务书模板
export function uploadTemplate(file) {
  return request({
    url: '/project/template/uploadTemplate',
    method: 'post',
    data: file
  })
}
