---
layout: page
title: "Sublime 定义代码片段"
category: tools
date: 2016-05-02 21:43:16
author: simon
---

不管是写代码还是写markdown，总会有一些简单重复的代码片段，就让我们用Sublime的内置功能来实现简化输入的目的吧。（代码片段：snippet)

Snippet文件是以```.sublime-snippet```为扩展名的XML文件, 可以任意命名为XXX.sublime-snippet。创建自己的snippet的方式为菜单栏```Tools > New Snippet```，然后编辑XML的内容如：

```xml
<snippet>
  <content><![CDATA[
var ${1:oVarName} = function(){
  ${2:body}
}
]]></content>
  <tabTrigger>func</tabTrigger>
  <scope>source.js, source.javascript</scope> -->
</snippet>
```
这个例子达到的效果为：输入func然后键入```<tab>```键，就可以立马出现一整段的内容(见以下)，并包含两个占位符可以使用```<tab>```切换进行编辑。是不是很方便！

```js
var oVarName = function(){
  body
}
```

下面介绍一下配置选项：

* content:其中必须包含<![CDATA[…]]>,否则无法工作, 在CDATA内可以使用任意格式和内容来进行编写代码片段。类似```${1:oVarName}```的是占位符，1表示参数的编号，而oVarName则是占位字符。
* tabTrigger: 用来引发代码片段的字符或者字符串。
* scope: 表示你的代码片段会在那种语言环境下激活。在以上这个例子内，并未定义，则全局可用。
* description :展示代码片段的描述, 如果不写的话，默认使用代码片段的文件名作为描述

文件写好后，直接保存即可，立即生效（无需重启Sublime）。如果需要修改的话，请查看：

Mac OS上在 ```/Users/hanz/Library/Application Support/Sublime Text 3/Packages/User```内

## 环境变量

以下这些环境变量是在Sublime中已经预定义的.

{: .table .table-striped }
| 环境变量名   | 描述   |
| ------------- |
| $TM_FILENAME | 用户文件名 |
| $TM_FILEPATH | 用户文件全路径 |
| $TM_FULLNAME | 用户的用户名 |
| $TM_LINE_INDEX | 插入多少列, 默认为0 |
| $TM_LINE_NUMBER | 一个snippet插入多少行 |
| $TM_SOFT_TABS | 如果设置translate_tabs_to_spaces : true 则为Yes |
| $TM_TAB_SIZE | 每个Tab包含几个空格 |

## 参考

* [手把手教你写Sublime中的Snippet](http://ju.outofmemory.cn/entry/105183)
