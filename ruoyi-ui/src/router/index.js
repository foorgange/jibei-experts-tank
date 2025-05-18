import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

/* Layout */
import Layout from '@/layout'

// const originalPush = VueRouter.prototype.push
// VueRouter.prototype.push = function push (location, onResolve, onReject) {
//   if (onResolve || onReject) return originalPush.call(this, location, onResolve, onReject)
//   return originalPush.call(this, location).catch(err => err)
// }
//
//
//
// // replace
// const originalReplace = VueRouter.prototype.replace
// VueRouter.prototype.replace= function replace(location) {
//   return originalReplace.call(this, location).catch(err => err)
// }
// Vue.use(VueRouter)
/**
 * Note: 路由配置项
 *
 * hidden: true                     // 当设置 true 的时候该路由不会再侧边栏出现 如401，login等页面，或者如一些编辑页面/edit/1
 * alwaysShow: true                 // 当你一个路由下面的 children 声明的路由大于1个时，自动会变成嵌套的模式--如组件页面
 *                                  // 只有一个时，会将那个子路由当做根路由显示在侧边栏--如引导页面
 *                                  // 若你想不管路由下面的 children 声明的个数都显示你的根路由
 *                                  // 你可以设置 alwaysShow: true，这样它就会忽略之前定义的规则，一直显示根路由
 * redirect: noRedirect             // 当设置 noRedirect 的时候该路由在面包屑导航中不可被点击
 * name:'router-name'               // 设定路由的名字，一定要填写不然使用<keep-alive>时会出现各种问题
 * query: '{"id": 1, "name": "ry"}' // 访问路由的默认传递参数
 * meta : {
    noCache: true                   // 如果设置为true，则不会被 <keep-alive> 缓存(默认 false)
    title: 'title'                  // 设置该路由在侧边栏和面包屑中展示的名字
    icon: 'svg-name'                // 设置该路由的图标，对应路径src/assets/icons/svg
    breadcrumb: false               // 如果设置为false，则不会在breadcrumb面包屑中显示
    activeMenu: '/system/user'      // 当路由设置了该属性，则会高亮相对应的侧边栏。
  }
 */

// 公共路由
export const constantRoutes = [
  {
    path: '/redirect',
    component: Layout,
    hidden: true,
    children: [
      {
        path: '/redirect/:path(.*)',
        component: (resolve) => require(['@/views/redirect'], resolve)
      }
    ]
  },
  {
    path: '/login',
    component: (resolve) => require(['@/views/login'], resolve),
    hidden: true
  },

  {
    path: '/displayMaterials',
    component: (resolve) => require(['@/views/displayMaterials'], resolve),
    hidden: true,
    meta: {
      noCache: true
    }
  },
  {
    path: '/displayReport',
    component: (resolve) => require(['@/views/displayReport'], resolve),
    hidden: true,
    meta: {
      noCache: true
    }
  },
  {
    path: '/displayEducation',
    component: (resolve) => require(['@/views/displayEducation'], resolve),
    hidden: true,
    meta: {
      noCache: true
    }
  },
  {
    path: '/registerend',
    component: (resolve) => require(['@/views/registerend'], resolve),
    hidden: true
  },
  {
    path: '/register',
    component: (resolve) => require(['@/views/register'], resolve),
    hidden: true
  },
  {
    path: '/404',
    component: (resolve) => require(['@/views/error/404'], resolve),
    hidden: true
  },
  {
    path: '/401',
    component: (resolve) => require(['@/views/error/401'], resolve),
    hidden: true
  },

  {
    path: '',
    component: Layout,
    redirect: 'index',
    children: [
      {
        path: 'index',
        component: (resolve) => require(['@/views/index'], resolve),
        name: 'Index',
        meta: { title: '首页', icon: 'dashboard', affix: true }
      }
    ]
  },
  {
    path: '/user',
    component: Layout,
    hidden: true,
    redirect: 'noredirect',
    children: [
      {
        path: 'profile',
        component: (resolve) => require(['@/views/system/user/profile/index'], resolve),
        name: 'Profile',
        meta: { title: '个人中心', icon: 'user' }
      }
    ]
  },
  {
    path: '/system/user-auth',
    component: Layout,
    hidden: true,
    children: [
      {
        path: 'role/:userId(\\d+)',
        component: (resolve) => require(['@/views/system/user/authRole'], resolve),
        name: 'AuthRole',
        meta: { title: '分配角色', activeMenu: '/system/user' }
      }
    ]
  },
  {
    path: '/system/role-auth',
    component: Layout,
    hidden: true,
    children: [
      {
        path: 'user/:roleId(\\d+)',
        component: (resolve) => require(['@/views/system/role/authUser'], resolve),
        name: 'AuthUser',
        meta: { title: '分配用户', activeMenu: '/system/role' }
      }
    ]
  },
  {
    path: '/system/dict-data',
    component: Layout,
    hidden: true,
    children: [
      {
        path: 'index/:dictId(\\d+)',
        component: (resolve) => require(['@/views/system/dict/data'], resolve),
        name: 'Data',
        meta: { title: '字典数据', activeMenu: '/system/dict' }
      }
    ]
  },
  {
    path: '/monitor/job-log',
    component: Layout,
    hidden: true,
    children: [
      {
        path: 'index',
        component: (resolve) => require(['@/views/monitor/job/log'], resolve),
        name: 'JobLog',
        meta: { title: '调度日志', activeMenu: '/monitor/job' }
      }
    ]
  },
  {
    path: '/tool/gen-edit',
    component: Layout,
    hidden: true,
    children: [
      {
        path: 'index',
        component: (resolve) => require(['@/views/tool/gen/editTable'], resolve),
        name: 'GenEdit',
        meta: { title: '修改生成配置', activeMenu: '/tool/gen' }
      }
    ]
  },
  {
    path: '/resetPwd',
    component: (resolve) => require(['@/views/system/user/profile/resetPwd'], resolve),
    hidden: true
  },
  // {
  //   path: '/user/header',
  //   component: (resolve) => require(['@/views/user/util/header'], resolve),
  //   hidden: true
  // }
  {
    path: '/cs',
    name: 'cs',
    component: () => import('@/views/tec/achievement/cs') // 引入新页面组件
  },
  {
    path: '/auditing',
    name: 'auditing',
    component: () => import('@/views/tec/achievement/auditing') // 引入新页面组件
  },
  {
    path: '/draft',
    name: 'draft',
    component: () => import('@/views/tec/achievement/draft')
  },
  {
    path: '/tecPi',
    name: 'tecPi',
    component: () => import('@/views/tec/achievement/tecPi') // 引入新页面组件
  },
  {
    path: '/tecLibrary',
    name: 'tecLibrary',
    component: () => import('@/views/tec/achievement/tecLibrary') // 引入新页面组件
  },
  {
    path: '/Openauditing',
    name: 'Openauditing',
    component: () => import('@/views/Openauditing') // 引入新页面组件
  },
  {
    path: '/PatentScreen',
    name: 'PatentScreen',
    component: () => import('@/views/techAchievementDashboard/index') // 引入新页面组件
  },
  {
    path: '/PatentScreenbackup',
    name: 'PatentScreenbackup',
    component: () => import('@/views/techAchievementDashboardbackup/index') // 引入新页面组件
  },
  {
    path: '/Donut3D',
    name: '/Donut3D',
    component: () => import('@/views/techAchievementDashboard/Donut3D') // 引入新页面组件
  },
  {
    path: '/patentScreenCRUD',
    name: 'patentScreenCRUD',
    component: () => import('@/views/techAchievementDashboardbackup/patentScreenCRUD') // 引入新页面组件
  },
  {
    path: '/addpatent',
    name: 'addpatent',
    component: () => import('@/views/tec/achievement/addpatent') // 引入新页面组件
  },
  {
    path: '/patentChart',
    name: 'patentChart',
    component: () => import('@/views/tec/achievement/patentChart') // 引入新页面组件
  },
  {
    path: '/papers',
    name: 'papers',
    component: () => import('@/views/tec/achievement/papers') // 引入新页面组件
  },
  {
    path: '/addpapers',
    name: 'addpapers',
    component: () => import('@/views/tec/achievement/addpapers') // 引入新页面组件
  },




]

export default new Router({
  mode: 'history', // 去掉url中的#
  scrollBehavior: () => ({ y: 0 }),
  routes: constantRoutes
})
