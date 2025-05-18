import request from '@/utils/request'
import * as url from "url";

// 查询任务管理列表
export function listTask(query) {
  return request({
    url: '/project/task/list',
    method: 'get',
    params: query
  })
}

// 查询任务管理详细
export function getTask(taskId) {
  return request({
    url: '/project/task/' + taskId,
    method: 'get'
  })
}

// 新增任务管理
export function addTask(data) {
  return request({
    url: '/project/task',
    method: 'post',
    data: data
  })
}

// 修改任务管理
export function updateTask(data) {
  return request({
    url: '/project/task',
    method: 'put',
    data: data
  })
}

// 删除任务管理
export function delTask(taskId) {
  return request({
    url: '/project/task/' + taskId,
    method: 'delete'
  })
}

// 导出任务管理
export function exportTask(query) {
  return request({
    url: '/project/task/export',
    method: 'get',
    params: query
  })
}

// 查询任务管理列表
export function listMyTask(query) {
  return request({
    url: '/project/task/myTaskList',
    method: 'get',
    params: query
  })
}


export function listCheckList(proId){
  return request({
    url: '/project/task/checkList/'+proId,
    method: 'get',
  })
}

export function saveCheckList(checkList){
  return request({
    url: '/project/task/saveCheckList',
    method: 'post',
    data: checkList
  })
}

export function uploadCheckList(checkList){
  return request({
    url: '/project/task/uploadCheckList',
    method: 'post',
    data: checkList
  })
}

export function getTaskInfo(proId){
  return request({
    url: '/project/task/getInfo/' + proId,
    method: 'get',
  })
}

export function uploadBook(file) {
  return request({
    url: '/project/task/uploadBook',
    method: 'post',
    data: file
  })
}

export function getFileUrl(booktask){
  return request({
    url: '/project/task/getFileUrl',
    method: 'get',
    params:booktask
  })
}
