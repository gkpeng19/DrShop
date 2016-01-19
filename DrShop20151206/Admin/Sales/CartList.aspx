<%@ Page Title="分销商商品分配管理" Language="C#" MasterPageFile="~/Admin/Basic.Master" CodeBehind="CartList.aspx.cs"
    Inherits="Maticsoft.Web.Admin.Sales.CartList" %>

<%@ Import Namespace="System.Data" %>
<%@ Register Assembly="Maticsoft.Web" Namespace="Maticsoft.Web.Controls" TagPrefix="cc1" %>
<%@ Register TagPrefix="Maticsoft" TagName="CategoriesDropList" Src="~/Controls/CategoriesDropList.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/Admin/js/colorbox/colorbox.css" rel="stylesheet" type="text/css" />
    <script src="/Admin/js/colorbox/jquery.colorbox-min.js" type="text/javascript"></script>
    <link href="/Admin/js/select2-3.4.1/select2.css" rel="stylesheet" type="text/css" />
    <script src="/Admin/js/select2-3.4.1/select2.min.js" type="text/javascript" charset="utf-8"></script>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="newslistabout">
        <div class="newslist_title">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="borderkuang">
                <tr>
                    <td bgcolor="#FFFFFF" class="newstitle">
                        <asp:Literal ID="Literal1" runat="server" Text="订购商品清单" />
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#FFFFFF" class="newstitlebody">
                        <asp:Literal ID="Literal2" runat="server" Text="您可以对订购的商品进行操作" />
                    </td>
                </tr>
            </table>
        </div>
        <br />
        
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="borderkuang">
            <tr>
                <td height="35" bgcolor="#FFFFFF" class="newstitlebody ">
                 <%--   <asp:Button ID="Button2" runat="server" Text="选择用户"
                        OnClientClick="return  false;" class="adminsubmit selectUser"></asp:Button>--%>



  
        <asp:Button ID="Button2" runat="server" Text="直接下单" href="/Com/Order/SubmitOrder"
                        OnClientClick="return  false;" class="adminsubmit selectUser"></asp:Button>
   <%--   <asp:LinkButton CssClass="adminsubmit" runat="server" href="/Com/Order/SubmitOrder">选择用户</asp:LinkButton>
      <a class=" selectUser" href="/Com/Order/SubmitOrder" >选择用户</a>--%>
      <asp:Button ID="Button1" runat="server" Text="清空" 
                        OnClientClick="return  false;" class="adminsubmit clearCar"></asp:Button>
 <asp:Button ID="Button3" runat="server" Text="返回" 
                        OnClientClick="return  false;" class="adminsubmit goback"></asp:Button>
                </td>
            </tr>
        </table>
        <br/>
        <cc1:GridViewEx ID="gridView" runat="server" AllowPaging="True" AllowSorting="True"
            ShowToolBar="True" AutoGenerateColumns="False" OnBind="BindData" OnPageIndexChanging="gridView_PageIndexChanging"
            OnRowDataBound="gridView_RowDataBound" Width="100%" PageSize="20" ShowExportExcel="False" ShowExportWord="False" ExcelFileName="FileName1"
            CellPadding="3" BorderWidth="1px" ShowCheckAll="False" DataKeyNames="ItemId" Style="float: left;"
            ShowGridLine="true" ShowHeaderStyle="true" >
            <Columns>

                <asp:TemplateField HeaderText="商品/商品规格" ItemStyle-HorizontalAlign="Left">
                    <ItemTemplate >
                         <%#DataBinder.Eval(Container.DataItem,"Name")%>
                    </ItemTemplate>
                </asp:TemplateField>
                      <asp:TemplateField HeaderText="数量" ItemStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <input class="txtQuantity" type="text" value="<%#DataBinder.Eval(Container.DataItem, "Quantity")%>" />
                    </ItemTemplate>
                </asp:TemplateField>
                  <asp:TemplateField  HeaderText="商品编码" ItemStyle-HorizontalAlign="Left">
                    <ItemTemplate >
                        <input type="hidden" class="hiditem" value="<%#DataBinder.Eval(Container.DataItem,"ItemId")%>"/>
                         <%#DataBinder.Eval(Container.DataItem, "Sku")%>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="单价" ItemStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <%#DataBinder.Eval(Container.DataItem, "AdjustedPrice", "￥{0:N2}")%>
                    </ItemTemplate>
                </asp:TemplateField>

          

                <asp:TemplateField HeaderText="小计" ItemStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                         ￥<%#decimal.Parse(DataBinder.Eval(Container.DataItem, "AdjustedPrice", "{0:N2}")) * int.Parse(DataBinder.Eval(Container.DataItem, "Quantity").ToString())%>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="操作" ItemStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                      <a href="javascript:;" class="btnDelete" ItemId="<%#DataBinder.Eval(Container.DataItem,"ItemId")%>">删除</a>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>

            <FooterStyle Height="25px" HorizontalAlign="Right" />
            <HeaderStyle Height="35px" />
            <PagerStyle Height="25px" HorizontalAlign="Right" />
            <SortTip AscImg="~/Images/up.JPG" DescImg="~/Images/down.JPG" />
            <RowStyle Height="25px" CssClass="skulist"/>
            <SortDirectionStr>DESC</SortDirectionStr>
        </cc1:GridViewEx>

    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceCheckright" runat="server">
    <script type="text/javascript">
        $(function () {


            $(".goback").click(function () {
                window.history.go(-1);
            });
            //商品数量修改
            $('.txtQuantity').OnlyNum();
            $('.txtQuantity').die("blur").live("blur", function () {
                var count = parseInt($(this).val());
                if (count < 1) {
                    if (confirm("您确定要删除该商品吗？")) {
                        $(this).parents('tr').find('.btnDelete').click();
                        return;
                    }
                    $(this).val(1);
                    return;
                }
                var itemId = $(this).parents('tr').find(".hiditem").val().trim();
                $.ajax({
                    type: "POST",
                    dataType: "text",
                    url: "/COM/ShoppingCart/UpdateItemCount?s=" + new Date().format('yyyyMMddhhmmssS'),
                    data: { ItemId: itemId, Count: count },
                    success: function (data) {
                        if (data != "No") {
                            window.location.reload();
                        } else {
                            ShowFailTip("服务器繁忙，请稍候再试！");
                        }
                    }
                });
            });




            //选择用户
            function ShowSubmit() {
                $(".selectUser").colorbox({ iframe: true, width: "1000", height: "700", overlayClose: false });
            }
            $(".selectUser").click(BeginOrder);

            function BeginOrder() {
                $.get("/COM/ShoppingCart/GetCartCount", function (result) {
                    if (!(result > 0)) { //购物车没有数据
                        ShowServerBusyTip("请先添加到商品到订购单！");
                        setTimeout(function () {
                            window.location.href = "ProductSKUList.aspx";
                        }, 1000);
                        return false;
                    }
                    $(".selectUser").unbind('click');
                    $(".selectUser").colorbox({ iframe: true, width: "1020", height: "700", overlayClose: false, onClosed: function () {
                        $.colorbox.remove();
                    }
                    });
                    $(".selectUser").click();
                    $(".selectUser").bind("click", BeginOrder);
                });
            }
            //删除操作
            $(".btnDelete").click(function () {
                if (confirm("您确认要删除吗？")) {
                    var itemId = $(this).attr("ItemId");
                    $.ajax({
                        type: "POST",
                        dataType: "text",
                        url: "/COM/ShoppingCart/RemoveItem",
                        data: { ItemIds: itemId },
                        success: function (data) {
                            if (data != "No") {
                                ShowSuccessTip("删除成功！");
                                setTimeout(function () { window.location.reload(); }, 1000);
                            } else {
                                ShowFailTip("服务器繁忙，请稍候再试！");
                                //setTimeout(function () { $("#LoadCartList").load("@(ViewBag.BasePath)ShoppingCart/CartList"); }, 3000);
                            }
                        }
                    });
                }
            });
            $(".clearCar").click(function () {
                if (confirm("您确定清空订购单吗？")) {
                    $.ajax({
                        type: "POST",
                        dataType: "text",
                        url: "/COM/ShoppingCart/ClearShopCart",
                        data: {},
                        success: function (data) {
                            if (data != "No") {
                                ShowSuccessTip("成功清空订购单！");
                                setTimeout(function () { window.location.reload(); }, 1000);
                            } else {
                                ShowFailTip("服务器繁忙，请稍候再试！");
                            }
                        }
                    });
                }

            });

            $(".txtCount").blur(function () {
                var orderCount = parseInt($.trim($(this).val()));
                var stock = parseInt($.trim($(".productStock[sku='" + $(this).attr("sku") + "']").val()));
                if (!(orderCount > 0)) {//代购数量为空
                    $(this).val('1');
                }
                if (orderCount > stock) {//代购大于库存
                    ShowFailTip("库存不足！");
                    $(this).val(stock);
                } else if (orderCount > 100) {//最大限制100个  不能添加无数个
                    ShowServerBusyTip("最多购买100个");
                    $(this).val(100);
                }

            });

        });
        function GetProductBySKU(sku) {
            var product = $(".proname[sku='" + sku + "']");
            return $(product).val();
        }
</script>

</asp:Content>

