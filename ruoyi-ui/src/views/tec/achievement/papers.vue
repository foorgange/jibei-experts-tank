<template>
    <div class="app-container">
        <!-- 查询表单 -->
        <el-form :model="papersQueryVo" ref="queryForm" v-show="showSearch" label-width="100px">
            <el-row :gutter="20">
                <el-col :span="8">
                    <el-form-item label="导师名称" prop="supervisorName">
                        <el-input v-model="papersQueryVo.supervisorName" placeholder="请输入导师姓名" clearable size="small"
                            @keyup.enter.native="handleQuery" />
                    </el-form-item>
                </el-col>

                <el-col :span="8">
                    <el-form-item label="论文题目" prop="paperTitle">
                        <el-input v-model="papersQueryVo.paperTitle" placeholder="请输入论文题目" clearable size="small"
                            @keyup.enter.native="handleQuery" />
                    </el-form-item>
                </el-col>

                <el-col :span="8">
                    <el-form-item label="作者" prop="author">
                        <el-input v-model="papersQueryVo.author" placeholder="请输入作者姓名" clearable size="small"
                            @keyup.enter.native="handleQuery" />
                    </el-form-item>
                </el-col>

                <el-col :span="8">
                    <el-form-item label="发表期刊/会议" prop="publicationVenue">
                        <el-input v-model="papersQueryVo.publicationVenue" placeholder="请输入期刊或会议名" clearable
                            size="small" @keyup.enter.native="handleQuery" />
                    </el-form-item>
                </el-col>

                <el-col :span="8">
                    <el-form-item label="发表年份" prop="publishYear">
                        <el-input v-model.number="papersQueryVo.publishYear" placeholder="请输入年份" clearable size="small"
                            @keyup.enter.native="handleQuery" />
                    </el-form-item>
                </el-col>

                <el-col :span="8">
                    <el-form-item label="是否通讯/一作" prop="isCorrespondingFirstAuthor">
                        <el-input v-model="papersQueryVo.isCorrespondingFirstAuthor" placeholder="是否通讯/一作" clearable
                            size="small" @keyup.enter.native="handleQuery" />
                    </el-form-item>
                </el-col>

                <el-col :span="7">
                    <el-form-item label="EI/SCI" prop="eiSci">
                        <el-input v-model="papersQueryVo.eiSci" placeholder="如：SCI" clearable size="small"
                            @keyup.enter.native="handleQuery" />
                    </el-form-item>
                </el-col>

                <el-col :span="9">
                    <el-form-item label="导师所在研究所" label-width="150px" prop="instituteOfSupervisor">
                        <el-input v-model="papersQueryVo.instituteOfSupervisor" placeholder="请输入研究所名称" clearable
                            size="small" @keyup.enter.native="handleQuery" />
                    </el-form-item>
                </el-col>

                <el-col :span="8">
                    <el-form-item label="卷期号，页码" prop="volumeIssuePages">
                        <el-input v-model="papersQueryVo.volumeIssuePages" placeholder="请输入卷期号，页码" clearable
                            size="small" @keyup.enter.native="handleQuery" />
                    </el-form-item>
                </el-col>

                <el-col :span="8">
                    <el-form-item label="备注" prop="remarks">
                        <el-input v-model="papersQueryVo.remarks" placeholder="请输入备注" clearable size="small"
                            @keyup.enter.native="handleQuery" />
                    </el-form-item>
                </el-col>
            </el-row>
        </el-form>

        <!-- 操作按钮 -->
        <el-row :gutter="10" class="mb8">
            <el-col :span="1.5">
                <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
            </el-col>
            <el-col :span="1.5">
                <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
            </el-col>
        </el-row>

        <!-- 表格展示 -->
        <el-table v-loading="loading" :data="paperList" @selection-change="handleSelectionChange">
            <el-table-column label="论文题目" align="center" prop="paperTitle" show-overflow-tooltip />
            <el-table-column label="作者" align="center" prop="author" />
            <el-table-column label="发表期刊/会议" align="center" prop="publicationVenue" show-overflow-tooltip />
            <el-table-column label="卷期号页码" align="center" prop="volumeIssuePages" />
            <el-table-column label="发表年份" align="center" prop="publishYear" />
            <el-table-column label="是否通讯/一作" align="center" prop="isCorrespondingFirstAuthor" />
            <el-table-column label="收录类型" align="center" prop="eiSci" />
            <el-table-column label="导师名称" align="center" prop="supervisorName" />
            <el-table-column label="导师研究所" align="center" prop="instituteOfSupervisor" />
            <el-table-column label="备注" align="center" prop="remarks" show-overflow-tooltip />

            <el-table-column label="操作" align="center" width="120">
                <template slot-scope="scope">
                    <el-button size="mini" type="text" icon="el-icon-view" @click="handleShow(scope.row)">查看</el-button>
                    <el-button size="mini" type="text" icon="el-icon-delete"
                        @click="handleDelete(scope.row)">删除</el-button>
                </template>
            </el-table-column>
        </el-table>

        <!-- 查看详情弹窗 -->
        <el-dialog title="查看详情" :visible.sync="dialogVisible" width="60%" :before-close="handleClose">
            <el-form :model="currentRow" label-width="160px">
                <el-form-item label="论文题目">
                    <el-input v-model="currentRow.paperTitle" readonly></el-input>
                </el-form-item>
                <el-form-item label="作者">
                    <el-input v-model="currentRow.author" readonly></el-input>
                </el-form-item>
                <el-form-item label="发表期刊/会议">
                    <el-input v-model="currentRow.publicationVenue" readonly></el-input>
                </el-form-item>
                <el-form-item label="卷期号页码">
                    <el-input v-model="currentRow.volumeIssuePages" readonly></el-input>
                </el-form-item>
                <el-form-item label="发表年份">
                    <el-input v-model="currentRow.publishYear" readonly></el-input>
                </el-form-item>
                <el-form-item label="是否通讯/一作">
                    <el-input v-model="currentRow.isCorrespondingFirstAuthor" readonly></el-input>
                </el-form-item>
                <el-form-item label="收录类型">
                    <el-input v-model="currentRow.eiSci" readonly></el-input>
                </el-form-item>
                <el-form-item label="导师名称">
                    <el-input v-model="currentRow.supervisorName" readonly></el-input>
                </el-form-item>
                <el-form-item label="导师研究所">
                    <el-input v-model="currentRow.instituteOfSupervisor" readonly></el-input>
                </el-form-item>
                <el-form-item label="备注">
                    <el-input type="textarea" :rows="4" v-model="currentRow.remarks" readonly></el-input>
                </el-form-item>
            </el-form>
            <span slot="footer" class="dialog-footer">
                <el-button @click="dialogVisible = false">关闭</el-button>
            </span>
        </el-dialog>

        <!-- 分页组件 -->
        <pagination v-show="total > 0" :total="total" :page.sync="papersQueryVo.pageNum"
            :limit.sync="papersQueryVo.pageSize" @pagination="getListByPapersV" v-if="total !== 0" />
    </div>
</template>

<script>
import { deletePaper,listPaperVO } from '@/api/tec/papers';
export default {
    name: "Paper",
    data() {
        return {
            // 控制搜索区域显示
            showSearch: true,

            // 加载状态
            loading: false,

            // 当前选中行数据
            currentRow: {},

            // 弹窗显示控制
            dialogVisible: false,

            // 查询参数对象
            paperVO: {
                supervisorName: null,
                paperTitle: null,
                author: null,
                publicationVenue: null,
                publishYear: null,
                isCorrespondingFirstAuthor: null,
                eiSci: null,
                instituteOfSupervisor: null,
                pageNum: 1,
                pageSize: 10
            },

            // 表格数据
            paperList: [],

            // 总记录数
            total: 0,

            // 多选选中的数据
            selectedRows: [],

            papersQueryVo: {
                pageNum: 1, // 当前页码
                pageSize: 10, // 每页显示条数
                supervisorName: '', // 导师名称
                paperTitle: '', // 论文标题
                author: '', // 作者姓名
                publicationVenue: '', // 发表期刊/会议
                volumeIssuePages: '', // 卷期号，页码
                publishYear: null, // 发表年份
                isCorrespondingFirstAuthor: '', // 是否通讯/一作
                eiSci: '', // EI/SCI
                remarks: '', // 备注信息，例如中科院分区或CCF等级
                instituteOfSupervisor: '', // 导师所属的研究机构
                volumeIssuePages: '',
                remarks: '',


            },
        };
    },
    created() {
        this.getListByPapersV();
    },
    methods: {
        /** 获取论文列表 */
        getListByPapersV() {
            this.loading = true;
            listPaperVO(this.papersQueryVo).then(response => {
                if (response && response.rows) { // 假设后端返回包含 rows 的对象
                    this.paperList = response.rows;
                    this.total = response.total || response.rows.length; // 根据实际情况调整
                } else {
                    this.paperList = [];
                    this.total = 0;
                }
                this.loading = false;
            }).catch(error => {
                console.error('Failed to fetch paper list:', error);
                this.loading = false;
                this.paperList = [];
                this.total = 0;
            });
        },



        /**
         * 搜索事件
         */
        /** 搜索按钮操作 */
        handleQuery() {
            this.getListByPapersV();
        },

        /**
         * 重置查询条件
         */
        resetQuery() {
            this.$refs.queryForm.resetFields();
            this.handleQuery();
        },

        /**
         * 查看详情
         * @param row 行数据
         */
        handleShow(row) {
            this.currentRow = JSON.parse(JSON.stringify(row));
            this.dialogVisible = true;
        },

        /**
         * 删除事件
         * @param row 行数据
         */
        handleDelete(row) {
            // 显示确认弹窗
            this.$modal.confirm('是否确认删除本条论文？').then(() => {
                // 用户点击确定按钮后执行删除操作
                return deletePaper(row.id);
            }).then(() => {
                // 删除成功后的处理
                this.getListByPapersV(); // 刷新列表数据
                this.$modal.msgSuccess("删除成功"); // 显示成功消息
            }).catch((error) => {
                if (error !== 'cancel') {
                    // 如果不是用户取消操作，则可能是删除失败
                    console.error("删除操作失败", error); // 错误处理
                    this.$modal.msgError("删除失败，请重试"); // 显示错误消息给用户
                } else {
                    // 用户点击取消按钮后的处理
                    this.$message({
                        type: 'info',
                        message: '已取消删除'
                    });
                }
            });
        },

        /**
         * 多选事件
         * @param rows 已选中的行
         */
        handleSelectionChange(rows) {
            this.selectedRows = rows;
        },

        /**
         * 弹窗关闭前处理
         */
        handleClose(done) {
            this.$confirm('确认关闭？')
                .then(_ => {
                    done();
                })
                .catch(_ => { });
        }
    }
};
</script>

<style scoped>
.w1 {
    width: 200px;
}

.custom-label .el-form-item__label {
    width: 100px;
    white-space: normal;
    line-height: 1.5;
}
</style>