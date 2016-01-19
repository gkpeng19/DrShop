﻿<%@ Page Language="C#" MasterPageFile="~/Admin/BasicNoFoot.Master" AutoEventWireup="true"
    CodeBehind="Modify.aspx.cs" Inherits="Maticsoft.Web.CMS.VideoClass.Modify" Title="<%$ Resources:CMSVideo, ptVideoClassModify %>" %>

<%@ Register Assembly="Maticsoft.Controls" Namespace="Maticsoft.Controls" TagPrefix="cc1" %>
<%@ Register TagPrefix="Maticsoft" Namespace="Maticsoft.Web.Validator" Assembly="Maticsoft.Web.Validator" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="/admin/js/validate/pagevalidator.css" type="text/css" />
    <link rel="stylesheet" href="/admin/css/Maticsoftv5.css" type="text/css" />
    <script type="text/javascript" src="/admin/js/validate/pagevalidator.js"></script>
    <script type="text/javascript" src="/admin/js/Maticsoftv5.js"></script>
    <div class="newslistabout">
        <div class="newslistabout">
            <div class="newslist_title">
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="borderkuang">
                    <tr>
                        <td bgcolor="#FFFFFF" class="newstitle">
                            <asp:Literal ID="ltlModify" runat="server" Text="<%$ Resources:CMSVideo, ptVideoClassModify %>"></asp:Literal>
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="#FFFFFF" class="newstitlebody">
                            <asp:Literal ID="ltlTip" runat="server" Text="<%$ Resources:CMSVideo, ptVideoClassModifyTip %>"></asp:Literal>
                        </td>
                    </tr>
                </table>
            </div>
            <table style="width: 100%;" cellpadding="2" cellspacing="1" class="border">
                <tr>
                    <td class="tdbg">
                        <table cellspacing="0" cellpadding="0" width="100%" border="0">
                            <tr>
                                <td class="td_class">
                                    <asp:Literal ID="ltlName" runat="server" Text="<%$ Resources:CMSVideo, Name %>"></asp:Literal> ：
                                </td>
                                <td height="25" width="*" align="left">
                                    <asp:TextBox ID="txtVideoClassName" runat="server" Width="371px" MaxLength="100"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="td_class">
                                </td>
                                <td height="25" width="*" align="left">
                                    <div id="txtVideoClassNameTip" runat="server">
                                    </div>
                                    <Maticsoft:ValidateTarget ID="ValidateTargetVideoClassName" runat="server" Description="<%$ Resources:CMSVideo, IDS_Message_VideoClassName_Description %>" OkMessage="输入正确"
                                        ControlToValidate="txtVideoClassName" ContainerId="ValidatorContainer">
                                        <Validators>
                                            <Maticsoft:InputStringClientValidator ErrorMessage="<%$ Resources:CMSVideo, IDS_Message_VideoClassName_Description %>"
                                                LowerBound="1" UpperBound="100" />
                                        </Validators>
                                    </Maticsoft:ValidateTarget>
                                </td>
                            </tr>
                            <tr>
                                <td class="td_class">
                                </td>
                                <td height="25">
                                    <br />
                                    <asp:Button ID="btnSave" runat="server" Text="<%$ Resources:Site, btnSaveText %>"
                                        OnClientClick="return PageIsValid();" OnClick="btnSave_Click" class="adminsubmit_short" />
                                    <asp:Button ID="btnCancle" runat="server" Text="<%$ Resources:Site, btnCancleText %>"
                                        class="adminsubmit_short" OnClientClick="javascript:parent.$.colorbox.close();" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td height="10" width="*" align="left">
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <br />
        </div>
        <Maticsoft:ValidatorContainer runat="server" ID="ValidatorContainer" />
</asp:Content>
