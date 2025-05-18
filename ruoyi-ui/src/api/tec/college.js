import request from '@/utils/request'


// 查询知识产权类型管理详细
export function getTecCollegeInfo(collegeId) {
  return request({
    url: '/tec/getTecCollegeInfo/' + collegeId,
    method: 'post'
  })
}


// 查询知识产权类型管理列表
export function getCollegeList(query) {
  return request({
    url: '/tec/getTecCollegeList',
    method: 'post',
    data: query
  })
}


