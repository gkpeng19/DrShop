﻿<%@ Page Title="优惠券管理" Language="C#" MasterPageFile="~/Admin/Basic.Master" AutoEventWireup="true"
    CodeBehind="CouponList.aspx.cs" Inherits="Maticsoft.Web.Admin.Shop.Coupon.CouponList" %>

<%@ Register Assembly="Maticsoft.Web" Namespace="Maticsoft.Web.Controls" TagPrefix="Grv" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="/Scripts/jqueryui/jquery-ui-1.8.19.custom.css" rel="stylesheet" type="text/css" />
    <script src="/Scripts/jqueryui/jquery-ui-1.8.19.custom.min.js" type="text/javascript"></script>
    <script src="/admin/js/jqueryui/JqueryDataPicker4CN.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $.datepicker.setDefaults($.datepicker.regional['zh-CN']);
            $("#ctl00_ContentPlaceHolder1_txtStartDate").prop("readonly", true).datepicker({
               
                changeMonth: true,
                dateFormat: "yy-mm-dd",
                onClose: function (selectedDate) {
                    $("#ctl00_ContentPlaceHolder1_txtEndDate").datepicker("option", "minDate", selectedDate);
                }
            });
            $("#ctl00_ContentPlaceHolder1_txtEndDate").prop("readonly", true).datepicker({
               
                changeMonth: true,
                dateFormat: "yy-mm-dd",
                onClose: function (selectedDate) {
                    $("#ctl00_ContentPlaceHolder1_txtStartDate").datepicker("option", "maxDate", selectedDate);
                    $("#ctl00_ContentPlaceHolder1_txtEndDate").val($(this).val());
                }
            });
        })
    </script>
    <div class="newslistabout">
        <div class="newslist_title">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="borderkuang">
                <tr>
                    <td bgcolor="#FFFFFF" class="newstitle">
                        <asp:Literal ID="Literal1" runat="server" Text="优惠券管理" />
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#FFFFFF" class="newstitlebody">
                        <asp:Literal ID="Literal4" runat="server" Text="您可以进行查看优惠券操作" />
                    </td>
                </tr>
            </table>
        </div>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="borderkuang">
            <tr>
                <td width="1%" height="30" bgcolor="#FFFFFF" class="newstitlebody">
                    <img src="/Admin/Images/icon-1.gif" width="19" height="19" />
                </td>
                <td height="35" bgcolor="#FFFFFF" class="newstitlebody">
                    优惠券分类：<asp:DropDownList ID="ddlClass" runat="server" Width="124px">
                    </asp:DropDownList>
                    &nbsp;&nbsp; 优惠券规则：<asp:DropDownList ID="ddlRule" runat="server" Width="124px">
                    </asp:DropDownList>
                    &nbsp; &nbsp;&nbsp; 使用状态：
                    <asp:DropDownList ID="ddlStatus" runat="server" Width="124px">
                        <asp:ListItem Value="-2" Text="请选择"> </asp:ListItem>
                        <asp:ListItem Value="-1" Text="已冻结"> </asp:ListItem>
                        <asp:ListItem Value="0" Text="未分配"> </asp:ListItem>
                        <asp:ListItem Value="1" Text="已分配"> </asp:ListItem>
                        <asp:ListItem Value="2" Text="已使用"> </asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                   &nbsp; 开始时间：<asp:TextBox ID="txtStartDate" runat="server" Width="122px"></asp:TextBox>
                     &nbsp;   &nbsp;&nbsp;&nbsp;结束时间：<asp:TextBox ID="txtEndDate" runat="server" Width="122px"></asp:TextBox>
                    &nbsp;&nbsp;<asp:Label ID="Label1" runat="server">
                        &nbsp;<asp:Literal ID="Literal3" runat="server" Text="优惠券卡号" />：</asp:Label><asp:TextBox
                            ID="txtKeyword" runat="server" class="admininput_1" Width="122px"></asp:TextBox>
                    &nbsp;&nbsp;
                    赠劵订单号：<asp:TextBox ID="txtOrderCode" runat="server" Width="122px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    <asp:CheckBox ID="chkRule" runat="server" />
                    显示活动名称 &nbsp;&nbsp;
                    <asp:CheckBox ID="chkCategory" runat="server" />
                    显示商品分类 &nbsp;&nbsp;
                    <asp:CheckBox ID="chkProductId" runat="server" />
                    显示商品 &nbsp;&nbsp;
                    <asp:CheckBox ID="chkSupplier" runat="server" />
                    显示商家 &nbsp;&nbsp;
                    <asp:CheckBox ID="chkUser" runat="server" />
                    显示使用者 &nbsp;&nbsp;
                           <asp:CheckBox ID="chkOrder" runat="server" />
                    显示使用订单 &nbsp;&nbsp; &nbsp;&nbsp;
                    <asp:CheckBox ID="chkzengOrder" runat="server" />
                    显示赠劵订单 &nbsp;&nbsp; 
                    <asp:Button ID="Button1" runat="server" Text="<%$ Resources:Site, btnSearchText %>"
                        OnClick="btnSearch_Click" class="adminsubmit_short"></asp:Button>
                    <asp:Button ID="btnMove" runat="server" Text="转移过期券" OnClick="btnMove_Click" CssClass="adminsubmit" />
                </td>
            </tr>
        </table>
        <br />
        <div class="newslist">
            <div class="newsicon">
                <ul>
                    <li id="liAdd" runat="server" style="background: url(/admin/images/icon8.gif) no-repeat 5px 3px;">
                        <a href="AddRule.aspx">
                            <asp:Literal ID="Literal5" runat="server" Text="<%$ Resources:Site, lblAdd%>" /></a>
                    </li>
                </ul>
            </div>
        </div>
        <Grv:GridViewEx ID="gridView" runat="server" AllowPaging="True" AllowSorting="True"
            ShowToolBar="True" AutoGenerateColumns="False" OnBind="BindData" OnPageIndexChanging="gridView_PageIndexChanging"
            OnRowDataBound="gridView_RowDataBound" OnRowDeleting="gridView_RowDeleting" UnExportedColumnNames="Modify"
            Width="100%" PageSize="10" DataKeyNames="CouponCode" ShowExportExcel="True" ShowExportWord="False"
            ExcelFileName="FileName1" CellPadding="3" BorderWidth="1px" ShowCheckAll="true">
            <Columns>
                <asp:TemplateField HeaderText="优惠券卡号" ItemStyle-Width="80" ItemStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <%#Eval("CouponCode")%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="优惠券密码" ItemStyle-Width="80" ItemStyle-HorizontalAlign="Center"
                    Visible="false">
                    <ItemTemplate>
                        <%#Eval("CouponPwd")%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="CouponName" HeaderText="活动名称" ItemStyle-HorizontalAlign="Left"
                    Visible="False" />
                <asp:TemplateField HeaderText="优惠券分类" ItemStyle-Width="120" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <%#GetClassName(Eval("ClassId"))%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="商家名称" ItemStyle-Width="120" ItemStyle-HorizontalAlign="Center"
                    Visible="False">
                    <ItemTemplate>
                        <%#GetSupplierName(Eval("SupplierId"))%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="面值" ItemStyle-Width="80" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <%#Eval("CouponPrice", "￥{0:N2}")%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="最低消费金额" ItemStyle-Width="80" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <%#Eval("LimitPrice", "￥{0:N2}")%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="积分" ItemStyle-Width="50" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <%#Eval("NeedPoint")%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="商品分类" ItemStyle-Width="120" ItemStyle-HorizontalAlign="Center"
                    Visible="False">
                    <ItemTemplate>
                        <%#GetCategoryName(Eval("CategoryId"))%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="商品" ItemStyle-Width="120" ItemStyle-HorizontalAlign="left"
                    Visible="False">
                    <ItemTemplate>
                        <%#GetProdName(Eval("ProductId"))%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="使用者" ItemStyle-Width="80" ItemStyle-HorizontalAlign="Left"  Visible="false">
                    <ItemTemplate>
                        <%#GetUserName(Eval("UserId"))%>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="使用订单" ItemStyle-Width="80" ItemStyle-HorizontalAlign="Left"  Visible="false">
                    <ItemTemplate>
                        <%#GetOrderCode(Eval("CouponCode"))%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="赠券订单" ItemStyle-Width="80" ItemStyle-HorizontalAlign="Left"  Visible="false">
                    <ItemTemplate>
                        <%#Eval("OrderCode")%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="微信用户" ItemStyle-Width="80" ItemStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <%#Eval("UserEmail")%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="活动时间" ItemStyle-Width="150" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <%#Eval("StartDate","{0:yyyy-MM-dd}")%>
                        至
                        <%#Eval("EndDate", "{0:yyyy-MM-dd}")%>
                        </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="生成时间" ItemStyle-Width="80" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <%#Eval("GenerateTime", "{0:yyyy-MM-dd}")%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="使用时间" ItemStyle-Width="80" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <%#Eval("UsedDate", "{0:yyyy-MM-dd}")%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="状态" ItemStyle-Width="40" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <%#GetStatusName(Eval("Status"))%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ControlStyle-Width="50" HeaderText="操作" ItemStyle-HorizontalAlign="Center"
                    ItemStyle-Width="120" Visible="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete"
                            OnClientClick='return confirm($(this).attr("ConfirmText"))' ConfirmText="<%$Resources:Site,TooltipDelConfirm %>"
                            Text="<%$ Resources:Site, btnDeleteText %>"></asp:LinkButton></ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle Height="25px" HorizontalAlign="Right" />
            <HeaderStyle Height="35px" />
            <PagerStyle Height="25px" HorizontalAlign="Right" />
            <SortTip AscImg="~/Images/up.JPG" DescImg="~/Images/down.JPG" />
            <RowStyle Height="25px" />
            <SortDirectionStr>DESC</SortDirectionStr>
        </Grv:GridViewEx>
        <table>
            <tr>
                <td>
                    <asp:Button ID="btnDelete" runat="server" Text="批量删除" OnClick="btnDelete_Click" CssClass="adminsubmit" />
                    <asp:DropDownList ID="ddlAction" runat="server" OnSelectedIndexChanged="ddlAction_Changed"
                        AutoPostBack="True">
                        <asp:ListItem Value="" Text="设置为....."> </asp:ListItem>
                        <asp:ListItem Value="0" Text="未分配"> </asp:ListItem>
                        <asp:ListItem Value="1" Text="已分配"> </asp:ListItem>
                        <asp:ListItem Value="2" Text="已使用"> </asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td style=" display:none">
                会员编号或卡号
                <asp:TextBox ID="txtUser" runat="server"  OnTextChanged="txtUser_Change" AutoPostBack="True"></asp:TextBox>
                        优惠券
                  <asp:DropDownList ID="ddlInfo" runat="server"  >
                        <asp:ListItem Value="" Text="请选择"> </asp:ListItem>
                    </asp:DropDownList>
                      <asp:Button ID="Button2" runat="server" Text="使用" OnClick="btnUse_Click" CssClass="adminsubmit_short" />
                </td>
            </tr>
        </table>
        
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceCheckright" runat="server">
</asp:Content>
