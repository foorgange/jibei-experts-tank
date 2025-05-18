import request from '@/utils/request'


export function listPapers() {
  return request({
    url: '/api/Papers/list', // 修改URL以匹配后端接口
    method: 'get',
  });
}

export function listPaperVO(query) {
  return request({
    url: '/api/Papers/getListByPapersQueryVo?pageNum=' + query.pageNum + '&pageSize=' + query.pageSize, // 移除了手动拼接的查询参数
    method: 'post',
    data: query // 确保所有查询参数都在这里发送
  });
}


/**
 * 删除论文库单一记录
 */
// 添加删除论文的方法
export function deletePaper(id) {
  return request({
    url: `/api/Papers/delete/${id}`,
    method: 'delete'
  });
}

/**
 * 添加新的论文
 * @param {Object} paperData - 论文数据对象
 */
export function addPaper(paperData) {
  return request({
    url: '/api/Papers/addPaper', // 确保这个URL与后端控制器中的PostMapping一致
    method: 'post',
    data: paperData,
  });
}

