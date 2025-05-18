import request from '@/utils/request'

// 查询知识产权附件列表
export function listPropertyAttachFile(query) {
  return request({
    url: '/property/propertyAttachFile/list',
    method: 'get',
    params: query
  })
}

// 查询知识产权附件详细
export function getPropertyAttachFile(fileId) {
  return request({
    url: '/property/propertyAttachFile/' + fileId,
    method: 'get'
  })
}

// 新增知识产权附件
export function addPropertyAttachFile(data) {
  return request({
    url: '/property/propertyAttachFile',
    method: 'post',
    data: data
  })
}

// 修改知识产权附件
export function updatePropertyAttachFile(data) {
  return request({
    url: '/property/propertyAttachFile',
    method: 'put',
    data: data
  })
}

// 删除知识产权附件
export function delPropertyAttachFile(fileId) {
  return request({
    url: '/property/propertyAttachFile/' + fileId,
    method: 'delete'
  })
}

// 导出知识产权附件
export function exportPropertyAttachFile(query) {
  return request({
    url: '/property/propertyAttachFile/export',
    method: 'get',
    params: query
  })
}
