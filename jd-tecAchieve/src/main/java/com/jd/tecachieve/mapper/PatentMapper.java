package com.jd.tecachieve.mapper;

import com.jd.tecachieve.domain.Patent;
import com.jd.tecachieve.domain.PatentCountByMonth;
import com.jd.tecachieve.vo.PatentQueryVo;
import org.apache.ibatis.annotations.MapKey;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface PatentMapper {

    /**
     * 根据专利名称查询专利信息
     *
     * 注意：
     * - 使用 XML 中的 selectPatentByName 查询数据库
     * - 返回值类型为 Map<String, Object>，因为 XML 中使用的是 <resultMap id="map" type="map"/>
     * - 数据库字段名会作为 key，值作为 value 返回
     *
     * @param patentName 需要查询的专利名称
     * @return 包含专利所有字段的 Map 对象，如果未找到则返回 null
     */
    Map<String, Object> selectPatentByName(@Param("patentName") String patentName);

    /**
     * 根据发明人查询专利信息
     * @param inventorName 发明人的名称（从前端传入）
     * @return 包含符合条件的专利信息列表
     */
    List<Patent> selectPatentsByInventor(@Param("inventorName") String inventorName);


    /**
     * 根据发明人名称，统计其所有专利中 IPC 分类号的首字母分布。
     *
     * @param inventorName 发明人名称
     * @return 首字母及对应数量的 Map 列表（每个 Map 是 {first_letter=..., count=...}）
     */
    @MapKey("first_letter,count")
    List<Map<String, Object>> countIpcFirstLettersByInventor(@Param("inventorName") String inventorName);

    /**
     * 统计指定发明人每年的专利申请数量
     *
     * @return 每年的专利申请数量列表
     */
    List<Map<String, Object>> countPatentsByInventorGroupByYear(String inventorName);

    /**
     * 查询每年每月的专利申请数量。
     *
     * 对应 XML 文件中的 <select id="countPatentsByYearMonth"> 标签。
     * 执行该方法将返回一个包含年份、月份和专利数量的 Map 列表。
     *
     *
     * @return 包含年、月和对应专利数量的 Map 列表
     */
    List<Map<String, Object>> countPatentsByYearMonth();

    /**
     * 动态插入专利信息
     *
     * @param params 包含所有字段的Map对象
     * @return 插入成功后返回受影响行数
     */
    int insertPatent(Map<String, Object> params);

    /**
     * 插入一条专利统计数据
     *
     * @param params 包含字段值的 Map 对象
     */
    void insertPatentTotal(Map<String, Object> params);


    /**
     * 插入一条专利分类记录到 patent_class 表中。
     *
     * @param params 包含专利信息的键值对
     *               - "patentName"：专利名称
     *               - "collaborator"：合作方名称
     *               - "operationType"：运营类型
     * @return 影响的行数（通常为 1）
     */
    int insertPatentClass(Map<String, Object> params);

    /**
     * 根据 id 删除对应行
     *
     * @param id 主键 id
     * @return 影响的行数
     */
    int deleteById(Long id);

    /**
     * 根据 id 修改 patent_class 表中的字段。
     *
     * @param params 参数 Map，包含需要更新的字段和 id。
     *               - id: 主键，用于定位需要修改的记录。
     *               - patent_name: 专利名称（可选）。
     *               - collaborator: 合作方名称（可选）。
     *               - operation_type: 运营类型（可选）。
     * @return 影响的行数（即更新了多少条记录）。
     */
    int updateByPatentClassId(@Param("params") Map<String, Object> params);

    /**
     * 查询 patent_class 表的所有数据。
     *
     * @return 包含所有专利分类信息的列表，每条记录为一个 Map。
     *         Map 的键为字段名（如 "id", "patentName"），值为对应的字段值。
     */
    List<Map<String, Object>> selectAllPatentClass();

    /**
     * 动态更新字段
     *
     * @param id          主键 ID
     * @param field       要更新的字段名（如 NumberOne、NumberTwo）
     * @param fieldValue  字段的新值
     * @param countField  计数字段名（如 OneCount、TwoCount）
     * @param countValue  计数字段的新值
     * @return 影响的行数
     */
    int updateDynamicFields(@Param("id") Long id,
                            @Param("field") String field,
                            @Param("fieldValue") String fieldValue,
                            @Param("countField") String countField,
                            @Param("countValue") Integer countValue);
    /**
     * 根据年份动态更新 patent_total 表中的字段。
     *
     * @param year   指定要更新的年份（对应表中的 year 字段）。
     * @param updates 包含需要更新的字段及其值的 Map。
     *                - key: 字段名（如 "transfers", "licenses" 等）。
     *                - value: 字段对应的值。
     * @return 返回受影响的行数。
     */
    int updatePatentTotalByYear(@Param("year") String year, @Param("updates") Map<String, Object> updates);
    /**
     * 更新 patent_statistics 表中的指定字段
     *
     * @param params 包含 "id", "field", "value" 的 Map
     * @return 影响的行数
     */
    int updatePatentStatistics(Map<String, Object> params);

    /**
     * 查询 patent_list 表的所有数据。
     *
     * @return 返回一个包含所有字段的 Map 列表。每个 Map 对应一行数据，键是字段名，值是字段对应的值。
     *
     */
    List<Map<String, Object>> selectAllPatentList();

    /**
     * 查询 patent_statistics 表的所有数据。
     *
     * @return 返回一个包含所有字段的 Map 列表。每个 Map 对应一行数据，键是字段名，值是字段对应的值。
     *
     */
    List<Map<String, Object>> selectAllPatentStatistics();

    /**
     * 获取2024年与2023年的专利统计数据对比。
     *
     * @return 返回包含统计结果的Map集合
     */
    Map<String, Object> getPatentStatsComparison();

    /**
     * 查询专利授权总量和发明授权总量
     * @return 包含两个键值对的Map: "totalpatentgranted" -> 专利授权总量, "totalinventiongranted" -> 发明授权总量
     */
    Map<String, Object> countTotalAndInventionPatentGranted();

    /**
     * 根据查询条件获取专利列表
     */
    List<Patent> selectPatentList(PatentQueryVo queryVo);

    List<Patent> selectPatentListByPatentQueryVo(PatentQueryVo patentQueryVo);

    /**
     * 删除专利增删改查
     *
     * @param patentid 科技成果增删改查主键
     * @return 结果
     */
    public int deletePatentByPatentid(Long patentid);

    /**
     * 获取所有专利信息。
     *
     * @return List<Map<String, Object>> 所有专利记录的列表
     */
    List<Map<String, Object>> selectAllPatents();

    /**
     * 查找与“山东建筑大学”无关的申请人，并按申请人出现次数降序排列，返回前5位。
     *
     * @return List<Map<String, Object>> 包含申请人名称及其计数的映射列表
     */
    List<Map<String, Object>> findDistinctApplicantsWithShanDongJianZhu();
    /**
     * 查找所有的 ipc_class 数据。
     *
     * @return 所有的 ipc_class 数据
     */
    List<Map<String, Object>> findAllIpcClasses();


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
    long countByPublicationNumberEndingWith(@Param("type") String type);


    /**
     * 查询有效的和无效的专利记录总数。
     *
     * @return 包含有效和无效专利记录总数的结果 Map，键为 "valid_count" 和 "invalid_count"
     */
    Map<String, Object> getPatentStatusCounts();



}
