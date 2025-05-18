import request from '@/utils/request'

// 查询专家属性列表
export function listExperts(query) {
  return request({
    url: '/expert/experts/list',
    method: 'get',
    params: query
  })
}

// 查询专家属性详细
export function getExperts(userId) {
  return request({
    url: '/expert/experts/' + userId,
    method: 'get'
  })
}
// 查询专家个人属性详细
export function getMyInfo() {
  return request({
    url: '/expert/experts/myInfo',
    method: 'get'
  })
}
// 专家信息申请
export function examineExpert(data) {
  return request({
    url: '/expert/experts/examineExperts',
    method: 'post',
    data: data
  })
}

// 新增专家属性
export function addExperts(data) {
  return request({
    url: '/expert/experts',
    method: 'post',
    data: data
  })
}

// 修改专家属性
export function updateExperts(data) {
  return request({
    url: '/expert/experts',
    method: 'put',
    data: data
  })
}

// 删除专家属性
export function delExperts(userId) {
  return request({
    url: '/expert/experts/' + userId,
    method: 'delete'
  })
}

// 导出专家属性
export function exportExperts(query) {
  return request({
    url: '/expert/experts/export',
    method: 'get',
    params: query
  })
}

// 审核专家
export function examineExperts(data) {
  return request({
    url: 'expert/experts/examine',
    method: 'put',
    data: data
  })
}
