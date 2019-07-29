<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/7/29
  Time: 15:49
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <title>采购申请</title>
    <base href="http://localhost:8080/springbootdemo/"></base>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
     <form role="form" class="form-inline">
         <div class="form-group">
             <label for="orderid">流水号</label>
             <input type="text" class="form-control" id="orderid" >
         </div>
         <div class="form-group">
             <label for="caigoudate">申请日期</label>
             <input type="text" class="form-control" id="caigoudate" >
         </div>
         <div class="form-group">
             <label for="caigouperson">申请人</label>
             <input type="text" class="form-control" id="caigouperson" value="${userInfo.username}">
         </div>
         <div class="form-group">
             <label for="caigoudept">申请部门</label>
             <input type="text" class="form-control" id="caigoudept" >
         </div>
     </form>
         <button id="btn">添加商品</button>
         <table  class="table">
             <thead>
                 <tr>
                     <th>商品编号</th>
                     <th>商品名称</th>
                     <th>商品类别</th>
                     <th>规格型号</th>
                     <th>计量单位</th>
                     <th>申请单位</th>
                     <th>数量</th>
                     <th>库存总数</th>
                     <th>备注</th>
                 </tr>
             </thead>
             <tbody id="mytbd">


             </tbody>

         </table>


</body>
</html>
<script>
    var num=0;//区分到底是第几行
    //点击添加商品时
      $("#btn").click(function(){
           var tr="<tr>"
             tr+="<td></td>";
          tr+="<td><select class='goodsname'><option>--选择商品--</option></select></td>";
          tr+="<td></td>";
          tr+="<td></td>";
          tr+="<td></td>";
          tr+="<td></td>";
          tr+="<td><input></td>";
          tr+="<td></td>";
          tr+="<td><button class='btn'>删除</button></td>";
            tr+="</tr>";
            //新增的tr追加到
             $("#mytbd").append(tr)
               getGoods();
      });


      //动态读取商品信息
    var goodsinfo;
  function getGoods(){
         $.ajax({
             url:"goods/selectGoods",
             contextType:"application/json",
             type:"post",
             dataType:"json",
             success:function(data) {
                 goodsinfo=data;
                 //清空下拉框中的子元素

                 for (var i in data) {
                     var option = "<option value='" + data[i].productNo + "'>" + data[i].productName + "</option>";
                     $("#mytbd .goodsname").eq(num).append(option);//当前行只会影响，不会影响其他行

                 }
                 num++;//每添一行num自增1

             }
         })
  }
//因为下拉框时动态生成的，所有不能直接使用change,B必须使用时间绑定
    //下拉框改变时，将对应的商品信息查询出来记载到对应的td中
$("#mytbd").on("change",".goodsname",function(){
   //循环进行匹配
    for(var i in goodsinfo){
        if($(this).val()==goodsinfo[i].productNo){
             //$(this).parent().prev().text();
            // $(this).parent().next().text(goodsinfo[i].typeName);
             $(this).parent().parent().children("td").eq(0).text(goodsinfo[i].productNo);
            $(this).parent().parent().children("td").eq(2).text(goodsinfo[i].typeName);
            $(this).parent().parent().children("td").eq(3).text(goodsinfo[i].productSize);
            $(this).parent().parent().children("td").eq(4).text(goodsinfo[i].productUnit);
            $(this).parent().parent().children("td").eq(7).text(goodsinfo[i].productCount);



        }

    }

})

    //删除
    $("#mytbd").on("click",".btn",function(){
        if(confirm("是否删除?")) {
            $(this).parent().parent().remove();
            num--;
        }

    })


</script>
