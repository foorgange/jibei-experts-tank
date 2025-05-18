<template>
  <div class="app-container">
<!-- 下载模板-->
    <el-form>
      <el-form-item>
        <el-row :gutter="10" class="mb8">
          <el-col :span="3">
            <el-button
              type="warning"
              icon="el-icon-download"
              @click="DownloadWord"
            >下载本页填写模板
            </el-button>
          </el-col>
        </el-row>
      </el-form-item>
    </el-form>
    <div style="display: flex;width: 100%;height: 50px;background-color: rgba(248,248,249,1);margin-top: -10px">
      <div style="width: 5px;background-color: rgba(0,121,254,1)"></div>
      <div style="line-height: 50px">
        <span style="margin-left: 20px;font-size: 18px;font-weight: bold">
          成果基础信息
        </span>
      </div>
    </div>

    <el-form ref="form" :model="form" label-width="80px" :rules="rules">
      <div>
        <el-form-item label="成果名称" prop="achievementname" class="a1">
          <el-input v-model="form.achievementname" @input="change($event)" placeholder="请输入成果名称" class="a2"/>
        </el-form-item>
      </div>

      <div>
        <el-form-item label="所属领域" class="a1" prop="field">
          <el-checkbox-group @input="change($event)" v-model="form.field" class="a4">
            <el-checkbox
              v-for="dict in dict.type.sys_field"
              :key="dict.value"
              :label="dict.value"
            >{{ dict.label }}
            </el-checkbox>
          </el-checkbox-group>
        </el-form-item>
      </div>

      <div>
        <el-form-item label="所属学院" prop="college" :style="{ whiteSpace: 'nowrap'}" class="a1">
          <el-select @input="change($event)" v-model="form.college" placeholder="请选择所属学院" class="a2"
                     style="width:47%">
            <el-option
              v-for="dict in dict.type.school_xy"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value+''"
            ></el-option>
          </el-select>
        </el-form-item>
      </div>

      <div>
        <el-form-item label="合作方式" :style="{ whiteSpace: 'nowrap' }" class="a1" prop="way">
          <el-checkbox-group v-model="form.way" class="a2" @input="change($event)">
            <el-checkbox
              v-for="dict in dict.type.jd_way"
              :key="dict.value"
              :label="dict.value"
            >{{ dict.label }}
            </el-checkbox>
          </el-checkbox-group>
        </el-form-item>
      </div>

      <div>
        <el-form-item label="成果类型" class="a1" prop="typesresults">
          <el-checkbox-group v-model="form.typesresults" class="a7" @input="change($event)">
            <el-checkbox
              style="width: 26.7%"
              v-for="dict in dict.type.type_achievement"
              :key="dict.value"
              :label="dict.value"
            >{{ dict.label }}
            </el-checkbox>
            <el-tooltip class="item" effect="light" placement="right">
              <el-button
                style="padding-left: 70px;"
                type="text"
                icon="el-icon-info"
              ></el-button>
              <div slot="content">重大应用成果：面向国家重大需求，在国之重器、国家重大工程和设施等得到成功应用的技术或产品。<br/>成果的知识产权权属、成果完成单位、完成人署名等方面清晰明确、无争议。</div>
            </el-tooltip>
          </el-checkbox-group>
        </el-form-item>
      </div>

      <div style="display: flex;width: 100%;height: 50px;background-color: rgba(248,248,249,1);margin-top: -10px">
        <div style="width: 5px;background-color: rgba(0,121,254,1)">
        </div>
        <div style="line-height: 50px">
          <span style="margin-left: 20px;font-size: 18px;font-weight: bold">
          成果介绍
          </span>
        </div>
      </div>

      <div class="input-row">
        <el-form-item label="技术成熟度" prop="technologylevel" :style="{ whiteSpace: 'nowrap'}" class="input-field">
          <el-select v-model="form.technologylevel" placeholder="请选择技术成熟度" class="a6" @input="change($event)">
            <el-option
              v-for="dict in dict.type.technology_level"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value+''"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="先进度" prop="advancementleve" class="input-field3" style="margin-top: 20px;">
          <el-select v-model="form.advancementleve" placeholder="请选择先进度" @input="change($event)">
            <el-option
              v-for="dict in dict.type.cutting_edge"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value+''"
            ></el-option>
          </el-select>
        </el-form-item>
      </div>

      <div>
        <el-form-item label="成果介绍" prop="introduction" class="a1">
          <el-input v-model="form.introduction"
                    placeholder="请输入成果介绍，提示信息需要包含依托基础研究课题、市场需求、政策导向等内容(请避免内容含有特殊字符)"
                    type="textarea" :rows="6" maxlength="1000" class="a2" @input="change($event)" style="width: 1000px"/>

          <el-upload
            :action="uploadUrl"
            :ref="upload"
            :on-remove="handleRemove"
            :on-change="handleChange"
            :on-success="handleSuccess"
            :on-preview="handlePictureCardPreview"
            multiple
            enctype="multipart/form-data"
            :limit="10"
            list-type="picture-card"
            accept=".jpg,.png,.jpeg"
            :headers="upload.headers"
            :file-list="fileList"
            class="a11"
          >点击上传成果图片
          </el-upload>
          <el-dialog :visible.sync="dialogVisible">
            <img width="100%" :src="dialogImageUrl" alt="">
          </el-dialog>
        </el-form-item>
<!--        图片回显-->
        <div style="margin-top: 20px; padding-left: 110px;">
          <a v-for="img in imgList" :key="img" :href="img" target="_blank" style="text-decoration: none;">
            <img :src="img" style="float: left; margin-right: 10px; padding-left: 20px;" width="160px">
          </a>
        </div>
      </div>

      <!--      <div>-->
      <!--        <el-upload-->
      <!--          class="upload-demo"-->
      <!--          :action="uploadUrl"-->
      <!--          :on-preview="handlePreview"-->
      <!--          :on-remove="handleRemove"-->
      <!--          :on-change="handleChange"-->
      <!--          :file-list="fileList"-->
      <!--          list-type="picture">-->
      <!--          <el-button size="small" type="primary">点击上传</el-button>-->
      <!--          <div slot="tip" class="el-upload__tip">只能上传jpg/png文件，且不超过500kb</div>-->
      <!--        </el-upload>-->
      <!--      </div>-->

      <div style="display: flex;width: 100%;height: 50px;background-color: rgba(248,248,249,1);margin-top: -10px">
        <div style="width: 5px;background-color: rgba(0,121,254,1)"></div>
        <div style="line-height: 50px">
          <span style="margin-left: 20px;font-size: 18px;font-weight: bold">
          研究背景与基础
          </span>
        </div>
      </div>

      <div class="a1">
        <el-form-item label="项目背景与基础"
                      prop="background"
                      :style="{ whiteSpace: 'nowrap'}"
                      style="margin-left: -20px">
          <el-input v-model="form.background" placeholder="请输入项目背景与基础，不超过1000字。没有填无(请避免内容含有特殊字符)"
                    type="textarea"
                    :rows="6"
                    class="a2"
                    @input="change($event)"
                    :input-style="{borderColor:backgroundLength>=1000?'red':''}"
                    style="width: 1000px;margin-left: 30px"/>
          <span class="gray left"> 字数限制:<span :style="{color:backgroundLength>=1000?'red':''}">{{backgroundLength}}</span>/1000</span>
        </el-form-item>
      </div>

      <div style="display: flex;width: 100%;height: 50px;background-color: rgba(248,248,249,1);margin-top: -10px">
        <div style="width: 5px;background-color: rgba(0,121,254,1)"></div>
        <div style="line-height: 50px">
          <span style="margin-left: 20px;font-size: 18px;font-weight: bold">
            知识产权情况
          </span>
        </div>
      </div>

      <div class="a1">
        <el-form-item label="知识产权情况" prop="intellectualproperty" :style="{ whiteSpace: 'nowrap'}"
                      style="margin-left: -13px">
          <el-input v-model="form.intellectualproperty"
                    placeholder="请输入知识产权简介，提示：包含知识产权类型（产权类型包括专利，软著，标准等）、名称、权利人、授权日期等信息。没有填无(请避免内容含有特殊字符)"
                    type="textarea"
                    :rows="4"
                    @input="change($event)"
                    style="width: 1000px;margin-left: 23px"/>
        </el-form-item>
      </div>

      <div style="display: flex;width: 100%;height: 50px;background-color: rgba(248,248,249,1);margin-top: -10px">
        <div style="width: 5px;background-color: rgba(0,121,254,1)"></div>
        <div style="line-height: 50px">
          <span style="margin-left: 20px;font-size: 18px;font-weight: bold">
            获奖情况
          </span>
        </div>
      </div>

      <div>
        <el-form-item label="获得奖项" prop="award" class="a1">
          <el-input v-model="form.award" placeholder="请输入该成果已获得的奖励情况。没有填无(请避免内容含有特殊字符)" class="a2" @input="change($event)"
                    type="textarea" :rows="4" style="width: 1000px"/>
        </el-form-item>
      </div>

      <div style="display: flex;width: 100%;height: 50px;background-color: rgba(248,248,249,1);margin-top: -10px">
        <div style="width: 5px;background-color: rgba(0,121,254,1)"></div>
        <div style="line-height: 50px">
          <span style="margin-left: 20px;font-size: 18px;font-weight: bold">
            效益分析
          </span>
        </div>
      </div>

      <div>
        <el-form-item label="效益分析" prop="benefit" class="a1">
          <el-input v-model="form.benefit" placeholder="请输入效益分析，不超过1000字，提示:包含社会效益和经济效益。没有填无(请避免内容含有特殊字符)"
                    class="a2"  type="textarea" :rows="6" @input="change($event)" style="width: 1000px" :input-style="{borderColor:benefitLength>=1000?'red':''}"/>
          <span class="gray"> 字数限制:<span :style="{color:benefitLength>=1000?'red':''}">{{benefitLength}}</span>/1000</span>
        </el-form-item>
      </div>

      <div style="display: flex;width: 100%;height: 50px;background-color: rgba(248,248,249,1);margin-top: -10px">
        <div style="width: 5px;background-color: rgba(0,121,254,1)"></div>
        <div style="line-height: 50px">
          <span style="margin-left: 20px;font-size: 18px;font-weight: bold">
            成果负责人信息
          </span>
        </div>
      </div>
<!--      成果负责人渲染区域-->
      <div class="input-row" >
        <el-form-item label="所属学院" prop="piCollege" class="input-field" >
          <template #label>
            <span style="color: rgba(255, 73, 73,1);">*</span> 所属学院
          </template>
          <el-select v-model="tecpi.piCollege"
                     @change="getSelectOne(tecpi.piCollege)"
                     placeholder="成果负责人所在学院"
                     class="a6" @input="change($event)">
            <el-option
              v-for="dict in dict.type.school_xy"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value+''"
            ></el-option>
          </el-select>
        </el-form-item>

        <el-form-item label="工号" prop="piStaffId" :style="{ whiteSpace: 'nowrap'}" class="input-field3"
                      style="margin-left: 20px;margin-top: 20px;">
          <el-input v-model="tecpi.piStaffId" placeholder="工号自动获取"
                    readonly="readonly" @input="change($event)"/>
        </el-form-item>

        <el-form-item label="姓名" prop="piName" class="input-field3"
                      style="margin-left: 20px;margin-top: 20px;">
          <template #label>
            <span style="color: rgba(255, 73, 73,1);">*</span> 姓名
          </template>
          <el-select v-model="tecpi.piId" placeholder="请选择成果负责人"
                     @change="getSelectTwo(tecpi.piId)"
                     @input="change($event)">
            <el-option
              v-for="item in nameList"
              :key="item.piId"
              :label="item.piName"
              :value="item.piId"
            ></el-option>
          </el-select>
        </el-form-item>
      </div>

      <div>
        <el-form-item label="个人简介" prop="piInformation" class="a1">
          <el-input v-model="tecpi.piInformation" readonly="readonly"
                    placeholder="成果负责人个人简介" class="a2"
                    type="textarea" :rows="4" @input="change($event)" style="width: 1000px"/>
        </el-form-item>
      </div>

      <el-form-item>
        <el-button type="primary" @click="handleAdd" class="a13">添加成果负责人</el-button>
      </el-form-item>

      <div style="display: flex;width: 100%;height: 50px;background-color: rgba(248,248,249,1);margin-top: -10px">
        <div style="width: 5px;background-color: rgba(0,121,254,1)"></div>
        <div style="line-height: 50px">
          <span style="margin-left: 20px;font-size: 18px;font-weight: bold">
            联系人信息
          </span>
        </div>
      </div>

      <div>
        <el-checkbox v-model="isChecked" @change="handleChangecontact"
                     style="margin-top: 20px;margin-left: 30px">
          联系人是否为成果负责人
        </el-checkbox>
      </div>
      <div class="input-row" style="width: 1059px">
        <el-form-item label="联系人姓名" prop="contactname" :style="{ whiteSpace: 'nowrap'}" class="input-field"
                      style="margin-left: -41px;width: 30%">
          <el-input v-model="form.contactname" placeholder="请输入联系人姓名" class="a5 inputDeep"
                    @input="change($event)" style="margin-left: 10px"/>
        </el-form-item>
        <el-form-item label="联系人工号" prop="staffid" :style="{ whiteSpace: 'nowrap'}" class="input-field1 inputDeep"
                      style="width: 30%;">
          <el-input class="" v-model="form.staffid" placeholder="请输入联系人工号" @input="change($event)"
                    style="margin-left: 10px"/>
        </el-form-item>
        <el-form-item label="联系人邮箱" prop="email" :style="{ whiteSpace: 'nowrap'}" class="input-field1 inputDeep"
                      style="width: 30%">
          <el-input class="" v-model="form.email" placeholder="请输入联系人邮箱" @input="change($event)"
                    style="margin-left: 10px"/>
        </el-form-item>
      </div>
      <div class="input-row" style="width: 1059px">
        <el-form-item label="联系电话" prop="phone" class="input-field1 inputDeep"
                      style="margin-left: -39px;width: 30%">
          <el-input class="" v-model="form.phone" placeholder="请输入联系电话" @input="change($event)"
                    style="padding-left: 8px;padding-right: 5px"/>
        </el-form-item>
      </div>

      <div style="display: flex;width: 100%;height: 50px;background-color: rgba(248,248,249,1);margin-top: -10px">
        <div style="width: 5px;background-color: rgba(0,121,254,1)"/>
        <div style="line-height: 50px">
          <span style="margin-left: 20px;font-size: 18px;font-weight: bold">
            团队介绍
          </span>
        </div>
      </div>
      <!--团队成员渲染区域-->
      <div>
        <el-form-item label="" style="padding-left: 110px ; width: 1190px">
          <el-table :data="tecTeamList" class="a3" :header-cell-style="customHeaderCellStyle">
            <el-table-column
              label="序号"
              type="index"
              prop="index"
              width="90px">
            </el-table-column>

            <el-table-column prop="teamStaffId" label="工号"></el-table-column>
            <el-table-column prop="teamName" label="姓名"></el-table-column>
            <el-table-column prop="teamSex" label="性别">
              <template slot-scope="scope">
                <dict-tag :options="dict.type.sys_user_sex" :value="scope.row.teamSex"/>
              </template>
            </el-table-column>
            <el-table-column prop="teamPhone" label="电话"></el-table-column>
            <el-table-column prop="teamEmail" label="邮箱"></el-table-column>
            <el-table-column prop="teamBirthday" label="出生日期"></el-table-column>
            <el-table-column prop="teamJobTitle" label="职务/职称"></el-table-column>
            <el-table-column prop="teamCommAddress" label="通讯地址"></el-table-column>
            <el-table-column prop="teamJobAddress" label="工作单位"></el-table-column>
            <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
              <template slot-scope="scope">
                <el-button
                  size="mini"
                  type="text"
                  icon="el-icon-edit"
                  @click="handleUpdateTeamUser(scope)"
                >修改
                </el-button>
                <el-button
                  size="mini"
                  type="text"
                  icon="el-icon-delete"
                  @click="handleDeleteTeamUser(scope)"
                >删除
                </el-button>
              </template>
            </el-table-column>
          </el-table>
        </el-form-item>
      </div>

      <el-form-item>
        <el-button type="primary" @click="addTableRow" class="a13">添加团队成员</el-button>
      </el-form-item>

      <div style="display: flex;width: 100%;height: 50px;background-color: rgba(248,248,249,1);margin-top: -10px">
        <div style="width: 5px;background-color: rgba(0,121,254,1)"/>
        <div style="line-height: 50px">
          <span style="margin-left: 20px;font-size: 18px;font-weight: bold">
            依托课题
          </span>
        </div>
      </div>
      <!--纵向课题渲染区域-->
      <div>
        <el-form-item style="padding-left: 110px ; width: 1190px">
          <el-table :data="tecVerticaltopicList" class="a3" :header-cell-style="customHeaderCellStyle">
            <el-table-column
              type="index"
              prop="index"
              label="序号"
              width="168px">
            </el-table-column>
            <el-table-column prop="topicCategory" label="课题大类">
              <template slot-scope="scope">
                <dict-tag :options="dict.type.topic_category" :value="scope.row.topicCategory"/>
              </template>
            </el-table-column>
            <el-table-column prop="topicSubcategory" label="课题子类">
              <template slot-scope="scope" >
                <template v-if="scope.row.topicCategory === '1'">
                  <dict-tag :options="dict.type.natural_sciences" :value="scope.row.topicSubcategory"/>
                </template>
                <template v-else-if="scope.row.topicCategory === '2'">
                  <dict-tag :options="dict.type.social_sciences" :value="scope.row.topicSubcategory"/>
                </template>
              </template>
            </el-table-column>
            <el-table-column prop="topicCode" label="课题编号"></el-table-column>
            <el-table-column prop="topicName" label="课题名称"></el-table-column>
            <el-table-column label="操作" align="center">
              <template slot-scope="scope">
                <el-button
                  size="mini"
                  type="text"
                  icon="el-icon-edit"
                  @click="handleUpdateTopic(scope)"
                >修改
                </el-button>
                <el-button
                  size="mini"
                  type="text"
                  icon="el-icon-delete"
                  @click="handleDeleteTopic(scope)"
                >删除
                </el-button>
              </template>
            </el-table-column>
          </el-table>
        </el-form-item>
      </div>

      <el-form-item>
        <el-button type="primary" @click="addTopic" class="a13">添加课题</el-button>
      </el-form-item>

      <div class="dialog-footer">
        <el-button type="primary" @click="submitAchievementForm(1)">暂 存</el-button>
        <el-button type="primary" @click="finaldialogVisible = true">提 交</el-button>
        <el-button @click="cancel" v-if="form.status!==3">取 消</el-button>
        <el-button @click="back" v-if="form.status===3">返 回</el-button>
      </div>
    </el-form>

    <!--纵向课题新增form-->
    <el-dialog :autoUpload="false" title="新增课题" :visible.sync="openTopic" width="500px" append-to-body
               :close-on-click-modal="false">
      <el-form v-model="topicTable" prop="topicCode">
        <el-form-item label="课题大类" prop="topicCategory" style="margin-left: 17px">
          <template #label>
            <span style="color: rgba(255, 73, 73, 0);">*</span> 课题大类
          </template>
          <el-select v-model="topicTable.topicCategory" placeholder="请选择所属课题大类"
                     @change="handleCategoryChange"
                     clearable
                     style="width: 265px">
            <el-option
              v-for="dict in dict.type.topic_category"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item  v-if="natural" label="课题子类" prop="naturalSciences" style="margin-left: 17px">
          <template #label>
            <span style="color: rgba(255, 73, 73, 0);">*</span> 课题子类
          </template>
          <el-select v-model="topicTable.topicSubcategory" placeholder="请选择具体课题类别"
                     clearable
                     style="width: 265px;">
            <el-option
              v-for="dict in dict.type.natural_sciences"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item v-if="social" label="课题子类" prop="socialSciences" style="margin-left: 17px">
          <template #label>
            <span style="color: rgba(255, 73, 73, 0);">*</span> 课题子类
          </template>
          <el-select v-model="topicTable.topicSubcategory" placeholder="请选择具体课题类别"
                     clearable
                     style="width: 265px;">
            <el-option
              v-for="dict in dict.type.social_sciences"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="编号" style="margin-left: 30px">
          <template #label>
            <span style="color: rgba(255, 73, 73, 1);">*</span> 编号
          </template>
          <el-input placeholder="请输入课题编号" v-model="topicTable.topicCode"
                    clearable
                    :style="{width: '61.5%'}"
                    class="a8">
          </el-input>
        </el-form-item>
        <el-form-item label="名称" style="margin-left: 30px">
          <template #label>
            <span style="color: rgba(255, 73, 73, 1);">*</span> 名称
          </template>
          <el-input placeholder="请输入课题名称" v-model="topicTable.topicName"
                    clearable
                    :style="{width: '61.5%'}"
                    class="a8">
          </el-input>
        </el-form-item>
        <div style="display: flex; justify-content: center;">
          <el-button type="primary" @click="submitTopicForm">确 定</el-button>
          <el-button @click="cancelTopicForm">取 消</el-button>
        </div>
      </el-form>
    </el-dialog>

    <!--纵向课题修改form-->
    <el-dialog :autoUpload="false" title="修改课题" :visible.sync="openUpdateTopic" width="500px" append-to-body
               :close-on-click-modal="false">
      <el-form v-model="topicUpdateTable" prop="topicCode">
        <el-form-item label="课题大类" prop="topicCategory" style="margin-left: 17px">
          <template #label>
            <span style="color: rgba(255, 73, 73, 0);">*</span> 课题大类
          </template>
          <el-select v-model="topicUpdateTable.topicCategory" placeholder="请选择所属课题大类"
                     @change="handleCategoryChangexg"
                     clearable
                     style="width: 265px">
            <el-option
              v-for="dict in dict.type.topic_category"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item  v-if="natural" label="具体项目" prop="naturalSciences" style="margin-left: 17px">
          <template #label>
            <span style="color: rgba(255, 73, 73, 0);">*</span> 具体项目
          </template>
          <el-select v-model="topicUpdateTable.topicSubcategory" placeholder="请选择具体课题类别"
                     clearable style="width: 265px;">
            <el-option
              v-for="dict in dict.type.natural_sciences"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item v-if="social" label="具体项目" prop="socialSciences" style="margin-left: 17px">
          <template #label>
            <span style="color: rgba(255, 73, 73, 0);">*</span> 具体项目
          </template>
          <el-select v-model="topicUpdateTable.topicSubcategory" placeholder="请选择具体课题类别" clearable style="width: 265px;">
            <el-option
              v-for="dict in dict.type.social_sciences"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="编号" style="margin-left: 30px">
          <template #label>
            <span style="color: rgba(255, 73, 73,1);">*</span> 编号
          </template>
          <el-input placeholder="请输入课题编号" v-model="topicUpdateTable.topicCode" clearable
                    :style="{width: '61.5%'}" class="a8">
          </el-input>
        </el-form-item>
        <el-form-item label="名称" style="margin-left: 30px">
          <template #label>
            <span style="color: rgba(255, 73, 73,1);">*</span> 名称
          </template>
          <el-input placeholder="请输入课题名称" v-model="topicUpdateTable.topicName" clearable
                    :style="{width: '61.5%'}" class="a8">
          </el-input>
        </el-form-item>
        <div style="display: flex; justify-content: center;">
          <el-button type="primary" @click="submitUpdateTopicForm">确 定</el-button>
          <el-button @click="cancelUpdateTopicForm">取 消</el-button>
        </div>
      </el-form>
    </el-dialog>

    <!--团队成员新增form-->
    <el-dialog :autoUpload="false" title="新增团队成员" :visible.sync="openTeamForm" width="500px" append-to-body
               :close-on-click-modal="false">
      <el-form v-model="teamTable" prop="teamName" >
        <el-form-item label="工号" style="margin-left: 30px">
          <template #label>
            <span style="color: rgba(255, 73, 73,1);">*</span> 工号
          </template>
          <el-input placeholder="请输入工号" v-model="teamTable.teamStaffId"
                    clearable  :style="{width: '61.5%'}" class="a8"/>
        </el-form-item>

        <el-form-item label="姓名" style="margin-left: 30px">
          <template #label>
            <span style="color: rgba(255, 73, 73,1);">*</span> 姓名
          </template>
          <el-input placeholder="请输入姓名" v-model="teamTable.teamName"
                    clearable :style="{width: '61.5%'}" class="a8" />
        </el-form-item>

        <el-form-item label="性别" prop="teamSex" style="margin-left: 30px">
          <template #label>
            <span style="color: rgba(255, 73, 73,1);">*</span> 性别
          </template>
          <el-select placeholder="请选择性别" clearable :style="{width: '61.5%'}"
                     v-model="teamTable.teamSex" class="a8">
            <el-option v-for="dict in dict.type.sys_user_sex"
                       :key="dict.value"
                       :label="dict.label"
                       :value="dict.value"/>
          </el-select>
        </el-form-item>

        <el-form-item label="电话" style="margin-left: 30px">
          <template #label>
            <span style="color: rgba(255, 73, 73,1);">*</span> 电话
          </template>
          <el-input placeholder="请输入电话" v-model="teamTable.teamPhone"
                    clearable :style="{width: '61.5%'}" class="a8"/>
        </el-form-item>

        <el-form-item label="邮箱" style="margin-left: 30px">
          <template #label>
            <span style="color: rgba(255, 73, 73,1);">*</span> 邮箱
          </template>
          <el-input placeholder="请输入邮箱" v-model="teamTable.teamEmail"
                    clearable :style="{width: '61.5%'}"
                    class="a8"/>
        </el-form-item>

        <el-form-item label="出生日期" style="white-space: nowrap;margin-left: 2px">
          <template #label>
            <span style="color: rgba(255, 73, 73,1);">*</span> 出生日期
          </template>
          <el-date-picker
            v-model="teamTable.teamBirthday"
            type="date"
            placeholder="请选择出生日期" class="a8"/>
        </el-form-item>

        <el-form-item label="职位/职称" prop="teamJobTitle" style="white-space: nowrap;margin-left: 2px">
          <template #label>
            <span style="color: rgba(255, 73, 73,1);">*</span> 职位/职称
          </template>
          <el-input placeholder="请输入职位/职称" clearable :style="{width: '58%'}"
                    v-model="teamTable.teamJobTitle"
                    class="a10"/>
        </el-form-item>

        <el-form-item label="通讯地址" style="white-space: nowrap;margin-left: 3px">
          <template #label>
            <span style="color: rgba(255, 73, 73,1);">*</span> 通讯地址
          </template>
          <el-input placeholder="请输入通讯地址" clearable :style="{width: '58%'}"
                    v-model="teamTable.teamCommAddress"
                    class="a9"/>
        </el-form-item>

        <el-form-item label="工作单位" prop="teamJobAddress" style="white-space: nowrap;margin-left: 3px">
          <template #label>
            <span style="color: rgba(255, 73, 73, 0);">*</span> 工作单位
          </template>
          <el-input placeholder="请输入工作单位" clearable :style="{width: '58%'}"
                    v-model="teamTable.teamJobAddress" class="a9"/>
        </el-form-item>

        <div style="display: flex; justify-content: center;">
          <el-button type="primary" @click="submitTeamForm">确 定</el-button>
          <el-button @click="cancelTeamForm">取 消</el-button>
        </div>
      </el-form>
    </el-dialog>

    <!--团队成员修改form-->
    <el-dialog :autoUpload="false" title="修改团队成员" :visible.sync="openUpdateTeamForm" width="500px" append-to-body
               :close-on-click-modal="false">
      <el-form v-model="teamUpdateTable" prop="teamName">
        <el-form-item label="工号" style="margin-left: 30px">
          <template #label>
            <span style="color: rgba(255, 73, 73,1);">*</span> 工号
          </template>
          <el-input placeholder="请输入工号" v-model="teamUpdateTable.teamStaffId"
                    clearable  :style="{width: '61.5%'}" class="a8"/>
        </el-form-item>

        <el-form-item label="姓名" style="margin-left: 30px">
          <template #label>
            <span style="color: rgba(255, 73, 73,1);">*</span> 姓名
          </template>
          <el-input placeholder="请输入姓名" v-model="teamUpdateTable.teamName"
                    clearable :style="{width: '61.5%'}" class="a8" />
        </el-form-item>

        <el-form-item label="性别" prop="teamSex" style="margin-left: 30px">
          <template #label>
            <span style="color: rgba(255, 73, 73,1);">*</span> 性别
          </template>
          <el-select placeholder="请选择性别" clearable :style="{width: '61.5%'}"
                     v-model="teamUpdateTable.teamSex" class="a8">
            <el-option v-for="dict in dict.type.sys_user_sex"
                       :key="dict.value"
                       :label="dict.label"
                       :value="dict.value"/>
          </el-select>
        </el-form-item>

        <el-form-item label="电话" style="margin-left: 30px">
          <template #label>
            <span style="color: rgba(255, 73, 73,1);">*</span> 电话
          </template>
          <el-input placeholder="请输入电话" v-model="teamUpdateTable.teamPhone"
                    clearable :style="{width: '61.5%'}" class="a8"/>
        </el-form-item>

        <el-form-item label="邮箱" style="margin-left: 30px">
          <template #label>
            <span style="color: rgba(255, 73, 73,1);">*</span> 邮箱
          </template>
          <el-input placeholder="请输入邮箱" v-model="teamUpdateTable.teamEmail"
                    clearable :style="{width: '61.5%'}"
                    class="a8"/>
        </el-form-item>

        <el-form-item label="出生日期" style="white-space: nowrap;margin-left: 2px">
          <template #label>
            <span style="color: rgba(255, 73, 73,1);">*</span> 出生日期
          </template>
          <el-date-picker
            v-model="teamUpdateTable.teamBirthday"
            type="date"
            placeholder="请选择出生日期" class="a8"/>
        </el-form-item>

        <el-form-item label="职位/职称" prop="teamJobTitle" style="white-space: nowrap;margin-left: 2px">
          <template #label>
            <span style="color: rgba(255, 73, 73,1);">*</span> 职位/职称
          </template>
          <el-input placeholder="请输入职位/职称" clearable :style="{width: '58%'}"
                    v-model="teamUpdateTable.teamJobTitle"
                    class="a10"/>
        </el-form-item>

        <el-form-item label="通讯地址" style="white-space: nowrap;margin-left: 3px">
          <template #label>
            <span style="color: rgba(255, 73, 73,1);">*</span> 通讯地址
          </template>
          <el-input placeholder="请输入通讯地址" clearable :style="{width: '58%'}"
                    v-model="teamUpdateTable.teamCommAddress"
                    class="a9"/>
        </el-form-item>

        <el-form-item label="工作单位" prop="teamJobAddress" style="white-space: nowrap;margin-left: 3px">
          <template #label>
            <span style="color: rgba(255, 73, 73, 0);">*</span> 工作单位
          </template>
          <el-input placeholder="请输入工作单位" clearable :style="{width: '58%'}"
                    v-model="teamUpdateTable.teamJobAddress" class="a9"/>
        </el-form-item>

        <div style="display: flex; justify-content: center;">
          <el-button type="primary" @click="submitUpdateTeamForm">确 定</el-button>
          <el-button @click="cancelUpdateTeamForm">取 消</el-button>
        </div>
      </el-form>
    </el-dialog>

    <!--成果负责人新增form-->
    <el-dialog :title="title" :visible.sync="openPiForm" width="500px" append-to-body>
      <el-form ref="formPi" :model="formPi" :rules="pirules" label-width="80px">
        <el-form-item label="工号" prop="piStaffId">
          <el-input v-model="formPi.piStaffId" placeholder="请输入工号，工号不超过11位" :style="{width: '58%'}"/>
        </el-form-item>

        <el-form-item label="姓名" prop="piName">
          <el-input v-model="formPi.piName" placeholder="请输入姓名" :style="{width: '58%'}"/>
        </el-form-item>

        <el-form-item label="性别" prop="piSex">
          <el-select v-model="formPi.piSex" placeholder="请选择性别">
            <el-option
              v-for="dict in dict.type.sys_user_sex"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"/>
          </el-select>
        </el-form-item>

        <el-form-item label="所属学院" prop="piCollege">
          <el-select v-model="formPi.piCollege" placeholder="请选择所属学院">
            <el-option
              v-for="dict in dict.type.school_xy"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"/>
          </el-select>
        </el-form-item>

        <el-form-item label="职称" prop="piJobTitle">
          <el-input v-model="formPi.piJobTitle" placeholder="请输入职称" :style="{width: '58%'}"/>
        </el-form-item>

        <el-form-item label="邮箱" prop="piEmail">
          <el-input v-model="formPi.piEmail" placeholder="请输入邮箱" :style="{width: '58%'}"/>
        </el-form-item>

        <el-form-item label="电话" prop="piPhone">
          <el-input v-model="formPi.piPhone" placeholder="请输入电话" :style="{width: '58%'}"/>
        </el-form-item>

        <el-form-item label="通讯地址" prop="piCommAddress">
          <el-input v-model="formPi.piCommAddress" placeholder="请输入通讯地址"/>
        </el-form-item>

        <el-form-item label="简介" prop="piInformation">
          <el-input v-model="formPi.piInformation" type="textarea" placeholder="请输入内容" :rows="6"/>
        </el-form-item>

        <el-upload
          :action="uploadUrl"
          :ref="upload"
          :on-remove="pihandleRemove"
          :on-change="pihandleChange"
          :on-success="handleSuccess"
          :on-preview="pihandlePictureCardPreview"
          multiple
          enctype="multipart/form-data"
          :limit="10"
          list-type="picture-card"
          accept=".jpg,.png,.jpeg"
          :headers="upload.headers"
          :file-list="pifileList"
          class="a11"
          style="margin-left:80px "
        >点击上传照片
        </el-upload>
        <el-dialog :visible.sync="dialogVisible">
          <img width="100%" :src="dialogImageUrl" alt="">
        </el-dialog>
      </el-form>

      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitTecPiForm">确 定</el-button>
        <el-button @click="cancelPiForm">取 消</el-button>
      </div>
    </el-dialog>

    <!--最终确认已通过审核弹窗-->
    <el-dialog
      :show-close="false"
      :close-on-click-modal="false"
      title="重要提示"
      :visible.sync="finaldialogVisible"
      width="30%"
      @opened="handleOpenDialog">
      <span style="display: flex;justify-content: center;">是否确定已通过学院审核</span>
      <p style="text-indent: 2em;justify-content: center;">承诺书内容是否确定已通过学院审核</p>
      <span class="dialog-footer">
        <el-button :disabled="disableButton" @click="finaldialogVisible = false">取 消</el-button>
        <el-button type="primary" :disabled="disableButton" @click="submitAchievementForm(4)" >确 定</el-button>
      </span>
      <span v-if="showMessage" class="bottom">{{ countMessage }}</span>
    </el-dialog>

  </div>
</template>

<script>
import {getToken} from "@/utils/auth";
// import {listTecachievement} from "@/api/tec/tecachievement";
import {
  listTecachievement,
  addTecachievement,
  updateTecachievement,
  uploadFile,
  uploadFiles,
  updateTecStatus
} from "@/api/tec/tecachievement";
import {MessageBox, Message} from 'element-ui';
import {uploadImg} from '@/api/tec/tecachievement';
import {adduploadImg} from '@/api/tec/tecachievement';
import {addTecteam} from "@/api/tec/tecteam";
import row from "element-ui/packages/row";
import {addTecpi, getTecpi, listTecpi, updateTecpi} from "@/api/tec/tecpi";
import tecteam from "@/views/tec/tecteam/index.vue";
import {updateVerticaltopic, updateTecVerticaltopicList, addTecVerticaltopicList} from "@/api/tec/verticaltopic";
import moment from 'moment';


export default {
  name: "Tecachievement",
  dicts: ['fare_status', 'school_xy', 'type_achievement', 'technology_level', 'cutting_edge',
    'sys_user_sex', 'sys_field', 'jd_way','topic_category','natural_sciences','social_sciences'
  ],
  data() {
    return {
      uploadUrl: process.env.VUE_APP_BASE_API + "/property/propertys/testUploadFile",
      upload: {
        headers: {Authorization: "Bearer " + getToken()},
      },
      //课题多选框不显示
      natural : false,
      social : false,
      //最终确认弹窗消失
      finaldialogVisible:false,
      //计时器空
      countdownTimer: null,
      //启用按钮
      disableButton: false,
      //秒数
      countSeconds: 5,
      //隐藏倒计时提示
      showMessage: false,
      //提示信息
      countMessage: '',
      //未勾选联系人=成果负责人
      isChecked: false,
      count: 0,
      formPi: {},
      teamTable: {
        teamId: '',
        teamStaffId: '',
        teamName: '',
        teamSex: '',
        teamPhone: '',
        teamEmail: '',
        teamBirthday: '',
        teamJobTitle: '',
        teamCommAddress: '',
        teamJobAddress: ''
      },
      teamUpdateTable: {
        index: '',
        teamId: '',
        teamStaffId: '',
        teamName: '',
        teamSex: '',
        teamPhone: '',
        teamEmail: '',
        teamBirthday: '',
        teamJobTitle: '',
        teamCommAddress: '',
        teamJobAddress: ''
      },
      //新建依托课题
      topicTable: {
        topicId: '',
        topicCode: '',
        topicName: '',
        topicCategory: '',
        topicSubcategory: ''
      },
      //修改依托课题
      topicUpdateTable: {
        index: '',
        topicId: '',
        topicCode: '',
        topicName: '',
        topicCategory: '',
        topicSubcategory: ''
      },
      attachFileOpen: false,
      form: {
        achievementid: null,
        achievementname: null,
        field: [],
        college: null,
        way: [],
        typesresults: [],
        technologylevel: '',
        advancementleve: '',
        introduction: null,
        intellectualproperty: null,
        contactname: null,
        staffid: null,
        email: null,
        phone: null,
        address: null,
        award: null,
        benefit: '',
        background: '',
        piId: null,
        teamId: null,
        topicId: null,
        status:'',
        dept_id:'',
        introductionImg:'',

      },
      // 图片列表
      imgList: [],
      // 判断是新增还是修改
      isEdit: false,
      //上传时存储文件的部分
      fileList: [],
      pifileList: [],
      nameList: [],
      userRole: '',
      collegeList: [],
      categoryList: ['专利', '软著'],
      // 导出遮罩层
      exportLoading: false,
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      openTeamForm: false,
      openUpdateTeamForm: false,
      openTopic: false,
      openUpdateTopic: false,
      showInfo: 0,
      tecTeamList: [],
      tecVerticaltopicList: [],
      tecpi: {},
      dialogImageUrl: '',
      dialogVisible: false,
      openPiForm: false,
      // 表单参数
      tecAchieveForm: {
        achievementId: '',
        achievementName: '',
        college: '',
        field: '',
        category: '',
        contactName: '',
        phoneNumber: '',
        staffid: '',
        email: '',
        cooperationMethods: '',
        attachFileName: '',
        registrationDate: '',
        archiveDate: '',
        pageNumber: '',
        background: '',
        status: 1,
      },
      rules: {
        achievementname: [{
            required: true, message: '请输入成果名称,成果名称不能为空', trigger: 'blur'
          }],
        field: [{
          required: true, message: '请选择所属领域,所属领域不能为空', trigger: 'blur'
        }],
        college: [{
          required: true, message: '请输入所属学院,所属学院不能为空', trigger: 'blur'
        }],
        way: [{
          required: true, message: '请选择合作方式,合作方式不能为空', trigger: 'blur'
        }],
        typesresults: [{
          required: true, message: '请选择成果类型,成果类型不能为空', trigger: 'blur'
        }],
        technologylevel: [{
          required: true, message: '请选择技术成熟度,技术成熟度不能为空', trigger: 'blur'
        }],
        advancementleve: [{
          required: true, message: '请选择先进度,先进度不能为空', trigger: 'blur'
        }],
        introduction: [{
          required: true, message: '请输入成果介绍,成果介绍应在300到1000字之间', min: 300, max: 1000, trigger: 'blur'
        }],
        background: [{
          required: true, message: '请输入项目背景与基础,项目背景与基础不能为空', trigger: 'blur'
        }],
        intellectualproperty: [{
          required: true, message: '请输入知识产权情况,知识产权情况不能为空', trigger: 'blur'
        }],
        award: [{
          required: true, message: '请输入获得奖项,获得奖项不能为空', trigger: 'blur'
        }],
        benefit: [{
          required: true, message: '请输入效益分析,效益分析不能为空', trigger: 'blur'
        }],
        contactname: [{
          required: true, message: '请输入联系人姓名,姓名不能为空', trigger: 'blur'
        }],
        staffid: [{
          required: true, message: '请输入联系人工号,联系人工号不能为空', trigger: 'blur'
        }],
        email: [{
          required: true, message: '请输入联系人邮箱,联系人邮箱不能为空', trigger: 'blur'
        }],
        phone: [{
          required: true, message: '请输入联系人电话,联系电话不能为空', trigger: 'blur'
        }]
      },
      pirules: {
        piCollege :[{
          required: true, message: '请输入负责人学院,负责人学院不能为空', trigger: 'blur'
        }],
        piName :[{
          required: true, message: '请输入负责人姓名,负责人姓名不能为空', trigger: 'blur'
        }],
        piStaffId :[{
          required: true, message: '请输入负责人工号,负责人工号不能为空', trigger: 'blur'
        }],
        piPhone :[{
          required: true, message: '请输入负责人电话,负责人电话不能为空', trigger: 'blur'
        }]
      },
    };
  },
  computed:{
    benefitLength(){
      // 计算字数
      return this.form.benefit.replace(/[a-zA-Z]+/g, "?").replace(/\s/g, "").replace(/\./g, " ").replace(/[\d-]+/g, " ").length;
    //.replace(/[a-zA-Z]+/g, "?")：这部分将任何英文字母（大写和小写）替换为问号 ?。/[a-zA-Z]+/g 是一个正则表达式，匹配一个或多个字母字符。.replace(/\s/g, "")：这部分将任何空白字符（空格、制表符、换行等）替换为空字符串。\s 是一个正则表达式，匹配任何空白字符。.replace(/\./g, " ")：这部分将任何句点 . 替换为空格。.replace(/[\d-]+/g, " ")：这部分将任何数字和连字符的序列替换为空格。[\d-]+ 是一个正则表达式，匹配一个或多个数字或连字符。length：最后，它计算了所有这些替换操作后得到的字符串的长度。
      },
    backgroundLength(){
      // 计算字数
      return this.form.background.replace(/[a-zA-Z]+/g, "?").replace(/\s/g, "").replace(/\./g, " ").replace(/[\d-]+/g, " ").length;
    }
  },
  mounted() {
    console.log('this.$route.query',this.$route)
    if (this.$route.path === '/cs'  && this.$route.query != null) {
      const data = this.$route.query
      this.form.achievementid = data.achievementid
      this.form.achievementname = data.achievementname
      this.form.field = data.field.split(',')
      this.tecTeamList = data.tecTeamList ??  []
      this.tecVerticaltopicList = data.tecVerticaltopicList ?? []
      this.form.college = data.college
      this.form.way = data.way.split(',')
      this.form.typesresults = data.typesresults.split(',')
      this.form.introduction = data.introduction
      this.form.intellectualproperty = data.intellectualproperty
      this.form.contactname = data.contactname
      this.form.staffid = data.staffid
      this.form.email = data.email
      this.form.phone = data.phone
      this.form.address = data.address
      this.form.award = data.award
      this.form.benefit = data.benefit ?? ''
      this.form.background = data.background
      this.form.piId = data.piId
      this.form.teamId = data.teamId
      this.form.topicId = data.topicId
      this.form.status = data.status
      this.form.dept_id = data.dept_id
      this.form.introductionImg = data.introductionImg
      this.form.technologylevel = data.technologylevel ? data.technologylevel + '' : ''
      this.form.advancementleve = data.advancementleve ? data.advancementleve + '' : ''
      if (data.introductionImg !== null) {
        this.imgList = data.introductionImg.split(',');
        for (var i = 0; i < this.imgList.length; i++) {
          this.imgList[i] = process.env.VUE_APP_BASE_API+'/profile' + this.imgList[i];
        }
      }
      if (this.form.piId !== null) {
        getTecpi(this.form.piId).then(response => {
          this.tecpi = response.data
          this.getSelectOne(this.tecpi.piCollege)
        })
      }
    }
  },
  methods: {
    //联系人是否为成果负责人
    handleChangecontact(value) {
      // 在这里编写处理勾选状态改变的逻辑
      console.log('勾选状态改变：', value);
      if (value) {
        console.log('选中了');
        //把负责人信息给到联系人
        this.form.contactname = this.tecpi.piName;
        this.form.staffid = this.tecpi.piStaffId;
        this.form.email = this.tecpi.piEmail;
        this.form.phone = this.tecpi.piPhone;
      } else {
        console.log('取消选中');
        this.form.contactname = '';
        this.form.staffid = '';
        this.form.email = '';
        this.form.phone = '';
      }
    },
    //表头
    customHeaderCellStyle({column, rowIndex}) {
      // 自定义表头单元格样式
      if (rowIndex === 0) {
        return {
          'font-weight': 'bold', // 自定义字体粗细
          'font-family': '黑体',//字体
          'font-size': '14px',//字号
          height: '20px',//高度
          'background-color': 'rgba(248,248,249,0.7)'//背景颜色
        };
      } else {
        return {}; // 默认样式
      }
    },

    // 修改团队成员
    handleUpdateTeamUser(scope) {
      console.log('handleUpdateTeamUser---scope.row', scope)
      //老方法
      // this.openTeamForm = true;
      // this.teamTable = scope.row;

      //新方法
      // this.teamUpdateTable = scope.row;
      // this.teamUpdateTable.index = scope.$index;
      console.log('handleUpdateTeamUser---teamUpdateTable', this.teamUpdateTable)
      console.log('点击团队修改按钮')
      //this.teamTable作为中间变量的新方法
      this.teamTable = scope.row;
      this.teamUpdateTable.teamId = this.teamTable.teamId;
      this.teamUpdateTable.teamStaffId = this.teamTable.teamStaffId;
      this.teamUpdateTable.teamName = this.teamTable.teamName;
      this.teamUpdateTable.teamSex = this.teamTable.teamSex;
      this.teamUpdateTable.teamPhone = this.teamTable.teamPhone;
      this.teamUpdateTable.teamEmail = this.teamTable.teamEmail;
      this.teamUpdateTable.teamBirthday = this.teamTable.teamBirthday;
      this.teamUpdateTable.teamJobTitle = this.teamTable.teamJobTitle;
      this.teamUpdateTable.teamCommAddress = this.teamTable.teamCommAddress;
      this.teamUpdateTable.teamJobAddress = this.teamTable.teamJobAddress;
      this.teamUpdateTable.index = scope.$index;

      this.openUpdateTeamForm = true;
    },

    // 修改课题
    handleUpdateTopic(scope) {
      console.log('handleUpdateTopic---scope.row', scope)
      //this.topicTable作为中间变量的新方法
      this.topicTable = scope.row;

      this.topicUpdateTable.index = scope.$index;
      this.topicUpdateTable.topicCode = this.topicTable.topicCode;
      this.topicUpdateTable.topicName = this.topicTable.topicName;
      this.topicUpdateTable.topicCategory = this.topicTable.topicCategory;
      this.topicUpdateTable.topicSubcategory = this.topicTable.topicSubcategory;

      console.log('handleUpdateTopic---topicUpdateTable', this.topicUpdateTable)

      this.openUpdateTopic = true;

      if (this.topicUpdateTable.topicCategory === '1') {
        this.natural = true;
        this.social = false;
        console.log('显示大类->1自然科学');
      } else if (this.topicUpdateTable.topicCategory === '2') {
        this.natural = false;
        this.social = true;
        console.log('显示大类->2社会科学');
      } else {
        this.natural = false;
        this.social = false;
      }
    },

    // 删除团队成员
    handleDeleteTeamUser(scope) {
      let index = scope.$index;
      // 弹窗确认删除
      MessageBox.confirm('确定要删除该团队用户吗？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        // 用户点击确定按钮，执行删除操作
        this.tecTeamList.splice(index, 1);
        Message.success('删除成功');
      }).catch(() => {
      });
    },

    //新增触发课题下拉框
    handleCategoryChange() {
      console.log('清空');
      //新增
      if (this.topicTable.topicCategory === '1') {
        this.social = false;
        this.natural = true;
        console.log('新增大类->1自然');
      } else if (this.topicTable.topicCategory === '2') {
        this.natural = false;
        this.social = true;
        console.log('新增大类->社会');
      } else {
        this.natural = false;
        this.social = false;
      }
    },

    //修改课题类型触发下拉框
    handleCategoryChangexg(){
      this.topicUpdateTable.topicSubcategory = '';
      console.log('清空');
      //修改窗口
      if (this.topicUpdateTable.topicCategory === '1') {
        this.natural = true;
        this.social = false;
        console.log('修改大类->1自然');
      } else if (this.topicUpdateTable.topicCategory === '2') {
        this.natural = false;
        this.social = true;
        console.log('修改大类->2社会');
      } else {
        this.natural = false;
        this.social = false;
      }
    },

    // 删除课题
    handleDeleteTopic(scope) {
      let index = scope.$index;
      // 弹窗确认删除
      MessageBox.confirm('确定要删除该课题吗？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        // 用户点击确定按钮，执行删除操作
        this.tecVerticaltopicList.splice(index, 1);
        Message.success('删除成功');
      }).catch(() => {
      });
    },

    //解决输入框无法输入
    change() {
      this.$forceUpdate();
    },
    showInfo1() {
      this.showInfo = 1;
    },
    showInfo2() {
      this.showInfo = 2;
    },
    showInfo3() {
      this.showInfo = 3;
    },
    showInfo4() {
      this.showInfo = 4;
    },
    showInfo5() {
      this.showInfo = 5;
    },
    showInfo6() {
      this.showInfo = 6;
    },
    showInfo7() {
      this.showInfo = 7;
    },
    handleSuccess() {
      console.log('文件上传成功！')
    },

    getCollage(piId) {
      getTecpi(piId).then(response => {
        this.tecpi = response.data
        this.getSelectOne(this.tecpi.piCollege)
      })
    },

    getSelectOne(data) {
      this.count = this.count + 1;
      // console.log(this.count);
      //   console.log("调用事件");
      if (this.count > 1) {
        this.tecpi.piStaffId = '';
        this.tecpi.piInformation = '';
        this.tecpi.piId = '';
      }
      let getSelectOneQueryParams = {
        piCollege: data
      }
      listTecpi(getSelectOneQueryParams).then(response => {
        this.nameList = response.rows
      });
    },

    getSelectTwo(data) {
      this.form.piId = data;
      getTecpi(this.form.piId).then(response => {
        this.tecpi = response.data
        // console.log(response.data.information)
      })
    },

    // 上传预处理
    beforeUpload(file) {
      //获取最后文件类型
      const fileSuffix = file.name.substring(file.name.lastIndexOf(".") + 1);

      const whiteList = ["doc", "docx", "pdf", "jpg", "jpeg", "png"];

      if (whiteList.indexOf(fileSuffix) === -1) {
        this.$modal.msgError("上传的附件只能是 doc、docx、pdf、jpg、jpeg和png格式");
        return false;
      }

      if (file.size == 0) {
        this.$modal.msgError('文件不能为空');
        return false;
      }

      const reader = new FileReader();
      reader.readAsDataURL(file);
    },

    handleChange(file, fileList) {
      console.log('handleChange---->file', file)
      console.log('handleChange---->fileList', fileList)
      console.log("handleChange----this.fileList", this.fileList)
      this.fileList = fileList
      console.log("handleChange----this.fileList", this.fileList)
    },

    handleRemove(file, fileList) {
      console.log('handleRemove--->file--->', file);
      console.log('handleRemove--->fileList--->', fileList);
      console.log('handleRemove--->this.fileList--->', this.fileList);
      this.fileList = fileList
      console.log("handleChange----this.fileList", this.fileList)
    },

    handlePreview(file) {
      console.log(file);
    },

    handlePictureCardPreview(file) {
      this.dialogImageUrl = file.url;
      this.dialogVisible = true;
    },

    pihandleChange(pifile, pifileList) {
      this.pifileList = pifileList
    },

    pihandleRemove(pifile, pifileList) {
      this.pifileList = pifileList
    },

    pihandlePictureCardPreview(pifile) {
      this.dialogImageUrl = pifile.url;
      this.dialogVisible = true;
    },

    stringToList(str) {
      let list = [];
      list = str.split(',');
      return list;
    },

    listToString(list) {
      let str = '';
      if (list != null || list != '') {
        for (let i = 0; i < list.length; i++) {
          str += list[i].nickName;
          if (i != list.length - 1) {
            str += ','
          }
        }
      }
      return str;
    },

    typeFormatter(row, column) {
      let name;
      this.collegeList.forEach(function (item, index) {
        if (row.propertyType == item.propertyTypeId) {
          name = item.propertyTypeName;
        }
      })
      return name;
    },

    //添加成果负责人
    handleAdd() {
      this.openPiForm = true;
      this.title = "添加成果负责人";
    },

    fareStatusFormatter(row, column) {
      let name;
      this.dict.type.fare_status.forEach(function (item, index) {
        if (row.fareStatus == item.value) {
          name = item.label;
        }
      })
      return name;
    },

    // 表单重置
    reset() {
      this.form = {
        achievementid: null,
        achievementname: null,
        field: [],
        college: null,
        way: [],
        typesresults: [],
        technologylevel: '',
        advancementleve: '',
        introduction: null,
        intellectualproperty: null,
        contactname: null,
        staffid: null,
        email: null,
        phone: null,
        address: '',
        award: null,
        benefit: '',
        background: '',
        piId: null,
        teamId: null,
        topicId: null,
      };
      this.resetForm("form");
    },

    // 取消按钮
    cancel() {
      this.openTeamForm = false;
      this.openTopic = false;
      // this.isEdit = false;
      // this.reset();
      // this.$refs.upload.clearFiles();

      if (this.form.status == 1) {
        this.$router.push('tec/draft')
      } else {
        this.$router.push('draft')
      }
      localStorage.setItem('csData', '');
    },

    back() {
      this.$router.push('tec/toBeModified')
    },

    cancelTeamForm() {
      this.openTeamForm = false;
      // this.reset();
    },

    cancelUpdateTeamForm() {
      this.openUpdateTeamForm = false;
      // this.reset();
    },

    cancelTopicForm() {
      this.openTopic = false;
    },

    cancelUpdateTopicForm() {
      this.openUpdateTopic = false;
    },

    cancelPiForm() {
      this.openPiForm = false;
    },

    //提交前确认
    // 弹出对话框时调用倒计时
    handleOpenDialog() {
      clearInterval(this.countdownTimer); // 清除定时器
      this.countSeconds = 5; // 重置倒计时秒数
      this.showMessage = true; // 显示倒计时提示
      this.disableButton = true; // 禁用确认按钮
      this.countMessage = `${this.countSeconds} 秒后才可以点击`;

      this.countdownTimer = setInterval(() => {
        this.countSeconds--;
        this.countMessage = `${this.countSeconds} 秒后才可以点击`;
        if (this.countSeconds === 0) {
          clearInterval(this.countdownTimer);
          this.disableButton = false; // 倒计时结束后启用确认按钮
          this.showMessage = false; // 隐藏倒计时提示
        }
      }, 1000);
    },
    handleClose() {
      clearInterval(this.countdownTimer); // 清除定时器
      this.countSeconds = 6; // 重置倒计时秒数
      this.disableButton = false; // 启用确认按钮
      this.showMessage = false; // 隐藏倒计时提示
    },

    /** 提交按钮 */
    submitAchievementForm(status) {
      if (!this.tecpi.piCollege) {
          this.$message.error('请填写成果负责人所属学院');
          return;
      }
      if (!this.tecpi.piId) {
        this.$message.error('请填写成果负责人');
        return;
      }
      this.$refs["form"].validate(async valid => {
        if (valid) {
          console.log('操作的achievementid--->', this.form.achievementid)

          this.form.field = this.form.field.join(',');
          this.form.way = this.form.way.join(',');
          this.form.typesresults = this.form.typesresults.join(',');
          this.form.tecTeamList = this.tecTeamList;
          this.form.tecVerticaltopicList = this.tecVerticaltopicList;
          console.log('this.form.tecVerticaltopicList--->', this.form.tecVerticaltopicList)

          this.form.status = status;

          let file = [];
          for (var i = 0; i < this.fileList.length; i++) {
            file.push((this.fileList[i] || {}).raw)
          }
          //根据 form.achievementid 是否为空来判断是更新还是新增科技成果项
          if (this.form.achievementid != null) { //更新

            //处理文件
            const formData = new FormData();
            if (file.length !== 0) {
              console.log('valid--->file', file.length)
              for (var i = 0; i < file.length; i++) {
                formData.append('avatarfile', file[i]);
              }
              await uploadFiles(formData).then(res => {
                console.log('uploadFile---res', res)
                this.form.introductionImg = res.data
                console.log("图片名字"+this.form.introductionImg)
              })
            }

            //处理成果负责人
            if (this.tecpi.piCollege != null) {
              // console.log('调用updateTecpi方法----->', this.tecpi)
              updateTecpi(this.tecpi).then(response => {
                // console.log('调用updateTecpi方法----->', response)
              })
            }

            console.log('调用updateTecachievement方法----->', this.form)
            updateTecachievement(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.openTeamForm = false;
              this.openTopic = false;
              this.$router.push('/tec/draft')
            });
          } else { //新增
            //处理文件
            const formData = new FormData();
            if (file.length !== 0)  {
              console.log('valid--->file', file.length)
              for (var i = 0; i < file.length; i++) {
                formData.append('avatarfile', file[i]);
              }
              await uploadFiles(formData).then(res => {
                console.log('uploadFile---res', res)
                this.form.introductionImg = res.data
                console.log("图片名字"+this.form.introductionImg)
              })
            }
            console.log('调用addTecAchievement方法')
            addTecachievement(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.openTeamForm = false;
              this.openTopic = false;
            });
            this.$router.push('/tec/draft')
          }
        }else {
          // 表单验证不通过，提示用户有未填项
          this.$message.error('请填写完整的成果信息');
        }
      });
      this.finaldialogVisible = false;
      //清空本地缓存
      localStorage.setItem('csData', '');
    },

    //重置团队成员表单
    resetteam() {
      this.teamTable = {
        teamId: '',
        teamStaffId: '',
        teamName: '',
        teamSex: '',
        teamPhone: '',
        teamEmail: '',
        teamBirthday: '',
        teamJobTitle: '',
        teamCommAddress: '',
        teamJobAddress: ''
      };
      this.resetForm("teamTable");
    },

    //重置课题表单
    resettopic() {
      this.topicTable = {
        topicId: '',
        topicCode: '',
        topicName: '',
        topicCategory: '',
      };
      this.resetForm("topicTable");
    },

    //重置成果负责人表单
    resetPi() {
      this.formPi = {
      }
    },
    //添加团队成员
    addTableRow() {
      this.openTeamForm = true;
      this.title = "添加团队成员";
      this.resetteam();
    },
    //添加课题
    addTopic() {
      this.natural = false;
      this.social = false;
      this.openTopic = true;
      this.title = "添加课题";
      this.resettopic();
    },
    //新增团队成员的保存按钮
    submitTeamForm() {
      // console.log('submitTeamForm----->this.teamTable', this.teamTable)
      //团队成员表单必填校验
      console.log('新增团队的保存按钮');
      if (this.teamTable.teamStaffId === '') {
        this.$message.error('未填写团队成员工号');
        return;
      } else if (this.teamTable.teamName === '') {
        this.$message.error('未填写团队成员姓名');
        return;
      } else if (this.teamTable.teamSex === '') {
        this.$message.error('未选择团队成员性别');
        return;
      } else if (this.teamTable.teamPhone === '') {
        this.$message.error('未填写团队成员电话');
        return;
      } else if (this.teamTable.teamEmail === '') {
        this.$message.error('未填写团队成员邮箱');
        return;
      } else if (!this.teamTable.teamBirthday || this.teamTable.teamBirthday === '') {
        this.$message.error('未填写团队成员出生日期');
        return;
      } else if (this.teamTable.teamJobTitle === '') {
        this.$message.error('未填写团队成员职位');
        return;
      } else if (this.teamTable.teamCommAddress === '') {
        this.$message.error('未填写团队成员通讯地址');
        return;
      } else {
        this.tecTeamList.push({
          teamId: this.form.teamId,
          teamStaffId: this.teamTable.teamStaffId,
          teamName: this.teamTable.teamName,
          teamSex: this.teamTable.teamSex,
          teamPhone: this.teamTable.teamPhone,
          teamEmail: this.teamTable.teamEmail,
          teamBirthday: this.$moment(this.teamTable.teamBirthday).format("YYYY/MM/DD"),
          teamJobTitle: this.teamTable.teamJobTitle,
          teamCommAddress: this.teamTable.teamCommAddress,
          teamJobAddress: this.teamTable.teamJobAddress
        });
        this.resetteam()
        console.log('this.tecTeamList--->', this.tecTeamList)
        this.openTeamForm = false;
      }
    },

    //修改团队成员的保存按钮
    submitUpdateTeamForm() {
      //为了页面回显
      this.teamTable = this.teamUpdateTable
      console.log('修改团队的保存按钮');
      this.teamTable.teamId = this.teamUpdateTable.teamId;
      this.teamTable.teamStaffId = this.teamUpdateTable.teamStaffId;
      this.teamTable.teamName = this.teamUpdateTable.teamName;
      this.teamTable.teamSex = this.teamUpdateTable.teamSex;
      this.teamTable.teamPhone = this.teamUpdateTable.teamPhone;
      this.teamTable.teamEmail = this.teamUpdateTable.teamEmail;
      this.teamTable.teamBirthday = this.$moment(this.teamUpdateTable.teamBirthday).format("YYYY/MM/DD");
      this.teamTable.teamJobTitle = this.teamUpdateTable.teamJobTitle
      this.teamTable.teamCommAddress = this.teamUpdateTable.teamCommAddress
      this.teamTable.teamJobAddress = this.teamUpdateTable.teamJobAddress

      console.log('}else{---teamUpdateTable.index', this.teamUpdateTable.index)
      //更新团队成员
      if (this.teamUpdateTable.teamStaffId === '') {
        this.$message.error('未填写团队成员工号');
        return;
      } else if (this.teamUpdateTable.teamName === '') {
        this.$message.error('未填写团队成员姓名');
        return;
      } else if (this.teamUpdateTable.teamSex === '') {
        this.$message.error('未选择团队成员性别');
        return;
      } else if (this.teamUpdateTable.teamPhone === '') {
        this.$message.error('未填写团队成员电话');
        return;
      } else if (this.teamUpdateTable.teamEmail === '') {
        this.$message.error('未填写团队成员邮箱');
        return;
      } else if (this.teamUpdateTable.teamBirthday === ''|| !this.teamUpdateTable.teamBirthday || !moment(this.teamUpdateTable.teamBirthday).isValid()) {
        alert('未填写团队成员出生日期');
        this.teamUpdateTable.teamBirthday = '';
      } else if (this.teamUpdateTable.teamJobTitle === '') {
        this.$message.error('未填写团队成员职位');
        return;
      } else if (this.teamUpdateTable.teamCommAddress === '') {
        this.$message.error('未填写团队成员通讯地址');
        return;
      } else {
        this.tecTeamList[this.teamUpdateTable.index].teamId = this.teamUpdateTable.teamId
        this.tecTeamList[this.teamUpdateTable.index].teamStaffId = this.teamUpdateTable.teamStaffId
        this.tecTeamList[this.teamUpdateTable.index].teamName = this.teamUpdateTable.teamName
        this.tecTeamList[this.teamUpdateTable.index].teamSex = this.teamUpdateTable.teamSex
        this.tecTeamList[this.teamUpdateTable.index].teamPhone = this.teamUpdateTable.teamPhone
        this.tecTeamList[this.teamUpdateTable.index].teamEmail = this.teamUpdateTable.teamEmail
        this.tecTeamList[this.teamUpdateTable.index].teamBirthday = this.$moment(this.teamUpdateTable.teamBirthday).format("YYYY/MM/DD")
        this.tecTeamList[this.teamUpdateTable.index].teamJobTitle = this.teamUpdateTable.teamJobTitle
        this.tecTeamList[this.teamUpdateTable.index].teamCommAddress = this.teamUpdateTable.teamCommAddress
        this.tecTeamList[this.teamUpdateTable.index].teamJobAddress = this.teamUpdateTable.teamJobAddress
        this.teamUpdateTable = {
          teamId: '',
          teamStaffId: '',
          teamName: '',
          teamSex: '',
          teamPhone: '',
          teamEmail: '',
          teamBirthday: '',
          teamJobTitle: '',
          teamCommAddress: '',
          teamJobAddress: '',
        };
        console.log('this.tecTeamList--->', this.tecTeamList)

        this.openUpdateTeamForm = false;
      }
    },

    //新增课题的保存按钮
    submitTopicForm() {
      //纵向课题表单必填校验
      if (this.topicTable.topicCode === '') {
        this.$message.error('未填写课题编号');
        return;
      } else if (this.topicTable.topicName === '') {
        this.$message.error('未填写课题名称');
        return;
      } else {
        if (this.topicTable.topicId) {
          updateTecachievement(this.topicTable).then(response => {
            this.$modal.msgSuccess("修改成功");
          });
        } else {
          this.tecVerticaltopicList.push({
            achievementid: this.form.achievementid,
            topicId: this.topicTable.topicId,
            topicCode: this.topicTable.topicCode,
            topicName: this.topicTable.topicName,
            topicCategory: this.topicTable.topicCategory,
            topicSubcategory: this.topicTable.topicSubcategory,
          });
          this.resetteam()
          console.log('刚新增成果，此时新增表单数据', this.topicTable)
          console.log('this.tecVerticaltopicList--->', this.tecVerticaltopicList)
        }
        this.openTopic = false;
      }
    },

    //修改课题的保存按钮
    submitUpdateTopicForm() {
      console.log('topicUpdateTable.index--->', this.topicUpdateTable.index)
      // 为了页面回显
      this.topicTable = this.topicUpdateTable

      console.log('this.topicUpdateTable--->', this.topicUpdateTable)

      this.topicTable.topicCode = this.topicUpdateTable.topicCode;
      this.topicTable.topicName = this.topicUpdateTable.topicName;
      this.topicTable.topicCategory = this.topicUpdateTable.topicCategory;
      this.topicTable.topicSubcategory = this.topicUpdateTable.topicSubcategory;

      //更新课题
      if (this.topicUpdateTable.topicCode === '') {
        alert('未填写课题编号')
      } else if (this.topicUpdateTable.topicName === '') {
        this.$message.error('未填写课题名称');
        return;
      } else {
        this.tecVerticaltopicList[this.topicUpdateTable.index].topicCode = this.topicUpdateTable.topicCode
        this.tecVerticaltopicList[this.topicUpdateTable.index].topicName = this.topicUpdateTable.topicName
        this.tecVerticaltopicList[this.topicUpdateTable.index].topicCategory = this.topicUpdateTable.topicCategory
        this.tecVerticaltopicList[this.topicUpdateTable.index].topicSubcategory = this.topicUpdateTable.topicSubcategory
        this.topicUpdateTable = {
          topicId: '',
          topicCode: '',
          topicName: '',
          topicCategory: '',
          topicSubcategory: '',
          achievementid: '',
        };
        console.log('this.tecVerticaltopicList--->', this.tecVerticaltopicList)
        this.openUpdateTopic = false;
      }
    },

    //成果负责人编辑确定按钮
    async submitTecPiForm() {
      let pifile = [];
      for (var i = 0; i < this.pifileList.length; i++) {
        pifile.push((this.pifileList[i] || {}).raw)
      }
      //处理文件
      const piformData = new FormData();
      if (pifile.length !== 0) {
        for (var i = 0; i < pifile.length; i++) {
          piformData.append('avatarfile', pifile[i]);
        }
        await uploadFiles(piformData).then(res => {
          console.log('uploadFile---res', res)
          this.formPi.piImg = res.data
          console.log(this.formPi.piImg)
        })
      }
      this.$refs["formPi"].validate( valid => {
        if (valid) {
          addTecpi(this.formPi).then(response => {
            this.$modal.msgSuccess("新增成功");
            this.resetPi();
            this.openPiForm = false;
            //刷新负责人列表数据
            this.getSelectOne(this.tecpi.piCollege)
          });
        }
      });
      this.pifileList = [];
    },
    DownloadWord() {
      // 构建需要下载的文件的 URL
      const fileUrl = '/模板.doc'; // 替换为实际的文档 URL
      // 创建一个 <a> 标签
      const link = document.createElement('a');
      link.href = fileUrl;
      // 设置下载文件的名称
      link.download = '填写成果-模板.doc'; // 替换为实际的文档名称
      // 将 <a> 标签添加到页面上并模拟点击以触发下载
      document.body.appendChild(link);
      link.click();
      // 下载完成后移除 <a> 标签
      document.body.removeChild(link);
    },
  }
};
</script>

<style scoped>
.dialog-footer {
  display: flex;
  justify-content: center;
  margin-top: 70px;
}
.bottom {
  display: flex;
  justify-content: center;
  color: gray;
  font-size: 10px;
  bottom: 0;
}

.a1 {
  margin-top: 20px;
  margin-left: 20px;
  length:1112px;
}

.a2 {
  margin-left: 10px;
  width: 1000px;
  display: flex;
  flex-wrap: wrap;
}

.a2 .el-checkbox {
  padding-right: 8px;
  width: 20%;
  margin-bottom: 3px; /* 设置每行多选框之间的垂直间距 */
}

.a3 {
  margin-top: 20px;
  margin-left: -80px;
}

.a4 {
  margin-left: 10px;
  width: 1000px;
  display: flex;
  flex-wrap: wrap;
}

.a4 .el-checkbox {
  flex-basis: 20%; /* 多选框元素占据每行的四分之一宽度 */
  margin-bottom: 3px; /* 设置每行多选框之间的垂直间距 */
}

.a5 {
  margin-right: 10px;
  margin-left: 40px;
}

.a6 {
  margin-left: 10px;
  width: 220px;
}

.a7 {
  margin-left: 10px;
  width: 750px;
  display: flex;
  flex-wrap: wrap;
}

.a8 {
  margin-left: 15px;
}

.a9 {
  margin-left: 14px;
}

.a10 {
  margin-left: 11px;
}

.a12 {
  margin-top: 20px;
  margin-right: 20px;
  margin-left: -38px;
}

.input-row {
  display: flex;
  margin-left: 60px;
  width: 1200px;
}

.a11 {
  margin-top: 10px;
  margin-left: 10px;
}

.a13 {
  margin-left: -50px;
}

.input-field {
  margin-top: 20px;
  margin-right: 10px;
  margin-left: -40px;
}

.input-field1 {
  margin-right: 20px;
  margin-top: 20px;
  margin-left: 70px;
}

. input-field3 {
  margin-right: 10px;
  margin-top: 20px;
  margin-left: 0px;
}
.gray{
  color: #888a8e;
}
.left{
  margin-left: 20px;
}
</style>
