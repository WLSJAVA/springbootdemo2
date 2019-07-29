<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/7/18
  Time: 17:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<html>
<head>
    <base href="http://localhost:8080/springbootdemo/"></base>
    <title>Title</title>
    <link rel="stylesheet" href="css/bootstrap.min.css"></link>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

</head>
<body>
<form id="myform">
      <fieldset>
           <legend>添加学生</legend>
            学号:<input id="stuid" name="stuid"/>
             姓名:<input id="sname" name="sname"/>
          班级:<select id="claid" name="claid"></select>
          <button id="btn">添加</button>

      </fieldset>

</form>
<table class="table table-striped">
    <thead>
    <tr>
        <th>学生编号</th>
        <th>学生姓名</th>
        <th>班级名称</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody id="mytbd">

    </tbody>

</table>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                   修改学生信息
                </h4>
            </div>
            <div class="modal-body">
                <form id="myform2">
                       <input class="stuid" name="stuid" placeholder="学生编号" readonly/><br/>
                       <input class="sname" name="sname" placeholder="学生姓名"/><br/>
                       <select name="claid"></select>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" id="updateconfirm">
                    提交更改
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</body>
</html>
<script>
    //页面加载完成时
     $(function(){

         query();
         queryCla();
     })
   //页面加载时查询班级信息，以下拉框的形式显示班级
    function queryCla(){
        $.ajax({
            url:"selectCla",
            type:"post",
            dataType:"json",
            success:function(data){
                 for(var i=0;i<data.length;i++){
                     //option:value（提交到服务器），text(用户直观看到的)
                        var option="<option value="+data[i].claid+">"+data[i].claname+"</option>";
                          $("#claid").append(option);
                          $("#myform2 select").append(option);
                 }
            }

        });

    }
    function query(){
        $.ajax({
            url:"selectStu",
            type:"post",
            dataType:"json",
            success:function(data){
                //每次加载之前清空表格中的内容
                $("#mytbd").html("");
                for(var i=0;i<data.length;i++){
                    var tr="<tr>"
                    tr+="<td>"+data[i].stuid+"</td>";
                    tr+="<td>"+data[i].sname+"</td>";
                    tr+="<td>"+data[i].claname+"</td>";
                    tr+="<td><button onclick='delStu("+data[i].stuid+")' type=\"button\" class='btn btn-primary btn-lg ' >删除</button>" +
                        "<button  type='button' class='btn btn-primary btn-lg update' data-toggle=\"modal\" data-target=\"#myModal\">修改</button>" +
                        "</td>";
                    tr+="</tr>";
                    $("#mytbd").append(tr);
                }
            }

        });

    }
  /*$("#mytbd").on("click","button",function(){
        alert($(this).val())
      $.ajax({
          url:"delstu",
          type:"post",
          data:{"id":$(this).val()},
          dataType:"json",
          success:function(data){
              //重新执行一次查询，刷新页面
              query();

          }

      })

    })*/
    //点击删除按钮时，删除操作
 function delStu(val){
         $.ajax({
               url:"delstu",
                type:"post",
                data:{"id":val},
                dataType:"json",
             success:function(data){
                   //重新执行一次查询，刷新页面
                  query();

             }

         })

  }

    //添加学生
    btn.onclick=function(){
       $.ajax({
             url:"addStu",
            type:"post",
            data:$("#myform").serialize(),//将表单序列化提交，将表单中的数据全部提交
           dataType:"json",
           success:function(data){
               query();

           }

       })

    }
                  //点击修改时需要将被点击行的数据填充到form中
               $("#mytbd").on("click",".update",function(){
                   //节点
                   $(".stuid").val($(this).parent().parent().find("td").eq(0).html());
                   $(".sname").val($(this).parent().parent().find("td").eq(1).html());
               })
// 点击确认修改按钮时，提交表单
               updateconfirm.onclick=function(){
                   if(confirm("确认修改?")){
                       $.ajax({
                           url:"updateStu",
                           type:"post",
                           data:$("#myform2").serialize(),//将表单序列化提交，将表单中的数据全部提交
                           dataType:"json",
                           success:function(data){
                               query();
                               $('#myModal').modal('hide');
                           }
                       })
                   }
    }
</script>

