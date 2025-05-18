package com.jd.tecachieve.Utils;

import org.springframework.stereotype.Component;

import java.text.DecimalFormat;
import java.util.*;
import java.util.stream.Collectors;
@Component
public class PatentTrendAnalyzer {

    private static final DecimalFormat df = new DecimalFormat("0.00");

    // 领域编号与中文名称映射表
    private static final Map<String, String> FIELD_MAP = new HashMap<>();

    static {
        FIELD_MAP.put("1", "电子信息");
        FIELD_MAP.put("2", "先进制造");
        FIELD_MAP.put("3", "生物、医药和医疗器械");
        FIELD_MAP.put("4", "化工");
        FIELD_MAP.put("5", "纺织");
        FIELD_MAP.put("6", "新材料");
        FIELD_MAP.put("7", "新能源与高效节能");
        FIELD_MAP.put("8", "环境保护与资源综合利用");
        FIELD_MAP.put("9", "海洋");
        FIELD_MAP.put("10", "农业");
        FIELD_MAP.put("11", "现代交通");
        FIELD_MAP.put("12", "城市建设与社会发展");
        FIELD_MAP.put("13", "其它");
    }

    /**
     * 分析字段占比，并生成自然语言描述
     */
    /**
     * 分析字段占比，并生成自然语言描述（完全动态）
     */
    public Map<String, Object> analyzeFieldPercentages(List<Map<String, Object>> fieldCounts) {
        if (fieldCounts == null || fieldCounts.isEmpty()) {
            throw new IllegalArgumentException("输入数据不能为空");
        }

        int total = fieldCounts.stream()
                .mapToInt(f -> {
                    Object obj = f.get("count");
                    if (obj instanceof Number) {
                        return ((Number) obj).intValue();
                    } else if (obj instanceof String) {
                        try {
                            return Integer.parseInt((String) obj);
                        } catch (NumberFormatException e) {
                            return 0;
                        }
                    }
                    return 0;
                })
                .sum();

        List<Map<String, String>> percentages = new ArrayList<>();
        StringBuilder descriptionBuilder = new StringBuilder("在所有记录中，我们观察到如下领域分布情况：\n");

        // 添加总体趋势描述
        descriptionBuilder.append(String.format("本次分析涵盖了总共 %d 条记录。\n", total));

        // 分析每个领域
        for (Map<String, Object> item : fieldCounts) {
            String num = (String) item.get("num");

            Object countObj = item.get("count");
            int count = 0;
            if (countObj instanceof Number) {
                count = ((Number) countObj).intValue();
            } else if (countObj instanceof String) {
                try {
                    count = Integer.parseInt((String) countObj);
                } catch (NumberFormatException ignored) {}
            }

            double percentage = ((double) count / total) * 100;
            String fieldName = FIELD_MAP.getOrDefault(num, "未知领域");

            Map<String, String> entry = new HashMap<>();
            entry.put("field", fieldName);
            entry.put("percentage", df.format(percentage) + "%");
            percentages.add(entry);

            descriptionBuilder.append(String.format("%s领域占总数的%s（%d条记录）。\n", fieldName, df.format(percentage) + "%", count));
        }

        // 领域对比与趋势分析
        descriptionBuilder.append("\n领域对比与趋势分析：\n");
        Optional<Map<String, Object>> maxField = fieldCounts.stream().max(Comparator.comparingInt(f -> getIntValue(f.get("count"))));
        Optional<Map<String, Object>> minField = fieldCounts.stream().min(Comparator.comparingInt(f -> getIntValue(f.get("count"))));

        if(maxField.isPresent() && minField.isPresent()){
            String maxFieldName = FIELD_MAP.getOrDefault((String) maxField.get().get("num"), "未知领域");
            String minFieldName = FIELD_MAP.getOrDefault((String) minField.get().get("num"), "未知领域");

            descriptionBuilder.append(String.format("其中，占比最高的领域是%s，占据了%d条记录，占比为%s；而占比最低的是%s，仅有%d条记录，占比为%s。\n",
                    maxFieldName,
                    getIntValue(maxField.get().get("count")),
                    df.format(((double) getIntValue(maxField.get().get("count")) / total) * 100) + "%",
                    minFieldName,
                    getIntValue(minField.get().get("count")),
                    df.format(((double) getIntValue(minField.get().get("count")) / total) * 100) + "%"));

            // 对“其它”领域的特殊处理
            Optional<Map<String, Object>> otherField = fieldCounts.stream()
                    .filter(f -> "13".equals(f.get("num")))
                    .findFirst();
            if(otherField.isPresent()){
                descriptionBuilder.append(String.format("值得注意的是，“其它”领域占据了相当大的比例，达到了%d条记录，即总记录数的%s。\n",
                        getIntValue(otherField.get().get("count")),
                        df.format(((double) getIntValue(otherField.get().get("count")) / total) * 100) + "%"));
            }
        }

        // 结论与建议部分
        descriptionBuilder.append("\n结论与建议：\n");

        // 提取前三大热门领域
        List<Map<String, String>> top3Fields = percentages.stream()
                .sorted(Comparator.comparingDouble((Map<String, String> p) -> Double.parseDouble(p.get("percentage").replace("%", ""))).reversed())
                .limit(3)
                .collect(Collectors.toList());

        if (!top3Fields.isEmpty()) {
            StringBuilder topFieldsBuilder = new StringBuilder();
            for (int i = 0; i < top3Fields.size(); i++) {
                Map<String, String> field = top3Fields.get(i);
                if (i > 0) {
                    if (i == top3Fields.size() - 1 && top3Fields.size() > 1) {
                        topFieldsBuilder.append(" 和 ");
                    } else {
                        topFieldsBuilder.append("、");
                    }
                }
                topFieldsBuilder.append(field.get("field")).append("（").append(field.get("percentage")).append("）");
            }

            descriptionBuilder.append(String.format("根据以上分析，可以发现不同技术领域的发展并不均衡。%s 占据了较大份额，",
                    topFieldsBuilder.toString()));
        }

        // 检查是否存在“其它领域”
        Optional<Map<String, String>> otherFieldOpt = percentages.stream()
                .filter(p -> "其它".equals(p.get("field")))
                .findFirst();

        if (otherFieldOpt.isPresent()) {
            descriptionBuilder.append("此外，“其它领域”也占有一定比例，");
        }

        descriptionBuilder.append("这可能反映了当前科技发展的重点方向。建议对这些热门领域进行深入研究，同时也不要忽视其他领域的潜力和发展机会。\n");

        // 构建返回结果
        Map<String, Object> result = new HashMap<>();
        result.put("total", total);
        result.put("percentages", percentages);
        result.put("description", descriptionBuilder.toString());

        return result;
    }

    // 工具方法：安全获取整数值
    private int getIntValue(Object obj) {
        if (obj instanceof Number) {
            return ((Number) obj).intValue();
        } else if (obj instanceof String) {
            try {
                return Integer.parseInt((String) obj);
            } catch (NumberFormatException ignored) {}
        }
        return 0;
    }

    // 技术先进度等级对应的中文名称
    private static final Map<Integer, String> ADVANCEMENT_LEVEL_DESCRIPTION_MAP = new HashMap<>();

    static {
        ADVANCEMENT_LEVEL_DESCRIPTION_MAP.put(1, "国内领先");
        ADVANCEMENT_LEVEL_DESCRIPTION_MAP.put(2, "国内先进");
        ADVANCEMENT_LEVEL_DESCRIPTION_MAP.put(3, "国际领先");
        ADVANCEMENT_LEVEL_DESCRIPTION_MAP.put(4, "国际先进");
        ADVANCEMENT_LEVEL_DESCRIPTION_MAP.put(5, "其他");
        ADVANCEMENT_LEVEL_DESCRIPTION_MAP.put(6, "未定义级别");
    }

    /**
     * 分析技术先进度分布并返回自然语言描述
     *
     * @param rawData 原始数据列表，格式为 List<Map<String, Object>>，每个元素包含 level 和 count
     * @return 包含分析结果的 Map，包括 naturalDescription 和 percentageDetails
     */
    public Map<String, Object> analyzeAdvancementLevels(List<Map<String, Object>> rawData) {
        int total = rawData.stream().mapToInt(map -> ((Number) map.get("count")).intValue()).sum();

        // 筛选除 level=6 以外的数据用于占比计算
        List<Map<String, Object>> validData = rawData.stream()
                .filter(item -> !(((Number) item.get("level")).intValue() == 6))
                .collect(Collectors.toList());

        int validTotal = validData.stream()
                .mapToInt(item -> ((Number) item.get("count")).intValue())
                .sum();

        int undefinedCount = rawData.stream()
                .filter(item -> ((Number) item.get("level")).intValue() == 6)
                .mapToInt(item -> ((Number) item.get("count")).intValue())
                .sum();

        StringBuilder descriptionBuilder = new StringBuilder();
        descriptionBuilder.append("基于当前的技术先进度数据分析，以下是详细的结果：\n\n");

        if (undefinedCount > 0) {
            descriptionBuilder.append(String.format("在所有 %d 个项目中，共有 %d 个为未定义级别，这部分暂未参与具体等级划分。\n", total, undefinedCount));
        } else {
            descriptionBuilder.append(String.format("在所有 %d 个项目中，均已明确技术先进度等级。\n", total));
        }

        if (validTotal > 0) {
            descriptionBuilder.append(String.format("其余 %d 个项目按照技术先进度进行了分类，分布如下：\n\n", validTotal));

            for (Map<String, Object> item : validData) {
                Integer level = ((Number) item.get("level")).intValue();
                Integer count = ((Number) item.get("count")).intValue();
                double percentage = ((double) count / validTotal) * 100;
                String description = ADVANCEMENT_LEVEL_DESCRIPTION_MAP.getOrDefault(level, "未知");

                descriptionBuilder.append(String.format("- %s：%d 个，占比 %s%%\n", description, count, df.format(percentage)));
            }

            descriptionBuilder.append("\n其中，");

            // 找出最高占比的项（可能多个并列）
            double maxPercentage = validData.stream()
                    .mapToDouble(item -> ((double) ((Number) item.get("count")).intValue()) / validTotal * 100)
                    .max()
                    .orElse(0);

            List<String> topDescriptions = validData.stream()
                    .filter(item -> (((double) ((Number) item.get("count")).intValue()) / validTotal * 100) >= maxPercentage)
                    .map(item -> ADVANCEMENT_LEVEL_DESCRIPTION_MAP.getOrDefault(((Number) item.get("level")).intValue(), "未知"))
                    .distinct()
                    .collect(Collectors.toList());

            if (topDescriptions.size() == 1) {
                descriptionBuilder.append(String.format("%s 的项目占比最高，为 %.2f%%；", topDescriptions.get(0), maxPercentage));
            } else {
                descriptionBuilder.append(String.format("%s 并列占比最高，均为 %.2f%%；",
                        String.join("、", topDescriptions), maxPercentage));
            }

            // 找出最低占比的项
            Optional<Map<String, Object>> minItemOpt = validData.stream()
                    .min(Comparator.comparingDouble(item -> ((double) ((Number) item.get("count")).intValue()) / validTotal * 100));

            if (minItemOpt.isPresent()) {
                Integer minLevel = ((Number) minItemOpt.get().get("level")).intValue();
                Integer minCount = ((Number) minItemOpt.get().get("count")).intValue();
                double minPercentage = ((double) minCount / validTotal) * 100;
                String minDescription = ADVANCEMENT_LEVEL_DESCRIPTION_MAP.getOrDefault(minLevel, "未知");

                descriptionBuilder.append(String.format("而 %s 最少，仅占 %.2f%%。\n", minDescription, minPercentage));
            }


            descriptionBuilder.append("我们学校在国际领先方面仍有较大提升空间。建议加强对国际先进及领先方向的研发投入，");
            descriptionBuilder.append("推动更多成果迈向更高水平。\n");
        }

        // 构建返回值
        Map<String, Object> result = new HashMap<>();
        result.put("totalProjects", total);
        result.put("validProjects", validTotal);
        result.put("undefinedProjects", undefinedCount);
        result.put("naturalDescription", descriptionBuilder.toString());

        return result;
    }



    /**
     * 分析技术成熟度等级的数据并生成描述性报告。
     *
     * @param levelCounts 技术成熟度等级及其对应的数量（如：level=1, count=10）
     * @return 包含每个等级的百分比和详细自然语言描述的分析结果
     */
    public Map<String, Object> analyzeTechnologyLevel(List<Map<String, Object>> levelCounts) {
        // 计算总数
        long totalCount = levelCounts.stream()
                .mapToLong(entry -> ((Number) entry.get("count")).longValue())
                .sum();

        // 构建 analysisList 并填充每个等级的信息
        List<Map<String, String>> analysisList = new ArrayList<>();
        for (Map<String, Object> entry : levelCounts) {
            Integer level = ((Number) entry.get("technologyLevel")).intValue();
            Long count = ((Number) entry.get("count")).longValue();
            double percentage = (double) count / totalCount * 100;

            String description = getLevelDescription(level);
            Map<String, String> item = new HashMap<>();
            item.put("level", String.valueOf(level));
            item.put("count", String.valueOf(count));
            item.put("percentage", String.format("%.2f%%", percentage));
            item.put("description", description);

            analysisList.add(item);
        }

        // 生成详细描述文本
        String detailedDescription = generateDetailedDescription(analysisList, (int) totalCount);

        // 构造返回结果
        Map<String, Object> result = new HashMap<>();
        result.put("levels", analysisList);
        result.put("description", detailedDescription);

        return result;
    }

    /**
     * 根据技术成熟度等级编号返回中文描述
     */
    private String getLevelDescription(int level) {
        switch (level) {
            case 1: return "正在研发";
            case 2: return "已有样品";
            case 3: return "通过小试";
            case 4: return "通过中试";
            case 5: return "可以量产";
            case 6: return "其他";
            default: return "未知阶段";
        }
    }

    /**
     * 生成详细的自然语言描述
     */
    private String generateDetailedDescription(List<Map<String, String>> analysisList, int total) {
        StringBuilder sb = new StringBuilder();
        sb.append("在当前统计周期内，总共记录了").append(total).append("个技术项目。这些项目的成熟度分布如下：\n\n");

        for (Map<String, String> item : analysisList) {
            String levelDesc = item.get("description");
            int count = Integer.parseInt(item.get("count"));
            String percentage = item.get("percentage");

            sb.append(levelDesc).append("：共有").append(count).append("个项目处于这一阶段，占比为").append(percentage);

            switch (levelDesc) {
                case "正在研发":
                    sb.append("。这表明有相对较小比例的技术项目目前还处在初期的研发阶段，它们可能还在探索关键技术或验证概念。\n");
                    break;
                case "已有样品":
                    sb.append("。这意味着这些项目已经完成了初步的设计，并制造出了原型产品，接下来可能会进行进一步的测试与优化。\n");
                    break;
                case "通过小试":
                    sb.append("。这类项目已经通过了实验室规模的小型试验，证明其具备一定的可行性，是技术从理论走向实践的重要一步。\n");
                    break;
                case "通过中试":
                    sb.append("。这类项目已经通过了中等规模的试验，标志着技术方案趋于稳定，为后续的大规模生产奠定了基础。\n");
                    break;
                case "可以量产":
                    sb.append("。这说明有相当一部分的技术项目已经具备了大规模生产的条件，预示着这些技术即将进入市场或者已经开始商业化应用。\n");
                    break;
                case "其他":
                    sb.append("。这部分可能包括那些不适合上述分类或者正处于特殊发展阶段的项目。\n");
                    break;
                default:
                    sb.append("。\n");
            }
        }

        // 添加动态总结语句
        String dynamicSummary = generateDynamicSummary(analysisList, total);
        sb.append(dynamicSummary);

        return sb.toString();
    }

    /**
     * 动态生成总结语句，根据数据突出主要趋势
     */
    private String generateDynamicSummary(List<Map<String, String>> analysisList, int total) {
        Map<String, Integer> summary = new HashMap<>();
        for (Map<String, String> item : analysisList) {
            int count = Integer.parseInt(item.get("count"));
            summary.put(item.get("description"), count);
        }

        List<Map.Entry<String, Integer>> sorted = new ArrayList<>(summary.entrySet());
        sorted.sort(Map.Entry.comparingByValue(Comparator.reverseOrder()));

        StringBuilder sb = new StringBuilder("总体来看，");
        if (sorted.isEmpty()) {
            sb.append("暂无技术项目数据可供分析。");
        } else {
            Map.Entry<String, Integer> top = sorted.get(0);
            double ratio = (double) top.getValue() / total;

            if (ratio > 0.5) {
                sb.append(top.getKey()).append("阶段的技术项目占据绝对主导地位，占比超过50%，说明技术整体尚处于早期或集中于某一特定阶段。\n");
            } else if (ratio > 0.3) {
                sb.append(top.getKey()).append("阶段的技术项目占比较大，说明该阶段是当前技术研发的主要集中点。\n");
            } else {
                sb.append("各阶段技术项目分布较为均衡，表明技术研发处于多阶段同步推进的状态。\n");
            }
        }

        sb.append("建议结合具体业务背景，对重点阶段加强资源投入或推动转化落地，以加快技术成果的应用进程。");

        return sb.toString();
    }

    /**
     * 输入原始IPC类别数量数据，返回包含比例、总数量以及自然语言描述的结果对象。
     *
     * @param ipcCounts 原始IPC分类数量 Map（例如：{"A": 511, "B": 1381, ...}）
     * @return 包含总数、比例和自然语言描述的分析结果
     */
    public static AnalysisResult analyzeIpcProportions(Map<String, Integer> ipcCounts) {
        int total = ipcCounts.values().stream().mapToInt(Integer::intValue).sum();
        Map<String, Double> proportions = calculateProportions(ipcCounts, total);
        String description = generateDescription(ipcCounts, total, proportions);
        return new AnalysisResult(total, proportions, description);
    }

    /**
     * 计算每个IPC类别的占比。
     */
    private static Map<String, Double> calculateProportions(Map<String, Integer> ipcCounts, int total) {
        Map<String, Double> proportions = new LinkedHashMap<>();
        for (Map.Entry<String, Integer> entry : ipcCounts.entrySet()) {
            double proportion = ((double) entry.getValue() / total) * 100;
            // 使用 DecimalFormat 格式化为两位小数
            double rounded = Double.parseDouble(df.format(proportion));
            proportions.put(entry.getKey(), rounded);
        }
        return proportions;
    }

    /**
     * 生成自然语言描述文本
     */
    private static String generateDescription(Map<String, Integer> ipcCounts, int total, Map<String, Double> proportions) {
        StringBuilder sb = new StringBuilder();
        sb.append("在总共").append(total).append("项专利中，");

        // 找出最大值和最小值对应的键
        Map.Entry<String, Double> maxEntry = getMax(proportions);
        Map.Entry<String, Double> minEntry = getMin(proportions);
        List<Map.Entry<String, Double>> sortedList = getSortedProportionsDesc(proportions);

        // 构建前几高的描述
        sb.append(maxEntry.getKey()).append("类占比最高，达到").append(maxEntry.getValue()).append("%，远超其他类别；");
        sb.append("其次是");

        for (int i = 1; i < Math.min(3, sortedList.size()); i++) {
            Map.Entry<String, Double> entry = sortedList.get(i);
            sb.append(entry.getKey()).append("类（").append(entry.getValue()).append("%）");
            if (i < 2 && i < sortedList.size() - 1) {
                sb.append("和");
            }
        }

        sb.append("。");
        sb.append(minEntry.getKey()).append("类最少，仅占").append(minEntry.getValue()).append("%。");

        // 描述其余类别
        sb.append("其余类别如");
        for (Map.Entry<String, Double> entry : proportions.entrySet()) {
            boolean isTop = sortedList.subList(0, Math.min(3, sortedList.size())).contains(entry);
            if (!isTop) {
                sb.append(entry.getKey()).append("类（").append(entry.getValue()).append("%）、");
            }
        }

        if (sb.charAt(sb.length() - 1) == '、') {
            sb.delete(sb.length() - 1, sb.length());
        }

        sb.append("分布较为均衡，但整体仍不及前三大类。");
        sb.append("这说明当前专利数据中，").append(maxEntry.getKey())
                .append("类（可能为物理或信息技术领域）占据主导地位，而")
                .append(minEntry.getKey()).append("类（纺织、造纸等）应用较少。");

        return sb.toString();
    }

    /**
     * 获取占比最高的条目
     */
    private static Map.Entry<String, Double> getMax(Map<String, Double> map) {
        return map.entrySet()
                .stream()
                .max(Map.Entry.comparingByValue())
                .orElseThrow(() -> new IllegalStateException("未找到最大值条目"));
    }

    /**
     * 获取占比最低的条目
     */
    private static Map.Entry<String, Double> getMin(Map<String, Double> map) {
        return map.entrySet()
                .stream()
                .min(Map.Entry.comparingByValue())
                .orElseThrow(() -> new IllegalStateException("未找到最小值条目"));
    }

    /**
     * 返回按比例降序排列的列表
     */
    private static List<Map.Entry<String, Double>> getSortedProportionsDesc(Map<String, Double> map) {
        return map.entrySet()
                .stream()
                .sorted(Collections.reverseOrder(Map.Entry.comparingByValue()))
                .collect(Collectors.toList());
    }

    /**
     * 分析结果包装类
     */
    public static class AnalysisResult {
        private final int total;
        private final Map<String, Double> proportions;
        private final String description;

        public AnalysisResult(int total, Map<String, Double> proportions, String description) {
            this.total = total;
            this.proportions = proportions;
            this.description = description;
        }

        public int getTotal() {
            return total;
        }

        public Map<String, Double> getProportions() {
            return proportions;
        }

        public String getDescription() {
            return description;
        }

        @Override
        public String toString() {
            return "AnalysisResult{" +
                    "total=" + total +
                    ", proportions=" + proportions +
                    ", description='" + description + '\'' +
                    '}';
        }
    }



    /**
     * 分析各学院的申请数量并返回结构化结果及自然语言描述
     *
     * @param rawData 原始数据：包含 college 字段和 count 字段的 Map 列表
     * @return 包含统计数据和自然语言分析的结果 Map
     */
    public static Map<String, Object> analyzeCollegeApplications(List<Map<String, Object>> rawData) {
        // 学院编号到名称的映射
        Map<String, String> collegeNameMap = createCollegeNameMapping();

        // 总申请数量（使用 long 避免 Long 转 Integer 异常）
        long totalCount = rawData.stream()
                .mapToLong(map -> ((Number) map.get("count")).longValue())
                .sum();

        // 构建包含中文名、百分比的数据列表
        List<Map<String, Object>> collegeList = new ArrayList<>();
        for (Map<String, Object> item : rawData) {
            String collegeCode = (String) item.get("college");
            Long count = ((Number) item.get("count")).longValue(); // 安全获取为 long
            String collegeName = collegeNameMap.getOrDefault(collegeCode, "未知学院");

            double percentage = totalCount > 0 ? ((double) count / totalCount) * 100 : 0;

            Map<String, Object> detail = new HashMap<>();
            detail.put("college_code", collegeCode);
            detail.put("college_name", collegeName);
            detail.put("count", count);
            detail.put("percentage", Double.parseDouble(df.format(percentage)));
            collegeList.add(detail);
        }

        // 按照申请数量降序排序
        collegeList.sort((a, b) -> Long.compare((Long) b.get("count"), (Long) a.get("count")));

        // 添加排名字段
        for (int i = 0; i < collegeList.size(); i++) {
            collegeList.get(i).put("rank", i + 1);
        }

        // 构造自然语言分析
        String analysisText = buildNaturalLanguageAnalysis(totalCount, collegeList);

        // 构造返回结果
        Map<String, Object> result = new HashMap<>();
        result.put("total_applications", totalCount);
        result.put("college_statistics", collegeList);
        result.put("analysis", analysisText);

        return result;
    }

    /**
     * 创建学院编号到中文名称的映射表
     */
    private static Map<String, String> createCollegeNameMapping() {
        Map<String, String> map = new HashMap<>();
        map.put("1", "计算机学院");
        map.put("2", "法学院");
        map.put("3", "土木学院");
        map.put("4", "管理学院");
        map.put("5", "热能学院");
        map.put("6", "市政学院");
        map.put("7", "建筑学院");
        map.put("8", "材料学院");
        map.put("9", "交通学院");
        map.put("10", "商学院");
        map.put("11", "理学院");
        map.put("13", "外国语学院");
        map.put("14", "马克思学院");
        map.put("15", "测绘学院");
        map.put("16", "信电学院");
        map.put("17", "机电学院");
        return map;
    }

    /**
     * 根据统计数据生成自然语言分析文本
     */
    private static String buildNaturalLanguageAnalysis(long totalApplication, List<Map<String, Object>> collegeList) {
        StringBuilder analysis = new StringBuilder();

        // 总体统计信息
        analysis.append("当前共有 ").append(totalApplication).append(" 条申请记录，分布在 ").append(collegeList.size()).append(" 个学院中。\n\n");

        // 找出最高申请量的学院
        long maxCount = (Long) collegeList.get(0).get("count");
        List<String> topColleges = new ArrayList<>();
        for (Map<String, Object> college : collegeList) {
            if ((Long) college.get("count") == maxCount) {
                topColleges.add((String) college.get("college_name"));
            }
        }
        if (topColleges.size() == 1) {
            analysis.append("其中，").append(topColleges.get(0)).append("申请数量最多，共计 ").append(maxCount).append(" 条，占比约为 ")
                    .append(df.format((Double) collegeList.get(0).get("percentage"))).append("%。\n");
        } else {
            analysis.append("其中，").append(String.join("、", topColleges)).append("并列申请数量最多，均为 ").append(maxCount)
                    .append(" 条，各自占比约 ").append(df.format((Double) collegeList.get(0).get("percentage"))).append("%。\n");
        }

        // 找出最低申请量的学院
        long minCount = (Long) collegeList.get(collegeList.size() - 1).get("count");
        List<String> bottomColleges = new ArrayList<>();
        for (Map<String, Object> college : collegeList) {
            if ((Long) college.get("count") == minCount) {
                bottomColleges.add((String) college.get("college_name"));
            }
        }
        if (bottomColleges.size() == 1) {
            analysis.append(bottomColleges.get(0)).append("申请数量最少，仅为 ").append(minCount).append(" 条，占比约为 ")
                    .append(df.format((Double) collegeList.get(collegeList.size() - 1).get("percentage"))).append("%。\n");
        } else {
            analysis.append(String.join("、", bottomColleges)).append("并列申请数量最少，均为 ").append(minCount)
                    .append(" 条，各自占比约 ").append(df.format((Double) collegeList.get(collegeList.size() - 1).get("percentage"))).append("%。\n");
        }

        analysis.append("\n以下是按申请数量从高到低排列的各学院统计详情：\n");

        // 学院详细统计信息（格式对齐）
        int maxNameLength = 0;
        for (Map<String, Object> college : collegeList) {
            maxNameLength = Math.max(maxNameLength, ((String) college.get("college_name")).length());
        }

        for (int i = 0; i < collegeList.size(); i++) {
            Map<String, Object> college = collegeList.get(i);
            String name = (String) college.get("college_name");
            Long count = (Long) college.get("count");
            Double percentage = (Double) college.get("percentage");

            // 使用固定长度字段对齐（例如左对齐+15字符宽度）
            analysis.append(String.format("%2d. %-15s: %4d 条申请，占比 %6s%%",
                    (i + 1), name, count, df.format(percentage)));
            analysis.append("\n");
        }

        return analysis.toString();
    }

    public static String generateQuarterlyTrendSummary(List<Map<String, Object>> data) {
        if (data == null || data.isEmpty()) {
            return "没有可用的数据进行趋势分析。";
        }

        Map<Integer, Integer[]> yearlyQuarters = new TreeMap<>();
        for (Map<String, Object> entry : data) {
            try {
                int year = Integer.parseInt((String) entry.get("year"));
                int month = Integer.parseInt((String) entry.get("month"));
                int count = ((Number) entry.get("count")).intValue();

                int quarterIndex = (month - 1) / 3;
                yearlyQuarters.putIfAbsent(year, new Integer[]{0, 0, 0, 0});
                yearlyQuarters.get(year)[quarterIndex] += count;
            } catch (Exception e) {
                continue;
            }
        }

        if (yearlyQuarters.isEmpty()) {
            return "没有有效的年份和季度数据可用于趋势分析。";
        }

        StringBuilder summary = new StringBuilder();
        summary.append("以下是专利申请趋势分析：\n");

        List<Integer> years = new ArrayList<>(yearlyQuarters.keySet());
        Integer lastYearTotal = null;

        // 存储每年的总量，用于后续总统计分析
        Map<Integer, Integer> yearlyTotals = new LinkedHashMap<>();

        for (int i = 0; i < years.size(); i++) {
            Integer year = years.get(i);
            Integer[] quarters = yearlyQuarters.get(year);

            summary.append(year).append("年的季度趋势分析如下：");

            boolean isIncreasingYear = true;
            boolean isDecreasingYear = true;
            for (int j = 1; j < 4; j++) {
                if (quarters[j] <= quarters[j - 1]) isIncreasingYear = false;
                if (quarters[j] >= quarters[j - 1]) isDecreasingYear = false;
            }

            if (isIncreasingYear) {
                summary.append(" 各季度呈持续增长趋势。");
            } else if (isDecreasingYear) {
                summary.append(" 各季度呈持续下降趋势。");
            } else {
                summary.append(" 季度间出现波动。");
                calculateFluctuationDetails(summary, quarters);
            }

            int totalThisYear = Arrays.stream(quarters).mapToInt(q -> q).sum();
            yearlyTotals.put(year, totalThisYear); // 记录每年总申请量

            if (i > 0) {
                Integer prevYear = years.get(i - 1);
                boolean isConsecutiveYear = (year - prevYear) == 1;

                if (!isConsecutiveYear) {
                    summary.append(" 与上一年相比，申请量未作比较（无历史数据）。");
                } else {
                    int prevYearTotal = lastYearTotal;

                    if (prevYearTotal == 0 && totalThisYear > 0) {
                        summary.append(" 与上一年相比，申请量显著增加（上一年无数据）。");
                    } else if (prevYearTotal == 0 && totalThisYear == 0) {
                        summary.append(" 与上一年相比，申请量保持稳定（均为零）。");
                    } else {
                        double changeRatio = ((double) totalThisYear - prevYearTotal) / prevYearTotal * 100;
                        summary.append(String.format(" 与上一年相比，申请量%s%.2f%%。",
                                totalThisYear > prevYearTotal ? "增加" : "减少",
                                Math.abs(changeRatio)));
                    }
                }
            } else {
                summary.append(" 与上一年相比，申请量未作比较（无历史数据）。");
            }

            summary.append("\n");
            lastYearTotal = totalThisYear;
        }

        // 新增全局统计信息（只考虑连续年份的增长）
        if (!years.isEmpty()) {
            int allYearsTotal = yearlyTotals.values().stream().mapToInt(Integer::intValue).sum();
            double averageAnnualCount = (double) allYearsTotal / years.size();
            Integer maxYear = Collections.max(yearlyTotals.entrySet(), Map.Entry.comparingByValue()).getKey();
            Integer minYear = Collections.min(yearlyTotals.entrySet(), Map.Entry.comparingByValue()).getKey();
            int maxCount = yearlyTotals.get(maxYear);
            int minCount = yearlyTotals.get(minYear);

            Integer fastestGrowingYear = null;
            double maxGrowthRate = Double.NEGATIVE_INFINITY;

            Integer prevYear = null;
            Integer prevTotal = null;

            for (int i = 0; i < years.size(); i++) {
                Integer currentYear = years.get(i);
                Integer currentTotal = yearlyTotals.get(currentYear);

                if (prevYear != null && prevTotal != null && prevTotal > 0 &&
                        (currentYear - prevYear == 1)) {
                    double growthRate = ((double) currentTotal - prevTotal) / prevTotal * 100;
                    if (growthRate > maxGrowthRate) {
                        maxGrowthRate = growthRate;
                        fastestGrowingYear = currentYear;
                    }
                }

                prevYear = currentYear;
                prevTotal = currentTotal;
            }

            summary.append("\n【整体趋势总结】\n");
            summary.append(String.format("所有年份的专利申请总量为：%d。\n", allYearsTotal));
            summary.append(String.format("平均每年申请量约为 %.2f 件。\n", averageAnnualCount));
            summary.append(String.format("专利申请量最多的年份是 %d 年，共 %d 件。\n", maxYear, maxCount));
            summary.append(String.format("专利申请量最少的年份是 %d 年，共 %d 件。\n", minYear, minCount));
            if (fastestGrowingYear != null) {
                summary.append(String.format("增长最快的年份是 %d 年，同比增长 %.2f%%。\n", fastestGrowingYear, maxGrowthRate));
            }
        }

        return summary.toString();
    }

    private static void calculateFluctuationDetails(StringBuilder summary, Integer[] quarters) {
        for (int i = 1; i < 4; i++) {
            int prev = quarters[i - 1];
            int curr = quarters[i];

            if (prev == 0 && curr == 0) {
                summary.append(" Q").append(i).append("到Q").append(i + 1).append("无变化;");
            } else if (prev == 0) {
                summary.append(" Q").append(i).append("到Q").append(i + 1).append("增长100%以上;");
            } else {
                double fluctuationRatio = ((double) curr - prev) / prev * 100;
                summary.append(String.format(" Q%d到Q%d变化%s%%;", i, i + 1, formatPercentage(fluctuationRatio)));
            }
        }
    }

    private static String formatPercentage(double value) {
        if (Double.isInfinite(value) || Double.isNaN(value)) {
            return "未知";
        }
        return df.format(value);
    }


    /**
     * 根据合作方式统计数据生成自然语言描述
     *
     * @param data  合作方式数据列表，包含 value, name, count, percentage
     * @param total 总数量
     * @return 完整描述字符串
     */
    public static String generateCooperationDescription(List<Map<String, Object>> data, long total) {
        if (data == null || data.isEmpty()) {
            return "暂无合作方式相关数据可供分析。";
        }

        StringBuilder sb = new StringBuilder();
        sb.append("当前数据显示了不同合作方式的数量分布及占比情况。");

        // 分离 “其他” 和 非“其他”
        List<Map<String, Object>> rankedData = new ArrayList<>();
        Map<String, Object> otherItem = null;

        for (Map<String, Object> item : data) {
            if ("9".equals(item.get("value"))) { // 假设 value=9 表示“其他”
                otherItem = item;
            } else {
                rankedData.add(item);
            }
        }

        // 按数量从高到低排序（仅非“其他”项）
        rankedData.sort((a, b) -> Long.compare((Long) b.get("count"), (Long) a.get("count")));

        // 生成前几个项的描述
        for (int i = 0; i < rankedData.size(); i++) {
            Map<String, Object> item = rankedData.get(i);
            String name = (String) item.get("name");
            Long count = (Long) item.get("count");
            Double percentage = (Double) item.get("percentage");

            if (percentage == null || Double.isNaN(percentage) || Double.isInfinite(percentage)) {
                percentage = 0.0;
            }

            if (i == 0) {
                sb.append(String.format("其中，%s以最多数量%d条占据了整体的%.2f%%，是目前最为常见的合作形式；", name, count, percentage));
            } else if (i == 1) {
                sb.append(String.format("其次是%s，共%d条，占比%.2f%%；", name, count, percentage));
            } else {
                sb.append(String.format("%s占比%.2f%%；", name, percentage));
            }
        }

        // 单独处理“其他”
        if (otherItem != null) {
            String name = (String) otherItem.get("name");
            Double percentage = (Double) otherItem.get("percentage");

            if (percentage == null || Double.isNaN(percentage) || Double.isInfinite(percentage)) {
                percentage = 0.0;
            }

            sb.append(String.format("另外，“%s”占比%.2f%%；", name, percentage));
        }

        // 获取前三名的名称（动态）
        List<String> top3Names = new ArrayList<>();
        for (int i = 0; i < Math.min(3, rankedData.size()); i++) {
            top3Names.add((String) rankedData.get(i).get("name"));
        }

        // 构建前三名合计占比部分
        long top3Count = rankedData.stream()
                .limit(3)
                .mapToLong(map -> (Long) map.get("count"))
                .sum();

        double top3Percentage = total > 0 ? Math.round((double) top3Count / total * 10000) / 100.0 : 0.0;

        // 动态拼接前三名名称
        String top3Str;
        if (top3Names.size() == 1) {
            top3Str = top3Names.get(0);
        } else if (top3Names.size() == 2) {
            top3Str = top3Names.get(0) + "和" + top3Names.get(1);
        } else if (top3Names.size() >= 3) {
            top3Str = top3Names.get(0) + "、" + top3Names.get(1) + "以及" + top3Names.get(2);
        } else {
            top3Str = "若干主要合作方式";
        }

        sb.append(String.format("总体来看，%s是当前主要的合作方式，合计占比超过%.2f%%。", top3Str, top3Percentage));

        return sb.toString();
    }


   }