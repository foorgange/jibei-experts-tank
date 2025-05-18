import request from '@/utils/request'

// 查询职位管理列表
export function listPosition(query) {
  return request({
    url: '/expert/position/list',
    method: 'get',
    params: query
  })
}

// 查询职位管理详细
export function getPosition(positionId) {
  return request({
    url: '/expert/position/' + positionId,
    method: 'get'
  })
}

// 新增职位管理
export function addPosition(data) {
  return request({
    url: '/expert/position',
    method: 'post',
    data: data
  })
}

// 修改职位管理
export function updatePosition(data) {
  return request({
    url: '/expert/position',
    method: 'put',
    data: data
  })
}

// 删除职位管理
export function delPosition(positionId) {
  return request({
    url: '/expert/position/' + positionId,
    method: 'delete'
  })
}

// 导出职位管理
export function exportPosition(query) {
  return request({
    url: '/expert/position/export',
    method: 'get',
    params: query
  })
}
