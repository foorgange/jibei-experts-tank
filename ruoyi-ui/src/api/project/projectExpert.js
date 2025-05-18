import request from '@/utils/request'

// 查询项目用户关联管理列表
export function listProjectExpert(query) {
  return request({
    url: '/project/projectExpert/list',
    method: 'get',
    params: query
  })
}

// 查询项目用户关联管理详细
export function getProjectExpert(projectUserId) {
  return request({
    url: '/project/projectExpert/' + projectUserId,
    method: 'get'
  })
}

// 新增项目用户关联管理
export function addProjectExpert(data) {
  return request({
    url: '/project/projectExpert',
    method: 'post',
    data: data
  })
}

// 修改项目用户关联管理
export function updateProjectExpert(data) {
  return request({
    url: '/project/projectExpert',
    method: 'put',
    data: data
  })
}

// 删除项目用户关联管理
export function delProjectExpert(projectUserId) {
  return request({
    url: '/project/projectExpert/' + projectUserId,
    method: 'delete'
  })
}

// 导出项目用户关联管理
export function exportProjectExpert(query) {
  return request({
    url: '/project/projectExpert/export',
    method: 'get',
    params: query
  })
}
