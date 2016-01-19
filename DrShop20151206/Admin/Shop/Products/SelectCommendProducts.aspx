﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/BasicNoFoot.Master" AutoEventWireup="true" CodeBehind="SelectCommendProducts.aspx.cs" Inherits="Maticsoft.Web.Admin.Shop.Products.SelectCommendProducts" %>
<%@ Register TagPrefix="webdiyer" Namespace="Wuqi.Webdiyer" Assembly="AspNetPager, Version=7.2.0.0, Culture=neutral, PublicKeyToken=fb0a0fe055d40fd4" %>
<%@ Register TagPrefix="Maticsoft" TagName="CategoriesDropList" Src="~/Controls/CategoriesDropList.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/admin/css/gridviewstyle.css" rel="stylesheet" type="text/css" />
    <script src="/admin/js/jquery/maticsoft.img.min.js" type="text/javascript"></script>
    <script src="/admin/js/jquery/jquery.scrollTo-min.js" type="text/javascript"></script>
    <script src="/admin/js/jquery/ProductStationMode.helper.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            resizeImg('.borderImage', 80, 80);
        });
    </script>
    <style type="text/css">
        .borderImage{width:81px;height: 81px;border: 1px solid #CCC;text-align: center;}
        .cate_ff div{display: initial;}
         .cate_ff div select{margin-right: 1px;}
         .margtop{margin-top: 5px;}
    </style>
</asp:Content>
<asp:content id="Content2" contentplaceholderid="ContentPlaceHolder1" runat="server">
    
    <div  style="background: white;width: 100%" id="relatedProc">
        <div class="advanceSearchArea clearfix">
            <!--预留显示高级搜索项区域-->
        </div>
        <div class="toptitle">
            <h3 class="title_height" style="margin-bottom: 5px">
                </h3>
        </div>
        <div class="Goodsgifts">
            <div class="left">
                <h1>
                <asp:Literal ID="litDesc" runat="server"></asp:Literal></h1>
                <asp:panel id="Panel1" runat="server" defaultbutton="btnSearch">
                <div> 
                         <div  class="margtop  cate_ff" >  
                              <asp:Literal runat="server" ID="LitProductCategories" Text="分&#12288;&#12288;类" />：
                              <Maticsoft:CategoriesDropList ID="drpProductCategory" runat="server" IsNull="true" />  
                          </div>
                        <div class="margtop">
                                <asp:Literal runat="server" ID="LitProductName" Text="商品名称" />：
                            <asp:textbox id="txtProductName" runat="server"/>
                            <asp:Literal runat="server" ID="Literal1" Text="商&#12288;&#12288;家" />：
                            <abbr class="formselect">
                                <asp:dropdownlist ID="ddlSupplier" runat="server">
                                </asp:dropdownlist>
                            </abbr>
                            <asp:Literal runat="server" ID="litProductNum"  Visible="false" Text="商品编号：" />
                            <asp:textbox id="txtProductNum" runat="server"  Visible="false" />
                              <asp:button id="btnSearch" OnClick="btnSearch_Click" runat="server" text="查询" cssclass="adminsubmit_short" />
                         </div>
                    </div>
                    <ul>
                    </ul>
                </asp:panel>
                <div class="content">
                    <div class="youhuiproductlist searchproductslist">
                    <asp:HiddenField ID="hfCurrentAllData" runat="server"/>
                        <asp:DataList runat="server" ID="dlstSearchProducts" Width="96%" DataKeyField="ProductId" RepeatLayout="Table" OnItemDataBound="dlstSearchProducts_ItemDataBound">
                            <ItemTemplate>
                    <table width="100%" border="0" cellspacing="0" class="conlisttd" skuid="<%# Eval("ProductId") %>">
                         <tr>
                            <td width="14%" rowspan="3" class="img">
                                <div class="borderImage">
                                  <a href="/Product/Detail/<%# Eval("ProductId") %>" target="_blank"><img  width="80px" height=80px id="ThumbnailUrl40" src="<%# @Maticsoft.Web.Components.FileHelper.GeThumbImage(Eval("ThumbnailUrl1").ToString(), "T128X130_") %>" /></a></div>
                            </td>
                            <td height="27" colspan="5" class="br_none"><span class="Name">
                                <a href='/Product/Detail/<%# Eval("ProductId") %>' target="_blank"><%# Eval("ProductName") %></a>
                            </span></td>
                          </tr>
                       <tr>
                        <td width="29%" height="28" valign="top"><span class="colorC">最低价：<%# Eval("LowestSalePrice", "{0:n2}")%></span></td>
                      <%--  <td width="19%" valign="top"> 库存：0<%--<%# Eval("Stock") %></td>--%>
                        <td width="11%" align="right" valign="top">&nbsp;</td>
                        <td width="14%" align="left" valign="top" class="a_none">&nbsp;</td>
                        <td width="15%" valign="top"><a href="javascript:void(0);"><span  runat="server" id="lbtnAdd" class="submit_add">添加</span></a></td>
                      </tr>
                   </table>
                </itemtemplate>
                        </asp:DataList>
                    </div>
                    <div class="r">
                        <div style="display:none;">
                            <asp:button runat="server" id="btnAddSearch" cssclass="adminsubmit" text="全部添加" />
                        </div>
                        <div class="pagination">
                    <webdiyer:AspNetPager runat="server" ID="anpSearchProducts" CssClass="anpager" CurrentPageButtonClass="cpb"
                        OnPageChanged="AspNetPager_PageChanged" PageSize="15" FirstPageText="<%$Resources:Site,FirstPage %>"
                        LastPageText="<%$Resources:Site,EndPage %>" NextPageText="<%$Resources:Site,GVTextNext %>"
                        PrevPageText="<%$Resources:Site,GVTextPrevious %>" ShowPageIndexBox="Never" NumericButtonCount="5">
                    </webdiyer:AspNetPager>
                        </div>
                    </div>
                </div>
            </div>
            <div class="right">
                <h1>
                    已添加的商品</h1>
                <ul>
                    <li id="liDelAll" runat="server">
                        <asp:button runat="server" id="btnClear" cssclass="adminsubmit" text="清空列表" 
                            onclick="btnClear_Click" /> 
                    </li>
                </ul>
                <div class="content">
                    <div class="youhuiproductlist addedproductslist">
                        <asp:HiddenField ID="hfSelectedData" runat="server"/>
                        <asp:DataList runat="server" id="dlstAddedProducts"  width="96%" datakeyfield="ProductId" repeatlayout="Table" OnItemDataBound="dlstAddedProducts_ItemDataBound">
                            <itemtemplate>
                     <table width="100%" border="0" cellspacing="0" class="conlisttd" skuid="<%# Eval("ProductId") %>">
                        <tr>
                            <td width="14%" rowspan="3" class="img">
                                  
                                <div class="borderImage"><img id="Img1" width="80px" height="80px" src="<%# @Maticsoft.Web.Components.FileHelper.GeThumbImage(Eval("ThumbnailUrl1").ToString(), "T128X130_") %>" /></div>
                            </td>
                            <td height="27" colspan="5" class="br_none"><span class="Name">
                                <a href='/Product/Detail/<%# Eval("ProductId") %>' target="_blank"><%# Eval("ProductName") %></a>
                            </span></td>
                          </tr>
                       <tr>
                        <td width="29%" height="28" valign="top"><span class="colorC">最低价：<%# Eval("LowestSalePrice", "{0:n2}")%></span></td>
            <%--            <td width="19%" valign="top"> 库存：0<%--<%# Eval("Stock") %></td>--%>
                        <td width="11%" align="right" valign="top">&nbsp;</td>
                        <td width="14%" align="left" valign="top" class="a_none">&nbsp;</td>
                        <td width="15%" valign="top"><a href="javascript:void(0);"><span runat="server" id="lbtnDel" > <span class="submit_del" skuid="<%# Eval("ProductId") %>" >删除</span></span></a></td>
                      </tr>
                      <%--<tr>
                          <td colspan="5">
                              <asp:Repeater ID="rptSKUItems" runat="server">
                                  <ItemTemplate>
                                      <div id="Div1" class="specdiv"><%# Eval("ValueStr")%></div>
                                  </ItemTemplate>
                              </asp:Repeater>
                          </td>
                      </tr>--%>
                     </table>
                </itemtemplate>
                        </asp:DataList>
                    </div>
                    <div class="r">
                        <div>
                            &nbsp;</div>
                        <div class="pagination">
                    <webdiyer:AspNetPager runat="server" ID="anpAddedProducts" CssClass="anpager" CurrentPageButtonClass="cpb"
                        OnPageChanged="AspNetPager_PageChanged" PageSize="15" FirstPageText="<%$Resources:Site,FirstPage %>"
                        LastPageText="<%$Resources:Site,EndPage %>" NextPageText="<%$Resources:Site,GVTextNext %>"
                        PrevPageText="<%$Resources:Site,GVTextPrevious %>" ShowPageIndexBox="Never" NumericButtonCount="5">
                    </webdiyer:AspNetPager>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="bntto">
            <%--<input type="button" id="btnOK" value="确定" class="adminsubmit_short" />--%>
        </div>
    </div>
</asp:content>
