import request from '@/utils/request'

// 查询成果负责人增删改查列表
export function getDeptId() {
  return request({
    url: '/user/getDeptId',
    method: 'get'
  })
}
