<%@ Page Language="C#" MasterPageFile="~/Admin/Basic.Master" AutoEventWireup="true"
    CodeBehind="Show.aspx.cs" Inherits="Maticsoft.Web.Pay.CMBC_LogPay.Show" Title="显示页" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="newslistabout">
        <div class="newslist_title">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="borderkuang">
                <tr>
                    <td bgcolor="#FFFFFF" class="newstitle">
                        <asp:Literal ID="Literal2" runat="server" Text="POS机刷卡记录信息" />
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#FFFFFF" class="newstitlebody">
                        <asp:Literal ID="Literal3" runat="server" Text="POS机刷卡记录信息" />接查看
                    </td>
                </tr>
            </table>
        </div>
        <table style="width: 100%;" cellpadding="2" cellspacing="1" class="border">
            <tr>
                <td class="tdbg">
                    
<table cellSpacing="0" cellPadding="0" width="100%" border="0">
	<tr>
	<td class="td_class">
		ID
	：</td>
	<td   >
		<asp:Label id="lblID" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td class="td_class">
		POS终端设置的商户号
	：</td>
	<td   >
		<asp:Label id="lblMCHNT_CD" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td class="td_class">
		交易发生时终端编号
	：</td>
	<td   >
		<asp:Label id="lblTERM_ID" runat="server"></asp:Label>
	</td></tr>
	<tr style="display:none;">
	<td class="td_class">
		交易日期
	：</td>
	<td   >
		<asp:Label id="lblINST_DATE" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td class="td_class">
		交易时间
	：</td>
	<td   >
		<asp:Label id="lblINST_TIME" runat="server"></asp:Label>
	</td></tr>
	<tr style="display:none;">
	<td class="td_class">
		供安全验证使用(暂无)
	：</td>
	<td   >
		<asp:Label id="lblVERT_NUM" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td class="td_class">
		物流通平台流水号
	：</td>
	<td   >
		<asp:Label id="lblSEQ_NUM" runat="server"></asp:Label>
	</td></tr>
	<tr  style="display:none;">
	<td class="td_class">
		员工编号
	：</td>
	<td   >
		<asp:Label id="lblUSER_ID" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td class="td_class">
		支付总额
	：</td>
	<td   >
		<asp:Label id="lblBILL_PAY_AMT" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td class="td_class">
		类型
	：</td>
	<td   >
		<asp:Label id="lblBILL_PAY_WAY" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td class="td_class">
		运单号
	：</td>
	<td   >
		<asp:Label id="lblBILL_NUM" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td class="td_class">
		实收货款
	：</td>
	<td   >
		<asp:Label id="lblCOD_AMT" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td class="td_class">
		实收运费
	：</td>
	<td   >
		<asp:Label id="lblTRAN_AMT" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td class="td_class">
		退货件数
	：</td>
	<td   >
		<asp:Label id="lblBACK_NUM" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td class="td_class">
		退货金额
	：</td>
	<td   >
		<asp:Label id="lblBACK_AMT" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td class="td_class">
		实收金额
	：</td>
	<td   >
		<asp:Label id="lblACT_AMT" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td class="td_class">
		差额
	：</td>
	<td   >
		<asp:Label id="lblDIF_AMT" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td class="td_class">
		备注
	：</td>
	<td   >
		<asp:Label id="lblREMARKS" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td class="td_class">
		保留域
	：</td>
	<td   >
		<asp:Label id="lblRESERVE" runat="server"></asp:Label>
	</td></tr>
	<tr>
	<td class="td_class">
		状态
	：</td>
	<td   >
		<asp:Label id="lblRET_CD" runat="server"></asp:Label>
	</td></tr>
       <tr>
                                <td class="td_class">
                                </td>
                                <td height="25">
                                   
                                    <asp:Button ID="btnCancle" runat="server" Text="<%$ Resources:Site, btnCancleText %>"
                                        class="adminsubmit_short" OnClick="btnCancle_Click" OnClientClick=" javascript: parent.$.colorbox.close();"></asp:Button>
                                </td>
                            </tr>
</table>

                </td>
            </tr>
        </table>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceCheckright" runat="server">
</asp:Content>
