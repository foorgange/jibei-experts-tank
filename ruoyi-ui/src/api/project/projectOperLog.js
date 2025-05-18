import request from '@/utils/request'

// 查询项目管理操作日志列表
export function listProjectOperLog(query) {
  return request({
    url: '/project/projectOperLog/list',
    method: 'get',
    params: query
  })
}

// 查询项目管理操作日志详细
export function getProjectOperLog(logId) {
  return request({
    url: '/project/projectOperLog/' + logId,
    method: 'get'
  })
}

// 新增项目管理操作日志
export function addProjectOperLog(data) {
  return request({
    url: '/project/projectOperLog',
    method: 'post',
    data: data
  })
}

// 修改项目管理操作日志
export function updateProjectOperLog(data) {
  return request({
    url: '/project/projectOperLog',
    method: 'put',
    data: data
  })
}

// 删除项目管理操作日志
export function delProjectOperLog(logId) {
  return request({
    url: '/project/projectOperLog/' + logId,
    method: 'delete'
  })
}

// 导出项目管理操作日志
export function exportProjectOperLog(query) {
  return request({
    url: '/project/projectOperLog/export',
    method: 'get',
    params: query
  })
}
