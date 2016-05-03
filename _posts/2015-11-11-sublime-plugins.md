---
layout: page
title:  "Sublime 常用插件"
date:   2015-11-11 10:10:00
categories: tools
author: simon
---

## 安装

### 安装package control

使用【 ctrl + ` 】或 点击```View > Show Console```打开Sublime Text 控制台，将下面的代码复制进去：

```python
import urllib.request,os,hashlib; h = '7183a2d3e96f11eeadd761d777e62404'  +  'e330c659d4bb41d3bdf022e94cab3cd0'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); by = urllib.request.urlopen( 'http://packagecontrol.io/'  +  pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); print('Error validating download (got %s instead of %s), please try manual install' % (dh, h)) if dh != h else open(os.path.join( ipp, pf), 'wb' ).write(by)
```

如果在```Perferences > Package Settings```中看到```Package Control```这一项说明安装成功。

<img src="http://o6l486e2a.bkt.clouddn.com/b.png" width='200px;'>

### 安装插件

点击菜单栏的”Package Control”或者使用【 ctrl + shift + p 】打开命令面板回车，输入install 并调出install Package 选项后回车。输入你需要安装的插件名称，选择后回车等待即可。

<img src="http://o6l486e2a.bkt.clouddn.com/c.png">

### 移除插件

点击菜单栏的”Package Control”或者使用【 ctrl + shift + p 】输入 remove package回车，之后选择你需要移除的插件。


### 查看已安装的插件

按下【 ctrl + shift + p 】调出命令板，输入package,在下拉列表中找到”Package Control:list packages”,选中后回车，你所安装的插件就会列出来。

## 常用的快捷键

### 【 ctrl + ` 】: 打开sublime text 控制台

### 分屏

除特殊注明外，ctrl均指代windows中的```ctrl```键及Mac中的```command```键。

* 【 Alt + shift + 2 】: 进行左右分屏
* 【 Alt + shift + 5 】: 进行上下左右分屏（分四屏）
* 【 ctrl + 数字 】: 跳转数字指定屏
* 【 ctrl + shift + 数字键 】：将当前屏幕移动到指定屏幕

### 格式化

* 【 ctrl + "[" 】: 向左缩进
* 【 ctrl + "]" 】: 向右缩进
* 【 ctrl + shift + V 】: 可以以当前缩进粘贴代码
* 【 Tab 】: 自动补全关键字

### 窗口和Tab页

* 【 ctrl + n 】: 在当前窗口创建一个新标签页
* 【 ctrl + shift + n 】:创建一个新窗口
* 【 ctrl + w 】: 恢复刚刚关闭的标签页

### 跳转

* 【 ctrl + p 】: 面板上会列出当前打开过的文件(或者是当前文件夹)，选择然后回车键即可打开
* 【  ctrl + g 】:输入行号以跳转到指定行（Mac中为ctrl+g）

### 括号

* 【 ctrl + m 】: 快速在起括号和结尾括号间切换
* 【 ctrl + shift + M 】:可以快速选择括号间的内容
* 【 ctrl + shift + J 】: 对于缩进型语言（例如Python）可以快速选择相同缩进语句块的内容

### 搜索

* 【 ctrl + shift + f 】: 开启多文件的搜索替换
* 【 ctrl + alt + f 】: 本文件中搜索替换

<img src="http://o6l486e2a.bkt.clouddn.com/d.png">

也可以在指定当前打开的文件进行搜索与替换

<img src="http://o6l486e2a.bkt.clouddn.com/e.png">

## 设置

### 个性化配置

如需修改个人配置(比如字体等)，可修改配置文件(```Preferences > Settings - User```)，可使如下代码复制进去：

```json
{
  "ignored_packages":
  [
    "Vintage"
  ],
  "tab_size": 2, //Tab大小为2
  "translate_tabs_to_spaces": true,  //用空格代替Tab
  "trim_trailing_white_space_on_save": true,
  "color_scheme": "Packages/Color Scheme - Default/Monokai.tmTheme",
  "theme": "Soda Dark.sublime-theme",   //更换编辑器主题

  // 设置Courier New等宽字体，以便阅读
  "font_face": "Courier New",
  "font_size": 12.0,     // 使光标闪动更加柔和
  "caret_style": "phase"     // 高亮当前行
}
```


## 常用插件

### 语法支持类插件

* Jade
* SCSS

> 首先，需要安装 Package Control (见上述描述)

### Emmet - HTML缩写

输入简写形式，然后按【 ctrl + E 】或【 tab 】键自动补全

例如```ul>li.item$*5```会被扩展为：

```html
<ul>
    <li class="item1"></li>
    <li class="item2"></li>
    <li class="item3"></li>
    <li class="item4"></li>
    <li class="item5"></li>
</ul>

```

[具体语法规则](http://docs.emmet.io/cheat-sheet/)

### CSSComb - CSS属性整理

需要提前安装node.js。安装完成后，在css文件中按下【 ctrl + shift + c 】或者点击菜单 ```Tools > Run CSSComb```即可规格化css文件

比如以下这段代码：

<img src="http://o6l486e2a.bkt.clouddn.com/a3.png">

会被整理为:

<img src="http://o6l486e2a.bkt.clouddn.com/a4.png">

### Alignment - 对齐助手

### HTMLBeautify - HTML代码整理

安装后，使用【 ctrl + alt + shift + f 】进行html美化。

### SASSBeautify - Sass代码整理

安装后，使用【 ctrl + shift + p 】呼出控制面板，然后输入```SassBeautify```即可。

也可以绑定快捷键，设置```Preferences > Key bindings - User```，添加描述

```json
[
    {
        "keys": ["alt + w"],
        "command": "sass_beautify"
    }
]
```

即可使用【 alt + w 】调用

[项目配置](https://github.com/badsyntax/SassBeautify)

### BrackerHighlighter - 括号及标签高亮

目前支持[]、()、｛｝

### ColorPicker

#### 相关插件链接<http://www.imjeff.cn/blog/146/>

### 主题与配色

可以直接在```Preference > Color Scheme``` 中进行筛选变更，也可以另行安装，比如：

#### Soda

打开install package,输入```soda dark```或```soda light```

<img src="http://o6l486e2a.bkt.clouddn.com/g.png" alt="">

安装后，需要在配置文件```Preferences > Settings - User```中，按上述介绍的加入以下内容即可

```json
{
  "theme":"Soda Light.sublime-theme"
  // 或"theme":"Soda Dark.sublime-theme"
}
```

## 参考

* [相关插件链接](http://www.imjeff.cn/blog/146/)
* [Sublime Text 3安装与使用](http://www.cnblogs.com/zhcncn/p/4113589.html)
