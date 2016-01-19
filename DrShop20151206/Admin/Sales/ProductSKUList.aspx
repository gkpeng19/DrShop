<%@ Page Title="分销商商品分配管理" Language="C#" MasterPageFile="~/Admin/Basic.Master" CodeBehind="ProductSKUList.aspx.cs"
    Inherits="Maticsoft.Web.Admin.Sales.ProductSKUList" %>

<%@ Register Assembly="Maticsoft.Web" Namespace="Maticsoft.Web.Controls" TagPrefix="cc1" %>
<%@ Register TagPrefix="Maticsoft" TagName="CategoriesDropList" Src="~/Controls/CategoriesDropList.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <script src="/admin/js/jquery/maticsoft.img.min.js" type="text/javascript"></script>
    <link href="/Admin/js/colorbox/colorbox.css" rel="stylesheet" type="text/css" />
    <script src="/Admin/js/colorbox/jquery.colorbox-min.js" type="text/javascript"></script>
    <link href="/Admin/js/select2-3.4.1/select2.css" rel="stylesheet" type="text/css" />
    <script src="/Admin/js/select2-3.4.1/select2.min.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("[id$='ddlSupplier']").select2({ placeholder: "请选择" });
            $(".select2-container").css("vertical-align", "middle");
            $(".txtCount").OnlyNum();
            $(".txtPrice").OnlyFloat();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="newslistabout">
        <div class="newslist_title">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="borderkuang">
                <tr>
                    <td bgcolor="#FFFFFF" class="newstitle">
                        <asp:Literal ID="Literal1" runat="server" Text="批量订购商品" />
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#FFFFFF" class="newstitlebody">
                        <asp:Literal ID="Literal2" runat="server" Text="您可以代替客户批量下单" />
                    </td>
                </tr>
            </table>
        </div>
        
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="borderkuang">
            <tr>
              
                <td> <span id="categoryid">
                         <asp:Literal ID="Literal3" runat="server" Text="商品分类" />：
                                            <script src="/Scripts/jquery/jquery.guid.js" type="text/javascript"></script>
                                              <asp:HiddenField  ID="hfSelectedNode"  value="0" runat="server"/>
                                            <script src="/Scripts/jquery/maticsoft.selectnode.js" handle="/Shopmanage.aspx" isnull="true"
                                                type="text/javascript"></script>
                                        </span></td>
            </tr>
            <tr>
            <%--    <td width="1%" height="30" bgcolor="#FFFFFF" class="newstitlebody">
                    <img src="/Admin/Images/icon-1.gif" width="19" height="19" />
                </td>--%>
                <td height="35" bgcolor="#FFFFFF" class="newstitlebody">
                   <%-- <asp:Literal ID="LiteralShopCate" runat="server" Text="商品分类" />：--%>
                    <asp:DropDownList ID="drpProductCategory" runat="server" Visible="False">
                    </asp:DropDownList>
                      <asp:Literal ID="LiteralSupplier" runat="server" Text="商家"  Visible="False"/>
                    <span><asp:DropDownList ID="ddlSupplier" runat="server" Visible="False">
                    </asp:DropDownList>
                    </span>
                    <asp:Literal ID="LiteralProductName" runat="server" Text="商品名称" />：
                    <asp:TextBox ID="txtKeyword" runat="server"></asp:TextBox>
                    <asp:Literal ID="LiteralProductNum" runat="server" Text="产品编号" />：
                    <asp:TextBox ID="txtProductNum" runat="server"></asp:TextBox>
                    <asp:CheckBox ID="chkAlert" runat="server" Text="警戒库存商品"> </asp:CheckBox > <%--<asp:Literal ID="Literal7" runat="server" Text="警戒库存商品"  />--%>
                    <asp:Button ID="btnSearch" runat="server" Text="<%$ Resources:Site, btnSearchText %>"
                        OnClick="btnSearch_Click" class="adminsubmit"></asp:Button>
                </td>
            </tr>
        </table>

        <br />
        
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="borderkuang">
            <tr>
                <td height="35" bgcolor="#FFFFFF" class="newstitlebody ">
                    <asp:Button ID="Button2" runat="server" Text="加入订购单"
                        OnClientClick="return  false;" class="adminsubmit addToCart"></asp:Button>
    <asp:Button ID="Button3" runat="server" Text="查看订购单"
                        OnClientClick="return  false;" class="adminsubmit cartDetail"></asp:Button>
                            <asp:Button ID="Button4" runat="server" Text="直接下单" href="/Com/Order/SubmitOrder"
                        OnClientClick="return  false;" class="adminsubmit submitOrder"></asp:Button>
                      <%--  <a href="javascript:;" class="adminsubmit submitOrder">代下单</a>--%>
                        </td>
            </tr>
        </table>
        
        <br />
     <%--   <asp:Button ID="Button1"  runat="server"  Text="代购" class="addCart" ></asp:Button>--%>
        <cc1:GridViewEx ID="gridView" runat="server" AllowPaging="True" AllowSorting="True"
            ShowToolBar="True" AutoGenerateColumns="False" OnBind="BindData" OnPageIndexChanging="gridView_PageIndexChanging"
            OnRowDataBound="gridView_RowDataBound" Width="100%" OnRowDeleting="gridView_RowDeleting"
            PageSize="20" ShowExportExcel="False" ShowExportWord="False" ExcelFileName="FileName1" 
            CellPadding="3" BorderWidth="1px" ShowCheckAll="true" DataKeyNames="SkuId" Style="float: left;"
            ShowGridLine="true" ShowHeaderStyle="true" OnRowCommand="gridView_RowCommand">
            <Columns>
                  <asp:TemplateField HeaderText="库存" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                         <div class="borderImage">
                            <a href="/Product/Detail/<%# Eval("ProductId") %>" target="_blank">
                                <img ref='<%# Maticsoft.Web.Components.FileHelper.GeThumbImage(GetProductModel(Eval("ProductId")).ThumbnailUrl1,"T207x270_") %>' />
                            </a>
                        </div>
                     </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="商品名称" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate >
                        <%#GetProductModel(Eval("ProductId")).ProductName%>
                        <input type="hidden" class="productId" sku='<%#Eval("SKU")%>' value='<%#Eval("ProductId")%>'/>
                        <input type="hidden" class="productName proname" sku='<%#Eval("SKU")%>' value=" <%#GetProductModel(Eval("ProductId")).ProductName%>"/>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="购买数量" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <input productId="<%#Eval("ProductId")%>"   type="text" value="1" class="txtCount"  sku='<%#Eval("SKU")%>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="商品编码" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <%#Eval("SKU")%>
                           <input type="hidden" class="productName" sku='<%#Eval("SKU")%>'/>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="价格" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <input productId="<%#Eval("ProductId")%>" sku='<%#Eval("SKU")%>'   type="text" value="<%#Eval("SalePrice","{0:N2}")%>" class="txtPrice"  />
                          <input type="hidden" class="productPrice" sku='<%#Eval("SKU")%>' value=" <%#Eval("SalePrice","{0:N2}")%>"/>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="库存" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <%#Eval("Stock")%>
                          <input type="hidden" class="productStock" sku='<%#Eval("SKU")%>' value=" <%#Eval("Stock")%>"/>
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
            resizeImg('.borderImage', 80, 80);
            //禁用库存为0的商品
            $(".skulist .input_middle input[type='checkbox']").each(function () {
                var tr = $(this).parents("tr");
                var skuInfo = $(tr).find(".txtCount");
                var productStock = $(tr).find(".productStock");
                var orderCount = $.trim($(skuInfo).val()); //.trim();
                if (parseInt(orderCount) > parseInt($.trim(productStock.val()))) {
                    $(this).attr("disabled", true);
                }
            });




            //查看购物车
            $(".cartDetail").click(function () {
                window.location.href = "/Admin/Sales/CartList.aspx";
            });

            $(".submitOrder").click(SubmitOrder);

            //填写代购数量
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
            $(".txtPrice").blur(function () {
                var currentPrice = Number($.trim($(this).val())); //当前价格
                var salePrice = Number($.trim($(".productPrice[sku='" + $(this).attr("sku") + "']").val())); //原销售价
                if (!currentPrice || (currentPrice < salePrice)) {
                    ShowFailTip("价格不能低于零售价");
                    $(this).val(salePrice);
                }
            });

            //添加到购物车
            $(".addToCart").click(function () {
                //遍历所有选中的checkbox
                if (!($(".skulist .input_middle input[type='checkbox']:checked").length > 0)) {
                    ShowFailTip("请先选择要订购的商品！");
                    return false;
                }
                GetCheckProduct(this);
                $(".skulist .input_middle input[type='checkbox']:checked").prop("checked", false);
                return false;
            });

        });

        function  SubmitOrder() {//两个操作 将当前商品添加到购物车
            if ($(".skulist .input_middle input[type='checkbox']:checked").length > 0) {//当前有选中部分商品
                GetCheckPro(".submitOrder");
                $(".skulist .input_middle input[type='checkbox']:checked").prop("checked", false);
            }
            $.get("/COM/ShoppingCart/GetCartCount", function (result) {
                if (result > 0) { //购物车有数据
                    $(".submitOrder").unbind('click');
                    $(".submitOrder").colorbox({ iframe: true, width: "1000", height: "750", overlayClose: false, onClosed: function () {
                        $.colorbox.remove();
                    } 
                    });
                    $(".submitOrder").click();
                    $(".submitOrder").bind('click', SubmitOrder);

                } else {
                    ShowFailTip("请先选择订购的商品！");
                    return false;
                }
            });
        }



        function GetProductBySKU(sku) {
            var product = $(".proname[sku='" + sku + "']");
            return $(product).val();
        }
        function GetCheckProduct(sender) {
            $(sender).attr("disabled", true);
            var errorCount = 0;
            var successCount = 0;
            var totalCount = 0;
            $(".skulist .input_middle input[type='checkbox']:checked").each(function () {
                totalCount += 1;
                var tr = $(this).parents("tr");
                var skuInfo = $(tr).find(".txtCount");
                var productStock = $(tr).find(".productStock");
                var productId = $(skuInfo).attr("productId");
                var orderCount = parseInt($.trim($(skuInfo).val()));
                var stockCount = parseInt($.trim($(productStock).val()));
                var sku = $(skuInfo).attr("sku");
                var orderPrice = $(tr).find(".txtPrice").val();
                if (orderCount > stockCount) {
                    errorCount += 1;
                    return false;
                }
                $.ajax({
                    url: "/COM/ShoppingCart/AddCart",
                    type: "POST",
                    async: false,
                    dataType: "JSON",
                    data: { ProductId: productId, Count: orderCount, Sku: sku, OrderPrice: orderPrice },
                    success: function (resultData) {
                        if (resultData.STATUS != "SUCCESS") {
                            errorCount += 1;
                        } else {
                            successCount += 1;
                        }
                        return false;
                    }
                });

            });
           // $(sender).attr("disabled", false);
            if (!(errorCount > 0)) {
                ShowSuccessTip("成功加入" + totalCount + "个商品到订购单！");
            } else {
                if (successCount > 0) {
                    ShowServerBusyTip(successCount + "个商品成功加入订购单," + errorCount + "个商品库存不足！");
                } else {
                    ShowFailTip("加入订购单失败，" + errorCount + "个商品库存不足");
                }
            }
            $(sender).attr("disabled", false);
        }




        function GetCheckPro(sender) {
            $(sender).attr("disabled", true);
            var errorCount = 0;
            $(".skulist .input_middle input[type='checkbox']:checked").each(function () {
                var tr = $(this).parents("tr");
                var productStock = $(tr).find(".productStock");
                var skuInfo = $(tr).find(".txtCount");
                var productId = $(skuInfo).attr("productId");
                var orderCount = $(skuInfo).val();
                var sku = $(skuInfo).attr("sku");
                var orderPrice = $(tr).find(".txtPrice").val();
                if (parseInt(orderCount) > parseInt(productStock)) {
                    errorCount += 1;
                    return false;
                }
                $.ajax({
                    url: "/COM/ShoppingCart/AddCart",
                    type: "POST",
                    async: false,
                    dataType: "JSON",
                    data: { ProductId: productId, Count: orderCount, Sku: sku, OrderPrice: orderPrice },
                    success: function (resultData) {
                        if (resultData.STATUS != "SUCCESS") {
                            errorCount += 1;
                        }
                        return false;
                    }
                });

            });
           $(sender).attr("disabled", false);
        }
</script>

</asp:Content>

