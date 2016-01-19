<%@ Page Title="业务员业绩统计" Language="C#" MasterPageFile="~/Admin/Basic.Master" AutoEventWireup="true"
    CodeBehind="SalesCount.aspx.cs" Inherits="Maticsoft.Web.Admin.Sales.SalesCount" %>

<%@ Register Assembly="Maticsoft.Web" Namespace="Maticsoft.Web.Controls" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/Scripts/jqueryui/jquery-ui-1.8.19.custom.css" rel="stylesheet" type="text/css" />
    <script src="/Scripts/jqueryui/jquery-ui-1.8.19.custom.min.js" type="text/javascript"></script>
    <script src="/admin/js/jqueryui/JqueryDataPicker4CN.js" type="text/javascript"></script>
    <script src="/Scripts/Highcharts/highcharts.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $.datepicker.setDefaults($.datepicker.regional['zh-CN']);
            $("[id$='txtBeginTime']").prop("readonly", true).datepicker({
                defaultDate: "+1w",
                changeMonth: true,
                dateFormat: "yy-mm-dd",
                onClose: function (selectedDate) {
                    $("[id$='txtEndTime']").datepicker("option", "minDate", selectedDate);
                }
            });
            $("[id$='txtEndTime']").prop("readonly", true).datepicker({
                defaultDate: "+1w",
                changeMonth: true,
                dateFormat: "yy-mm-dd",
                onClose: function (selectedDate) {
                    $("[id$='txtBeginTime']").datepicker("option", "maxDate", selectedDate);
                    $("[id$='txtEndTime']").val($(this).val());
                }
            });

            var hfCategory = $("[id$='hfCategory']").val();
            if (hfCategory == "") {
                $("#tabCount").hide();
                $("#tabGrid").hide();
                return;
            }
            var categories = hfCategory.split(',');
            var orderCount = [];
            var orderTotal = [];

            var datavalue = $("[id$='hfOrderCount']").val().split(',');
            for (var i = 0; i < datavalue.length; i++) {
                var item = parseInt(datavalue[i]);
                orderCount.push(item);
            }
            var hfordertotal = $("[id$='hfOrderTotal']").val().split(',');
            for (var i = 0; i < hfordertotal.length; i++) {
                var item = parseFloat(hfordertotal[i]);
                orderTotal.push(item);
            }

            $('#tdOrderCount').highcharts({
                chart: {
                    type: 'bar'
                },
                title: {
                    text: '业务员业绩统计'
                },
                subtitle: {
                    text: '订单统计'
                },
                xAxis: {
                    categories: categories,
                    title: {
                        text: null
                    }
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: '订单数 ',
                        align: 'high'
                    },
                    labels: {
                        overflow: 'justify'
                    }
                },
                tooltip: {
                    valueSuffix: '笔 '
                },
                plotOptions: {
                    bar: {
                        dataLabels: {
                            enabled: true
                        }
                    }
                },
                legend: {
                    layout: 'vertical',
                    align: 'right',
                    verticalAlign: 'top',
                    x: -40,
                    y: 100,
                    floating: true,
                    borderWidth: 1,
                    backgroundColor: '#FFFFFF',
                    shadow: true
                },
                credits: {
                    enabled: false
                },
                series: [{
                    name: '订单数',
                    data: orderCount
                }]
            });

            $('#tdOrderTotal').highcharts({
                chart: {
                    type: 'bar'
                },
                title: {
                    text: '业务员业绩统计'
                },
                subtitle: {
                    text: '销售额'
                },
                xAxis: {
                    categories: categories,
                    title: {
                        text: null
                    }
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: '销售额 ',
                        align: 'high'
                    },
                    labels: {
                        overflow: 'justify'
                    }
                },
                tooltip: {
                    valueSuffix: ' 元'
                },
                plotOptions: {
                    bar: {
                        dataLabels: {
                            enabled: true
                        }
                    }
                },
                legend: {
                    layout: 'vertical',
                    align: 'right',
                    verticalAlign: 'top',
                    x: -40,
                    y: 100,
                    floating: true,
                    borderWidth: 1,
                    backgroundColor: '#FFFFFF',
                    shadow: true
                },
                credits: {
                    enabled: false
                },
                series: [{
                    name: '销售额',
                    data: orderTotal
                }]
            });
//            $('#tdOrderTotal').find("text").last().hide();
//            $('#tdOrderCount').find("text").last().hide();
        })
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--Title -->
    <div class="newslistabout">
        <div class="newslist_title">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="borderkuang">
                <tr>
                    <td bgcolor="#FFFFFF" class="newstitle">
                        业务员业绩统计
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#FFFFFF" class="newstitlebody">
                        您可以查看业务员业绩的统计信息
                    </td>
                </tr>
            </table>
        </div>
        <!--Title end -->
        <!--Add  -->
        <!--Add end -->
        <!--Search -->
        <asp:HiddenField ID="hfCategory" runat="server" />
        <asp:HiddenField ID="hfOrderCount" runat="server" />
        <asp:HiddenField ID="hfOrderTotal" runat="server" />
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="borderkuang">
            <tr>
                <td width="1%" height="30" bgcolor="#FFFFFF" class="newstitlebody">
                    <img src="/Admin/Images/icon-1.gif" width="19" height="19" />
                </td>
                <td height="35" bgcolor="#FFFFFF" class="newstitlebody">
                    <asp:Literal ID="Literal5" runat="server" Text="时间范围："></asp:Literal>
                    <asp:TextBox ID="txtBeginTime" runat="server" CssClass="PostDate"></asp:TextBox>
                    <asp:Literal ID="Literal6" runat="server" Text="--"></asp:Literal>
                    <asp:TextBox ID="txtEndTime" runat="server" CssClass="PostDate"> </asp:TextBox>
                    <asp:Button ID="btnSearch" runat="server" Text="统计" OnClick="btnSearch_Click" class="adminsubmit">
                    </asp:Button>
                </td>
            </tr>
        </table>
        <!--Search end-->
        <br />
        <table border="0" cellpadding="0" cellspacing="1" width="100%" style="height: 60px"
            class="borderkuang">
            <tr>
                <td style="width: 1px;">
                </td>
                <td style="width: 120px;">
                    总订单数：
                    <asp:Literal ID="lblOrderCount" runat="server" Text="--"></asp:Literal>
                </td>
                <td>
                    总销售额： ￥<asp:Literal ID="lblOrderTotal" runat="server" Text="--"></asp:Literal>
                </td>
            </tr>
        </table>
        <br />
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="borderkuang"
            height="80px" style="display: none">
            <tr>
                <td style="width: 1px;">
                </td>
                <td style="width: 120px;">
                    成交客户数：
                    <asp:Literal ID="lblCustom" runat="server" Text="--"></asp:Literal>
                </td>
                <td>
                    总客户数：
                    <asp:Literal ID="lblTotalCustom" runat="server" Text="--"></asp:Literal>
                </td>
            </tr>
        </table>
        <br />
        <table border="0" cellpadding="0" cellspacing="1" width="100%" class="borderkuang" id="tabCount">
            <tr>
                <td id="tdOrderCount">
                </td>
            </tr>
            <tr>
                <td id="tdOrderTotal">
                </td>
            </tr>
        </table>
        <br />
        <table border="0" cellpadding="0" cellspacing="1" width="100%" class="borderkuang"
             id="tabGrid">
            <tr>
                <td width="800px">
                    <cc1:GridViewEx ID="gridView" runat="server" AllowPaging="True" AllowSorting="True"
                        ShowToolBar="False" AutoGenerateColumns="False" OnBind="BindData" OnPageIndexChanging="gridView_PageIndexChanging"
                        OnRowDataBound="gridView_RowDataBound" UnExportedColumnNames="Modify" Width="100%"
                        PageSize="100" ShowExportExcel="False" ShowExportWord="False" ExcelFileName="FileName1"
                        CellPadding="3" BorderWidth="1px" ShowCheckAll="False">
                        <Columns>
                            <asp:TemplateField HeaderText="业务员" ItemStyle-HorizontalAlign="Left">
                                <ItemTemplate>
                                    <%# GetUserName(Eval("ReferID"))%></ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="OrderCount" HeaderText="订单数" ItemStyle-HorizontalAlign="Center" />
                            <asp:TemplateField HeaderText="销售额" ItemStyle-HorizontalAlign="Right">
                                <ItemTemplate>
                                    ￥<%#Eval("OrderTotal", "{0:N2}")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle Height="25px" HorizontalAlign="Right" />
                        <HeaderStyle Height="35px" />
                        <PagerStyle Height="25px" HorizontalAlign="Right" />
                        <SortTip AscImg="~/Images/up.JPG" DescImg="~/Images/down.JPG" />
                        <RowStyle Height="25px" />
                        <SortDirectionStr>DESC</SortDirectionStr>
                    </cc1:GridViewEx>
                </td>
                <td>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceCheckright" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".iframe").colorbox({ iframe: true, width: "800", height: "400", overlayClose: false });
        });
    </script>
</asp:Content>
