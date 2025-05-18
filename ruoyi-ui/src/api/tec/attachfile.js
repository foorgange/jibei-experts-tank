import request from '@/utils/request'

// 查询科技成果附件列表
export function listAttachfile(query) {
  return request({
    url: '/tec/attachfile/list',
    method: 'get',
    params: query
  })
}

// 查询科技成果附件详细
export function getAttachfile(fileId) {
  return request({
    url: '/tec/attachfile/' + fileId,
    method: 'get'
  })
}

// 新增科技成果附件
export function addAttachfile(data) {
  return request({
    url: '/tec/attachfile',
    method: 'post',
    data: data
  })
}

// 修改科技成果附件
export function updateAttachfile(data) {
  return request({
    url: '/tec/attachfile',
    method: 'put',
    data: data
  })
}

// 删除科技成果附件
export function delAttachfile(fileId) {
  return request({
    url: '/tec/attachfile/' + fileId,
    method: 'delete'
  })
}

// 导出科技成果附件
export function exportAttachfile(query) {
  return request({
    url: '/tec/attachfile/export',
    method: 'get',
    params: query
  })
}
