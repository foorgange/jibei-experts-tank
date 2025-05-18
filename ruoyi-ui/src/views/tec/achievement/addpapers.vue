<template>
    <div class="container">
        <div class="form-wrapper">
            <!-- 标题 -->
            <div class="header">
                <h3>论文基础信息</h3>
            </div>

            <!-- 表单 -->
            <el-form ref="form" :model="form" label-width="130px" size="medium">
                <el-form-item label="论文题目">
                    <el-input v-model="form.paperTitle" placeholder="请输入论文题目"></el-input>
                </el-form-item>

                <!-- 多个作者 -->
                <el-form-item label="作者">
                    <div v-for="(author, index) in form.authors" :key="index" class="dynamic-input">
                        <el-input v-model="form.authors[index]" placeholder="请输入作者姓名"
                            style="margin-bottom: 10px;"></el-input>
                        <el-button v-if="index === form.authors.length - 1" type="text" icon="el-icon-plus"
                            @click="addAuthor">增加</el-button>
                        <el-button v-else type="text" icon="el-icon-minus" @click="removeAuthor(index)">删除</el-button>
                    </div>
                </el-form-item>

                <el-form-item label="导师名称">
                    <el-input v-model="form.supervisorName" placeholder="请输入导师名称"></el-input>
                </el-form-item>
                <el-form-item label="发表期刊/会议">
                    <el-input v-model="form.publicationVenue" placeholder="请输入发表期刊/会议"></el-input>
                </el-form-item>
                <el-form-item label="卷期号，页码">
                    <el-input v-model="form.volumeIssuePages" placeholder="请输入卷期号，页码"></el-input>
                </el-form-item>
                <el-form-item label="发表年份">
                    <el-date-picker v-model="form.publishYear" type="year" placeholder="请选择年份" value-format="yyyy"
                        style="width: 100%"></el-date-picker>
                </el-form-item>
                <el-form-item label="是否通讯/一作">
                    <el-input v-model="form.isCorrespondingFirstAuthor" placeholder="是否通讯/一作"></el-input>
                </el-form-item>
                <el-form-item label="EI/SCI收录">
                    <el-input v-model="form.eiSci" placeholder="EI、SCI"></el-input>
                </el-form-item>
                <el-form-item label="备注">
                    <el-input v-model="form.remarks" type="textarea" :rows="4"
                        placeholder="备注（中科院分区或者CCF 分类）"></el-input>
                </el-form-item>
                <el-form-item label="导师所在研究所">
                    <el-input v-model="form.instituteOfSupervisor" placeholder="请输入导师所在研究所"></el-input>
                </el-form-item>

                <!-- 按钮 -->
                <div class="btn-group">
                    <el-button type="primary" @click="handleSubmit">提交</el-button>
                    <el-button @click="cancel">取消</el-button>
                </div>
            </el-form>
        </div>
    </div>
</template>

<script>
import { addPaper } from '@/api/tec/papers';
export default {
    name: 'PaperForm',
    data() {
        return {
            form: {
                paperTitle: '',
                authors: [''],
                supervisorName: '',
                publicationVenue: '',
                volumeIssuePages: '',
                publishYear: '',
                isCorrespondingFirstAuthor: '',
                eiSci: '',
                remarks: '',
                instituteOfSupervisor: ''
            }
        };
    },
    methods: {
        // 添加作者
        addAuthor() {
            this.form.authors.push('');
        },
        // 移除作者
        removeAuthor(index) {
            if (this.form.authors.length > 1) {
                this.form.authors.splice(index, 1);
            }
        },

        resetForm() {
            // 重置表单数据
            this.form = {
                paperTitle: '',
                authors: [''], // 注意这里保持至少一个空字符串以便用户可以立即开始添加作者
                supervisorName: '',
                publicationVenue: '',
                volumeIssuePages: '',
                publishYear: '',
                isCorrespondingFirstAuthor: '',
                eiSci: '',
                remarks: '',
                instituteOfSupervisor: ''
            };
        },
        // 提交表单
        // 提交表单
        async handleSubmit() {
            try {
                const payload = {};

                if (this.form.paperTitle) payload.paper_title = this.form.paperTitle;
                if (this.form.authors.some(a => a.trim())) payload.author = this.form.authors.filter(a => a.trim()).join(', ');
                if (this.form.supervisorName) payload.supervisor_name = this.form.supervisorName;
                if (this.form.publicationVenue) payload.publication_venue = this.form.publicationVenue;
                if (this.form.volumeIssuePages) payload.volume_issue_pages = this.form.volumeIssuePages;
                if (this.form.publishYear) payload.publish_year = this.form.publishYear;
                if (this.form.isCorrespondingFirstAuthor) payload.is_corresponding_first_author = this.form.isCorrespondingFirstAuthor;
                if (this.form.eiSci) payload.ei_sci = this.form.eiSci;
                if (this.form.remarks) payload.remarks = this.form.remarks;
                if (this.form.instituteOfSupervisor) payload.institute_of_supervisor = this.form.instituteOfSupervisor;

                // 使用封装好的 API 方法
                await addPaper(payload);


                this.$message.success('论文新增成功');
                // 清空输入框
                this.resetForm();
            } catch (error) {
                this.$message.error('论文新增失败，请检查输入或网络连接');
                console.error('提交失败:', error.response || error.message || error);
            }
        },
        // 取消操作
        cancel() {
            this.$router.go(-1); // 返回上一页
        },
        // 假设这是你用来发送请求的方法，需要根据实际情况调整
        addDynamicPaper(payload) {
            // 这里应替换为实际的API调用
            // 示例：return axios.post('/api/papers', payload);
        }
    }
};
</script>

<style scoped>
.container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    background-color: #f5f7fa;
}

.form-wrapper {
    width: 600px;
    padding: 24px;
    background: #fff;
    border-radius: 8px;
    box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
}

.header {
    text-align: center;
    margin-bottom: 20px;
}

.header h3 {
    font-size: 20px;
    font-weight: bold;
    color: #333;
}

.btn-group {
    display: flex;
    justify-content: center;
    margin-top: 20px;
}

.dynamic-input {
    display: flex;
    align-items: center;
    margin-bottom: 10px;
}

.dynamic-input .el-input {
    flex: 1;
    margin-right: 10px;
}
</style>