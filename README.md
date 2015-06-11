#VJ
---
##VJ是什么，能干什么？
* VJ本身提供的不是一个瑰丽的UI框架，甚至特别绚丽的单一界面功能,而是更加方便的提供给你方便应用各种框架的可能：
    * 它首先改变的是 **你对JS的看法**；
    * 它是一个将页面甚至应用进行 **层次分明，抽丝剥茧的划分与配合的思想体系**；
    * 它是一个 **为了节省代码又能很好的配置化插入式编程**的代码工具；
    * 它是一个鼓励 **js控件、组件、模块开发、复用甚至在不同公司间分享**的跨越所谓的AMD,CMD划分的社区；
    * 它是一个很好的实现 **逻辑归逻辑、设计归设计、数据归数据** 的前端开发模式；
    * 是一个允许 **随时兼容各种新的H5技术和框架又不需要改动任何原有逻辑代码** 就可以完成升级的神奇架构设计；
    * 是一个可以 **一键升级替换所有控件与表现层又能保证业务逻辑正确** 的神马框架。 
	
---                                       
### 那么问题来了VJ是怎么实现呢？  
 * 根据快速UI更新，快速迭代的需求与写的越少，错的越少的编程规律，分层化控件化成为VJ提高效率不加班快速开发的核心方法思想，所以**代码=框架+构件（控件，组件，模块)+例外(单页面的逻辑代码）**成为VJ的设计思路
 * 于是VJ将 **控件（不含业务逻辑的UI件)\组件(含有业务逻辑的UI控件)\模块(含有完整业务逻辑的完整控件)** 与其业务逻辑和调用分离成两个部分:
    * 控组模部分：控件、组件、模块通过继承自VJ.view.Control的独立js代码段+html代码段或者文件/css进行独立开发和发布（如下代称`控组模`）
    * 逻辑代码部分：Html内通过'_'属性来定义的自定义的标签，
    通过自定义的html标签名表明自定义控件的类型，通过定义Id与逻辑控件绑定。
    用户页面代码（例外代码）通过继承`VJ.viewmodel.Page`并填写构造参数json设
    置与id对应的相关控件、组件、模块的JS逻辑控件属性与事件
    ，最终由`VJ.view.Page`类完成页面控件创建，初始化，替换标签与绑定工作，
    调用页面逻辑控件处理业务逻辑。
	
---

 * 要想完成这个过程就必须有个地方来管理用户自定义标签对应的控组模：
     * VJ通过`VJ.middler.Middler`定义的IOC容器分别将公共控件库，公共逻辑对象，数据访问对象分别定义和组织了起来，这样就需要一个独立的json配置代码段或者json配置文件，一般是根目录下的***config.js***配合VJ.viewmodel.Page完成了这个工作。
     * 为了完成业务逻辑会话和数据交互是必不可少的，VJ将逻辑代码中与会话和数据操作有关的部分再次分离，完成了五花八门的业务处理与乱七八糟的数据访问分离的任务。


         为毛不用$.cookie,$.ajax非要换成this.session,this.ni去调用呢？  
         因为基于统一的Middler容器,
            * VJ才不仅可以在不改动用户代码的情况下仅修改config.js便可以更换用户标签对应的UI控件、组件、模块
            * 还可以在不改动用户代码的情况下通过修改config.js更改某个会话是存放cookie还是sessionStorage,是明文还是加密，更可以在不改动用户代码的情况下修改ni.js配置某个数据请求是否需要缓存，是json还是jsonp，是ajax还是webdb甚至是WebSocket。

 * 用户页面代码继承的VJ.viewmodel.Page通过内置的会话管理对象this.session（data(key),update(key,{json})完成了会话管理，通过独立json配置代码段或者json配置文件一般是根目录下的ni.js配合内置的数据管理对象this.ni（excute(command，params，function)）完成了数据访问管理。
     * 是的，这一切都是可以通过配置在（不改动用户代码）的情况下，分分钟搞定的。更何况PC，平板，手机三合一喊了许久，怎么能更好的实现呢？目前看还是手机统一其他两个平台居多，其他两个平台都是被动兼容手机样式的，IM的网页版就是其中之一。在VJ里其实很简单如果配置文件也是动态加载的问题就解决了。不管是后台生成config.js还是页面根据userAgent加载不同的config.js这都是不错的选择（因为Page控件也是动态加载替换的）
     * 至此VJ将开发人员做了清晰的分类：
        1. config.js+公共控组模由前端架构组负责
        2. page.html+page.js+私有组模由业务开发组+UI负责
        3. ni.js+各种后端由服务组+架构组负责。
 * 这样前端架构组就可以不断的研究新的技术和更新目前的控件，业务人员简单快速响应业务需求并提请架构组改进控件（实际上SQL也应该由业务人员开发保证快速开发，VESH.Net已经实现SQL的自动转换成数据而无需编译），然后后端服务架构组人员根据业务人员编写的ni.js和后端SQL快速修改成适合线上架构的服务和部署配置.
 * 如此三方职责清晰，工作有序将业务开发组的高人，全人，能人抽取出来做持续的事情，让业务开发无需复杂快速完成工作，让后端集中考虑性能和优化，让任务不再全摊到每个业务人员的身上，总是想做高大全的事情却做出来低小烂的东西，
###好了 VJ介绍完毕再说点题外话
 * VJ属于Web4层架构**VESH**中的V层实现，**VESH**本身也是分层分控件思想下的Web架构产物，VJ与VESH结合产生更多神奇的功能，具体可参见附录A
##简单例子

##复杂例子

##配置文件

##有问题反馈

在使用中有任何问题，欢迎反馈给我，可以用以下联系方式跟我交流  
 * 邮件：[@白冰](baibing0004@sohu.com)  
 * QQ: 26342049 群：3793554  
###config配置

###ni配置

##VJ的构成

##字典

###VJ.base

###VJ.config框架

###VJ.collection

###VJ.middler框架

###VJ.ni框架

###VJ.viewmodel框架

###VJ.view框架

##附录A VESH架构简介
