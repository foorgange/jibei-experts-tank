package com.jd.tecachieve.service;

import com.jd.tecachieve.domain.Patent;
import com.jd.tecachieve.domain.PatentCountByMonth;
import com.jd.tecachieve.vo.PatentQueryVo;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;
import java.util.Map;

public interface PatentService
{

    /**
     * 根据专利名称获取专利信息
     *
     * @param patentName 专利名称
     * @return 包含专利信息的 Map
     */
    Map<String, Object> getPatentInfoByName(String patentName);

    List<Patent> getPatentsByInventor(String inventorName);
    /**
     * 根据发明人名称，统计其所有专利中 IPC 分类号的首字母分布。
     *
     * @param inventorName 发明人名称
     * @return 首字母及对应数量的对象列表
     */
    List<Map<String, Object>> countIpcFirstLettersByInventor(String inventorName);

    /**
     * 根据发明人名字统计每年的专利申请数量。
     *
     * @param inventorName 发明人的名字
     * @return 每年的专利申请数量列表，每个元素是一个包含"year"和"count"键的Map对象。
     */
    List<Map<String, Object>> countPatentsByInventorGroupByYear(String inventorName);
    /**
     * 获取每年每月的专利申请数量统计信息。
     *
     * @return 包含年、月和对应专利数量的 Map 列表
     */
    List<Map<String, Object>> getPatentCountByYearMonth();
    /**
     * 插入专利信息
     *
     * @param params 包含所有字段的Map对象
     * @return 插入成功后返回主键ID
     */
    Long insertPatent(Map<String, Object> params);


    /**
     * 添加专利统计数据
     *
     * @param params 包含字段值的 Map 对象
     */
    void addPatentData(Map<String, Object> params);
    /**
     * 插入一条专利分类记录。
     *
     * @param params 包含专利信息的键值对
     *               - "patentName"：专利名称
     *               - "collaborator"：合作方名称
     *               - "operationType"：运营类型
     * @return 影响的行数（通常为 1）
     */
    int insertPatentClass(Map<String, Object> params);

    /**
     * 根据 id 删除专利信息
     *
     * @param id 主键 id
     */
    void deletePatentById(Long id);
    /**
     * 更新指定 id 的专利信息。
     *
     * @param id             专利记录的主键 ID。
     * @param patentName     专利名称（可选，传入 null 表示不更新）。
     * @param collaborator   合作方名称（可选，传入 null 表示不更新）。
     * @param operationType  运营类型（可选，传入 null 表示不更新）。
     */
    void updatePatentInfo(Long id, String patentName, String collaborator, String operationType);
    /**
     * 查询所有专利分类信息。
     *
     * @return 包含所有专利分类信息的列表，每条记录为一个 Map。
     */
    List<Map<String, Object>> getAllPatentClass();


    /**
     * 更新专利的动态字段
     *
     * @param id          主键 ID
     * @param field       要更新的字段名（如 NumberOne、NumberTwo）
     * @param fieldValue  字段的新值
     * @param countField  计数字段名（如 OneCount、TwoCount）
     * @param countValue  计数字段的新值
     * @return 是否更新成功
     */
    boolean updatePatentFields(Long id, String field, String fieldValue, String countField, Integer countValue);

    /**
     * 根据年份动态更新 patent_total 表中的字段。
     *
     * @param year   指定要更新的年份。
     * @param updates 包含需要更新的字段及其值的 Map。
     * @return 返回受影响的行数。
     */
    int updatePatentTotalByYear(String year, Map<String, Object> updates);

    /**
     * 更新专利统计表中的某个字段
     *
     * @param id    主键 ID
     * @param field 要更新的字段名
     * @param value 字段的新值
     */
    void updateField(Long id, String field, Object value);

    /**
     * 查询 patent_list 表的所有数据。
     *
     * @return 返回一个包含所有字段的 Map 列表。每个 Map 对应一行数据，键是字段名，值是字段对应的值。
     */
    List<Map<String, Object>> selectAllPatentList();

    /**
     * 查询 patent_statistics 表的所有数据。
     *
     * @return 返回一个包含所有字段的 Map 列表。每个 Map 对应一行数据，键是字段名，值是字段对应的值。
     */
    List<Map<String, Object>> selectAllPatentStatistics();

    /**
     * 获取2024年与2023年的专利统计数据对比。
     *
     * @return 返回包含统计结果的Map集合，其中键代表不同类型的统计数据（如total_2024, invention_2024等），
     *         值为对应的统计数值。
     */
    Map<String, Object> getPatentStatsComparison();

    /**
     * 获取专利授权总量和发明授权总量。
     *
     * 此方法通过调用底层的数据访问层（如PatentMapper），计算并返回所有专利记录中，
     * 已授权的专利数量以及属于发明专利且已授权的数量。
     *
     * @return 包含两个键值对的Map:
     *         - "totalpatentgranted" -> 所有类型的专利授权总量,
     *         - "totalinventiongranted" -> 发明专利授权总量.
     */
    Map<String, Object> getTotalAndInventionPatentGrantedCount();

    /**
     * 获取有效的和无效的专利记录总数。
     *
     * @return 包含有效和无效专利记录总数的结果 Map，键为 "valid_count" 和 "invalid_count"
     */
    Map<String, Integer> getPatentStatusCounts();
    /**
     * 统计 ipc_class 类别出现次数。
     *
     * @return 各类别出现次数的映射
     */
    Map<String, Integer> countIpcCategories();
    /**
     * 查询与山东建筑大学合作的前N个申请人及其专利申请数量，并返回总数。
     *
     * @return 包含申请人列表及其专利申请数量和总申请数量的Map
     */
    List<Map<String, Object>> findDistinctApplicantsWithShanDongJianZhu();

    /**
     * 查询所有专利信息
     *
     * @return 专利信息集合
     */
    public List<Patent> getAllPatents();


    List<Patent> selectPatentListByPatentQueryVo(PatentQueryVo patentQueryVo);
    // 获取专利总数
    int getCount();

    /**
     * 删除科技成果增删改查信息
     *
     * @param patentid 专利库增删改查主键
     * @return 结果
     */
    public int deletePatentByPatentid(Long patentid);

    /**
     * 查询发明人发明专利排名前六的专利数和专利人。
     * @return List<Map<String, Object>> 包含每个发明人的名称及其专利数量
     */
    List<Map<String, Object>> findTopSixInventors();


    /**
     * 获取每月的open_count和authorize_count。
     * @return List<Map<String, Object>> 每个Map代表一行结果，包含month, open_count, authorize_count字段。
     */
    List<Map<String, Object>> getMonthlyCounts();


    /**
     * 根据专利编号的后缀统计特定类型的专利数量。
     *
     * @param type 专利类型的标识符：
     *             - "A" 表示发明专利 (Invention Patent)
     *             - "U" 表示实用新型专利 (Utility Model Patent)
     *             - "S" 表示外观设计专利 (Design Patent)
     * @return 符合指定类型的专利数量
     */
    long countByType(String type);




}
