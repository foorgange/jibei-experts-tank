<template>
  <el-card>
    <el-tabs v-model="activeName">
      <el-tab-pane label="基本信息" name="basic">
        <basic-info-form ref="basicInfo" :info="info" />
      </el-tab-pane>
      <el-tab-pane label="字段信息" name="columnInfo">
        <el-table ref="dragTable" :data="columns" row-key="columnId" :max-height="tableHeight" style="width: 100%">
          <el-table-column label="序号" type="index" min-width="50" class-name="allowDrag" :key="Math.random()" fixed />
          <el-table-column
            fixed
            label="字段列名"
            prop="columnName"
            min-width="150"
            :show-overflow-tooltip="true"
            :key="Math.random()"
          />
          <el-table-column label="字段描述" min-width="150" :key="Math.random()">
            <template slot-scope="scope">
              <el-input v-model="scope.row.columnComment"></el-input>
            </template>
          </el-table-column>
          <el-table-column
            label="物理类型"
            prop="columnType"
            min-width="100"
            :show-overflow-tooltip="true"
          />
          <el-table-column label="Java类型" min-width="120" :key="Math.random()">
            <template slot-scope="scope">
              <el-select v-model="scope.row.javaType">
                <el-option label="Long" value="Long" />
                <el-option label="String" value="String" />
                <el-option label="Integer" value="Integer" />
                <el-option label="Double" value="Double" />
                <el-option label="BigDecimal" value="BigDecimal" />
                <el-option label="Date" value="Date" />
              </el-select>
            </template>
          </el-table-column>
          <el-table-column label="java属性" min-width="180" :key="Math.random()">
            <template slot-scope="scope">
              <el-input v-model="scope.row.javaField"></el-input>
            </template>
          </el-table-column>

          <el-table-column label="插入" min-width="50" v-if="this.info.functionName!='VIEW'" :key="Math.random()">
            <template slot-scope="scope">
              <el-checkbox true-label="1" v-model="scope.row.isInsert"></el-checkbox>
            </template>
          </el-table-column>
          <el-table-column label="编辑" min-width="50" v-if="this.info.functionName!='VIEW'" :key="Math.random()">
            <template slot-scope="scope">
              <el-checkbox true-label="1" v-model="scope.row.isEdit"></el-checkbox>
            </template>
          </el-table-column>
          <el-table-column label="列表" min-width="50" :key="Math.random()">
            <template slot-scope="scope">
              <el-checkbox true-label="1" v-model="scope.row.isList"></el-checkbox>
            </template>
          </el-table-column>
          <el-table-column label="查询" min-width="50" :key="Math.random()">
            <template slot-scope="scope">
              <el-checkbox true-label="1" v-model="scope.row.isQuery"></el-checkbox>
            </template>
          </el-table-column>
          <el-table-column label="查询方式" min-width="100" :key="Math.random()">
            <template slot-scope="scope">
              <el-select v-model="scope.row.queryType">
                <el-option label="=" value="EQ" />
                <el-option label="!=" value="NE" />
                <el-option label=">" value="GT" />
                <el-option label=">=" value="GTE" />
                <el-option label="<" value="LT" />
                <el-option label="<=" value="LTE" />
                <el-option label="LIKE" value="LIKE" />
                <el-option label="BETWEEN" value="BETWEEN" />
              </el-select>
            </template>
          </el-table-column>
          <el-table-column label="必填" min-width="50" :key="Math.random()" v-if="this.info.functionName!='VIEW'">
            <template slot-scope="scope">
              <el-checkbox true-label="1" v-model="scope.row.isRequired"></el-checkbox>
            </template>
          </el-table-column>
          <el-table-column label="显示类型" min-width="150" :key="Math.random()">
            <template slot-scope="scope">
              <el-select v-model="scope.row.htmlType">
                <el-option label="文本框" value="input" />
                <el-option label="文本域" value="textarea" />
                <el-option label="下拉框" value="select" />
                <el-option label="单选框" value="radio" />
                <el-option label="复选框" value="checkbox" />
                <el-option label="日期控件" value="datetime" />
                <el-option label="图片上传" value="imageUpload" />
                <el-option label="文件上传" value="fileUpload" />
                <el-option label="富文本控件" value="editor" />
              </el-select>
            </template>
          </el-table-column>
          <el-table-column label="字典类型" min-width="180" v-if="this.info.functionName!='VIEW'" :key="Math.random()">
            <template slot-scope="scope">
              <el-select v-model="scope.row.dictType" clearable filterable placeholder="请选择" :disabled="scope.row.linkTable || scope.row.linkTable!=''">
                <el-option
                  v-for="dict in dictOptions"
                  :key="dict.dictType"
                  :label="dict.dictName"
                  :value="dict.dictType">
                  <span style="float: left">{{ dict.dictName }}</span>
                  <span style="float: right; color: #8492a6; font-size: 13px">{{ dict.dictType }}</span>
                </el-option>
              </el-select>
            </template>
          </el-table-column>
          <el-table-column label="连接表" min-width="180" v-if="this.info.functionName!='VIEW'" :key="Math.random()">
            <template slot-scope="scope">
              <el-select v-model="scope.row.linkTable" clearable filterable placeholder="请选择" :disabled="scope.row.dictType || scope.row.dictType!='' || scope.row.htmlType!='select'">
                <el-option
                  v-for="table in tables"
                  :key="table.tableId"
                  :label="table.tableName"
                  :value="table.tableName"
                >
                  <span style="float: left">{{ table.tableComment }}</span>
                  <span style="float: right; color: #8492a6; font-size: 13px">{{ table.tableName }}</span>
                </el-option>
              </el-select>
            </template>
          </el-table-column>
          <el-table-column label="连接字段" min-width="180" v-if="this.info.functionName!='VIEW'" :key="Math.random()">
            <template slot-scope="scope">
              <el-select v-model="scope.row.linkField" clearable filterable placeholder="请选择" @click.native="getLinkFieldOptionselect(scope.row.linkTable)" :disabled="scope.row.dictType || scope.row.dictType!='' || scope.row.htmlType!='select'">
                <el-option
                  v-for="tColumn in tColumns"
                  :key="tColumn.columnId"
                  :label="tColumn.columnName"
                  :value="tColumn.columnName">
                  <span style="float: left">{{ tColumn.tableComment }}</span>
                  <span style="float: right; color: #8492a6; font-size: 13px">{{ tColumn.columnName }}</span>
                </el-option>
              </el-select>
            </template>
          </el-table-column>
          <el-table-column label="连接展示字段" min-width="180" v-if="this.info.functionName!='VIEW'" :key="Math.random()">
            <template slot-scope="scope">
              <el-select v-model="scope.row.linkShowField" clearable filterable placeholder="请选择" @click.native="getLinkFieldOptionselect(scope.row.linkTable)" :disabled="scope.row.dictType || scope.row.dictType!='' || scope.row.htmlType!='select'">
                <el-option
                  v-for="tColumn in tColumns"
                  :key="tColumn.columnId"
                  :label="tColumn.columnName"
                  :value="tColumn.columnName">
                  <span style="float: left">{{ tColumn.tableComment }}</span>
                  <span style="float: right; color: #8492a6; font-size: 13px">{{ tColumn.columnName }}</span>
                </el-option>
              </el-select>
            </template>
          </el-table-column>
          <el-table-column label="过滤字段" min-width="180" v-if="this.info.functionName!='VIEW'" :key="Math.random()">
            <template slot-scope="scope">
              <el-select v-model="scope.row.filterField" clearable filterable placeholder="请选择" @click.native="getLinkFieldOptionselect(scope.row.linkTable)" :disabled="scope.row.htmlType!='select'">
                <el-option
                  v-for="tColumn in tColumns"
                  :key="tColumn.columnId"
                  :label="tColumn.columnName"
                  :value="tColumn.columnName">
                  <span style="float: left">{{ tColumn.tableComment }}</span>
                  <span style="float: right; color: #8492a6; font-size: 13px">{{ tColumn.columnName }}</span>
                </el-option>
              </el-select>
            </template>
          </el-table-column>
          <el-table-column label="字段验证类型" min-width="180" v-if="this.info.functionName!='VIEW'" :key="Math.random()">
            <template slot-scope="scope">
              <el-select v-model="scope.row.fieldCheck" clearable filterable placeholder="请选择" :disabled="scope.row.htmlType != 'input'">
                <el-option label="手机号" value="手机号" />
                <el-option label="邮箱" value="邮箱" />
                <el-option label="身份证号" value="身份证号" />
                <el-option label="数字" value="数字" />
              </el-select>
            </template>
          </el-table-column>
          <el-table-column label="字段最小值" min-width="180" v-if="this.info.functionName!='VIEW'" :key="Math.random()">
            <template slot-scope="scope">
              <el-input v-model="scope.row.fieldMin" :disabled="scope.row.javaType != 'Long' && scope.row.javaType != 'Integer' && scope.row.javaType != 'Double' && scope.row.javaType != 'BigDecimal'"></el-input>
            </template>
          </el-table-column>
          <el-table-column label="字段最大值" min-width="180" v-if="this.info.functionName!='VIEW'" :key="Math.random()">
            <template slot-scope="scope">
              <el-input v-model="scope.row.fieldMax" :disabled="scope.row.javaType != 'Long' && scope.row.javaType != 'Integer' && scope.row.javaType != 'Double' && scope.row.javaType != 'BigDecimal'"></el-input>
            </template>
          </el-table-column>
        </el-table>
      </el-tab-pane>
      <el-tab-pane label="生成信息" name="genInfo">
        <gen-info-form ref="genInfo" :info="info" :tables="tables" :menus="menus"/>
      </el-tab-pane>
    </el-tabs>
    <el-form label-width="100px">
      <el-form-item style="text-align: center;margin-left:-100px;margin-top:10px;">
        <el-button type="primary" @click="submitForm()">提交</el-button>
        <el-button @click="close()">返回</el-button>
      </el-form-item>
    </el-form>
  </el-card>
</template>
<script>
import { getGenTable, updateGenTable, getGenTableByTableName } from "@/api/tool/gen";
import { optionselect as getDictOptionselect } from "@/api/system/dict/type";
import { listMenu as getMenuTreeselect } from "@/api/system/menu";
import basicInfoForm from "./basicInfoForm";
import genInfoForm from "./genInfoForm";
import Sortable from 'sortablejs'

export default {
  name: "GenEdit",
  components: {
    basicInfoForm,
    genInfoForm
  },
  data() {
    return {
      // 选中选项卡的 name
      activeName: "columnInfo",
      // 表格的高度
      tableHeight: document.documentElement.scrollHeight - 245 + "px",
      // 表信息
      tables: [],
      // 表列信息
      columns: [],
      // 字典信息
      dictOptions: [],
      // 菜单信息
      menus: [],
      // 表详细信息
      info: {},
      // 选择连接字段信息
      tColumns: [],
      // 判断是否可以是左树右表
      linkTree: 0
    };
  },
  created() {
    const tableId = this.$route.query && this.$route.query.tableId;
    if (tableId) {
      // 获取表详细信息
      getGenTable(tableId).then(res => {
        this.columns = res.data.rows;
        this.info = res.data.info;
        this.tables = res.data.tables;
        this.info.linkTreeList = res.data.linkTreeList;
        this.info.leftTreeColumnId = res.data.leftTreeColumnId;
      });
      /** 查询字典下拉列表 */
      getDictOptionselect().then(response => {
        this.dictOptions = response.data;
      });
      /** 查询菜单下拉列表 */
      getMenuTreeselect().then(response => {
        this.menus = this.handleTree(response.data, "menuId");
      });
    }
  },
  methods: {
    /** 提交按钮 */
    submitForm() {
      if(this.info.tplCategory == 'treeTable'){
        let linkTree = 0;
        for(let i=0; i<this.columns.length; i++){
          if(this.columns[i].linkTree === 1){
            console.log(this.columns[i].linkTree);
            linkTree=1;//满足左树右表的条件
            console.log("linkTree:"+linkTree);
            break;
          }
        }
        if(linkTree == 0){
          this.$modal.msgError("关联表中不存在树表！");
          return;
        }
      }
      const basicForm = this.$refs.basicInfo.$refs.basicInfoForm;
      const genForm = this.$refs.genInfo.$refs.genInfoForm;
      Promise.all([basicForm, genForm].map(this.getFormPromise)).then(res => {
        const validateResult = res.every(item => !!item);
        if (validateResult) {
          const genTable = Object.assign({}, basicForm.model, genForm.model);
          console.log("this.info.leftTreeColumnId:"+this.info.leftTreeColumnId);
          for(let i in this.columns){
            if(this.columns[i].columnId === this.info.leftTreeColumnId){
              this.columns[i].leftTreeFlag = 1;
            }else{
              this.columns[i].leftTreeFlag = 0;
            }
          }
          console.log("this.columns:");
          console.log(this.columns);
          genTable.columns = this.columns;
          console.log("genTable.columns:");
          console.log(genTable.columns);
          genTable.params = {
            treeCode: genTable.treeCode,
            treeName: genTable.treeName,
            treeParentCode: genTable.treeParentCode,
            parentMenuId: genTable.parentMenuId
          };
          updateGenTable(genTable).then(res => {
            this.$modal.msgSuccess(res.msg);
            if (res.code === 200) {
              this.close();
            }
          });
        } else {
          this.$modal.msgError("表单校验未通过，请重新检查提交内容");
        }
      });
    },
    getFormPromise(form) {
      return new Promise(resolve => {
        form.validate(res => {
          resolve(res);
        });
      });
    },
    /** 关闭按钮 */
    close() {
      this.$store.dispatch("tagsView/delView", this.$route);
      this.$router.push({ path: "/tool/gen", query: { t: Date.now(), pageNum: this.$route.query.pageNum } })
    },
    getLinkFieldOptionselect(tableName){
      console.log("进入getLinkFieldOptionselect");
      console.log(tableName);
      if(tableName!="" && tableName){
        getGenTableByTableName(tableName).then(res => {
          this.tColumns = res.data.rows;
          console.log(this.tColumns);
        });
      }
    }
  },
  mounted() {
    const el = this.$refs.dragTable.$el.querySelectorAll(".el-table__body-wrapper > table > tbody")[0];
    const sortable = Sortable.create(el, {
      handle: ".allowDrag",
      onEnd: evt => {
        const targetRow = this.columns.splice(evt.oldIndex, 1)[0];
        this.columns.splice(evt.newIndex, 0, targetRow);
        for (let index in this.columns) {
          this.columns[index].sort = parseInt(index) + 1;
        }
      }
    });
  }
};
</script>
