---
layout: page
title: "HTML 规范"
category: convention
date: 2016-05-02 19:44:39
author: anna,simon
---

(0). 尽量不使用style属性

(1).为每个HTML页面第一行添加标准模式（Standard mode）,确保在每个浏览器中拥有一致的展现,如下代码:

```html
<!DOCTYPE html>
```

(2). 标签、属性命名由小写英文、数字和-组成，且所有的标签必须闭合，属性值必须用双引号 “" ，同时避免中文拼音命名，尽量简易并语义化

  * class 为 - 连接的全小写字母，例如：eurus-table
  * id, name 为首字母小写的驼峰命名，例如：eurusTable

```html
<div class="css-name" id="idName" name="nameDiv"></div>
```

(3).文档类型的声明统一为HTML5声明类型，编码统一为UTF-8 如下代码:

```html
<meta charset="UTF-8">
```

(4). IE支持通过特定<meta>标签来确定绘制当前页面所应该采用的IE版本。除非有强烈的特殊需求，否则最好是设置为edge mode ，从而通知IE采用其所支持的最新的模式。如下代码:

```html
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
```

(5). <head>中添加页面相关信息(通过<title>、<meta>、<link>标签),标准的<head>如下:

```html
<head>
  <title>页面标题</title>
  <!-- 设置页面编码 -->
  <meta charset="UTF-8" />
  <!-- SEO 属性 -->
  <meta name="description" content=" " />
  <meta name="keywords" content=" "/>
  <meta name="author" content=" " />

  <!-- 设置IE的版本为最新版 -->
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <!-- 移动端自适应viewport设置 -->
  <meta name="viewport" content="width=device-width,initial-scale=1" user-scalable=no>
  <!-- 网页图标 -->
  <link rel="web icon" href="favicon.ico">

  <link rel="stylesheet" href="/stylesheets/style.css">
</head>
```

(6).非特殊情况下的css样式文件外链至HEAD之间，javascript文件外链至页面底部,如下代码:
```html
<!DOCTYPE html>
<html>
  <head>
    <link rel ="stylesheet" href="/stylesheets/style.css">
  </head>
  <body>
    <!-- 页面头部 -->
    <header></header>

    <!-- 页面主题内容 -->
    <section></section>

    <!-- 页面底部 -->
    <footer></footer>
    <script src="/javascripts/jquery.js" type="text/javascript"></script>
  </body>
</html>
```

(7).HTML 属性应当按照以下给出顺序来依次排列，目的是确保代码的易读性

```css
class --> id、name --> data-* --> src、for、type、href --> title、all --> aria-* 、role
```

(8). 含有描述性表单元素时(input、textarea)添加label

```html
<p>
  <label for="test">测试</label>
  <input type="text" id="test">
</p>
```

(9). 尽可能的减少<div>的嵌套

(10). 省略Type 属性

鉴于 HTML5 中以上两者默认的 type 值就是 text/css 和 text/javascript，所以 type 属性一般是可以忽略掉的。甚至在老旧版本的浏览器中这么做也是安全可靠的。

不推荐

```html
<link rel="stylesheet" href="main.css" type="text/css">
<script src="main.js" type="text/javascript"></script>
```

推荐

```html
<link rel="stylesheet" href="main.css">
<script src="main.js"></script>
```

## 图片规范

* 命名应用小写英文、数字、-组合，以便于团队其他成员理解
* 页面元素类的图片全部放入images文件夹中
* 图片格式仅限于gif、png、jpg 等等
* 背景图片请尽可能的使用sprite技术，目的是减小http请求

## 多媒体备选文本

对页面上的媒体而言，像图片、视频、canvas 动画等，要确保其有可替代的占位文字。图片文件我们可采用有意义的备选文本（alt），视频和音频文件我们可以为其加上说明文字或字幕。

提供可替代内容对可用性来说十分重要。（图片的 alt 属性是可不填写内容的，纯装饰性的图片就可用这么做：alt=""）

```html
<img src ="/img/img.png" alt="this is a test">
```

## 注释规范

* 注释包括标明作者，文件版本，创建/修改时间 ，重大改版记录，函数描述，文件版本，功能等信息。
* html 注释 :  ```<!--  <div class="test""> -->```
* css 注释 : ```/* test; */```

