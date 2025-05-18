package com.jd.tecachieve.service.impl;

import com.jd.tecachieve.domain.Patent;
import com.jd.tecachieve.domain.PatentCountByMonth;
import com.jd.tecachieve.domain.PatentTotal;
import com.jd.tecachieve.mapper.PatentMapper;
import com.jd.tecachieve.service.PatentService;
import com.jd.tecachieve.vo.PatentQueryVo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

import static jdk.nashorn.internal.runtime.regexp.joni.Config.log;

@Service
public class PatentServiceImpl implements PatentService {

    @Autowired
    private PatentMapper patentMapper;

    /**
     * 根据专利名称查询专利信息
     *
     * @param patentName 需要查询的专利名称
     * @return 返回包含专利所有字段的 Map（字段名为 key，值为 value），如果没有找到返回 null
     */
    @Override
    public Map<String, Object> getPatentInfoByName(String patentName) {
        // 调用 PatentMapper 中定义的方法，传入专利名称进行查询
        return patentMapper.selectPatentByName(patentName);
    }

    /**
     * 根据发明人名称查询专利信息
     * @param inventorName 发明人姓名
     * @return 专利列表
     */
    @Override
    public List<Patent> getPatentsByInventor(String inventorName) {
        return patentMapper.selectPatentsByInventor(inventorName);
    }


    /**
     * 根据发明人名称，统计其所有专利中 IPC 分类号的首字母分布。
     *
     * @param inventorName 发明人名称
     * @return 首字母及对应数量的 Map 列表（每个 Map 是 {first_letter=..., count=...}）
     */
    @Override
    public List<Map<String, Object>> countIpcFirstLettersByInventor(String inventorName) {
        // 调用 Mapper 方法，执行 SQL 查询并返回结果
        return patentMapper.countIpcFirstLettersByInventor(inventorName);
    }


    /**
     * 根据发明人名字统计每年的专利申请数量。
     *
     * @param inventorName 发明人的名字
     * @return 每年的专利申请数量列表，每个元素是一个包含"year"和"count"键的Map对象。
     */
    @Override
    public List<Map<String, Object>> countPatentsByInventorGroupByYear(String inventorName) {
        // 调用patentMapper中的方法，传递发明人名字作为参数
        return patentMapper.countPatentsByInventorGroupByYear(inventorName);
    }



    /**
     * 获取每年每月的专利申请数量。
     *
     * 该方法通过调用 PatentMapper 的 countPatentsByYearMonth() 方法，
     * 查询数据库中按年份和月份分组的专利申请数量。
     *
     * @return 包含年、月和对应专利数量的 Map 列表
     */
    @Override
    public List<Map<String, Object>> getPatentCountByYearMonth() {
        return patentMapper.countPatentsByYearMonth();
    }


    @Override
    public Long insertPatent(Map<String, Object> params) {
        patentMapper.insertPatent(params);
        return (Long) params.get("id");
    }


    /**
     * 实现添加专利统计数据的方法
     *
     * @param params 包含字段值的 Map 对象
     */
    @Override
    public void addPatentData(Map<String, Object> params) {
        // 调用 Mapper 的 insert 方法插入数据
        patentMapper.insertPatentTotal(params);
    }


    /**
     * 插入一条专利分类记录。
     *
     * @param params 包含专利信息的键值对
     *               - "patentName"：专利名称
     *               - "collaborator"：合作方名称
     *               - "operationType"：运营类型
     * @return 影响的行数（通常为 1）
     */
    @Override
    public int insertPatentClass(Map<String, Object> params) {
        // 调用 Mapper 层的 insertPatentClass 方法执行插入操作
        return patentMapper.insertPatentClass(params);
    }


    /**
     * 根据 id 删除专利信息
     *
     * @param id 主键 id
     */
    @Override
    public void deletePatentById(Long id) {
        // 调用 Mapper 层的删除方法
        int rowsAffected = patentMapper.deleteById(id);

        // 打印日志或抛出异常（根据需求）
        if (rowsAffected > 0) {
            System.out.println("删除成功！影响行数：" + rowsAffected);
        } else {
            System.out.println("未找到对应记录！");
            // 如果需要，可以抛出自定义异常
            // throw new RuntimeException("未找到对应记录！");
        }
    }



    /**
     * 更新指定 id 的专利信息。
     *
     * @param id             专利记录的主键 ID。
     * @param patentName     专利名称（可选，传入 null 表示不更新）。
     * @param collaborator   合作方名称（可选，传入 null 表示不更新）。
     * @param operationType  运营类型（可选，传入 null 表示不更新）。
     */
    @Override
    public void updatePatentInfo(Long id, String patentName, String collaborator, String operationType) {
        // 创建参数 Map，用于传递给 Mapper
        Map<String, Object> params = new HashMap<>();
        params.put("id", id);

        // 只有非空字段才会被更新
        if (patentName != null) {
            params.put("patent_name", patentName);
        }
        if (collaborator != null) {
            params.put("collaborator", collaborator);
        }
        if (operationType != null) {
            params.put("operation_type", operationType);
        }

        // 调用 Mapper 方法执行更新
        int rowsAffected = patentMapper.updateByPatentClassId(params);

        // 打印日志或进行其他处理
        System.out.println("更新了 " + rowsAffected + " 条记录。");
    }


    /**
     * 查询所有专利分类信息。
     *
     * @return 包含所有专利分类信息的列表，每条记录为一个 Map。
     */
    @Override
    public List<Map<String, Object>> getAllPatentClass() {
        return patentMapper.selectAllPatentClass();
    }



    @Override
    public boolean updatePatentFields(Long id, String field, String fieldValue, String countField, Integer countValue) {
        try {
            // 调用 Mapper 层的动态更新方法
            int rowsAffected = patentMapper.updateDynamicFields(id, field, fieldValue, countField, countValue);

            // 如果影响的行数大于 0，表示更新成功
            return rowsAffected > 0;
        } catch (Exception e) {
            // 捕获异常并打印错误日志
            System.err.println("更新专利字段时发生错误：" + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    /**
     * 根据年份动态更新 patent_total 表中的字段。
     *
     * @param year   指定要更新的年份（对应表中的 year 字段）。
     * @param updates 包含需要更新的字段及其值的 Map。
     *                - key: 字段名（如 "transfers", "licenses" 等）。
     *                - value: 字段对应的值。
     * @return 返回受影响的行数。
     */
    @Override
    public int updatePatentTotalByYear(String year, Map<String, Object> updates) {
        // 调用 Mapper 层方法进行更新操作
        return patentMapper.updatePatentTotalByYear(year, updates);
    }

    /**
     * 更新专利统计表中的某个字段
     *
     * @param id    主键 ID
     * @param field 要更新的字段名
     * @param value 字段的新值
     */
    @Override
    public void updateField(Long id, String field, Object value) {
        // 构造参数 Map
        Map<String, Object> params = new HashMap<>();
        params.put("id", id);
        params.put("field", field);
        params.put("value", value);

        // 调用 Mapper 层方法进行更新
        int rowsAffected = patentMapper.updatePatentStatistics(params);

        // 根据更新结果输出日志或抛出异常
        if (rowsAffected > 0) {
            System.out.println("更新成功！");
        } else {
            System.out.println("更新失败！");
        }
    }

    /**
     * 查询 patent_list 表的所有数据。
     *
     * @return 返回一个包含所有字段的 Map 列表。每个 Map 对应一行数据，键是字段名，值是字段对应的值。
     */
    @Override
    public List<Map<String, Object>> selectAllPatentList() {
        // 调用 PatentMapper 的方法查询所有数据
        return patentMapper.selectAllPatentList();
    }



    /**
     * 查询 patent_statistics 表的所有数据。
     *
     * @return 返回一个包含所有字段的 Map 列表。每个 Map 对应一行数据，键是字段名，值是字段对应的值。
     */
    @Override
    public List<Map<String, Object>> selectAllPatentStatistics() {
        // 调用 PatentMapper 的方法查询所有数据
        return patentMapper.selectAllPatentStatistics();
    }

    /**
     * 获取2024年与2023年的专利统计数据对比。
     *
     * @return 返回包含统计结果的Map集合
     */
    @Override
    public Map<String, Object> getPatentStatsComparison() {
        return patentMapper.getPatentStatsComparison();
    }

    @Override
    public Map<String, Object> getTotalAndInventionPatentGrantedCount() {
        // 调用PatentMapper的方法获取专利授权总量和发明授权总量
        return patentMapper.countTotalAndInventionPatentGranted();
    }

    @Override
    public Map<String, Integer> getPatentStatusCounts() {
        // 获取原始结果
        Map<String, Object> rawResult = patentMapper.getPatentStatusCounts();

        // 创建新的结果 Map
        Map<String, Integer> result = new HashMap<>();

        // 进行类型转换
        if (rawResult != null) {
            result.put("valid_count", ((Number) rawResult.get("valid_count")).intValue());
            result.put("invalid_count", ((Number) rawResult.get("invalid_count")).intValue());
        }

        return result;
    }


    /**
     * 根据专利类型统计特定类型的专利数量。
     *
     * @param type 专利类型的标识符：
     *             - "A" 表示发明专利 (Invention Patent)
     *             - "U" 表示实用新型专利 (Utility Model Patent)
     *             - "S" 表示外观设计专利 (Design Patent)
     * @return 符合指定类型的专利数量
     */
    @Override
    public long countByType(String type) {
        return patentMapper.countByPublicationNumberEndingWith(type);
    }


    public Map<String, Integer> countIpcCategories() {
        List<Map<String, Object>> ipcClassData = patentMapper.findAllIpcClasses();
        System.out.println("Total records: " + (ipcClassData != null ? ipcClassData.size() : "null"));

        // 如果 ipcClassData 为 null 或空，则直接返回空 Map
        if (ipcClassData == null || ipcClassData.isEmpty()) {
            return Collections.emptyMap();
        }

        Map<String, Integer> categoryCount = new HashMap<>();

        // 定义有效的分类前缀集合
        Set<String> validPrefixes = new HashSet<>(Arrays.asList("A", "B", "C", "D", "E", "F", "G", "H"));

        for (Map<String, Object> record : ipcClassData) {
            // 确保 record 不为 null，并且包含键 "ipc_class"
            if (record == null || !record.containsKey("ipc_class")) {
                continue;
            }

            String ipcClass = (String) record.get("ipc_class");

            // 确保 ipcClass 不为 null
            if (ipcClass == null || ipcClass.isEmpty()) {
                continue;
            }

            try {
                Set<String> processedPrefixes = new HashSet<>(); // 每个记录都需要一个新的 Set

                System.out.println("Processing record: " + ipcClass);

                // 处理 "==" 分隔符
                String[] parts = ipcClass.split(";");
                for (String part : parts) {
                    // 进一步处理 "; " 分隔符
                    String[] ipcClasses = part.split("== ");
                    for (String ipc : ipcClasses) {
                        if (ipc != null && !ipc.isEmpty()) {
                            String categoryPrefix = ipc.substring(0, 1).toUpperCase();

                            // 只有当前缀是 A, B, C, D, E, F, G, H 中的一个时才处理
                            if (validPrefixes.contains(categoryPrefix)) {
                                // 只有当该前缀尚未在当前记录中计数时才增加计数
                                if (!processedPrefixes.contains(categoryPrefix)) {
                                    System.out.println("Adding prefix: " + categoryPrefix);
                                    categoryCount.put(categoryPrefix, categoryCount.getOrDefault(categoryPrefix, 0) + 1);
                                    processedPrefixes.add(categoryPrefix); // 标记该前缀已计数
                                } else {
                                    System.out.println("Prefix already counted: " + categoryPrefix);
                                }
                            } else {
                                System.out.println("Invalid prefix, skipping: " + categoryPrefix);
                            }
                        }
                    }
                }
            } catch (Exception e) {
                // 捕获并记录任何潜在异常
                System.err.println("Error processing ipcClass: " + ipcClass);
                e.printStackTrace();
            }
        }

        System.out.println("Final category counts: " + categoryCount);
        return categoryCount;
    }

    /**
     * 调用PatentMapper中的findDistinctApplicantsWithShanDongJianZhu方法，
     * 获取与“山东建筑大学”无关的申请人列表。
     *
     * @return 包含申请人名称及其计数的映射列表
     */
    @Override
    public List<Map<String, Object>> findDistinctApplicantsWithShanDongJianZhu() {
        return patentMapper.findDistinctApplicantsWithShanDongJianZhu();
    }


    @Override
    public List<Patent> getAllPatents() {
        return patentMapper.selectPatentList(null);
    }

    @Override
    public List<Patent> selectPatentListByPatentQueryVo(PatentQueryVo patentQueryVo) {
        return patentMapper.selectPatentListByPatentQueryVo(patentQueryVo);
    }


    @Override
    public int getCount() {
        return patentMapper.selectPatentList(null).size();
    }

    @Override
    public int deletePatentByPatentid(Long patentid) {
        return patentMapper.deletePatentByPatentid(patentid);
    }


    @Override
    public List<Map<String, Object>> findTopSixInventors() {
        try {
            // 从数据库中获取所有记录
            List<Map<String, Object>> allPatents = patentMapper.selectAllPatents();

            // 创建一个Map来统计每个发明人的专利数量
            Map<String, Integer> inventorCountMap = new HashMap<>();

            for (Map<String, Object> patent : allPatents) {
                String inventors = (String) patent.get("inventors");
                if (inventors != null && !inventors.isEmpty()) {
                    // 分割多个发明人
                    String[] inventorsArray = inventors.split(";");
                    for (String inventor : inventorsArray) {
                        inventor = inventor.trim(); // 去除首尾空格
                        inventorCountMap.put(inventor, inventorCountMap.getOrDefault(inventor, 0) + 1);
                    }
                }
            }

            // 将Map转换为List并按专利数量降序排序
            List<Map.Entry<String, Integer>> sortedInventors = new ArrayList<>(inventorCountMap.entrySet());
            sortedInventors.sort((o1, o2) -> o2.getValue().compareTo(o1.getValue()));

            // 取前六名
            List<Map<String, Object>> topSixInventors = new ArrayList<>();
            int count = Math.min(6, sortedInventors.size());
            for (int i = 0; i < count; i++) {
                Map<String, Object> inventorInfo = new HashMap<>();
                inventorInfo.put("inventor", sortedInventors.get(i).getKey());
                inventorInfo.put("patentCount", sortedInventors.get(i).getValue());
                topSixInventors.add(inventorInfo);
            }

            return topSixInventors;
        } catch (Exception e) {
            // 异常处理
            e.printStackTrace();
            throw new RuntimeException("查询发明人发明专利排名时发生错误: " + e.getMessage());
        }
    }



    // 实现接口中的方法
    @Override
    public List<Map<String, Object>> getMonthlyCounts() {
        return patentMapper.getMonthlyCounts();
    }



















}
