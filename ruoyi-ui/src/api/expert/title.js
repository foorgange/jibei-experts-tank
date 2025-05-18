import request from '@/utils/request'

// 查询职称管理列表
export function listTitle(query) {
  return request({
    url: '/expert/title/list',
    method: 'get',
    params: query
  })
}

// 查询职称管理详细
export function getTitle(titleId) {
  return request({
    url: '/expert/title/' + titleId,
    method: 'get'
  })
}

// 新增职称管理
export function addTitle(data) {
  return request({
    url: '/expert/title',
    method: 'post',
    data: data
  })
}

// 修改职称管理
export function updateTitle(data) {
  return request({
    url: '/expert/title',
    method: 'put',
    data: data
  })
}

// 删除职称管理
export function delTitle(titleId) {
  return request({
    url: '/expert/title/' + titleId,
    method: 'delete'
  })
}

// 导出职称管理
export function exportTitle(query) {
  return request({
    url: '/expert/title/export',
    method: 'get',
    params: query
  })
}
