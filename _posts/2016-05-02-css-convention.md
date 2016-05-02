---
layout: page
title: "CSS 规范"
category: convention
date: 2016-05-02 19:33:42
author: anna
---

(1). 可以将代码分为两个文件，一个是针对所有浏览器，一个是只针对IE，可以通过下面的方法导入,如下代码:

{% highlight html %}
  <!-- 放置所有浏览器样式 -->
  <link rel ="stylesheet" type="text/css" href="">

  <!-- 只放置ie -->
  <!--[if it ie 8]
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
  -webkit-border-radius:10px;
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
  property:value; /*所有浏览器*/
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

## 注释规范

* 注释包括标明作者，文件版本，创建/修改时间 ，重大改版记录，函数描述，文件版本，功能等信息。
* css 注释 : ```/* test; */```
