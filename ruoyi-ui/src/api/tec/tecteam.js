import request from '@/utils/request'

// 查询团队成员增删改查列表
export function listTecteam(query) {
  return request({
    url: '/tec/tecteam/list',
    method: 'get',
    params: query
  })
}

// 查询团队成员增删改查详细
export function getTecteam(teamId) {
  return request({
    url: '/tec/tecteam/' + teamId,
    method: 'get'
  })
}

// 新增团队成员增删改查
export function addTecteam(data) {
  return request({
    url: '/tec/tecteam',
    method: 'post',
    data: data
  })
}

// 修改团队成员增删改查
export function updateTecteam(data) {
  return request({
    url: '/tec/tecteam',
    method: 'put',
    data: data
  })
}

// 删除团队成员增删改查
export function delTecteam(teamId) {
  return request({
    url: '/tec/tecteam/' + teamId,
    method: 'delete'
  })
}

// 导出团队成员增删改查
export function exportTecteam(query) {
  return request({
    url: '/tec/tecteam/export',
    method: 'get',
    params: query
  })
}
