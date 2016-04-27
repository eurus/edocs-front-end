---
layout: page
title: "CSS 和 HTML 规范"
category: css
date: 2016-04-25 15:33:42
author: anna
---

## 通用规范

1. Tab用两个空格代替
2. CSS每个样式属性结尾加";"
3. 文档内容编码统一为 UTF-8
4. 尽量不使用style属性

Sublime Text 设置Tab为两个空格可以选择Preference > Settings - User，在其中添加以下这一段：


{% highlight javascript %}
  "tab_size": 2,
  "translate_tabs_to_spaces": true,
  "trim_trailing_white_space_on_save": true
{% endhighlight %}


## 文件规范

1. 文件名使用语义化单词全名，多个单词使用驼峰命名法
2. 文件名、id、class等命名保持语义化清晰易懂且避免重复定义

## html书写规范

(1).为每个HTML页面第一行添加标准模式（Standard mode）,确保在每个浏览器中拥有一致的展现,如下代码:

{% highlight html %}
<!DOCTYPE html>
{% endhighlight%}

(2). 标签、属性命名由小写英文、数字和-组成，且所有的标签必须闭合，属性值必须用双引号 “" ，同时避免中文拼音命名，尽量简易并语义化

  * class 为 - 连接的全小写字母，例如：eurus-table
  * id, name 为首字母小写的驼峰命名，例如：eurusTable

  {% highlight css %}
  <div class="css-name" id="idName" name="nameDiv"></div>
  {% endhighlight%}

(3).文档类型的声明统一为HTML5声明类型，编码统一为UTF-8 如下代码:

{% highlight html %}
<meta charset="UTF-8">
{% endhighlight %}

(4). IE支持通过特定<meta>标签来确定绘制当前页面所应该采用的IE版本。除非有强烈的特殊需求，否则最好是设置为edge mode ，从而通知IE采用其所支持的最新的模式。如下代码:

{% highlight html %}
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
{% endhighlight %}

(5). <head>中添加页面相关信息(通过<title>、<meta>、<link>标签),标准的<head>如下:

{% highlight html %}
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
  <meta name="viewport" content="width=device-width,initial-scale=1",user-scalable=no>
  <!-- 网页图标 -->
  <link rel="web icon" href="favicon.ico">

  <link rel="stylesheet" href="/stylesheets/style.css">
</head>
{% endhighlight %}

(6).非特殊情况下的css样式文件外链至HEAD之间，javascript文件外链至页面底部,如下代码:
{% highlight html %}
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
{% endhighlight %}

(7).HTML 属性应当按照以下给出顺序来依次排列，目的是确保代码的易读性

{% highlight css %}
class --> id、name --> data-* --> src、for、type、href --> title、all --> aria-* 、role
{% endhighlight%}

(8). 含有描述性表单元素时(input、textarea)添加label

{% highlight html %}
<p>
  <label for="test">测试</label>
  <input type="text" id="test">
</p>
{% endhighlight %}

(9). 尽可能的减少<div>的嵌套

## css书写规范

(1). 可以将代码分为两个文件，一个是针对所有浏览器，一个是只针对IE，可以通过下面的方法导入,如下代码:

{% highlight html %}
<!—放置所有浏览器样式 -->
<link rel ="stylesheet" type="text/css" href="">

<!—只放置ie-->
<! --[if it ie 8]
  < link rel="stylesheet" href="/stylesheet/ie.css">
<! [end if]-->
{% endhighlight %}

(2). css样式新建或修改应该遵循以下原则:

* 避免css重复定义
* 通过继承和层叠重用已有样式
* 不要轻易改动全站级css,若要改动，则需要经过全站的测试

(3). 单位 和 0值

* 省略0值后面的单位 如:

{% highlight css%}
margin: 0; /* 正确 */
margin:0px; /* 错误 */
{% endhighlight %}

(4) css属性的显示顺序统一使用CssComb整理（详见Sublime Text插件指南）

(5).兼容多个浏览器时，将标准属性写在底部，如下代码:

{% highlight css%}
.div {
  -moz-border-radius:10px;
  -wekkit-border-radius:10px;
  -ms-border-radius:10px;
  -o-border-radius:10px;
  border-radius:10px;
}
{% endhighlight %}

(6).css使用选择器时，不允许使用无意义的单词定义样式 如: .hh .a .b 等, 可以通过父类节点进行设置如: .father .child {...}

(7).使用z-index属性时它的值不要超过150（通用组除外），页面中元素内容的值<=10,不可直接使用999-9999之间的大值

(8).尽量地避免使用CSS Hack ,如下代码：

{% highlight css%}
.div {
  property:value； /*所有浏览器*/
 +property:value; /* ie 7 */
 _property:value; /* ie 6 */
 *property:value; /* ie 6-7 */
 property:value\9; /* ie 6-7-8-9 */
}
{% endhighlight %}

(9).避免使用低效的选择器

{% highlight css%}
body> * {…}
ul>li>a {…}
#footer >h3 {…}
{% endhighlight %}

(10).css引号

属性选择器或属性值用双引号" " 而不是用单引号' ',url值不要使用引号。

{% highlight css %}
@import url('//cdn.com');

html {
  font-family:"open sans";
}
{% endhighlight%}

(11).几个注意点

* 尽量不要在css中使用 !important
* 不要在css选择器中使用标签名 h2.title{…}
* 避免使用filter

## 图片规范

* 命名应用小写英文、数字、-组合，以便于团队其他成员理解
* 页面元素类的图片全部放入images文件夹中
* 图片格式仅限于gif、png、jpg 等等
* 背景图片请尽可能的使用sprite技术，目的是减小http请求

## 多媒体备选文本

对页面上的媒体而言，像图片、视频、canvas 动画等，要确保其有可替代的占位文字。图片文件我们可采用有意义的备选文本（alt），视频和音频文件我们可以为其加上说明文字或字幕。

提供可替代内容对可用性来说十分重要。（图片的 alt 属性是可不填写内容的，纯装饰性的图片就可用这么做：alt=""）

{% highlight html %}
<img src ="/img/img.png" alt="this is a test">
{% endhighlight %}

## 注释规范

* 注释包括标明作者，文件版本，创建/修改时间 ，重大改版记录，函数描述，文件版本，功能等信息。

* html 注释 :  ```<!--  <div class="test""> -->```
* css 注释 : ```/* test; */```
