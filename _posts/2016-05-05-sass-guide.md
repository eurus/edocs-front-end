---
layout: page
title: "Sass 指南"
category: tools
date: 2016-05-05 12:57:12
author: anna
---

## 一、Sass简介

Sass是一种css的开发工具，提供多种便利写法，大大的减少了开发者的时间 ，使css的开发，变得更加的简单和可维护。

## 二、安装

Sass是```Ruby```语言写的，但两者的语法并没有直接的关系，所以需要先安装Ruby，然后再安装Sass..详情可以见下面的链接：
<http://www.w3cplus.com/sassguide/install.html>

## 三、Sass语法

### 1.建议使用后缀名为.scss为结尾的文件，文件后缀为scss语法：

``` css
//文件后缀名为scss的语法
body {
  background: #eee;
  font-size:12px;
}
p{
 background: #0982c1;
}
```

### 2.文件的导入

所有的导入文件可以忽略后缀名.scss，或者_开头的文件全名，在导入的时候可以不写下划线，可以写成 @import “mixin”

``` css
//a.scss
 body {
    background:red;
 }


// b.scss
@import “reset.css”
@import “a”;
p {
  color:red;
}
========合并结果==========
@import  “reset.css”
body {
  background:red;
}
p{
   color:red;
}

```

### 3.注释

Sass有两种注释方式，一种是标准css注释方式 ```/* */```，另一种则是```//```双斜杆形式

``` bash
 ==========标准css注释===========
/*
  *我是css的标准注释
  *设置body内距
*/
body{
  padding:5px;
}
============== 双斜杆单行注释 =============

单行注释跟JavaScript语言中的注释一样，使用又斜杠（//），但单行注释不会输入到CSS中。
//我是双斜杠表示的单行注释
//设置body内距
body{
    padding:5px; //5px
}

```

### 4.变量

sass的变量是以$开头的，后面紧跟变量名，而变量值和变量名之间就需要使用冒号分开

``` css
==========普通变量===========
//sass style

$fontSize: 12px;
body{
  font-size:$fontSize;
}

//css style
//———————————————

body{
  font-size:12px;
}

==========默认变量===========

//sass style
//———————————————

$baseLineHeight: 1.5 !default;
body{
  line-height: $baseLineHeight;
}

//css style
//———————————————
body{
   line-height:1.5;
}

```

sass的默认变量一般是用来设置默认值，然后根据需求来覆盖的，覆盖的方式也很简单，只需要在默认变量之前重新声明下变量即可

``` css
//sass style
//———————————————
$baseLineHeight:        2;
$baseLineHeight:        1.5 !default;
body{
  line-height: $baseLineHeight;
}

//css style
//———————————————
body{
  line-height:2;
}

```

可以看出现在编译后的line-height为2，而不是我们默认的1.5。默认变量的价值在进行组件化开发的时候会非常有用。

### 5.全局变量

``` css
//sass style
//———————————————
$fontSize:      12px;
body{
  $fontSize: 14px;
  font-size:$fontSize;
}
p{
  font-size:$fontSize;
}

//css style
//———————————————
body{
  font-size:14px;
}
p{
  font-size:14px;
}

```

启用global之后的机制请注意，这个目前还无法使用，所以样式不是真实解析出来的。

``` css
//sass style
//———————————————
$fontSize:      12px;
$color:         #333;
body{
    $fontSize: 14px;
    $color：   #fff !global;
    font-size:$fontSize;
    color:$color;
}
p{
    font-size:$fontSize;
    color:$color;
}

//css style
//———————————————
body{
    font-size:14px;
    color:#fff;
}
p{
    font-size:12px;
    color:#fff;
}
这里设置了两个变量，然后在body里面重新设置了下，有点不同的是对于$color变量，我们设置了!global。通过编译后的css可以看到font-size取值不同，而color取值相同。与上面的机制对比就会发现默认在选择器里面的变量为局部变量，而只有设置了!global之后才会成为全局变量。
```

### 6 嵌套

所谓选择器嵌套指的是在一个选择器中嵌套另一个选择器来实现继承，从而增强了sass文件的结构性和可读性。在选择器嵌套中，可以使用&表示父元素选择器

``` css
//scss style
//-------------------------------
#top_nav{
    line-height: 40px;
    text-transform: capitalize;
    background-color:#333;
    li{
      float:left;
    }
    a{
      display: block;
      padding: 0 10px;
      color: #fff;
    }
}

//css style
//-------------------------------
#top_nav{
    line-height: 40px;
    text-transform: capitalize;
    background-color:#333;
}
#top_nav li{
    float:left;
}
#top_nav a{
    display: block;
  padding: 0 10px;
    color: #fff;
}
```

### 7.属性嵌套

所谓属性嵌套指的是有些属性拥有同一个开始单词，如border-width，border-color都是以border开头。

``` css
//sass style
//-------------------------------
.fakeshadow {
    border: {
    style: solid;
      left: {
          width: 4px;
          color: #888;
      }
      right: {
          width: 2px;
          color: #ccc;
      }
    }
}

//css style
//-------------------------------
.fakeshadow {
    border-style: solid;
    border-left-width: 4px;
    border-left-color: #888;
    border-right-width: 2px;
    border-right-color: #ccc;
}
当然这只是个属性嵌套的例子，如果实际这样使用，那估计得疯掉。
```

### 8.混合 （mixin）

``` css
==============无参数mixin================
//sass style
//———————————————
@mixin center-block {
    margin-left:auto;
    margin-right:auto;
}
.demo{
    @include center-block;
}

//css style
//———————————————
.demo{
    margin-left:auto;
    margin-right:auto;
}

```

``` css
==============有参数mixin================
//sass style
//———————————————
@mixin opacity($opacity:50) {
    opacity: $opacity / 100;
    filter: alpha(opacity=$opacity);
}

//css style
//———————————————
.opacity{
    @include opacity; //参数使用默认值
}
.opacity-80{
    @include opacity(80); //传递参数

//sass style
//-----------------------------------}

@mixin box-sizing ($sizing) {
    -webkit-box-sizing:$sizing;
      -moz-box-sizing:$sizing;
          box-sizing:$sizing;
}
.box-border{
    border:1px solid #ccc;
    @include box-sizing(border-box);
}
//css style
//-----------------------------------
.box-border {
    border: 1px solid #ccc;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
```

调用时可直接传入值，如@include传入参数的个数小于@mixin定义参数的个数，则按照顺序表示，后面不足的使用默认值，如不足的没有默认值则报错。除此之外还可以选择性的传入参数，使用参数名与值同时传入。

``` css
==============多参数mixin================
//sass style
//———————————————
@mixin horizontal-line($border:1px dashed #ccc, $padding:10px){
    border-bottom:$border;
    padding-top:$padding;
    padding-bottom:$padding;
}
.imgtext-h li{
    @include horizontal-line(1px solid #ccc);
}
.imgtext-h———————————————product li{
    @include horizontal-line($padding:15px);
}

//css style
//———————————————
.imgtext-h li {
    border-bottom: 1px solid #cccccc;
    padding-top: 10px;
    padding-bottom: 10px;
}
.imgtext-h———————————————product li {
    border-bottom: 1px dashed #cccccc;
    padding-top: 15px;
    padding-bottom: 15px;
}

```

如果一个参数可以有多组值，如box-shadow、transition等，那么参数则需要在变量后加三个点表示，如$variables...。

``` css
==============多组值参数mixin================

//sass style
//-------------------------------
//box-shadow可以有多组值，所以在变量参数后面添加...
@mixin box-shadow($shadow...) {
    -webkit-box-shadow:$shadow;
    box-shadow:$shadow;
}
.box{
    border:1px solid #ccc;
    @include box-shadow(0 2px 2px rgba(0,0,0,.3),0 3px 3px rgba(0,0,0,.3),0 4px 4px rgba(0,0,0,.3));
}

//css style
//-------------------------------
.box{
border:1px solid #ccc;
-webkit-box-shadow:0 2px 2px rgba(0,0,0,.3),0 3px 3px rgba(0,0,0,.3),0 4px 4px rgba(0,0,0,.3);
box-shadow:0 2px 2px rgba(0,0,0,.3),0 3px 3px rgba(0,0,0,.3),0 4px 4px rgba(0,0,0,.3);
}

```

### 9.继承

sass中，选择器继承可以让选择器继承另一个选择器的所有样式，并联合声明。使用选择器的继承，要使用关键词@extend，后面紧跟需要继承的选择器。

``` css
//sass style
//———————————————
h1{
    border: 4px solid #ff9aa9;
}
.speaker{
    @extend h1;
    border-width: 2px;
}

//css style
//———————————————
h1,.speaker{
    border: 4px solid #ff9aa9;
}
.speaker{
    border-width: 2px;
  ｝

```

### 10.计算功能

Sass允许在代码中使用算式：

``` css
body{
  margin:(14px/2);
  top:50px+100px;
  right:$nav*10%;
}
```

### 11.颜色函数

sass提供了一些内置的颜色函数，以便生成系列颜色

``` css
lighten(#cc3,10%) //#d6d65c
darken(#cc3,10%) //#a3a329
grayscale(#cc3) //#808080
complement(#cc3) //#33c
```

# 12. 表达示

@if可以用来判断

``` css
p {
　　@if 1 + 1 == 2 {
　　　 border: 1px solid; 　
　　}
　　@if 5 < 3 {
　　　 border: 2px dotted;
　　}　　
}
```

配套的还有@else命令：

``` css
@if lightness($color) > 30% {
  background-color: #000;
}
@else {
  background-color: #fff;
}

```

for循环语句：

``` css
@for $i from 1 to 10 {
　　  .border-#{$i} {
　　      border: #{$i}px solid blue;
　　}
}
```

while 循环:

``` css
$i: 6;
@while $i > 0 {
　.item-#{$i} {
　   width: 2em * $i;
　}
　$i: $i - 2;
}
```

each 循环:

``` css
@each $member in a, b, c, d {
   .#{$member} {
      background-image: url("/image/#{$member}.jpg");
   }
}
```

自定义函数:

``` css
@function double($n) {
　　@return $n * 2;
}
#sidebar {
　　width: double(5px);
}
```

## 参考

* [sass入门指南](http://www.w3cplus.com/sassguide/)
