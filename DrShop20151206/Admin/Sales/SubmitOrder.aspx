<%@ Page Title="分销商商品分配管理" Language="C#" MasterPageFile="~/Admin/Basic.Master" CodeBehind="SubmitOrder.aspx.cs"
    Inherits="Maticsoft.Web.Admin.Sales.SubmitOrder" %>

<%@ Import Namespace="System.Data" %>
<%@ Register Assembly="Maticsoft.Web" Namespace="Maticsoft.Web.Controls" TagPrefix="cc1" %>
<%@ Register TagPrefix="Maticsoft" TagName="CategoriesDropList" Src="~/Controls/CategoriesDropList.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/Admin/js/colorbox/colorbox.css" rel="stylesheet" type="text/css" />
    <script src="/Admin/js/colorbox/jquery.colorbox-min.js" type="text/javascript"></script>
    <link href="/Admin/js/select2-3.4.1/select2.css" rel="stylesheet" type="text/css" />
    <script src="/Admin/js/select2-3.4.1/select2.min.js" type="text/javascript" charset="utf-8"></script>
     <link href="/admin/css/tab.css" rel="stylesheet" type="text/css" />
    <script src="/admin/js/tab.js" type="text/javascript"></script>
    <script src="/Scripts/jquery/jquery.guid.js" type="text/javascript"></script>
    <script src="/Areas/MShop/Themes/M1/Content/Scripts/Pay/SubmitOrder.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <div class="newslistabout">
        <div class="newslist_title">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="borderkuang">
                <tr>
                    <td bgcolor="#FFFFFF" class="newstitle">
                        <asp:Literal ID="lblTitle" runat="server" Text="正在进行代购操作" />
                    </td>
                </tr>
            </table>
        </div>
       
        <div class="TabContent">
            <%--选择用户--%>
            <div id="myTab1_Content0">
                <label>用户：</label><asp:DropDownList ID="ddlUser" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlUser_SelectIndexChanged"></asp:DropDownList>
            </div>
            <%--     收货人信息--%>
            <div  >
                <table style="width: 100%; border-bottom: none; border-top: none; float: left;" cellpadding="2"
                    cellspacing="1" class="border">
                    <tr>
                        <asp:HiddenField runat="server"  ID="shipId"/>
                        <td style="vertical-align: top;">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="borderkuang"
                                style="padding-top: 8px">
                                
                                <tr>
                                    <td class="td_class" style="background-color: #E2E8EB">
                                        <asp:Literal ID="Literal18" runat="server" Text=" 收货人" />：
                                    </td>
                                    <td height="25" class="td_content">
                                     <asp:TextBox runat="server" ID="txtUsername" AutoPostBack="True"></asp:TextBox>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="td_class" style="background-color: #E2E8EB">
                                        <asp:Literal ID="Literal22" runat="server" Text="所在地区" />：
                                    </td>
                                    <td height="25" class="td_content">
                                        <asp:HiddenField runat="server" id="hfSelectedNode"/>
                <script src="/Scripts/jquery/maticsoft.selectregion.js" handle="/RegionHandle.aspx" isnull="true" type="text/javascript"></script>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td class="td_class" style="background-color: #E2E8EB">
                                        <asp:Literal ID="Literal1" runat="server" Text="详细地址" />：
                                    </td>
                                    <td height="25" class="td_content">
                                     <asp:TextBox runat="server" ID="txtDetailAddress"></asp:TextBox>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td class="td_class" style="background-color: #E2E8EB">
                                        <asp:Literal ID="Literal2" runat="server" Text="手机号码" />：
                                    </td>
                                    <td height="25" class="td_content">
                                     <asp:TextBox runat="server" ID="txtPhone"></asp:TextBox>
                                    </td>
                                </tr>
                               
                               <tr>
                                    <td class="td_class" style="background-color: #E2E8EB">
                                        <asp:Literal ID="Literal3" runat="server" Text="邮编" />：
                                    </td>
                                    <td height="25" class="td_content">
                                     <asp:TextBox runat="server" ID="txtZipCode"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
            
            
            <div id="Div1">
                <asp:HiddenField runat="server" ID="ShippingTypeId"/>
                <asp:HiddenField runat="server" ID="PaymentTypeId"/>
                  <label>支付方式：</label><asp:DropDownList ID="ddlPayType" runat="server" OnSelectedIndexChanged="ddlPayType_SelectIndexChanged" AutoPostBack="True"></asp:DropDownList>
                  <br />
                  <label>配送方式：</label><asp:DropDownList ID="ddlSendType" runat="server"></asp:DropDownList>
            </div>
            
             <cc1:GridViewEx ID="gridView" runat="server" AllowPaging="True" AllowSorting="True"
            ShowToolBar="True" AutoGenerateColumns="False" OnBind="BindData" OnPageIndexChanging="gridView_PageIndexChanging"
            OnRowDataBound="gridView_RowDataBound" Width="100%" OnRowDeleting="gridView_RowDeleting"
            PageSize="20" ShowExportExcel="False" ShowExportWord="False" ExcelFileName="FileName1"
            CellPadding="3" BorderWidth="1px" ShowCheckAll="False" DataKeyNames="ItemId" Style="float: left;"
            ShowGridLine="true" ShowHeaderStyle="true" OnRowCommand="gridView_RowCommand" >
            <Columns>

                <asp:TemplateField HeaderText="商品/商品规格" ItemStyle-HorizontalAlign="Left">
                    <ItemTemplate >
                         <%#DataBinder.Eval(Container.DataItem,"Name")%>
                         
                    </ItemTemplate>
                </asp:TemplateField>
                
                  <asp:TemplateField HeaderText="商品SKU" ItemStyle-HorizontalAlign="Left">
                    <ItemTemplate >
                        <input type="hidden" class="hiditem" value="<%#DataBinder.Eval(Container.DataItem,"ItemId")%>"/>
                         <%#GetSKUStr(DataBinder.Eval(Container.DataItem, "Sku"))%>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="单价" ItemStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                         <%#DataBinder.Eval(Container.DataItem, "AdjustedPrice")%>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="数量" ItemStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                         <%#DataBinder.Eval(Container.DataItem, "Quantity")%>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="小计" ItemStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                         <%#(decimal.Parse(DataBinder.Eval(Container.DataItem, "AdjustedPrice").ToString()) * int.Parse(DataBinder.Eval(Container.DataItem, "Quantity").ToString()))%>
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
            <br/>
            <asp:Button runat="server" Text="下单" CssClass="postOrder"/>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceCheckright" runat="server">
    <script type="text/javascript">
        $(function () {
            //选择用户
            $("[id$='ddlUser']").select2({ placeholder: "请选择" });
            $(".select2-container").css("vertical-align", "middle");

            //下单操作
            $(".postOrder").click(function () {
                var addressId = $("#shipId").val();
                var shipId = $("#ShippingTypeId").val();
                var payId = $("#PaymentTypeId").val();
                SubmitOrder(this, addressId, shipId, payId, conpon);
            });
        });
        function GetProductBySKU(sku) {
            var product = $(".proname[sku='" + sku + "']");
            return $(product).val();
        }
</script>

</asp:Content>

