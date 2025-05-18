// import request from '@/utils/request'
//
// export function getTecAchievementInfo(tecAchiId) {
//   return request({
//     url: '/tec/getTecAchiInfoById/' + tecAchiId,
//     method: 'post'
//   })
// }
//
// export function getTecAchievementList(data) {
//   return request({
//     url: '/tec/getTecAchiList',
//     method: 'post',
//     data: data
//   })
// }
//
// // 删除知识产权
// export function delTecAchievement(tecAchievementId) {
//   return request({
//     url: '/tec/delTecAchi/' + tecAchievementId,
//     method: 'post'
//   })
// }
//
// export function addTecAchievement(data) {
//   return request({
//     url: '/tec/addTecAchi',
//     method: 'post',
//     data: data
//   })
// }
//
// export function updateTecAchievement(data) {
//   return request({
//     url: '/tec/updateTecAchi',
//     method: 'post',
//     data: data
//   })
// }
//
// export function uploadFile(data, college) {
//   return request({
//     url: '/file/upload/' + college,
//     method: 'post',
//     data: data
//   })
// }
//
//
//
//
// // 新增知识产权
// export function addPropertys(data) {
//   let url;
//   console.log(data.get('file') == null)
//   if (data.get('file') == null) {
//     url = '/property/propertys/'
//   } else {
//     url = '/property/propertys/addWithFile'
//   }
//   return request({
//     url: url,
//     method: 'post',
//     data: data
//   })
// }
//
// // 修改知识产权
//
//
//
//
// // 导出知识产权
// export function exportPropertys(query) {
//   return request({
//     url: '/property/propertys/export',
//     method: 'get',
//     params: query
//   })
// }
//
// export function uploadAttachFiles(formData) {
//   return request({
//     url: '/property/propertys/uploadFiles',
//     method: 'post',
//     data: formData
//   })
// }
