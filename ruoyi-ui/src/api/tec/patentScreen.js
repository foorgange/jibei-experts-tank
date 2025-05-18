import request from '@/utils/request'
import qs from "qs"; // 引入 qs 库用于序列化参数


// 定义获取专利统计数据的API
export function getPatentStats() {
  return request({
    url: '/api/patents/stats', // 注意这里使用了完整的URL路径
    method: 'get' // 根据实际情况选择GET或者POST方法
  });
}

// 定义获取专利申请总量的API
export function getPatentApplicationTotal() {
  return request({
    url: '/api/patents/count',
    method: 'get'
  }).then(response => {
    // 确认返回的数据是数值类型
    if (typeof response === 'number') {
      return response;
    } else if (response && typeof response === 'object' && 'data' in response) {
      // 如果响应体是一个包含数据的对象，则尝试返回其值
      return response.data;
    } else {
      throw new Error('Unexpected response format');
    }
  });
}

// 定义获取有效专利总量统计数据的API
export function getPatentValidStats() {
  return request({
    url: '/api/patents/status-counts', // 注意这里使用了完整的URL路径
    method: 'get' // 根据实际情况选择GET或者POST方法
  });
}

// 定义获取专利授权总数和发明专利授权总数的API
export function getPatentAuthorizes() {
  return request({
    url: '/api/patents/counts/authorized', // 注意这里使用了完整的URL路径
    method: 'get' // 根据实际情况选择GET或者POST方法
  });
}

// 新增：定义获取当前时间的API
export function getCurrentTime() {
  return request({
    url: '/api/patents/current-time', // 确保此路径与后端Controller中的GetMapping路径一致
    method: 'get'
  });
}

// 新增：定义获取Ipc领域的数量及种类
export function getIpcClass() {
  return request({
    url: '/api/patents/ipcCategoryCount', // 确保此路径与后端Controller中的GetMapping路径一致
    method: 'get'
  });
}

// 新增：定义获取发明人发明数量前六
export function gettopInventors() {
  return request({
    url: '/api/patents/topInventors', // 确保此路径与后端Controller中的GetMapping路径一致
    method: 'get'
  });
}

// 新增：定义获取专利转让，专利许可，专利质押的总数
export function getTotalCounts() {
  return request({
    url: '/api/patentCounts/total-counts', // 确保此路径与后端Controller中的GetMapping路径一致
    method: 'get'
  });
}

// 新增：定义获取合作前五大单位
export function getTopFive() {
  return request({
    url: '/api/patents/applicants/top5', // 确保此路径与后端Controller中的GetMapping路径一致
    method: 'get'
  });
}

// 新增：定义获取专利评级分布的总数
export function getGradesTotal() {
  return request({
    url: '/api/patentCounts/grades/total', // 确保此路径与后端Controller中的GetMapping路径一致
    method: 'get'
  });
}

// 新增：定义获取每年专利运营情况趋势数据
export function getPatentCountsByYear() {
  return request({
    url: '/api/patentCounts', // 确保此路径与后端Controller中的GetMapping路径一致
    method: 'get'
  });
}

// 新增：定义获取每年专利申请趋势
export function getMonthlyCounts() {
  return request({
    url: '/api/patents/monthlyCounts', // 确保此路径与后端Controller中的GetMapping路径一致
    method: 'get'
  });
}


// 新增：定义获取patent_statistics表数据
export function getPatentStatistics() {
  return request({
    url: '/api/patents/patent-statistics', // 确保此路径与后端Controller中的GetMapping路径一致
    method: 'get'
  });
}


// 新增：定义获取patent_list表数据
export function getPatentList() {
  return request({
    url: '/api/patents/patent-list', // 确保此路径与后端Controller中的GetMapping路径一致
    method: 'get'
  });
}

export function updatePatentField(id, field, value) {
  console.log('API 请求参数:', { id, field, value }); // 添加日志
  return request({
    url: '/api/patents/update', // 确保路径与后端一致
    method: 'post',
    params: { id, field, value } // 或者 data，取决于后端实现
  });
}

// 定义更新专利数据的 API
export function updatePatent(year, updates) {
  return request({
    url: `/api/patents/updates/${year}`, // 使用反引号包裹路径
    method: 'put', // 使用 PUT 方法
    data: updates // 请求体数据
  });
}

/**
 * 定义更新专利字段的 API 方法
 * 
 * @param {Object} params - 请求参数对象
 * @param {number} params.id - 主键 ID
 * @param {string} [params.field] - 要更新的字段名（如 NumberOne、NumberTwo）
 * @param {string} [params.fieldValue] - 字段的新值
 * @param {string} [params.countField] - 计数字段名（如 OneCount、TwoCount）
 * @param {number} [params.countValue] - 计数字段的新值
 * @returns {Promise} 返回一个 Promise 对象，包含后端返回的数据
 */
export function updatePatentFields(params) {
  const queryString = qs.stringify(params);
  return request({
    url: `/api/patents/updatePatentFields?${queryString}`,
    method: 'post',
  }).then(response => {
    //console.log("Server response:", response);

    // 如果后端返回的是纯文本，手动解析为 JSON 格式
    if (typeof response === "string") {
      if (response.includes("更新成功")) {
        return { success: true, message: "更新成功" };
      } else {
        throw new Error("更新失败");
      }
    }

    // 如果后端返回的是 JSON 格式，直接检查 success 字段
    if (!response.success) {
      throw new Error(response.message || "更新失败");
    }

    return response;
  }).catch(error => {
    console.error("Error in updatePatentFields:", error);
    throw error;
  });
}


// 新增：定义获取专利数据
export function getPatentClass() {
  return request({
    url: '/api/patents/PatentClass', // 确保此路径与后端Controller中的GetMapping路径一致
    method: 'get'
  });
}


/**
 * 更新指定 id 的专利信息。
 *
 * @param {number} id - 专利记录的主键 ID。
 * @param {string|null} patentName - 专利名称（可选，传入 null 表示不更新）。
 * @param {string|null} collaborator - 合作方名称（可选，传入 null 表示不更新）。
 * @param {string|null} operationType - 运营类型（可选，传入 null 表示不更新）。
 * @returns {Promise} - 返回 Promise 对象，包含更新结果。
 */
export function updatePatentClassInfo(id, patentName, collaborator, operationType) {
  return request({
    url: `/api/patents/${id}`, // 动态路径参数
    method: 'put', // 使用 PUT 方法更新资源
    params: {
      patentName: patentName || undefined, // 传入 null 或 undefined 表示不更新
      collaborator: collaborator || undefined,
      operationType: operationType || undefined
    },
    paramsSerializer: (params) => qs.stringify(params, { skipNulls: true }) // 使用 qs 库过滤空值
  });
}

// 定义删除专利的API
export function deletePatentClass(id) {
  return request({
    url: `/api/patents/${id}`, // 使用动态路径参数传递 id
    method: 'delete' // 删除操作通常使用 DELETE 方法
  });
}

// 定义插入专利分类的 API
export function insertPatentClass(params) {
  return request({
    url: '/api/patents/insertPatentClass', // 后端接口路径
    method: 'post', // 使用 POST 方法
    data: params // 请求体数据
  });
}


// 定义添加专利统计数据的 API
export function addPatentData(params) {
  return request({
    url: '/api/patents/addPatentData', // 后端接口路径
    method: 'post', // 使用 POST 方法
    data: params, // 请求体中的数据
    headers: {
      'Content-Type': 'application/json' // 设置请求头为 JSON 格式
    }
  });
}

// 定义获取专每年每月的专利申请数量
export function getPatentCountByYearMonth() {
  return request({
    url: '/api/patents/PatentCountByYearMonth', // 注意这里使用了完整的URL路径
    method: 'get' // 根据实际情况选择GET或者POST方法
  });
}

export function getCountByYear(inventorName) {
  return request({
    url: '/api/patents/countByYear',
    method: 'post',
    data: qs.stringify({ inventorName }),
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded'
    }
  });
}

export function getIpcDistributionByInventor(inventorName) {
  return request({
    url: '/api/patents/ipc-distribution',
    method: 'get',
    params: {
      inventorName
    },
    paramsSerializer: params => qs.stringify(params, { indices: false })
  });
}

export function getPatentsByInventor(inventorName) {
  return request({
    url: '/api/patents/inventorPatentName',
    method: 'get',
    params: {
      inventorName
    },
    paramsSerializer: params => qs.stringify(params, { indices: false })
  });
}


/**
 * 根据专利名称查询专利详细信息
 *
 * @param {string} patentName - 要查询的专利名称
 * @returns {Promise}
 */
export function getPatentByName(patentName) {
  console.log(`[API 请求] 正在根据专利名称查询: ${patentName}`);

  return request({
    url: '/api/patents/get-by-name', // 控制器中的路径
    method: 'get',
    params: {
      patentName
    },
    paramsSerializer: params => {
      // 使用 qs 序列化参数，确保中文等特殊字符能正确传递
      const serialized = qs.stringify(params, { indices: false });
      console.log(`[API 请求参数序列化] ${serialized}`);
      return serialized;
    }
  }).then(response => {
    console.log(`[API 响应 - 成功] 专利 "${patentName}" 的响应数据：`, response);
    return response;
  }).catch(error => {
    console.error(`[API 响应 - 错误] 查询专利 "${patentName}" 时发生错误：`, error);
    throw error;
  });
}

// 新增：获取专利趋势摘要信息
export function getPatentTrendSummary() {
  return request({
    url: '/api/patents/PatentTrendSummary', // 接口地址
    method: 'get' // 使用 GET 请求
  });
}

// 新增：获取 IPC 分类占比数据的 API 调用函数
export function getIpcCategoryProportions() {
  return request({
    url: '/api/patents/ipcCategoryProportions', // 对应后端接口路径，如需前缀可加上 /api
    method: 'get'
  });
}
