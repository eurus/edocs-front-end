---
layout: page
title: "middleware的定义和使用"
category: node
date: 2016-04-29 23:09:41
author: banana
---

## 什么是中间件

一言以蔽之，解决业务系统普遍问题的服务或者组件。

## 一个简单的例子

{% highlight javascript %}
router.use(function(req, res, next) {
    console.log("hello world");
    next();
})
{% endhighlight %}

以上是一个最简单的中间件，它只做了一件事情，就是输出hello world。

## 应用场景

### 登录

假设这样一种情况，你需要让当前router下面的函数都执行一个动作，那按照道理你会写好多重复的代码，那现在只需要一个中间件，便可以减少你很多的代码量，而且写起来非常的优雅，比如你可以判断一个管理员是否登录，如果没有登录，跳转到登陆页面，如果登录则继续处理。

{% highlight javascript %}
router.use(function(req, res, next) {
    // check if admin is logged in
    if (req.session.admin_object_id == null) {
        req.flash('info', "需要登录才能继续执行");
        res.redirect('/login');
    } else {
        next();
    }
})
{% endhighlight %}

### 侧边栏

会有这样一种情况，你需要高亮侧边栏的某一个模块，你需要知道当前的action是什么的时候，所以你才能够做出相应的判断，所以在view中，你可以使用session中的变量来坐判断了。

{% highlight javascript %}
router.use(function(req, res, next) {
    req.session.sidebar = 'hotel'
    next();
})
{% endhighlight %}

如果需要使用session来访问一些东西，你需要引入`cookie-session`这个npm包

{% highlight javascript %}
var cookieSession = require('cookie-session');
app.use(cookieSession({
  name: 'session',
  keys: ['pink','banana']
}))；
app.use(function(req,res,next){
    res.locals.session = req.session;
    res.locals.mo = moment;
    next();
});
{% endhighlight %}
