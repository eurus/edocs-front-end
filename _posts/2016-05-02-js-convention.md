---
layout: page
title: "Javascript 规范"
category: convention
date: 2016-05-02 18:43:16
author: simon
---
## 命名规则

1-1 构造器的首字母大写。如：

```js
  function Dialog (config) {
    statement;
  }

  var dlg = new Dialog({/*...*/});
```

1-2 对象的属性或方法名采用小驼峰式(lower camel-case)，如"init", "bindEvent", "updatePosition"：

```js
  Dialog.prototype = {
    init: function () {},
    bindEvent: function () {},
    updatePosition: function () {}
  // ...
  };
```

1-3 私有变量名用下划线开头。如："_current", "_defaultConfig"

1-4 常量名全部大写，单词间用下划线分隔。如：“CSS_BTN_CLOSE”, "TXT_LOADING"

1-5 变量名的前缀：

{: .table .table-striped }
| 前缀   | 类型   | 例子  |
| ------------- |
| n | integer | nVariableName |
| i,j,k,m,n | integer as counter | (for i=0; i<=oArray.length; i++) |
| s | string | sVariableName |
| o | object | oObjectName |
| is, can, has | boolean | isBooleanName, canBooleanName |
| get, set | accessor method | getMethodName, setMethodName |

Note: 只有循环变量可以以一个字母定义

## 静态检查

2-1 所有的循环体和判断体都需要用"{}"括起来。如：

#### 不推荐

```js
  if (condition)
     statement;
  // 或
  if (condition) statement;
```

#### 推荐

```js
  if (condition) {
    statement;
  }
  // 或
  if (condition) { statement; }
```

2-2 变量声明。变量声明应放在function的最上面。避免使用未声明的变量。

#### 不推荐

```js
  if (n > 0) {
    var isvalid = true;
  }
```

#### 推荐

```js
  var isvalid;
  if (n > 0) {
    isvalid = true;
  }
```

2-3 不要使用with, void, eval。

2-4 统一使用单引号(')，不使用双引号(")。这在创建 HTML 字符串非常有好处：

```js
  var msg = 'This is some HTML <div class="makes-sense"></div>';
```

2-5 简单情况下，用三元操作符分配或返回语句

注意：避免在复杂的情况下使用，没人愿意用 10 行三元操作符把自己的脑子绕晕。

### 不推荐

```js
if(x === 10) {
  return 'valid';
} else {
  return 'invalid';
}
```

推荐

```js
return x === 10 ? 'valid' : 'invalid';
```

## 全局命名空间污染与 IIFE

总是将代码包裹成一个 IIFE(Immediately-Invoked Function Expression)，用以创建独立隔绝的作用域。这一举措可防止全局命名空间被污染。

IIFE 还可确保你的代码不会轻易被其它全局命名空间里的代码所修改（i.e. 第三方库，window 引用，被覆盖的未定义的关键字等等）。

### 不推荐

{% highlight js %}
var x = 10,
    y = 100;

// Declaring variables in the global scope is resulting in global scope pollution. All variables declared like this
// will be stored in the window object. This is very unclean and needs to be avoided.
console.log(window.x + ' ' + window.y);
{% endhighlight %}

推荐

{% highlight js %}
// We declare a IIFE and pass parameters into the function that we will use from the global space
(function(log, w, undefined){
  'use strict';

  var x = 10,
      y = 100;

  // Will output 'true true'
  log((w.x === undefined) + ' ' + (w.y === undefined));

}(console.log.bind(console), window));
{% endhighlight %}

## IIFE（立即执行的函数表达式）

无论何时，想要创建一个新的封闭的作用域，那就用 IIFE。它不仅避免了干扰，也使得内存在执行完后立即释放。

所有脚本文件建议都从 IIFE 开始。

立即执行的函数表达式的执行括号应该写在外包括号内。虽然写在内还是写在外都是有效的，但写在内使得整个表达式看起来更像一个整体，因此推荐这么做。

### 不推荐

```js
(function(){})();
```

推荐

```js
(function(){}());
```

so，用下列写法来格式化你的 IIFE 代码：

```js
(function(){
  'use strict';

  // Code goes here

}());
```

如果你想引用全局变量或者是外层 IIFE 的变量，可以通过下列方式传参：

```js
(function($, w, d){
  'use strict';

  $(function() {
    w.alert(d.querySelectorAll('div').length);
  });
}(jQuery, window, document));
```

## 理解 JavaScript 的作用域域和作用域提升

在 JavaScript 中变量和方法定义会自动提升到执行之前。JavaScript 只有函数级的作用域，而无其他很多编程语言中的块作用域，所以使得你在某一函数内的某语句和循环体中定义了一个变量，此变量可作用于整个函数内，而不仅仅是在此语句或循环体中，因为它们的声明被 JavaScript 自动提升了。

为避免变量和方法定义被自动提升造成误解，把风险降到最低，我们应该手动地显示地去声明变量与方法。

也就是说，所有的变量以及方法，应当定义在 function 内的首行。

关于作用域和自动提升(hoisting)，可以参见[Javascript的作用域和提升机制](http://yanhaijing.com/javascript/2014/04/30/JavaScript-Scoping-and-Hoisting/)


### 不推荐

```js
(function(log){
  'use strict';

  var a = 10;
  var b = 10;

  for(var i = 0; i < 10; i++) {
    var c = a * b * i;
  }

  function f() {

  }

  var d = 100;
  var x = function() {
    return d * d;
  };
  log(x());

}(console.log.bind(console)));
```

### 推荐

```js
(function(log){
  'use strict';

  var a = 10,
      b = 10,
      i,
      c,
      d,
      x;

  function f() {

  }

  for(i = 0; i < 10; i++) {
    c = a * b * i;
  }



  d = 100;
  x = function() {
    return d * d;
  };
  log(x());

}(console.log.bind(console)));
```

把赋值尽量写在变量申明中。

### 不推荐

```js
var a,
    b,
    c;

a = 10;
b = 10;
c = 100;
```

### 推荐

```js
var a = 10,
    b = 10,
    c = 100;
```

## 总是使用带类型判断的比较判断

总是使用 ```===``` 精确的比较操作符，避免在判断的过程中，由JavaScript 的强制类型转换所造成的困扰。(举例：```0 == ''``` 会被判断为```true```)

如果你使用 ```===``` 操作符，那比较的双方必须是同一类型为前提的条件下才会有效。

如果你想了解更多关于强制类型转换的信息，你可以读一读 [Dmitry Soshnikov 的这篇文章](http://dmitrysoshnikov.com/notes/note-2-ecmascript-equality-operators/)。
在只使用 ```==``` 的情况下，JavaScript 所带来的强制类型转换使得判断结果跟踪变得复杂，下面的例子可以看出这样的结果有多怪了：

```js
(function(log){
  'use strict';

  log('0' == 0); // true
  log('' == false); // true
  log('1' == true); // true
  log(null == undefined); // true

  var x = {
    valueOf: function() {
      return 'X';
    }
  };

  log(x == 'X');

}(console.log.bind(console)));
```

## 明智地使用真假判断

当我们在一个 if 条件语句中使用变量或表达式时，会做真假判断。```if(a == true)``` 是不同于 ```if(a)``` 的。后者的判断比较特殊，我们称其为真假判断。这种判断会通过特殊的操作将其转换为 true 或 false，下列表达式统统返回 false：false, 0, undefined, null, NaN, ''（空字符串）。

这种真假判断在我们只求结果而不关心过程的情况下，非常的有帮助。

以下示例展示了真假判断是如何工作的：

```js
(function(log){
  'use strict';

  function logTruthyFalsy(expr) {
    if(expr) {
      log('truthy');
    } else {
      log('falsy');
    }
  }

  logTruthyFalsy(true); // truthy
  logTruthyFalsy(1); // truthy
  logTruthyFalsy({}); // truthy
  logTruthyFalsy([]); // truthy
  logTruthyFalsy('0'); // truthy

  logTruthyFalsy(false); // falsy
  logTruthyFalsy(0); // falsy
  logTruthyFalsy(undefined); // falsy
  logTruthyFalsy(null); // falsy
  logTruthyFalsy(NaN); // falsy
  logTruthyFalsy(''); // falsy

}(console.log.bind(console)));
```

## 变量赋值时的逻辑操作

逻辑操作符 || 和 && 也可被用来返回布尔值。如果操作对象为非布尔对象，那每个表达式将会被自左向右地做真假判断。基于此操作，最终总有一个表达式被返回回来。这在变量赋值时，是可以用来简化你的代码的。

### 不推荐

```js
if(!x) {
  if(!y) {
    x = 1;
  } else {
    x = y;
  }
}
```

### 推荐

```js
x = x || y || 1;
```

这一小技巧经常用来给方法设定默认的参数。

```js
(function(log){
  'use strict';

  function multiply(a, b) {
    a = a || 1;
    b = b || 1;

    log('Result ' + a * b);
  }

  multiply(); // Result 1
  multiply(10); // Result 10
  multiply(3, NaN); // Result 3
  multiply(9, 5); // Result 45

}(console.log.bind(console)));
```

## 分号

总是使用分号，因为隐式的代码嵌套会引发难以察觉的问题。当然我们更要从根本上来杜绝这些问题 。以下几个示例展示了缺少分号的危害

```js
MyClass.prototype.myMethod = function() {
  return 42;
}  // No semicolon here.

(function() {
  // Some initialization code wrapped in a function to create a scope for locals.
})();


var x = {
  'i': 1,
  'j': 2
}  // No semicolon here.

// 2.  Trying to do one thing on Internet Explorer and another on Firefox.
// I know you'd never write code like this, but throw me a bone.
[ffVersion, ieVersion][isIE]();


var THINGS_TO_EAT = [apples, oysters, sprayOnCheese]  // No semicolon here.

// 3. conditional execution a la bash
-1 == resultOfOperation() || die();
```

### 发生了什么？

JavaScript 错误 —— 首先返回 42 的那个 function 被第二个 function 当中参数传入调用，接着数字 42 也被“调用”而导致出错。
八成你会得到 'no such property in undefined' 的错误提示，因为在真实环境中的调用是这个样子：```x[ffVersion, ieVersion][isIE]().```
```die``` 总是被调用。因为数组减 1 的结果是 NaN，它不等于任何东西（无论 resultOfOperation 是否返回 NaN）。所以最终的结果是 die() 执行完所获得值将赋给 THINGS_TO_EAT.

### Why?

JavaScript 中语句要以分号结束，否则它将会继续执行下去，不管换不换行。以上的每一个示例中，函数声明或对象或数组，都变成了在一句语句体内。要知道闭合圆括号并不代表语句结束，JavaScript 不会终结语句，除非它的下一个 token 是一个中缀符或者是圆括号操作符。

所以乖乖地给语句末加上分号吧。

### 澄清：分号与函数

分号需要用在表达式的结尾，而并非函数声明的结尾。区分它们最好的例子是：

```js
var foo = function() {
  return true;
};  // semicolon here.

function foo() {
  return true;
}  // no semicolon here.
```

## 语句块内的函数声明

切勿在语句块内声明函数，在 ECMAScript 5 的严格模式下，这是不合法的。函数声明应该在作用域的顶层。但在语句块内可将函数申明转化为函数表达式赋值给变量。

### 不推荐

```js
if (x) {
  function foo() {}
}
```

### 推荐

```js
if (x) {
  var foo = function() {};
}
```

## 异常

基本上你无法避免出现异常，特别是在做大型开发时（使用应用开发框架等等）。

在没有自定义异常的情况下，从有返回值的函数中返回错误信息一定非常的棘手，更别提多不优雅了。不好的解决方案包括了传第一个引用类型来接纳错误信息，或总是返回一个对象列表，其中包含着可能的错误对象。以上方式基本上是比较简陋的异常处理方式。适时可做自定义异常处理。

在复杂的环境中，你可以考虑抛出对象而不仅仅是字符串（默认的抛出值）。

```js
if(name === undefined) {
  throw {
    name: 'System Error',
    message: 'A name should always be specified!'
  }
}
```

## 切勿在循环中创建函数

在简单的循环语句中加入函数是非常容易形成闭包而带来隐患的。下面的例子就是一个典型的陷阱：

### 不推荐

```js
(function(log, w){
  'use strict';

  // numbers and i is defined in the current function closure
  var numbers = [1, 2, 3],
      i;

  for(i = 0; i < numbers.length; i++) {
    w.setTimeout(function() {
      // At the moment when this gets executed the i variable, coming from the outer function scope
      // is set to 3 and the current program is alerting the message 3 times
      // 'Index 3 with number undefined
      // If you understand closures in javascript you know how to deal with those cases
      // It's best to just avoid functions / new closures in loops as this prevents those issues

      w.alert('Index ' + i + ' with number ' + numbers[i]);
    }, 0);
  }

}(console.log.bind(console), window));
```

## this 关键字

只在对象构造器、方法和在设定的闭包中使用 this 关键字。this 的语义在此有些误导。它时而指向全局对象（大多数时），时而指向调用者的作用域（在 eval 中），时而指向 DOM 树中的某一节点（当用事件处理绑定到 HTML 属性上时），时而指向一个新创建的对象（在构造器中），还时而指向其它的一些对象（如果函数被 call() 和 apply() 执行和调用时）。

正因为它是如此容易地被搞错，请限制它的使用场景：

* 在构造函数中
* 在对象的方法中（包括由此创建出的闭包内）

关于this和闭包，请仔细学习这两篇文章

* [javascript的this用法](http://www.ruanyifeng.com/blog/2010/04/using_this_keyword_in_javascript.html)
* [javascript闭包](http://www.ruanyifeng.com/blog/2009/08/learning_javascript_closures.html)

## 首选函数式风格

函数式编程让你可以简化代码并缩减维护成本，因为它容易复用，又适当地解耦和更少的依赖。

接下来的例子中，在一组数字求和的同一问题上，比较了两种解决方案。第一个例子是经典的程序处理，而第二个例子则是采用了函数式编程和 ECMA Script 5.1 的数组方法。

例外：往往在重代码性能轻代码维护的情况之下，要选择最优性能的解决方案而非维护性高的方案（比如用简单的循环语句代替 forEach）。

### 不推荐

```js
(function(log){
  'use strict';

  var arr = [10, 3, 7, 9, 100, 20],
      sum = 0,
      i;


  for(i = 0; i < arr.length; i++) {
    sum += arr[i];
  }

  log('The sum of array ' + arr + ' is: ' + sum)

}(console.log.bind(console)));
```

### 推荐

```js
(function(log){
  'use strict';

  var arr = [10, 3, 7, 9, 100, 20];

  var sum = arr.reduce(function(prevValue, currentValue) {
    return prevValue + currentValue;
  }, 0);

  log('The sum of array ' + arr + ' is: ' + sum);

}(console.log.bind(console)));
```


## 参考
* [前端编码风格规范 - JavaScript规范](http://www.css88.com/archives/5366)
* [豆瓣JS规范](https://docs.google.com/document/pub?id=17ICSeE4Qd04-1U-pphmKCAmfgJGEVjqDellbu4oAiqU)
* [Airbnb javascript 规范](https://github.com/airbnb/javascript )
* [Javascript 编码风格](http://www.ruanyifeng.com/blog/2012/04/javascript_programming_style.html)
