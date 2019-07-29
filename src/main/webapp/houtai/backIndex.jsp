<!DOCTYPE html>
<html>
<head>
    <base href="http://localhost:8080/springbootdemo/"></base>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>layout 后台大布局 - Layui</title>
    <link rel="stylesheet" href="layui/css/layui.css">
    <%@page pageEncoding="utf-8" %>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">layui 后台布局</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="">控制台</a></li>
            <li class="layui-nav-item"><a href="">商品管理</a></li>
            <li class="layui-nav-item"><a href="">用户</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">其它系统</a>
                <dl class="layui-nav-child">
                    <dd><a href="">邮件管理</a></dd>
                    <dd><a href="">消息管理</a></dd>
                    <dd><a href="">授权管理</a></dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    贤心
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="">退了</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="nav" id="nav" >
                <!-- <li class="layui-nav-item layui-nav-itemed">
                     <a class="" href="javascript:;">所有商品</a>
                     <dl class="layui-nav-child">
                         <dd><a href="javascript:;">列表一</a></dd>
                         <dd><a href="javascript:;">列表二</a></dd>
                         <dd><a href="javascript:;">列表三</a></dd>
                         <dd><a href="">超链接</a></dd>
                     </dl>
                 </li>
                 <li class="layui-nav-item">
                     <a href="javascript:;">解决方案</a>
                     <dl class="layui-nav-child">
                         <dd><a href="javascript:;">列表一</a></dd>
                         <dd><a href="javascript:;">列表二</a></dd>
                         <dd><a href="">超链接</a></dd>
                     </dl>
                 </li>
                 <li class="layui-nav-item"><a href="">云市场</a>
                     <dl class="layui-nav-child">
                         <dd><a href="javascript:;">列表一</a></dd>
                         <dd><a href="javascript:;">列表二</a></dd>
                         <dd><a href="">超链接</a></dd>
                     </dl>
                 </li>
                 <li class="layui-nav-item"><a href="">发布商品</a></li>-->
            </ul>
        </div>
    </div>

    <div class="layui-tab" lay-filter="demo" lay-allowclose="true" style="margin-left: 200px;">
        <ul class="layui-tab-title">
        </ul>
        <!-- 内容主体区域 -->
        <div style="padding: 15px;"  class="layui-tab-content">内容主体区域</div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
    </div>
</div>
<script src="layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var $=layui.$;
        var element = layui.element;
        $.ajax( {
            url : "menu",
            type : 'post',
            dataType : 'json',
            success : function(data) {
                var menu = ""; //定义变量存储
                for(var i = 0;i<data.length;i++){
                    menu += "<li class='layui-nav-item '>"
                    if(data[i].parentid == 0){ //取出父元素的菜单，拼进页面
                        menu +=        "<a href='javascript:;'>"+data[i].funname+"</a>"
                        for(var j = 0;j<data.length;j++){ //继续遍历这几条数据

                            if(data[j].parentid==data[i].funid){ //取出这个父元素所对应的子元素
                                menu +=    "<dl class='layui-nav-child'>"
                                menu +=        "<dd>"
                                menu +=            "<a class=\"site-demo-active\" data-url='"+data[j].urlpath+"' data-title='"+data[j].funname+"'  data-id='"+data[j].funid+"'>"+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+data[j].funname+"</a>"
                                menu +=        "</dd>"
                                menu +=    "</dl>"
                            }
                        }
                    }
                    menu +=    "</li>";
                }
                $("#nav").html(menu);

                element.init()//初始化element事件，使菜单展开
            }
        });
        //触发事件
        var active = {
            //在这里给active绑定几项事件，后面可通过active调用这些事件
            tabAdd: function(url,id,name) {
                console.log(url+"="+id+"=="+name);
                //新增一个Tab项 传入三个参数，分别对应其标题，tab页面的地址，还有一个规定的id，是标签中data-id的属性值
                //关于tabAdd的方法所传入的参数可看layui的开发文档中基础方法部分
                element.tabAdd('demo', {
                    title: name,
                    content: '<iframe data-frameid="'+id+'" scrolling="auto" frameborder="0" src="'+url+'" style="width:100%;height:99%;"></iframe>',
                    id: id //规定好的id
                })
                // CustomRightClick(id); //给tab绑定右击事件
                console.log(2222);
                FrameWH();  //计算ifram层的大小
            },
            tabChange: function(id) {
                //切换到指定Tab项
                element.tabChange('demo', id); //根据传入的id传入到指定的tab项
            },
            tabDelete: function (id) {
                element.tabDelete("demo", id);//删除
            }
            , tabDeleteAll: function (ids) {//删除所有
                $.each(ids, function (i,item) {
                    element.tabDelete("demo", item); //ids是一个数组，里面存放了多个id，调用tabDelete方法分别删除
                })
            }
        };
        //当点击有site-demo-active属性的标签时，即左侧菜单栏中内容 ，触发点击事件
        $('#nav').on('click',".site-demo-active", function() {
            console.log(111);
            var dataid = $(this);
            console.log(dataid);
            //这时会判断右侧.layui-tab-title属性下的有lay-id属性的li的数目，即已经打开的tab项数目
            if ($(".layui-tab-title li[lay-id]").length <= 0) {
                //如果比零小，则直接打开新的tab项
                active.tabAdd(dataid.attr("data-url"), dataid.attr("data-id"),dataid.attr("data-title"));
            } else {
                //否则判断该tab项是否以及存在

                var isData = false; //初始化一个标志，为false说明未打开该tab项 为true则说明已有
                $.each($(".layui-tab-title li[lay-id]"), function () {
                    //如果点击左侧菜单栏所传入的id 在右侧tab项中的lay-id属性可以找到，则说明该tab项已经打开
                    if ($(this).attr("lay-id") == dataid.attr("data-id")) {
                        isData = true;
                    }
                })
                if (isData == false) {
                    //标志为false 新增一个tab项
                    active.tabAdd(dataid.attr("data-url"), dataid.attr("data-id"),dataid.attr("data-title"));
                }
            }
            //最后不管是否新增tab，最后都转到要打开的选项页面上
            active.tabChange(dataid.attr("data-id"));
        });
       //计算iframe大小
        function FrameWH() {
            var h = $(window).height() -41- 10 - 60 -10-44 -10;
            $("iframe").css("height",h+"px");
        }

        $(window).resize(function () {
            FrameWH();
        })

    })

    /* $(function () {
         $.ajax( {
             url : "menu",
             type : 'post',
             dataType : 'json',
             success : function(data) {
                 var menu = ""; //定义变量存储
                 for(var i = 0;i<data.length;i++){
                     menu += "<li class='layui-nav-item '>"
                     if(data[i].parentid == 0){ //取出父元素的菜单，拼进页面
                         menu +=        "<a href='javascript:;'>"+data[i].funmame+"</a>"
                         for(var j = 0;j<data.length;j++){ //继续遍历这几条数据
                             if(data[j].parentid==data[i].id){ //取出这个父元素所对应的子元素
                                 menu +=    "<dl class='layui-nav-child'>"
                                 menu +=        "<dd>"
                                 menu +=            "<a href='"+data[j].url+"' target='option'>"+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+data[j].funname+"</a>"
                                 menu +=        "</dd>"
                                 menu +=    "</dl>"
                             }
                         }
                     }
                     menu +=    "</li>";
                 }
                 $("#nav").html(menu);
                 var element = layui.element;
                 element.init()//初始化element事件，使菜单展开
             }
         });
     })
 */
</script>
</body>
</html>