import request from '@/utils/request'

// 查询项目列表列表
export function listProjects(query) {
  return request({
    url: '/project/projects/list',
    method: 'get',
    params: query
  })
}

// 查询项目列表详细
export function getProjects(projectId) {
  return request({
    url: '/project/projects/' + projectId,
    method: 'get'
  })
}

// 新增项目列表
export function addProjects(data) {
  return request({
    url: '/project/projects',
    method: 'post',
    data: data
  })
}

// 修改项目列表(同时修改待办事项)
export function updateProjects(data) {
  return request({
    url: '/project/projects',
    method: 'put',
    data: data
  })
}

//查询专家任务是否全部提交
export function examineTask(data) {
  return request({
    url: '/project/projects/examineTask',
    method: 'put',
    data: data
  })
}

// 修改项目状态从2到3
// export function updateProjects2to3(data) {
//   return request({
//     url: '/project/projects/edit2to3',
//     method: 'put',
//     data: data
//   })
// }


// 删除项目列表
export function delProjects(projectId) {
  return request({
    url: '/project/projects/' + projectId,
    method: 'delete'
  })
}

//导出项目列表
export function exportProjects(query) {
  return request({
    url: '/project/projects/export',
    method: 'get',
    params: query
  })
}

// 导出我申请的项目列表
export function exportMyProjects(query) {
  return request({
    url: '/project/projects/myexport',
    method: 'get',
    params: query
  })
}


//加入项目
export function joinProject(projectId) {
  return request({
    url: '/project/projects/joinProject',
    method: 'post',
    data: projectId
  })
}

//获取我加入的项目
export function getJoinedProject(){
  return request({
    url: '/project/projects/joinedProject',
    method: 'get'
  })
}

//获取我的项目
export function getMyProject(pro){
  return request({
    url: '/project/projects/myProject/',
    method: 'get',
    params: pro
  })
}

//获取查看的项目的参与专家
export function getJoinedExperts(proId){
  return request({
    url: '/project/projects/projectExperts/'+proId,
    method: 'get',
  })
}

//发布任务
export function publishTask(task){
  return request({
    url:'/project/projects/publishTask',
    method: 'post',
    data: task
  })
}

export function deleteMember(projectExpertProject){
  return request({
    url:'/project/projects/delMember',
    method: 'post',
    data: projectExpertProject
  })
}

export function getMemberTaskInfoList(projectId){
  return request({
    url:'/project/projects/getMemberTaskInfo/' + projectId,
    method: 'get'
  })
}

export function getTemplateList(){
  return request({
    url:'/project/projects/getTemplateList',
    method:'get'
  })
}
