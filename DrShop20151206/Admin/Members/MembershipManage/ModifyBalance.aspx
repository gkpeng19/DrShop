﻿<%@ Page Language="C#" MasterPageFile="~/Admin/BasicNoFoot.Master" AutoEventWireup="true"
    CodeBehind="ModifyBalance.aspx.cs" Inherits="Maticsoft.Web.Admin.Members.MembershipManage.ModifyBalance"
    Title="账户充值" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="newslistabout">
        <div class="newslist_title">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="borderkuang">
                <tr>
                    <td bgcolor="#FFFFFF" class="newstitle">
                        <asp:Literal ID="Literal1" runat="server" Text="账户充值" />
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#FFFFFF" class="newstitlebody">
                        您可以对会员的账户进行充值
                    </td>
                </tr>
            </table>
        </div>
        <table style="width: 100%;" cellpadding="2" cellspacing="1" class="border">
            <tr>
                <td class="tdbg">
                    <table cellspacing="0" cellpadding="3" width="100%" border="0">
                        <tr style="display: none;">
                            <td class="td_class">
                                ID ：
                            </td>
                            <td height="25" width="*" align="left">
                                <asp:Label ID="lblID" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_class">
                                用户名 ：
                            </td>
                            <td height="25" width="*" align="left">
                                <asp:Label ID="lblUserName" Text="Admin" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_class">
                                昵称 ：
                            </td>
                            <td height="25" width="*" align="left">
                                <asp:Label ID="lblNickName" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr style="display: none;">
                            <td class="td_class">
                                真实姓名 ：
                            </td>
                            <td height="25" width="*" align="left">
                                <asp:Label ID="lblTrueName" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr style="display: none;">
                            <td class="td_class">
                                联系电话 ：
                            </td>
                            <td height="25" width="*" align="left">
                                <asp:Label ID="lblPhone" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr style="display: none;">
                            <td class="td_class">
                                邮箱 ：
                            </td>
                            <td height="25" width="*" align="left">
                                <asp:Label ID="lblEmail" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr style="display: none;">
                            <td class="td_class">
                                积分 ：
                            </td>
                            <td height="25" width="*" align="left">
                                <asp:Label ID="lblPoints" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_class">
                                当前余额 ：
                            </td>
                            <td height="25" width="*" align="left">
                                <asp:Label ID="lblBalance" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_class">
                                充值金额 ：
                            </td>
                            <td height="25" width="*" align="left">
                                <asp:TextBox ID="txtRecharge" runat="server" CssClass="OnlyFloat"     onblur="checkMoney()" onfocus="cleanMes();"  ></asp:TextBox>
                                <label  class="msg-error"></label>
                            </td>
                        </tr>
                        <tr id="divrechargeMoney"  style="display:none;"  >
                            <td class="td_class">
                                应付金额 ：
                            </td>
                            <td height="25" width="*" align="left">
                                <asp:label  ID="lblMoney" runat="server" CssClass="OnlyFloat"  style="font-size: 22px;margin-right: 5px;color: #F60;">0.00</asp:label>元
                            </td>
                        </tr>
                
                        <tr>
                            <td class="td_classshow">
                            </td>
                            <td height="25">
                                <asp:Button ID="btnRecharge" runat="server" CausesValidation="false" Text="充值"
                                    class="adminsubmit_short" OnClick="btnRecharge_Click"></asp:Button>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <input type="hidden" id="hidRechargeRatio"  runat="server" />
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceCheckright" runat="server">
    <script type="text/javascript" language="javascript">
        $(".OnlyFloat").OnlyFloat();

        var RechargeRatio;
        var RechargeRatioStates = false;
        function cleanMes() {
            $(".msg-error").html("");
        }
        function checkMoney() {
            var account = $('[id$="txtRecharge"]').val();
            if (account == "") {
                $('[id$="lblMoney"]').text("0.00");
                return;
            }

            if (parseInt(account) > 1000000) {
                $(".msg-error").html("只能填写大于0，小于1000000的金额");
                return;
            }
            if (RechargeRatioStates) {
                var payMoney = parseFloat(account) / RechargeRatio;
                $('[id$="lblMoney"]').text(payMoney.toFixed(2));
            }
        }

        $(function () {
            RechargeRatio = $('[id$="hidRechargeRatio"]').val();
            if ($.trim(RechargeRatio) != '' && RechargeRatio != '1' && RechargeRatio != '1.0') {
                $('[id$="divrechargeMoney"]').show();
                RechargeRatioStates = true;
            }
            $('[id$="txtRecharge"]').OnlyFloat();

            //回发
            if (IsPostBack()) {
                checkMoney(); //回发后值保持不变
            }  
        });
        function IsPostBack() {
            var IsPostBack = "<%=IsPostBack%>";
            if (IsPostBack == "True") {
                return true;
            } else {
                return false;
            }
        }


    </script>
</asp:Content>
