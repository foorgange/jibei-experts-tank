import request from '@/utils/request'

export function getExpertNum(){
  return request({
    url:"/expert/experts/expertProportionData",
    method:"get"
  })
}
export function getNewExpertNum(){
  return request({
    url:"/expert/experts/newExpertNumData",
    method:"get"
  })
}
