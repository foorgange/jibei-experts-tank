import request from '@/utils/request'

// 查询科技成果增删改查列表
export function listTecachievement(query) {
  return request({
    url: '/system/tecachievement/list',
    method: 'get',
    params: query
  })
}

// 查询科技成果增删改查详细
export function getTecachievement( achievementid) {
  return request({
    url: '/system/tecachievement/' +  achievementid,
    method: 'get'
  })
}

// 新增科技成果增删改查
export function addTecachievement(data) {
  return request({
    url: '/system/tecachievement',
    method: 'post',
    data: data
  })
}

// 修改科技成果增删改查
export function updateTecachievement(data) {
  return request({
    url: '/system/tecachievement',
    method: 'put',
    data: data
  })
}

// 删除科技成果增删改查
export function delTecachievement( achievementid) {
  return request({
    url: '/system/tecachievement/' +  achievementid,
    method: 'delete'
  })
}

// 导出科技成果增删改查
export function exportTecachievement(query) {
  return request({
    url: '/system/tecachievement/export',
    method: 'get',
    params: query
  })
}
