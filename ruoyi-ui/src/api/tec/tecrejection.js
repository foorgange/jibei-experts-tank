import request from '@/utils/request'

export function addtecrejection(data) {
  return request({
    url: '/tec/tecrejection/addrejection',
    method: 'post',
    data: data,
  })
}
// 查询驳回详细信息
export function getlistByachievementId(achievementid) {
  return request({
    url: '/tec/tecrejection/getListByachievementId',
    method: 'get',
    params: {achievementid}
  })
}
