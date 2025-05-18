import request from '@/utils/request'

// 查询通行码管理列表
export function listCode(query) {
  return request({
    url: '/expert/code/list',
    method: 'get',
    params: query
  })
}

// 查询通行码管理详细
export function getCode(passCodeId) {
  return request({
    url: '/expert/code/' + passCodeId,
    method: 'get'
  })
}

// 新增通行码管理
export function addCode(data) {
  return request({
    url: '/expert/code',
    method: 'post',
    data: data
  })
}

// 修改通行码管理
export function updateCode(data) {
  return request({
    url: '/expert/code',
    method: 'put',
    data: data
  })
}

// 删除通行码管理
export function delCode(passCodeId) {
  return request({
    url: '/expert/code/' + passCodeId,
    method: 'delete'
  })
}

// 导出通行码管理
export function exportCode(query) {
  return request({
    url: '/expert/code/export',
    method: 'get',
    params: query
  })
}
