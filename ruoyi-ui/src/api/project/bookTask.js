import request from '@/utils/request'

// 查询制定任务书任务列表
export function listBookTask(query) {
  return request({
    url: '/project/bookTask/list',
    method: 'get',
    params: query
  })
}

// 查询制定任务书任务详细
export function getBookTask(bookTaskId) {
  return request({
    url: '/project/bookTask/' + bookTaskId,
    method: 'get'
  })
}

// 新增制定任务书任务
export function addBookTask(data) {
  return request({
    url: '/project/bookTask',
    method: 'post',
    data: data
  })
}

// 修改制定任务书任务
export function updateBookTask(data) {
  return request({
    url: '/project/bookTask',
    method: 'put',
    data: data
  })
}

// 删除制定任务书任务
export function delBookTask(bookTaskId) {
  return request({
    url: '/project/bookTask/' + bookTaskId,
    method: 'delete'
  })
}

// 导出制定任务书任务
export function exportBookTask(query) {
  return request({
    url: '/project/bookTask/export',
    method: 'get',
    params: query
  })
}
