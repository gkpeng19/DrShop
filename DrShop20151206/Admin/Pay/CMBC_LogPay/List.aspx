<%@ Page Title="POS机刷卡记录" Language="C#" MasterPageFile="~/Admin/Basic.Master"
    AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="Maticsoft.Web.Pay.CMBC_LogPay.List" %>

<%@ Register Assembly="Maticsoft.Web" Namespace="Maticsoft.Web.Controls" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="/Scripts/jqueryui/jquery-ui-1.8.19.custom.css" rel="stylesheet" type="text/css" />
    <script src="/Scripts/jqueryui/jquery-ui-1.8.19.custom.min.js" type="text/javascript"></script>
    <script src="/admin/js/jqueryui/JqueryDataPicker4CN.js" type="text/javascript"></script>
    <script>
        $(function() {
            $.datepicker.setDefaults($.datepicker.regional['zh-CN']);
            //日期控件
            $("[id$='txtCreatedDateStart']").prop("readonly", true).datepicker({
                numberOfMonths: 1, //显示月份数量
                onClose: function () {
                    $(this).css("color", "#000");
                }
            }).focus(function () { $(this).val(''); });
            $("[id$='txtCreatedDateEnd']").prop("readonly", true).datepicker({
                numberOfMonths: 1, //显示月份数量
                onClose: function () {
                    $(this).css("color", "#000");
                }
            }).focus(function () { $(this).val(''); });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--Title -->
    <div class="newslistabout">
        <div class="newslist_title">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="borderkuang">
                <tr>
                    <td bgcolor="#FFFFFF" class="newstitle">
                         <asp:Literal ID="Literal1" runat="server" Text="POS机刷卡记录" />
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#FFFFFF" class="newstitlebody">
                        您可以查看 <asp:Literal ID="Literal3" runat="server" Text="POS机刷卡记录" />
                    </td>
                </tr>
            </table>
        </div>
    <!--Title end -->
    <!--Add  -->
    <!--Add end -->
    <!--Search -->
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="borderkuang">
        <tr>
            <td width="1%" height="30" bgcolor="#FFFFFF" class="newstitlebody">
                <img src="../../Images/icon-1.gif" width="19" height="19" />
            </td>
            <td height="35" bgcolor="#FFFFFF" class="newstitlebody">
                <asp:Literal ID="Literal2" runat="server" Text="交易时间" />：
                <asp:TextBox ID="txtCreatedDateStart" runat="server"></asp:TextBox>
                 <asp:Literal ID="Literal4" runat="server" Text="-" />
                <asp:TextBox ID="txtCreatedDateEnd" runat="server"></asp:TextBox>
                 <asp:Literal ID="Literal5" runat="server" Text="交易状态" />：
               <asp:DropDownList ID="dropStatus" runat="server">
                    <asp:ListItem Value="-1">请选择</asp:ListItem>
                    <asp:ListItem Value="1">成功</asp:ListItem>
                    <asp:ListItem Value="0">失败</asp:ListItem>
                </asp:DropDownList>
                <asp:Button ID="btnSearch" runat="server" Text="<%$ Resources:Site, btnSearchText %>"
                    OnClick="btnSearch_Click" class="adminsubmit"></asp:Button>
            </td>
        </tr>
    </table>
    <!--Search end-->
    <br />
    
    <cc1:GridViewEx ID="gridView" runat="server" AllowPaging="True" AllowSorting="True"
        ShowToolBar="false" AutoGenerateColumns="False" OnBind="BindData" OnPageIndexChanging="gridView_PageIndexChanging"
        OnRowDataBound="gridView_RowDataBound"  UnExportedColumnNames="Modify"
        Width="100%" PageSize="10" ShowExportExcel="True" ShowExportWord="False" ExcelFileName="FileName1"
        CellPadding="0" BorderWidth="1px" ShowCheckAll="true" DataKeyNames="ID">
        <columns>
                            
		<asp:BoundField DataField="MCHNT_CD" HeaderText="商户号" SortExpression="MCHNT_CD" ItemStyle-HorizontalAlign="Center"  /> 
		<asp:BoundField DataField="TERM_ID" HeaderText="终端编号" SortExpression="TERM_ID" ItemStyle-HorizontalAlign="Center"  /> 
		<asp:BoundField DataField="INST_DATE" HeaderText="交易日期" SortExpression="INST_DATE" ItemStyle-HorizontalAlign="Center"  Visible="false" /> 
		 <asp:TemplateField ControlStyle-Width="50" HeaderText="交易时间"    ItemStyle-HorizontalAlign="Center" >
                                <ItemTemplate>
                                    <%# ((DateTime)Eval("INST_TIME")).ToString("yyyy-MM-dd HH:mm:ss")%>
                                </ItemTemplate>
                            </asp:TemplateField>
		<asp:BoundField DataField="VERT_NUM" HeaderText="供安全验证使用(暂无)" SortExpression="VERT_NUM" ItemStyle-HorizontalAlign="Center"  Visible="false" /> 
		<asp:BoundField DataField="SEQ_NUM" HeaderText="物流通平台流水号" SortExpression="SEQ_NUM" ItemStyle-HorizontalAlign="Center"  /> 
		<asp:BoundField DataField="USER_ID" HeaderText="员工编号" SortExpression="USER_ID" ItemStyle-HorizontalAlign="Center"  Visible="false"  /> 
  <asp:TemplateField ControlStyle-Width="50" HeaderText="支付总额"    ItemStyle-HorizontalAlign="Center" >
                                <ItemTemplate>
                                    <%# (Eval("BILL_PAY_AMT") != null) ? ((Maticsoft.Common.Globals.SafeDecimal(Eval("BILL_PAY_AMT"),0)).ToString("F")) : ""%>
                                </ItemTemplate>
                            </asp:TemplateField>
		<asp:BoundField DataField="BILL_PAY_WAY" HeaderText="类型" SortExpression="BILL_PAY_WAY" ItemStyle-HorizontalAlign="Center"  /> 
		<asp:BoundField DataField="BILL_NUM" HeaderText="运单号" SortExpression="BILL_NUM" ItemStyle-HorizontalAlign="Center" Visible="false" /> 
         <asp:TemplateField ControlStyle-Width="50" HeaderText="实收货款"    ItemStyle-HorizontalAlign="Center"  >
                                <ItemTemplate>
                                  <%# (Eval("COD_AMT") != null) ? ((Maticsoft.Common.Globals.SafeDecimal(Eval("COD_AMT"), 0)).ToString("F")) : ""%> 
                                </ItemTemplate>
                            </asp:TemplateField>
                        
                             <asp:TemplateField ControlStyle-Width="50" HeaderText="实收运费"    ItemStyle-HorizontalAlign="Center"  Visible="false">
                                <ItemTemplate>
                              <%# (Eval("TRAN_AMT") != null) ? ((Maticsoft.Common.Globals.SafeDecimal(Eval("TRAN_AMT"), 0)).ToString("F")) : ""%> 
                                </ItemTemplate>
                            </asp:TemplateField>
                      
                            	<asp:BoundField DataField="BACK_NUM" HeaderText="退货件数" SortExpression="BACK_NUM" ItemStyle-HorizontalAlign="Center"  Visible="false" /> 
                               <asp:TemplateField ControlStyle-Width="50" HeaderText="退货金额"    ItemStyle-HorizontalAlign="Center"  Visible="false">
                                <ItemTemplate>
                                     <%# (Eval("BACK_AMT") != null) ? ((Maticsoft.Common.Globals.SafeDecimal(Eval("BACK_AMT"), 0)).ToString("F")) : ""%>
                                </ItemTemplate>
                            </asp:TemplateField>
                               <asp:TemplateField ControlStyle-Width="50" HeaderText="实收金额"    ItemStyle-HorizontalAlign="Center"  Visible="false">
                                <ItemTemplate>
                                     <%# (Eval("ACT_AMT") != null) ? ((Maticsoft.Common.Globals.SafeDecimal(Eval("ACT_AMT"), 0)).ToString("F")) : ""%>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField ControlStyle-Width="50" HeaderText="差额"    ItemStyle-HorizontalAlign="Center"  Visible="false" >
                                <ItemTemplate>
                                     <%# (Eval("DIF_AMT") != null) ? ((Maticsoft.Common.Globals.SafeDecimal(Eval("DIF_AMT"), 0)).ToString("F")) : ""%>
                                </ItemTemplate>
                            </asp:TemplateField>
	 
		<asp:BoundField DataField="RET_CD" HeaderText="交易状态" SortExpression="RET_CD" ItemStyle-HorizontalAlign="Center"  /> 
  <asp:TemplateField ControlStyle-Width="50" HeaderText="详情"    ItemStyle-HorizontalAlign="Center"  >
                                <ItemTemplate>
                                  <a  href="Show.aspx?id=<%#Eval("ID") %> ">详情</a>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </columns>
        <footerstyle height="25px" horizontalalign="Right" />
        <headerstyle height="25px" />
        <pagerstyle height="25px" horizontalalign="Right" />
        <sorttip ascimg="~/Images/up.JPG" descimg="~/Images/down.JPG" />
        <rowstyle height="25px" />
        <sortdirectionstr>DESC</sortdirectionstr>
    </cc1:GridViewEx>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceCheckright" runat="server">
</asp:Content>
