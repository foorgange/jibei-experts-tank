import request from '@/utils/request'

// 查询知识产权列表
export function listPropertys(query) {
  return request({
    url: '/property/propertys/list',
    method: 'get',
    params: query
  })
}

// 查询知识产权详细
export function getPropertys(propertyId) {
  return request({
    url: '/property/propertys/' + propertyId,
    method: 'get'
  })
}

// 新增知识产权
export function addPropertys(data) {
  let url;
  console.log(data.get('file') == null)
  if (data.get('file') == null) {
    url = '/property/propertys/'
  } else {
    url = '/property/propertys/addWithFile'
  }
  return request({
    url: url,
    method: 'post',
    data: data
  })
}

// 修改知识产权
export function updatePropertys(data) {
  // 根据data选择访问的url
  let url;
  console.log(data.get('file') == null)
  if (data.get('file') == null) {
    url = '/property/propertys/'
  } else {
    url = '/property/propertys/addFiles'
  }
  return request({
    url: url,
    method: 'put',
    data: data
  })
}

// 删除知识产权
export function delPropertys(propertyId) {
  return request({
    url: '/property/propertys/' + propertyId,
    method: 'delete'
  })
}

// 导出知识产权
export function exportPropertys(query) {
  return request({
    url: '/property/propertys/export',
    method: 'get',
    params: query
  })
}

export function uploadAttachFiles(formData) {
  return request({
    url: '/property/propertys/uploadFiles',
    method: 'post',
    data: formData
  })
}
