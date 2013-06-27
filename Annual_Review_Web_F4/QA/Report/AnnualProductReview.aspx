﻿<%@ Page Language="VB" MasterPageFile="~/MasterPage/main.master" AutoEventWireup="false" CodeFile="AnnualProductReview.aspx.vb" Inherits="QA_Report_AnnualProductReview" title="Untitled Page" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="AjaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="padding:2px">
        <div id="searchBased">
            <table border="0" cellspacing="0" cellpadding="5" style="background-color:#F2F4FD;">
                <tr valign="middle">
                    <td align="right">Kode Produk :</td>
                    <td align="left">
                        <asp:TextBox ID="txtItemCode" runat="server" />
                    </td>
                    <td style="background-color:White"></td>
                </tr>
                <tr valign="middle">
                    <td align="right">No. Batch :</td>
                    <td align="left">
                        <asp:TextBox ID="txtNoBatch" runat="server" />
                    </td>
                    <td style="background-color:White"></td>
                </tr>
                <tr valign="middle">
                    <td align="right">Periode :</td>
                    <td align="left">
                        <asp:TextBox ID="txtFromDate" runat="server" Width="80" />
                        <asp:ImageButton ID="btnFromDate" runat="server" ImageUrl="~/Image/25.png" /> &nbsp; s/d &nbsp;
                        <asp:RequiredFieldValidator ID="valFromDate" runat="server" ControlToValidate="txtFromDate" ErrorMessage="*" />
                        <asp:TextBox ID="txtToDate" runat="server" Width="80" />
                        <asp:ImageButton ID="btnToDate" runat="server" ImageUrl="~/Image/25.png" />
                        <asp:RequiredFieldValidator ID="valToDate" runat="server" ControlToValidate="txtToDate" ErrorMessage="*" />
                        <AjaxToolkit:CalendarExtender ID="calFromDate" runat="server"
                            TargetControlID="txtFromDate"
                            PopupButtonID="btnFromDate"
                            Format="dd-MMM-yy"
                            CssClass="MyCalendar" />
                        <AjaxToolkit:CalendarExtender ID="calToDate" runat="server"
                            TargetControlID="txtToDate"
                            PopupButtonID="btnToDate"
                            Format="dd-MMM-yy"
                            CssClass="MyCalendar" />
                    </td>
                    <td style="background-color:White; width:89px; text-align:left">
                        <asp:LinkButton ID="btnFind" runat="server" CssClass="LinkButton" Text="Get Data" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>

