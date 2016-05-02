---
layout: page
title: "使用bcrypt来实现注册登录"
category: node
date: 2016-04-29 13:00:43
author: banana
---

## 介绍以及依赖安装

在项目的`package.json`中添加bcrypt的依赖

{% highlight javasript %}
"bcryptjs": "*"
{% endhighlight %}

什么是[bcrypt](https://zh.wikipedia.org/wiki/Bcrypt)：
bcrypt是一个跨平台的文件加密工具。由它加密的文件可在所有支持的操作系统和处理器上进行转移。它的口令必须是8至56个字符，并将在内部被转化为448位的密钥。然而，所提供的所有字符都具有十分重要的意义。密码越强大，您的数据就越安全。

除了对您的数据进行加密，默认情况下，bcrypt在删除数据之前将使用随机数据三次覆盖原始输入文件，以阻挠可能会获得您的计算机数据的人恢复数据的尝试。如果您不想使用此功能，可设置禁用此功能。

bcrypt使用的是布鲁斯·施内尔在1993年发布的Blowfish加密算法。具体来说，bcrypt使用保罗·柯切尔的算法实现。随bcrypt一起发布的源代码对原始版本作了略微改动。

## util.js

以下两个方法提供了加密以及比较两个方法。

{% highlight javasript %}
var bcrypt = require('bcryptjs');

exports.cryptPassword = function(password, callback) {
  bcrypt.genSalt(10, function(err, salt) {
    if (err)
      return callback(err);

    bcrypt.hash(password, salt, function(err, hash) {
      return callback(err, hash);
    });

  });
};

exports.comparePassword = function(password, userPassword, callback) {
  bcrypt.compare(password, userPassword, function(err, isPasswordMatch) {
      if (err)
        return callback(err);
      return callback(null, isPasswordMatch);
  });
};
{% endhighlight %}

这边注意，任何时候请不要明文存储密码！！！
在你需要使用的地方引入util.js即可

## 如何使用

假设我需要在users.js中新增一个用户，所以这边不会明文存储密码在数据库中。不推荐在客户端中加密密码，如果考虑到密码传输的安全性，请使用HTTPS。

{% highlight javascript %}
router.post('/create', function(req, res, next) {
    var username = req.body.username;
    var password = req.body.password;
    var crypt_pass = util.cryptPassword(password, function(err, hash) {
        var admin = new Admin();
        admin.set('username', username);
        admin.set('password', hash);
        admin.save().then(function(admin) {
            req.flash('info', "用户新增成功");
            res.redirect('/');
        }, function(err) {
            console.log('创建新管理员失败' + err.message);
            req.flash('info', "用户名已经被使用了");
            res.redirect('/');
        });
    })
})
{% endhighlight %}

同样如果我想要验证登录

{% highlight javascript %}
router.post('/login', function(req, res, next) {
    var query = new AV.Query(Admin);
    var username = req.body.username;
    var password = req.body.password;

    query.equalTo('username', username);
    query.first().then(function(admin) {
        var userPassword = admin.get('password');
        util.comparePassword(password, userPassword, function(err, isPasswordMatch) {
            if (isPasswordMatch) {
                req.flash('info', "登录成功");
                req.session.admin_object_id = admin.id;
                res.redirect('/');
            } else {
                console.log("用户密码错误");
                req.flash('info', "用户密码错误");
                res.redirect('/login');
            };
        })
    }, function(err) {
        console.log("用户不存在");
        req.flash('info', "用户不存在");
    })
})
{% endhighlight %}

以上代码会去验证你的密码是否符合服务器中存储的密码。

