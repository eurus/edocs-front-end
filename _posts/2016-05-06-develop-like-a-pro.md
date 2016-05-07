---
layout: page
title: "产品开发规范"
category: convention
date: 2016-05-06 10:08:46
---

## 团队协作

### 使用工具

**任务管理使用Trello**    

每个Trello Board都有Todo，Doing，Done，Test，Story，Bug这六个列表    
其中     

**Todo**：TeamLeader确认的任务会更新到Tode列表，并且安排相应的人和相应的截止时间     
**Doing**：开发人员认领任务，移动到Doing的列表，来显示目前团队成员正在进行的事情    
**Test**：开发完成任务之后，移动到这个List，指定除了自己以外的测试人员，并提醒相关人员测试     
**Done**：Test分支上面的任务经过测试之后移动到Done列表，并且打上Master Branch的hash    
**Story**：和客户交流收集的需求，会新增到这边，评估可行性之后，生成相应的Todo Card     
**Bug**：用户反馈，以及测试生成的Bug，提供详细的错误信息，错误描述放入这个List     
**团队交流使用BearyChat **   
增加Trello机器人    
增加Coding的机器人   
后续增加集成测试的机器人

## 代码管理

### 开发流程

前端项目，后端项目都需要分为单独的Repo    
每个项目都分为master和release两个主分支，开发人员从master分支clone代码，然后新建feature分支，例如Doing中的新增支付宝支付，则新增banana-add-alipay这个分支，内容格式为nickname-feature-description。    
`git checkout -b banana-feature-add-alipay`    
每次提交代码到自己的分支，然后提merge request，相应的人code review之后merge到master branch，并且删除本地以及远程的分支。

### 错误修正流程

master的bug直接发起merge request，命名为banana-bugfix-bugname
`git check out -b banana-bugfix-bugname`     

**NOTICE**: 每天工作之前务必pull最新的master branch     
关于版本号<major>.<minor>.<patch>，例如1.1.1，如果有bugfix则为1.1.1，1.1.2，依次递增

## 产品上线以及CI

* 确保所有要发布的merge request已经merge到master
* 对master代码进行测试，如果发现bug，把对应的bugfix merge到master
* 删除旧的release分支，从当前master创建新的release分支
* CI服务器测试build并且发布
* 发布完成之后在当前release分支打上对应版本的tag
代码部署从release分支部署，每次分为stg和prod两个模式，stg模式无重大错误则发布到prod环境

## 产品上线的Bug反馈

在程序中增加hook，计入新的bug系统中，根据项目及时通知对应干系人进行处理。

