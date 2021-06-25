<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/6/11
  Time: 13:43
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="./layui/css/layui.css">
    <link rel="stylesheet" href="./css/public.css" media="all">

</head>
<body style="background-color: white">
<div class="layuimini-container">
    <div class="layuimini-main">

        <fieldset class="table-search-fieldset">
            <legend>搜索信息</legend>
            <div style="margin: 10px 10px 10px 10px">
                <form class="layui-form layui-form-pane" action="">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">订单ID</label>
                            <div class="layui-input-inline">
                                <input type="text" name="orderId" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label required">仓库</label>
                                <div class="layui-input-inline">
                                    <select name="orderStorageId" lay-filter="select" id="orderStorageId"  lay-search>
                                        <option value=""></option>
                                        <c:forEach items="${allStorage}" var="storage">
                                            <option value="${storage.storageId}">${storage.storageName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="layui-form-item">
                                <label class="layui-form-label required">供货商</label>
                                <div class="layui-input-block">
                                    <select name="orderSupplierId" lay-filter="select" id="orderSupplierId"  lay-search>
                                        <option value=""></option>
                                        <c:forEach items="${allSuppliers}" var="supplier">
                                            <option value="${supplier.supplierId}">${supplier.supplierName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="layui-inline">
                                <label class="layui-form-label required">商品</label>
                                <div class="layui-input-inline">
                                    <select name="orderProductId" lay-filter="select" id="orderProductId"  lay-search>
                                        <option value=""></option>
                                        <c:forEach items="${allProduct}" var="product">
                                            <option value="${product.productId}">${product.productName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <%--                        <div class="layui-inline">--%>
                            <%--                            <label class="layui-form-label required">创建日期</label>--%>
                            <%--                            <div class="layui-input-inline">--%>
                            <%--                                <input type="text1" class="layui-input" id="test1" placeholder="yyyy-MM-dd" value=""  name="orderDate" >--%>
                            <%--                            </div>--%>
                            <%--                        </div>--%>

                            <div class="layui-inline">
                                <label class="layui-form-label">日期范围</label>
                                <div class="layui-inline" id="test-range">
                                    <div class="layui-input-inline">
                                        <input type="text" id="startDate" class="layui-input" placeholder="开始日期" name="startDay">
                                    </div>
                                    <div class="layui-form-mid">-</div>
                                    <div class="layui-input-inline">
                                        <input type="text" id="endDate" class="layui-input" placeholder="结束日期" name="endDay">
                                    </div>
                                </div>
                            </div>

                            <div class="layui-inline">
                                <button type="submit" class="layui-btn layui-btn-primary"  lay-submit lay-filter="data-search-btn"><i class="layui-icon"></i> 搜 索</button>
                            </div>

                </form>
            </div>
        </fieldset>



       <%-- <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>--%>

        <div id="container" style="height: 700px"></div>


    </div>
</div>
<script src="./layui/layui.js"></script>
<script type="text/javascript" src="./js/echarts.min.js"></script>
<script>
    //
    var dom = document.getElementById("container");
    var myChart = echarts.init(dom);
    var app = {};

    var option;

    option = {
        legend: {
            top: 'bottom'
        },
        toolbox: {
            show: true,
            feature: {
                mark: {show: true},
                dataView: {show: true, readOnly: false},
                restore: {show: true},
                saveAsImage: {show: true}
            }
        },
        series: [
            {
                name: '面积模式',
                type: 'pie',
                radius: [50, 250],
                center: ['50%', '50%'],
                roseType: 'area',
                itemStyle: {
                    borderRadius: 8
                },
                data: [
                    {value: 40, name: 'rose 1'},
                    {value: 38, name: 'rose 2'},
                    {value: 32, name: 'rose 3'},
                    {value: 30, name: 'rose 4'},
                    {value: 28, name: 'rose 5'},
                    {value: 26, name: 'rose 6'},
                    {value: 22, name: 'rose 7'},
                    {value: 18, name: 'rose 8'}
                ]
            }
        ]
    };

    if (option && typeof option === 'object') {
        myChart.setOption(option);
    }




    layui.use(['form', 'table'], function () {
        var $ = layui.jquery,
            form = layui.form,
            laydate = layui.laydate,
            table = layui.table;

        laydate.render({
            elem: '#test-range' //开始时间和结束时间所在 input 框的父选择器
            //设置开始日期、日期日期的 input 选择器
            , range: ['#startDate', '#endDate'] //数组格式为 layui 2.6.6 开始新增
        });

        //日期范围选择器
        // laydate.render({
        //     elem: '#test1'
        //     //设置开始日期、日期日期的 input 选择器
        //     //数组格式为 5.3.0 开始新增，之前版本直接配置 true 或任意分割字符即可
        //     ,range: ['#test-startDate-1', '#test-endDate-1']
        // });


        // 监听搜索操作
        form.on('submit(data-search-btn)', function (data) {
            var result = JSON.stringify(data.field);
            layer.alert(result, {
                title: '最终的搜索信息'
            },function (){

                $.ajax({
                    url:'./findInorderData',
                    type:'post',
                    data:{
                        data:JSON.stringify(data.field)
                    },
                    success:function(data){
                       // console.log(data)
                       //  console.log(option )
                        option.series[0].data=[];

                        if(JSON.parse(data).status == 'error'){
                            layer.msg(JSON.parse(data).msg,{icon: 5});//失败的表情
                            return;
                        }else{
                            layer.msg(JSON.parse(data).msg, {
                                icon: 6,//成功的表情
                                time: 1000 //1秒关闭（如果不配置，默认是3秒）
                            },  function(){
                                // layer.close(index);


                                let t = JSON.parse(data).data
                                console.log(t)
                                //更新
                                console.log(option )

                                for (let key in t) {
                                    if (t.hasOwnProperty(key)) {
                                        console.log({value: t[key], name: key})
                                        option.series[0].data.push({value: t[key], name: key})
                                    }
                                }
                                console.log(option)
                                myChart.setOption(option);


                                //刷新当前窗口
                                // window.location.reload();
                                // var iframeIndex = parent.layer.getFrameIndex(window.name);
                                // parent.layer.close(iframeIndex);
                                // window.parent.location.reload();
                            });
                        }
                    },
                    error:function(e){
                        layer.msg("失败",
                            {icon: 5},
                            function(){
                                location.reload();
                            });//失败的表情
                        console.log(e);
                    },

                });

            });

            return false;
        });
    });



</script>

<!-- Uncomment this line if you want to dataTool extension
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts@5/dist/extension/dataTool.min.js"></script>
-->
<!-- Uncomment this line if you want to use gl extension
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts-gl@2/dist/echarts-gl.min.js"></script>
-->
<!-- Uncomment this line if you want to echarts-stat extension
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts-stat@latest/dist/ecStat.min.js"></script>
-->
<!-- Uncomment this line if you want to use map
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts@5/map/js/china.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts@5/map/js/world.js"></script>
-->
<!-- Uncomment these two lines if you want to use bmap extension
<script type="text/javascript" src="https://api.map.baidu.com/api?v=2.0&ak=<Your Key Here>"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts@5/dist/extension/bmap.min.js"></script>
-->



</body>
</html>