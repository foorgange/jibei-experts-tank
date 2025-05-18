import request from '@/utils/request'

/**
 * 查询专利信息列表
 * @param query - 应包含需要发送到后端的查询条件，这里应是一个符合PatentQueryVo结构的对象
 */
export function listPatents(query) {
  return request({  
    url: '/api/patents/getListByPatentQueryVo?pageNum='+query.pageNum +'&pageSize='+query.pageSize, // 修改URL以匹配后端接口
    method: 'post', // 更改为POST方法
    data: query // 使用data字段来发送请求体内容，而不是params
  });
}

/**
 * 删除专利库单一记录
 * @param patentId - 需要删除的专利记录的ID
 */
export function removePatent(patentid) {
  return request({
    url: '/api/patents/delTecachievement', // URL指向后端删除接口
    method: 'get', // 使用DELETE方法，更符合RESTful设计原则
    params: { patentid:patentid }// 使用params字段来发送查询参数
  });
}

/**
 * 新增专利信息
 * @param patentData - 包含专利信息的对象，字段需与后端接口要求一致
 * @returns {Promise} - 返回一个Promise对象，用于处理响应结果
 */
export function addPatent(patentData) {
  return request({
    url: '/api/patents/addPatentInfo', // 后端提供的新增专利信息接口地址
    method: 'post', // 使用POST方法提交数据
    data: patentData // 请求体中包含专利信息数据
  });
}

