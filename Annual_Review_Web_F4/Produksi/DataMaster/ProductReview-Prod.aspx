﻿<%@ Page Language="VB" MasterPageFile="~/MasterPage/main.master" AutoEventWireup="false" CodeFile="ProductReview-Prod.aspx.vb" Inherits="Produksi_DataMaster_ProductReview_Prod" title="Untitled Page" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="AjaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script type="text/javascript">
        var txtNoBatch;

        function pageLoad() {
            txtNoBatch = $get("<%=txtNoBatch.ClientID%>");
            txtProdDate = $get("<%=txtProdDate.ClientID%>");
            $addHandler(txtNoBatch, "blur", txtNoBatch_OnBlur);
            Sys.Application.add_disposing(appDispose);
        }

        function txtNoBatch_OnBlur(e) {
            if(this.value != '')
                WS_ProdukReview.ValidateNoBatch(this.value,$get("<%=txtProdID.ClientID%>").value,onSuccess, onError);
        }

        function appDispose() {
            $clearHandlers(txtNoBatch);
        }
        
        function onSuccess(result) {
            if (!result) {
                alert('No Batch Salah !');
                txtNoBatch.value = '';
                txtNoBatch.focus();
            }
            else
                <%=PostBackStr%>
        }

        function onError(err) {
            alert(err.get_message());
        }
        
        function isEmptyBatch(){
            spanBatch = $get("errBatch");
            spanProdDate = $get("errProdDate");
            if(txtNoBatch.value==''){
                spanBatch.style.display = 'inline';
                return false;
                }
            else {
                if (txtProdDate.value=='') {
                    spanProdDate.style.display = 'inline';
                    return false;
                    }
                else
                    return true;
                }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManagerProxy ID="proxy" runat="server">
        <Services>
            <asp:ServiceReference Path="~/WS_ProdukReview.asmx" />
        </Services>
    </asp:ScriptManagerProxy>
    <div style="padding:2px">
        <table border="0">
            <tr valign="middle">
                <td align="right">Produk :</td>
                <td align="left">
                    <asp:Label ID="lblProdName" runat="server" Text="." />
                    <asp:TextBox ID="txtProdID" runat="server" style="display:none" />
                </td>
            </tr>
            <tr valign="middle">
                <td align="right">
                    No. Batch :
                </td>
                <td align="left">
                    <asp:TextBox ID="txtNoBatch" runat="server" />
                    <span id="errBatch" style="display:none; color:Red">*</span>
                </td>
            </tr>
            <tr valign="middle">
                <td align="right">Tgl. Produksi :</td>
                <td align="left">
                    <asp:TextBox ID="txtProdDate" runat="server" Width="100" />
                    <asp:ImageButton ID="btnProdDate" runat="server" ImageUrl="~/Image/25.png" />
                    <AjaxToolkit:CalendarExtender ID="CalProdDate" runat="server"
                        TargetControlID="txtProdDate"
                        PopupButtonID="btnProdDate"
                        Format="dd-MMM-yy"
                        CssClass="MyCalendar"/>
                    <span id="errProdDate" style="display:none; color:Red">*</span>
                 </td>
            </tr>
            <tr valign="middle">
                <td align="right">Jam Kerja :</td>
                <td align="left">
                    <asp:TextBox ID="txtPBAJamKerja" runat="server" style="text-align:right" Text="0.00" Width="40" />
                    <AjaxToolkit:MaskedEditExtender ID="mePBAJamKerja" runat="server"
                        TargetControlID="txtPBAJamKerja"
                        MaskType="Number"
                        Mask="99.99"
                        InputDirection="RightToLeft" />
                    <AjaxToolkit:MaskedEditValidator ID="mevPBAJamKerja" runat="server"
                        ControlToValidate="txtPBAJamKerja"
                        ControlExtender="mePBAJamKerja"
                        SetFocusOnError="true"
                        EmptyValueMessage="*"
                        IsValidEmpty="false"
                        InvalidValueMessage="*" />
                </td>
            </tr>
            <tr valign="middle">
                <td align="right">PBA Rendemen(%) :</td>
                <td align="left">
                    <asp:TextBox ID="txtPBARendemen" runat="server" Text="0.00" style="text-align:right" Width="40" />
                    <AjaxToolkit:MaskedEditExtender ID="mePBARendemen" runat="server"
                        TargetControlID="txtPBARendemen"
                        MaskType="Number"
                        Mask="999.99"
                        InputDirection="RightToLeft" />
                    <AjaxToolkit:MaskedEditValidator ID="mevPBARendemen" runat="server"
                        ControlToValidate="txtPBARendemen"
                        ControlExtender="mePBARendemen"
                        IsValidEmpty="false"
                        SetFocusOnError="true"
                        EmptyValueMessage="*"
                        InvalidValueMessage="*" /> 
                </td>
            </tr>
        </table>
        <asp:Panel ID="pnlOIL" style="margin-top:10px;" runat="server">
            <div class="groupTitle" style="width:100px">
                <div style="text-align:center; background-color:Navy">
                    OIL    
                </div>
            </div>
            <div class="groupContent">
                <table border="0">
                    <tr valign="middle">
                        <td align="right">Mixing :</td>
                        <td align="left">
                            <asp:TextBox ID="txtOilMix" runat="server" Text="0.00" Width="40" style="text-align:right" />
                        </td>
                        <td align="left">Jam
                            <AjaxToolkit:MaskedEditExtender ID="meOilMix" runat="server"
                                TargetControlID="txtOilMix"
                                MaskType="Number"
                                Mask="99.99"
                                InputDirection="RightToLeft" />
                            <AjaxToolkit:MaskedEditValidator ID="mevOilMix" runat="server"
                                ControlToValidate="txtOilMix"
                                ControlExtender="meOilMix"
                                EmptyValueMessage="Tidak boleh kosong! Min. diisi 0"
                                IsValidEmpty="false"
                                MinimumValue="0"
                                MinimumValueMessage="Min. 0 Jam"
                                ValidationGroup="OIL" />
                        </td>
                    </tr>
                    <tr valign="middle">
                        <td align="right">Filling :</td>
                        <td align="left">
                            <asp:TextBox ID="txtOilFilling" runat="server" Text="0.00" style="text-align:right" Width="40" />
                        </td>
                        <td align="left">Jam
                            <AjaxToolkit:MaskedEditExtender ID="meOilFilling" runat="server"
                                TargetControlID="txtOilFilling"
                                MaskType="Number"
                                Mask="99.99"
                                InputDirection="RightToLeft" />
                            <AjaxToolkit:MaskedEditValidator ID="mevOilFilling" runat="server"
                                ControlToValidate="txtOilFilling"
                                ControlExtender="meOilFilling"
                                EmptyValueMessage="Tidak boleh kosong! Min. diisi 0"
                                IsValidEmpty="false"
                                MinimumValue="0"
                                MinimumValueMessage="Min. 0 Jam"
                                ValidationGroup="OIL" />
                        </td>
                    </tr>
                </table>
             </div>   
             <div style="width:575px; text-align:right">
            <asp:LinkButton ID="btnSaveOIL" CssClass="LinkButton" runat="server" ValidationGroup="OIL" Text="Save" OnClientClick="return isEmptyBatch()" />
        </div>  
        </asp:Panel>
        <asp:Panel ID="pnlSYR" style="margin-top:10px;" runat="server">
            <div class="groupTitle" style="width:100px">
                <div style="text-align:center; background-color:Navy">
                    SYR  
                </div>
            </div>
            <div class="groupContent">
                <table border="0" width="100%">
                    <tr valign="middle">
                        <td align="right" style="width:80px">CMC :</td>
                        <td align="left" style="width:60px">
                            <asp:TextBox ID="txtCMC" runat="server" Width="60" Text="0" style="text-align:right" />
                        </td>
                        <td align="left">Cps
                            <AjaxToolkit:MaskedEditExtender ID="meCMC" runat="server"
                                TargetControlID="txtCMC"
                                MaskType="Number"
                                Mask="999999"
                                InputDirection="RightToLeft" />
                            <AjaxToolkit:MaskedEditValidator ID="mevCMC" runat="server"
                                ControlToValidate="txtCMC"
                                ControlExtender="meCMC"
                                EmptyValueMessage="Min. diisi 0"
                                IsValidEmpty="false"
                                MinimumValue="0"
                                MinimumValueMessage="Min. 0 Jam"
                                ValidationGroup="SYR" />
                        </td>
                        <td align="right">Mixing :</td>
                        <td align="left" style="width:60px">
                            <asp:TextBox ID="txtSyrMix" runat="server" Text="0.00" style="text-align:right" Width="60" />
                        </td>
                        <td align="left">Jam
                            <AjaxToolkit:MaskedEditExtender ID="meSyrMix" runat="server"
                                TargetControlID="txtSyrMix"
                                MaskType="Number"
                                Mask="99.99"
                                InputDirection="RightToLeft" />
                            <AjaxToolkit:MaskedEditValidator ID="mevSyrMix" runat="server"
                                ControlToValidate="txtSyrMix"
                                ControlExtender="meSyrMix"
                                EmptyValueMessage="Min. diisi 0"
                                IsValidEmpty="false"
                                MinimumValue="0"
                                MinimumValueMessage="Min. 0 Jam"
                                ValidationGroup="SYR" />
                        </td>
                    </tr>
                    <tr valign="middle">
                        <td align="right">Avicel :</td>
                        <td align="left">
                            <asp:TextBox ID="txtAvicel" runat="server" Width="60" Text="0" style="text-align:right" />
                        </td>
                        <td align="left">Cps
                            <AjaxToolkit:MaskedEditExtender ID="meAvicel" runat="server"
                                TargetControlID="txtAvicel"
                                MaskType="Number"
                                Mask="999999"
                                InputDirection="RightToLeft" />
                            <AjaxToolkit:MaskedEditValidator ID="mevAvicel" runat="server"
                                ControlToValidate="txtAvicel"
                                ControlExtender="meAvicel"
                                EmptyValueMessage="Min. diisi 0"
                                IsValidEmpty="false"
                                MinimumValue="0"
                                MinimumValueMessage="Min. 0 Jam"
                                ValidationGroup="SYR" />
                        </td>
                        <td align="right">Filing :</td>
                        <td align="left">
                            <asp:TextBox ID="txtSyrFilling" runat="server" Text="0.00" style="text-align:right" Width="60" />
                        </td>
                        <td align="left">Jam
                            <AjaxToolkit:MaskedEditExtender ID="meSyrFilling" runat="server"
                                TargetControlID="txtSyrFilling"
                                MaskType="Number"
                                Mask="99.99"
                                InputDirection="RightToLeft" />
                            <AjaxToolkit:MaskedEditValidator ID="mevSyrFilling" runat="server"
                                ControlToValidate="txtSyrFilling"
                                ControlExtender="meSyrFilling"
                                EmptyValueMessage="Min. diisi 0"
                                IsValidEmpty="false"
                                MinimumValue="0"
                                MinimumValueMessage="Min. 0 Jam"
                                ValidationGroup="SYR" />
                        </td>
                    </tr>
                    <tr valign="middle">
                    <td align="right">Xanthan :</td>
                        <td align="left">
                            <asp:TextBox ID="txtXanthan" runat="server" Width="60" Text="0" style="text-align:right" />
                        </td>
                        <td align="left" style="width:80px">Cps
                            <AjaxToolkit:MaskedEditExtender ID="meXanthan" runat="server"
                                TargetControlID="txtXanthan"
                                MaskType="Number"
                                Mask="999999"
                                InputDirection="RightToLeft" />
                            <AjaxToolkit:MaskedEditValidator ID="mevXanthan" runat="server"
                                ControlToValidate="txtXanthan"
                                ControlExtender="meXanthan"
                                EmptyValueMessage="Min. diisi 0"
                                IsValidEmpty="false"
                                MinimumValue="0"
                                MinimumValueMessage="Min. 0 Jam"
                                ValidationGroup="SYR" />
                        </td>
                    </tr>
                </table>
             </div>   
            <div style="width:575px; text-align:right">
                <asp:LinkButton ID="btnSaveSYR" CssClass="LinkButton" runat="server" ValidationGroup="SYR" Text="Save" OnClientClick="return isEmptyBatch()" />
            </div>  
        </asp:Panel>
        <asp:Panel ID="pnlINA" style="margin-top:10px;" runat="server">
            <div class="groupTitle" style="width:200px">
                <div style="text-align:center; background-color:Navy">
                    INA, MTR002, MTR004  
                </div>
            </div>
            <div class="groupContent">
                <table border="0" width="100%">
                    <tr valign="middle">
                        <td align="right" style="width:80px">Filing :</td>
                        <td align="left" style="width:41px">
                            <asp:TextBox ID="txtInaFilling" runat="server" Text="0.00" style="text-align:right" Width="40" />
                        </td>
                        <td align="left">Jam
                            <AjaxToolkit:MaskedEditExtender ID="meInaFilling" runat="server"
                                TargetControlID="txtInaFilling"
                                MaskType="Number"
                                Mask="99.99"
                                InputDirection="RightToLeft" />
                            <AjaxToolkit:MaskedEditValidator ID="mevInaFilling" runat="server"
                                ControlToValidate="txtInaFilling"
                                ControlExtender="meInaFilling"
                                EmptyValueMessage="*"
                                IsValidEmpty="false"
                                MinimumValue="0"
                                MinimumValueMessage="*"
                                ValidationGroup="INA" />
                        </td>
                        <td align="right">BS Clarity :</td>
                        <td align="left" style="width:41px">
                            <asp:TextBox ID="txtBSClarity" runat="server" Text="0" style="text-align:right" Width="50" />
                        </td>
                        <td align="left">amp
                            <AjaxToolkit:MaskedEditExtender ID="meBSClarity" runat="server"
                                TargetControlID="txtBSClarity"
                                MaskType="Number"
                                Mask="9999"
                                InputDirection="RightToLeft" />
                            <AjaxToolkit:MaskedEditValidator ID="mevBSClarity" runat="server"
                                ControlToValidate="txtBSClarity"
                                ControlExtender="meBSClarity"
                                EmptyValueMessage="*"
                                IsValidEmpty="false"
                                MinimumValue="0"
                                MinimumValueMessage="*"
                                ValidationGroup="INA" />
                        </td>
                    </tr>
                    <tr valign="middle">
                        <td align="right">BS Cuci :</td>
                        <td align="left">
                            <asp:TextBox ID="txtInaBSCuci" runat="server" Text="0" Width="40" style="text-align:right" />
                        </td>
                        <td align="left">amp
                            <AjaxToolkit:MaskedEditExtender ID="meInaBSCuci" runat="server"
                                TargetControlID="txtInaBSCuci"
                                MaskType="Number"
                                Mask="999"
                                InputDirection="RightToLeft" />
                            <AjaxToolkit:MaskedEditValidator ID="mevInaBSCuci" runat="server"
                                ControlToValidate="txtInaBSCuci"
                                ControlExtender="meInaBSCuci"
                                EmptyValueMessage="*"
                                IsValidEmpty="false"
                                MinimumValue="0"
                                MinimumValueMessage="*"
                                ValidationGroup="INA" />
                        </td>
                        <td align="right">Hasil Baik :</td>
                        <td align="left">
                            <asp:TextBox ID="txtHasilBaik" runat="server" Text="0" style="text-align:right" Width="50" />
                        </td>
                        <td align="left">amp
                            <AjaxToolkit:MaskedEditExtender ID="meHasilBaik" runat="server"
                                TargetControlID="txtHasilBaik"
                                MaskType="Number"
                                Mask="99999"
                                InputDirection="RightToLeft" />
                            <AjaxToolkit:MaskedEditValidator ID="mevHasilBaik" runat="server"
                                ControlToValidate="txtHasilBaik"
                                ControlExtender="meHasilBaik"
                                EmptyValueMessage="*"
                                IsValidEmpty="false"
                                MinimumValue="0"
                                MinimumValueMessage="*"
                                ValidationGroup="INA" />
                        </td>
                    </tr>
                    <tr valign="middle">
                        <td align="right">BS Filling :</td>
                        <td align="left">
                            <asp:TextBox ID="txtBSFilling" runat="server"  Text="0" style="text-align:right" Width="40" />
                        </td>
                        <td align="left">amp
                            <AjaxToolkit:MaskedEditExtender ID="meBSFilling" runat="server"
                                TargetControlID="txtBSFilling"
                                MaskType="Number"
                                Mask="9999"
                                InputDirection="RightToLeft" />
                            <AjaxToolkit:MaskedEditValidator ID="mevBSFilling" runat="server"
                                ControlToValidate="txtBSFilling"
                                ControlExtender="meBSFilling"
                                EmptyValueMessage="*"
                                IsValidEmpty="false"
                                MinimumValue="0"
                                MinimumValueMessage="*"
                                ValidationGroup="INA" />
                        </td>
                    </tr>
                </table>
             </div>   
             <div style="width:575px; text-align:right">
                <asp:LinkButton ID="btnSaveINA" CssClass="LinkButton" runat="server" ValidationGroup="INA" Text="Save" OnClientClick="return isEmptyBatch()" />
             </div>  
        </asp:Panel>
        <asp:Panel ID="pnlINV" style="margin-top:10px;" runat="server">
            <div style="width:575px; text-align:right">
                <asp:LinkButton ID="btnSaveINV" CssClass="LinkButton" runat="server" Text="Save" />
            </div> 
        </asp:Panel>
        <asp:Panel ID="pnlSYK" style="margin-top:10px;" runat="server">
            <div class="groupTitle" style="width:100px">
                <div style="text-align:center; background-color:Navy">
                    SYK    
                </div>
            </div>
            <div class="groupContent">
                <table border="0">
                    <tr valign="middle">
                        <td align="right">Mixing :</td>
                        <td align="left">
                            <asp:TextBox ID="txtSykMix" runat="server" Text="0.00" Width="40" style="text-align:right" />
                        </td>
                        <td align="left">Jam
                            <AjaxToolkit:MaskedEditExtender ID="meSykMix" runat="server"
                                TargetControlID="txtSykMix"
                                MaskType="Number"
                                Mask="99.99"
                                InputDirection="RightToLeft" />
                            <AjaxToolkit:MaskedEditValidator ID="mevSykMix" runat="server"
                                ControlToValidate="txtSykMix"
                                ControlExtender="meSykMix"
                                EmptyValueMessage="Tidak boleh kosong! Min. diisi 0"
                                IsValidEmpty="false"
                                MinimumValue="0"
                                MinimumValueMessage="Min. 0 Jam"
                                ValidationGroup="SYK" />
                        </td>
                    </tr>
                    <tr valign="middle">
                        <td align="right">Filling :</td>
                        <td align="left">
                            <asp:TextBox ID="txtSykFilling" runat="server" Text="0.00" style="text-align:right" Width="40" />
                        </td>
                        <td align="left">Jam
                            <AjaxToolkit:MaskedEditExtender ID="meSykFilling" runat="server"
                                TargetControlID="txtSykFilling"
                                MaskType="Number"
                                Mask="99.99"
                                InputDirection="RightToLeft" />
                            <AjaxToolkit:MaskedEditValidator ID="mevSykFilling" runat="server"
                                ControlToValidate="txtSykFilling"
                                ControlExtender="meSykFilling"
                                EmptyValueMessage="Tidak boleh kosong! Min. diisi 0"
                                IsValidEmpty="false"
                                MinimumValue="0"
                                MinimumValueMessage="Min. 0 Jam"
                                ValidationGroup="SYK" />
                        </td>
                    </tr>
                </table>
             </div>   
             <div style="width:575px; text-align:right">
                <asp:LinkButton ID="btnSaveSYK" CssClass="LinkButton" runat="server" ValidationGroup="SYK" Text="Save" OnClientClick="return isEmptyBatch()" />
            </div>  
        </asp:Panel>
        <asp:Panel ID="pnlTAB" style="margin-top:10px;" runat="server">
            <div class="groupTitle" style="width:250px">
                <div style="text-align:center; background-color:Navy">
                    TAB,KPT,KPS, MTR001, MTR003    
                </div>
            </div>
            <div class="groupContent">
                <div style="text-align:right">
                    <div style="width:200px">
                        <div class="groupItemBar">
                            <div class="groupItemTitle">
                                <div style="padding-top:10px;margin:0 auto">
                                    Granulasi bsh di Diosna 
                                </div>   
                            </div>
                        </div>
                    </div>
                </div>
                <table border="0" width="100%">
                    <tr valign="middle">
                        <td align="right" style="width:80px" >Total Air :</td>
                        <td align="left" style="width:41px">
                            <asp:TextBox ID="txtTotAir" runat="server" Text="0.00" Width="40" style="text-align:right" />
                        </td>
                        <td align="left">L
                            <AjaxToolkit:MaskedEditExtender ID="meTotAir" runat="server"
                                TargetControlID="txtTotAir"
                                MaskType="Number"
                                Mask="99.99"
                                InputDirection="RightToLeft" />
                            <AjaxToolkit:MaskedEditValidator ID="mevTotAir" runat="server"
                                ControlToValidate="txtTotAir"
                                ControlExtender="meTotAir"
                                EmptyValueMessage="Tidak boleh kosong! Min. diisi 0"
                                IsValidEmpty="false"
                                MinimumValue="0"
                                MinimumValueMessage="Min. 0 Jam"
                                ValidationGroup="TAB" />
                        </td>
                        <td align="right">Tot.Waktu Mix</td>
                        <td align="left" style="width:41px">
                            <asp:TextBox ID="txtTotWaktuMix" runat="server" Text="0.0" Width="40" 
                                style="text-align:right" />    
                        </td>
                        <td align="left">mnt
                            <AjaxToolkit:MaskedEditExtender ID="meTotWaktu" runat="server"
                                TargetControlID="txtTotWaktuMix"
                                MaskType="Number"
                                Mask="99.9"
                                InputDirection="RightToLeft" />
                            <AjaxToolkit:MaskedEditValidator ID="mevTotWaktu" runat="server"
                                ControlToValidate="txtTotWaktuMix"
                                ControlExtender="meTotWaktu"
                                EmptyValueMessage="Tidak boleh kosong! Min. diisi 0"
                                IsValidEmpty="false"
                                MinimumValue="0"
                                MinimumValueMessage="Min. 0 Jam"
                                ValidationGroup="TAB" />
                        </td>
                    </tr>
                    <tr valign="middle">
                        <td align="right">Alkohol :</td>
                        <td align="left">
                            <asp:TextBox ID="txtTotAlk" runat="server" Text="0.0" style="text-align:right" 
                                Width="40" />
                        </td>
                        <td align="left" colspan="4">L
                            <AjaxToolkit:MaskedEditExtender ID="meAlk" runat="server"
                                TargetControlID="txtTotAlk"
                                MaskType="Number"
                                Mask="99.99"
                                InputDirection="RightToLeft" />
                            <AjaxToolkit:MaskedEditValidator ID="mevAlk" runat="server"
                                ControlToValidate="txtTotAlk"
                                ControlExtender="meAlk"
                                EmptyValueMessage="Tidak boleh kosong! Min. diisi 0"
                                IsValidEmpty="false"
                                MinimumValue="0"
                                MinimumValueMessage="Min. 0 Jam"
                                ValidationGroup="TAB" />
                        </td>
                    </tr>
                </table>
                <div style="text-align:right; border-top: solid 1px #333333">
                    <div style="width:200px">
                        <div class="groupItemBar">
                            <div class="groupItemTitle">
                                <div style="padding-top:10px;margin:0 auto">
                                    Pengeringan FBD 
                                </div>   
                            </div>
                        </div>
                    </div>
                </div>
                <table border="0" width="100%">
                    <tr valign="middle">
                        <td align="right" style="width:80px">Lot 1 :</td>
                        <td align="left" style="width:41px">
                            <asp:TextBox ID="txtLot1" runat="server" Text="0.00" style="text-align:right" 
                                Width="50px" />
                        </td>
                        <td align="left">min
                            <AjaxToolkit:MaskedEditExtender ID="meLot1" runat="server"
                                TargetControlID="txtLot1"
                                MaskType="Number"
                                Mask="9999.99"
                                InputDirection="RightToLeft" />
                            <AjaxToolkit:MaskedEditValidator ID="mevLot1" runat="server"
                                ControlToValidate="txtLot1"
                                ControlExtender="meLot1"
                                EmptyValueMessage="Tidak boleh kosong! Min. diisi 0"
                                IsValidEmpty="false"
                                MinimumValue="0"
                                MinimumValueMessage="Min. 0"
                                ValidationGroup="TAB" />
                        </td>
                        <td align="right">mc Lot 1 :</td>
                        <td align="left" style="width:61px">
                            <asp:TextBox ID="txtMcLot1" runat="server" Text="0.00" style="text-align:right" Width="60px" />
                        </td>
                        <td align="left">%
                            <AjaxToolkit:MaskedEditExtender ID="meMcLot1" runat="server"
                                TargetControlID="txtMcLot1"
                                MaskType="Number"
                                Mask="99.99"
                                InputDirection="RightToLeft" />
                            <AjaxToolkit:MaskedEditValidator ID="mevMcLot1" runat="server"
                                ControlToValidate="txtMcLot1"
                                ControlExtender="meMcLot1"
                                EmptyValueMessage="Tidak boleh kosong! Min. diisi 0"
                                IsValidEmpty="false"
                                MinimumValue="0"
                                MinimumValueMessage="Min. 0"
                                ValidationGroup="TAB" />
                        </td>
                    </tr>
                    <tr valign="middle">
                        <td align="right">Lot 2 :</td>
                        <td align="left">
                            <asp:TextBox ID="txtLot2" runat="server" Text="0.00" style="text-align:right" 
                                Width="50px" />
                        </td>
                        <td align="left">min
                            <AjaxToolkit:MaskedEditExtender ID="meLot2" runat="server"
                                TargetControlID="txtLot2"
                                MaskType="Number"
                                Mask="9999.99"
                                InputDirection="RightToLeft" />
                            <AjaxToolkit:MaskedEditValidator ID="mevLot2" runat="server"
                                ControlToValidate="txtLot2"
                                ControlExtender="meLot2"
                                EmptyValueMessage="Tidak boleh kosong! Min. diisi 0"
                                IsValidEmpty="false"
                                MinimumValue="0"
                                MinimumValueMessage="Min. 0"
                                ValidationGroup="TAB" />
                        </td>
                        <td align="right">mc Lot 2 :</td>
                        <td align="left">
                            <asp:TextBox ID="txtMcLot2" runat="server" Text="0.00" style="text-align:right" Width="60px" />
                        </td>
                        <td align="left">%
                            <AjaxToolkit:MaskedEditExtender ID="meMcLot2" runat="server"
                                TargetControlID="txtMcLot2"
                                MaskType="Number"
                                Mask="99.99"
                                InputDirection="RightToLeft" />
                            <AjaxToolkit:MaskedEditValidator ID="mevMcLot2" runat="server"
                                ControlToValidate="txtMcLot2"
                                ControlExtender="meMcLot2"
                                EmptyValueMessage="Tidak boleh kosong! Min. diisi 0"
                                IsValidEmpty="false"
                                MinimumValue="0"
                                MinimumValueMessage="Min. 0"
                                ValidationGroup="TAB" />
                        </td>
                    </tr>
                    <tr valign="middle">
                        <td align="right">Lot 3 :</td>
                        <td align="left">
                            <asp:TextBox ID="txtLot3" runat="server" Text="0.00" style="text-align:right" 
                                Width="50px" />
                        </td>
                        <td align="left">min
                            <AjaxToolkit:MaskedEditExtender ID="meLot3" runat="server"
                                TargetControlID="txtLot3"
                                MaskType="Number"
                                Mask="9999.99"
                                InputDirection="RightToLeft" />
                            <AjaxToolkit:MaskedEditValidator ID="mevLot3" runat="server"
                                ControlToValidate="txtLot3"
                                ControlExtender="meLot3"
                                EmptyValueMessage="Tidak boleh kosong! Min. diisi 0"
                                IsValidEmpty="false"
                                MinimumValue="0"
                                MinimumValueMessage="Min. 0"
                                ValidationGroup="TAB" />
                        </td>
                        <td align="right">mc Lot 3 :</td>
                        <td align="left">
                            <asp:TextBox ID="txtMcLot3" runat="server" Text="0.00" style="text-align:right" Width="60px" />
                        </td>
                        <td align="left">%
                            <AjaxToolkit:MaskedEditExtender ID="meMcLot3" runat="server"
                                TargetControlID="txtMcLot3"
                                MaskType="Number"
                                Mask="99.99"
                                InputDirection="RightToLeft" />
                            <AjaxToolkit:MaskedEditValidator ID="mevMcLot3" runat="server"
                                ControlToValidate="txtMcLot3"
                                ControlExtender="meMcLot3"
                                EmptyValueMessage="Tidak boleh kosong! Min. diisi 0"
                                IsValidEmpty="false"
                                MinimumValue="0"
                                MinimumValueMessage="Min. 0"
                                ValidationGroup="TAB" />
                        </td>
                    </tr>
                    <tr valign="middle">
                        <td align="right">Lot 4 :</td>
                        <td align="left">
                            <asp:TextBox ID="txtLot4" runat="server" Text="0.00" style="text-align:right" 
                                Width="50px" />
                        </td>
                        <td align="left">min
                            <AjaxToolkit:MaskedEditExtender ID="meLot4" runat="server"
                                TargetControlID="txtLot4"
                                MaskType="Number"
                                Mask="9999.99"
                                InputDirection="RightToLeft" />
                            <AjaxToolkit:MaskedEditValidator ID="mevLot4" runat="server"
                                ControlToValidate="txtLot4"
                                ControlExtender="meLot4"
                                EmptyValueMessage="Tidak boleh kosong! Min. diisi 0"
                                IsValidEmpty="false"
                                MinimumValue="0"
                                MinimumValueMessage="Min. 0"
                                ValidationGroup="TAB" />
                        </td>
                        <td align="right">mc Lot 4 :</td>
                        <td align="left">
                            <asp:TextBox ID="txtMcLot4" runat="server" Text="0.00" style="text-align:right" Width="60px" />
                        </td>
                        <td align="left">%
                            <AjaxToolkit:MaskedEditExtender ID="meMcLot4" runat="server"
                                TargetControlID="txtMcLot4"
                                MaskType="Number"
                                Mask="99.99"
                                InputDirection="RightToLeft" />
                            <AjaxToolkit:MaskedEditValidator ID="mevMcLot4" runat="server"
                                ControlToValidate="txtMcLot4"
                                ControlExtender="meMcLot4"
                                EmptyValueMessage="Tidak boleh kosong! Min. diisi 0"
                                IsValidEmpty="false"
                                MinimumValue="0"
                                MinimumValueMessage="Min. 0"
                                ValidationGroup="TAB" />
                        </td>
                    </tr>
                    <tr valign="middle">
                        <td align="right">Lot 5 :</td>
                        <td align="left">
                            <asp:TextBox ID="txtLot5" runat="server" Text="0.00" style="text-align:right" 
                                Width="50px" />
                        </td>
                        <td align="left">min
                            <AjaxToolkit:MaskedEditExtender ID="meLot5" runat="server"
                                TargetControlID="txtLot5"
                                MaskType="Number"
                                Mask="9999.99"
                                InputDirection="RightToLeft" />
                            <AjaxToolkit:MaskedEditValidator ID="mevLot5" runat="server"
                                ControlToValidate="txtLot5"
                                ControlExtender="meLot5"
                                EmptyValueMessage="Tidak boleh kosong! Min. diisi 0"
                                IsValidEmpty="false"
                                MinimumValue="0"
                                MinimumValueMessage="Min. 0"
                                ValidationGroup="TAB" />
                        </td>
                        <td align="right">mc Lot 5 :</td>
                        <td align="left">
                            <asp:TextBox ID="txtMcLot5" runat="server" Text="0.00" style="text-align:right" Width="60px" />
                        </td>
                        <td align="left">%
                            <AjaxToolkit:MaskedEditExtender ID="meMcLot5" runat="server"
                                TargetControlID="txtMcLot5"
                                MaskType="Number"
                                Mask="99.99"
                                InputDirection="RightToLeft" />
                            <AjaxToolkit:MaskedEditValidator ID="mevMcLot5" runat="server"
                                ControlToValidate="txtMcLot5"
                                ControlExtender="meMcLot5"
                                EmptyValueMessage="Tidak boleh kosong! Min. diisi 0"
                                IsValidEmpty="false"
                                MinimumValue="0"
                                MinimumValueMessage="Min. 0"
                                ValidationGroup="TAB" />
                        </td>
                    </tr>
                </table>
                <div style="text-align:right; border-top: solid 1px #333333">
                    <div style="width:200px">
                        <div class="groupItemBar">
                            <div class="groupItemTitle">
                                <div style="padding-top:10px;margin:0 auto">
                                    Coating 
                                </div>   
                            </div>
                        </div>
                    </div>
                </div>
                <table border="0" width="100%">
                    <tr valign="middle">
                        <td align="right" style="width:80px">Lot 1 :</td>
                        <td align="left" style="width:41px">
                            <asp:TextBox ID="txtCoatLot1" runat="server" Text="0.00" style="text-align:right" Width="40" />
                        </td>
                        <td align="left">jam
                            <AjaxToolkit:MaskedEditExtender ID="meCoatLot1" runat="server"
                                TargetControlID="txtCoatLot1"
                                MaskType="Number"
                                Mask="99.99"
                                InputDirection="RightToLeft" />
                            <AjaxToolkit:MaskedEditValidator ID="mevCoatLot1" runat="server"
                                ControlToValidate="txtCoatLot1"
                                ControlExtender="meCoatLot1"
                                EmptyValueMessage="Tidak boleh kosong! Min. diisi 0"
                                IsValidEmpty="false"
                                MinimumValue="0"
                                MinimumValueMessage="Min. 0"
                                ValidationGroup="TAB" />
                        </td>
                        <td align="right">Lot 2 :</td>
                        <td align="left" width="41">
                            <asp:TextBox ID="txtCoatLot2" runat="server" Text="0.00" style="text-align:right" Width="40" />
                        </td>
                        <td align="left">jam
                            <AjaxToolkit:MaskedEditExtender ID="meCoatLot2" runat="server"
                                TargetControlID="txtCoatLot2"
                                MaskType="Number"
                                Mask="99.99"
                                InputDirection="RightToLeft" />
                            <AjaxToolkit:MaskedEditValidator ID="mevCoatLoat2" runat="server"
                                ControlToValidate="txtCoatLot2"
                                ControlExtender="meCoatLot2"
                                EmptyValueMessage="Tidak boleh kosong! Min. diisi 0"
                                IsValidEmpty="false"
                                MinimumValue="0"
                                MinimumValueMessage="Min. 0"
                                ValidationGroup="TAB" />
                        </td>
                    </tr>
                    <tr valign="middle">
                        <td align="right">Lot 3 :</td>
                        <td align="left">
                            <asp:TextBox ID="txtCoatLot3" runat="server" Text="0.00" style="text-align:right" Width="40" />
                        </td>
                        <td align="left">jam
                            <AjaxToolkit:MaskedEditExtender ID="meCoatLot3" runat="server"
                                TargetControlID="txtCoatLot3"
                                MaskType="Number"
                                Mask="99.99"
                                InputDirection="RightToLeft" />
                            <AjaxToolkit:MaskedEditValidator ID="mevCoatLot3" runat="server"
                                ControlToValidate="txtCoatLot3"
                                ControlExtender="meCoatLot3"
                                EmptyValueMessage="Tidak boleh kosong! Min. diisi 0"
                                IsValidEmpty="false"
                                MinimumValue="0"
                                MinimumValueMessage="Min. 0"
                                ValidationGroup="TAB" />
                        </td>
                        <td align="right">Lot 4 :</td>
                        <td align="left">
                            <asp:TextBox ID="txtCoatLot4" runat="server" Text="0.00" style="text-align:right" Width="40" />
                        </td>
                        <td align="left">jam
                            <AjaxToolkit:MaskedEditExtender ID="meCoatLot4" runat="server"
                                TargetControlID="txtCoatLot4"
                                MaskType="Number"
                                Mask="99.99"
                                InputDirection="RightToLeft" />
                            <AjaxToolkit:MaskedEditValidator ID="mevCoatLot4" runat="server"
                                ControlToValidate="txtCoatLot4"
                                ControlExtender="meCoatLot4"
                                EmptyValueMessage="Tidak boleh kosong! Min. diisi 0"
                                IsValidEmpty="false"
                                MinimumValue="0"
                                MinimumValueMessage="Min. 0"
                                ValidationGroup="TAB" />
                        </td>
                    </tr>
                </table>
                <div style="text-align:right; border-top: solid 1px #333333">
                    <div style="width:200px">
                        <div class="groupItemBar">
                            <div class="groupItemTitle">
                                <div style="padding-top:10px;margin:0 auto">
                                    Cetak & PGA 
                                </div>   
                            </div>
                        </div>
                    </div>
                </div>
                <table border="0" width="100%">
                    <tr valign="middle">
                        <td align="right" width="100">Waktu Cetak :</td>
                        <td align="left" style="width:61px">
                            <asp:TextBox ID="txtWaktuCetak" runat="server" Text="0.00" style="text-align:right" Width="60" />
                        </td>
                        <td align="left">Jam
                            <AjaxToolkit:MaskedEditExtender ID="meWaktuCetak" runat="server"
                                TargetControlID="txtWaktuCetak"
                                MaskType="Number"
                                Mask="99.99"
                                InputDirection="RightToLeft" />
                            <AjaxToolkit:MaskedEditValidator ID="mevWaktuCetak" runat="server"
                                ControlToValidate="txtWaktuCetak"
                                ControlExtender="meWaktuCetak"
                                EmptyValueMessage="Harus diisi"
                                SetFocusOnError="true"
                                ValidationGroup="TAB" />
                        </td>
                    </tr>
                    <tr valign="middle">
                        <td align="right" width="100">PGA :</td>
                        <td align="left" style="width:61px">
                            <asp:TextBox ID="txtPGA" runat="server" Text="0.00" style="text-align:right" Width="60" />
                        </td>
                        <td align="left">Jam
                            <AjaxToolkit:MaskedEditExtender ID="mePGA" runat="server"
                                TargetControlID="txtPGA"
                                MaskType="Number"
                                Mask="99.99"
                                InputDirection="RightToLeft" />
                            <AjaxToolkit:MaskedEditValidator ID="mevPGA" runat="server"
                                ControlToValidate="txtPGA"
                                ControlExtender="mePGA"
                                EmptyValueMessage="Harus diisi"
                                SetFocusOnError="true"
                                ValidationGroup="TAB" />
                        </td>
                    </tr>
                </table>
             </div>   
            <div style="width:575px; text-align:right">
                <asp:LinkButton ID="btnSaveTAB" CssClass="LinkButton" runat="server" ValidationGroup="TAB" Text="Save" OnClientClick="return isEmptyBatch()" />
            </div>  
        </asp:Panel>
        <asp:Panel ID="pnlMOT" style="margin-top:10px;" runat="server">
            <div class="groupTitle" style="width:100px">
                <div style="text-align:center; background-color:Navy">
                    MOT  
                </div>
            </div>
            <div class="groupContent">
                <div style="text-align:right">
                    <div style="width:200px">
                        <div class="groupItemBar">
                            <div class="groupItemTitle">
                                <div style="padding-top:10px;margin:0 auto">
                                    Aqua Pro Injeksi 
                                </div>   
                            </div>
                        </div>
                    </div>
                </div>
                <table border="0" width="100%">
                    <tr valign="middle">
                        <td align="right" style="width:80px">Filing :</td>
                        <td align="left" style="width:41px">
                            <asp:TextBox ID="txtMotFilling" runat="server" Text="0.00" style="text-align:right" Width="40" />
                        </td>
                        <td align="left">Jam
                            <AjaxToolkit:MaskedEditExtender ID="meMotFilling" runat="server"
                                TargetControlID="txtMotFilling"
                                MaskType="Number"
                                Mask="99.99"
                                InputDirection="RightToLeft" />
                            <AjaxToolkit:MaskedEditValidator ID="mevMotFilling" runat="server"
                                ControlToValidate="txtMotFilling"
                                ControlExtender="meMotFilling"
                                EmptyValueMessage="*"
                                IsValidEmpty="false"
                                MinimumValue="0"
                                MinimumValueMessage="*"
                                ValidationGroup="MOT" />
                        </td>
                        <td align="right">BS Clarity :</td>
                        <td align="left" style="width:41px">
                            <asp:TextBox ID="txtMotClarity" runat="server" Text="0" style="text-align:right" Width="50" />
                        </td>
                        <td align="left">amp
                            <AjaxToolkit:MaskedEditExtender ID="meMotClarity" runat="server"
                                TargetControlID="txtMotClarity"
                                MaskType="Number"
                                Mask="9999"
                                InputDirection="RightToLeft" />
                            <AjaxToolkit:MaskedEditValidator ID="mevMotClarity" runat="server"
                                ControlToValidate="txtMotClarity"
                                ControlExtender="meMotClarity"
                                EmptyValueMessage="*"
                                IsValidEmpty="false"
                                MinimumValue="0"
                                MinimumValueMessage="*"
                                ValidationGroup="MOT" />
                        </td>
                    </tr>
                    <tr valign="middle">
                        <td align="right">BS Cuci :</td>
                        <td align="left">
                            <asp:TextBox ID="txtMotBSCuci" runat="server" Text="0" Width="40" style="text-align:right" />
                        </td>
                        <td align="left">amp
                            <AjaxToolkit:MaskedEditExtender ID="meMotBSCuci" runat="server"
                                TargetControlID="txtMotBSCuci"
                                MaskType="Number"
                                Mask="999"
                                InputDirection="RightToLeft" />
                            <AjaxToolkit:MaskedEditValidator ID="mevMotBSCuci" runat="server"
                                ControlToValidate="txtMotBSCuci"
                                ControlExtender="meMotBSCuci"
                                EmptyValueMessage="*"
                                IsValidEmpty="false"
                                MinimumValue="0"
                                MinimumValueMessage="*"
                                ValidationGroup="MOT" />
                        </td>
                        <td align="right">Hasil Baik :</td>
                        <td align="left">
                            <asp:TextBox ID="txtMotHasilBaik" runat="server" Text="0" style="text-align:right" Width="50" />
                        </td>
                        <td align="left">amp
                            <AjaxToolkit:MaskedEditExtender ID="meMotHasilBaik" runat="server"
                                TargetControlID="txtMotHasilBaik"
                                MaskType="Number"
                                Mask="99999"
                                InputDirection="RightToLeft" />
                            <AjaxToolkit:MaskedEditValidator ID="mevMotHasilBaik" runat="server"
                                ControlToValidate="txtMotHasilBaik"
                                ControlExtender="meMotHasilBaik"
                                EmptyValueMessage="*"
                                IsValidEmpty="false"
                                MinimumValue="0"
                                MinimumValueMessage="*"
                                ValidationGroup="MOT" />
                        </td>
                    </tr>
                    <tr valign="middle">
                        <td align="right">BS Filling :</td>
                        <td align="left">
                            <asp:TextBox ID="txtMotBSFill" runat="server"  Text="0" style="text-align:right" Width="40" />
                        </td>
                        <td align="left">amp
                            <AjaxToolkit:MaskedEditExtender ID="meMotBSFill" runat="server"
                                TargetControlID="txtMotBSFill"
                                MaskType="Number"
                                Mask="999"
                                InputDirection="RightToLeft" />
                            <AjaxToolkit:MaskedEditValidator ID="mevMotBSFill" runat="server"
                                ControlToValidate="txtMotBSFill"
                                ControlExtender="meMotBSFill"
                                EmptyValueMessage="*"
                                IsValidEmpty="false"
                                MinimumValue="0"
                                MinimumValueMessage="*"
                                ValidationGroup="MOT" />
                        </td>
                    </tr>
                </table>
                <div style="text-align:right; border-top: solid 1px #333333">
                    <div style="width:200px">
                        <div class="groupItemBar">
                            <div class="groupItemTitle">
                                <div style="padding-top:10px;margin:0 auto">
                                    Ice Pack 
                                </div>   
                            </div>
                        </div>
                    </div>
                </div>
                <table border="0" width="100%">
                    <tr valign="middle">
                        <td align="right" style="width:80px">CMC :</td>
                        <td align="left" style="width:60px">
                            <asp:TextBox ID="txtMotCMC" runat="server" Width="60" Text="0" style="text-align:right" />
                        </td>
                        <td align="left">Cps
                            <AjaxToolkit:MaskedEditExtender ID="meMotCMC" runat="server"
                                TargetControlID="txtMotCMC"
                                MaskType="Number"
                                Mask="999999"
                                InputDirection="RightToLeft" />
                            <AjaxToolkit:MaskedEditValidator ID="mevMotCMC" runat="server"
                                ControlToValidate="txtMotCMC"
                                ControlExtender="meMotCMC"
                                EmptyValueMessage="Min. diisi 0"
                                IsValidEmpty="false"
                                MinimumValue="0"
                                MinimumValueMessage="Min. 0 Jam"
                                ValidationGroup="MOT" />
                        </td>
                        <td align="right">Mixing :</td>
                        <td align="left" style="width:60px">
                            <asp:TextBox ID="txtMotMix" runat="server" Text="0.00" style="text-align:right" Width="60" />
                        </td>
                        <td align="left">Jam
                            <AjaxToolkit:MaskedEditExtender ID="meMotMix" runat="server"
                                TargetControlID="txtMotMix"
                                MaskType="Number"
                                Mask="99.99"
                                InputDirection="RightToLeft" />
                            <AjaxToolkit:MaskedEditValidator ID="mevMotMix" runat="server"
                                ControlToValidate="txtMotMix"
                                ControlExtender="meMotMix"
                                EmptyValueMessage="Min. diisi 0"
                                IsValidEmpty="false"
                                MinimumValue="0"
                                MinimumValueMessage="Min. 0 Jam"
                                ValidationGroup="MOT" />
                        </td>
                    </tr>
                    <tr valign="middle">
                        <td align="right">Avicel :</td>
                        <td align="left">
                            <asp:TextBox ID="txtMotAvicel" runat="server" Width="60" Text="0" style="text-align:right" />
                        </td>
                        <td align="left">Cps
                            <AjaxToolkit:MaskedEditExtender ID="meMotAvicel" runat="server"
                                TargetControlID="txtMotAvicel"
                                MaskType="Number"
                                Mask="999999"
                                InputDirection="RightToLeft" />
                            <AjaxToolkit:MaskedEditValidator ID="mevMotAvicel" runat="server"
                                ControlToValidate="txtMotAvicel"
                                ControlExtender="meMotAvicel"
                                EmptyValueMessage="Min. diisi 0"
                                IsValidEmpty="false"
                                MinimumValue="0"
                                MinimumValueMessage="Min. 0 Jam"
                                ValidationGroup="MOT" />
                        </td>
                        <td align="right">Filing :</td>
                        <td align="left">
                            <asp:TextBox ID="txtMotFill2" runat="server" Text="0.00" style="text-align:right" Width="60" />
                        </td>
                        <td align="left">Jam
                            <AjaxToolkit:MaskedEditExtender ID="meMotFill2" runat="server"
                                TargetControlID="txtMotFill2"
                                MaskType="Number"
                                Mask="99.99"
                                InputDirection="RightToLeft" />
                            <AjaxToolkit:MaskedEditValidator ID="mevMotFill2" runat="server"
                                ControlToValidate="txtMotFill2"
                                ControlExtender="meMotFill2"
                                EmptyValueMessage="Min. diisi 0"
                                IsValidEmpty="false"
                                MinimumValue="0"
                                MinimumValueMessage="Min. 0 Jam"
                                ValidationGroup="MOT" />
                        </td>
                    </tr>
                    <tr valign="middle">
                    <td align="right">Xanthan :</td>
                        <td align="left">
                            <asp:TextBox ID="txtMotXanthan" runat="server" Width="60" Text="0" style="text-align:right" />
                        </td>
                        <td align="left" style="width:80px">Cps
                            <AjaxToolkit:MaskedEditExtender ID="meMotXanthan" runat="server"
                                TargetControlID="txtMotXanthan"
                                MaskType="Number"
                                Mask="999999"
                                InputDirection="RightToLeft" />
                            <AjaxToolkit:MaskedEditValidator ID="mevMotXanthan" runat="server"
                                ControlToValidate="txtMotXanthan"
                                ControlExtender="meMotXanthan"
                                EmptyValueMessage="Min. diisi 0"
                                IsValidEmpty="false"
                                MinimumValue="0"
                                MinimumValueMessage="Min. 0 Jam"
                                ValidationGroup="MOT" />
                        </td>
                    </tr>
                </table>
             </div>   
            <div style="width:575px; text-align:right">
               <asp:LinkButton ID="btnSaveMOT" CssClass="LinkButton" runat="server" ValidationGroup="MOT" Text="Save" OnClientClick="return isEmptyBatch()" />
            </div>  
        </asp:Panel>
        <asp:Panel ID="PnlG" style="margin-top:10px;" runat="server">
            <div class="groupTitle" style="width:100px">
                <div style="text-align:center; background-color:Navy">
                    Granul    
                </div>
            </div>
            <div class="groupContent">
                <div style="text-align:right">
                    <div style="width:200px">
                        <div class="groupItemBar">
                            <div class="groupItemTitle">
                                <div style="padding-top:10px;margin:0 auto">
                                    Granulasi bsh di Diosna 
                                </div>   
                            </div>
                        </div>
                    </div>
                </div>
                <table border="0" width="100%">
                    <tr valign="middle">
                        <td align="right" style="width:80px" >Total Air :</td>
                        <td align="left" style="width:41px">
                            <asp:TextBox ID="txtGTotAir" runat="server" Text="0" Width="40" style="text-align:right" />
                        </td>
                        <td align="left">L
                            <AjaxToolkit:MaskedEditExtender ID="meGTotAir" runat="server"
                                TargetControlID="txtGTotAir"
                                MaskType="Number"
                                Mask="999"
                                InputDirection="RightToLeft" />
                            <AjaxToolkit:MaskedEditValidator ID="mevGTotAir" runat="server"
                                ControlToValidate="txtGTotAir"
                                ControlExtender="meGTotAir"
                                EmptyValueMessage="Tidak boleh kosong! Min. diisi 0"
                                IsValidEmpty="false"
                                MinimumValue="0"
                                MinimumValueMessage="Min. 0 Jam"
                                ValidationGroup="G" />
                        </td>
                        <td align="right">Tot.Waktu Mix</td>
                        <td align="left" style="width:41px">
                            <asp:TextBox ID="txtGTotWaktuMix" runat="server" Text="0.0" Width="40" 
                                style="text-align:right" />    
                        </td>
                        <td align="left">mnt
                            <AjaxToolkit:MaskedEditExtender ID="meGTotWaktuMix" runat="server"
                                TargetControlID="txtGTotWaktuMix"
                                MaskType="Number"
                                Mask="99.9"
                                InputDirection="RightToLeft" />
                            <AjaxToolkit:MaskedEditValidator ID="mevGTotWaktuMix" runat="server"
                                ControlToValidate="txtGTotWaktuMix"
                                ControlExtender="meGTotWaktuMix"
                                EmptyValueMessage="Tidak boleh kosong! Min. diisi 0"
                                IsValidEmpty="false"
                                MinimumValue="0"
                                MinimumValueMessage="Min. 0 Jam"
                                ValidationGroup="G" />
                        </td>
                    </tr>
                    <tr valign="middle">
                        <td align="right">Alkohol :</td>
                        <td align="left">
                            <asp:TextBox ID="txtGTotAlk" runat="server" Text="0.0" style="text-align:right" 
                                Width="40" />
                        </td>
                        <td align="left" colspan="4">L
                            <AjaxToolkit:MaskedEditExtender ID="meGTotAlk" runat="server"
                                TargetControlID="txtGTotAlk"
                                MaskType="Number"
                                Mask="99.9"
                                InputDirection="RightToLeft" />
                            <AjaxToolkit:MaskedEditValidator ID="mevGTotAlk" runat="server"
                                ControlToValidate="txtGTotAlk"
                                ControlExtender="meGTotAlk"
                                EmptyValueMessage="Tidak boleh kosong! Min. diisi 0"
                                IsValidEmpty="false"
                                MinimumValue="0"
                                MinimumValueMessage="Min. 0 Jam"
                                ValidationGroup="G" />
                        </td>
                    </tr>
                </table>
                <div style="text-align:right; border-top: solid 1px #333333">
                    <div style="width:200px">
                        <div class="groupItemBar">
                            <div class="groupItemTitle">
                                <div style="padding-top:10px;margin:0 auto">
                                    Pengeringan FBD 
                                </div>   
                            </div>
                        </div>
                    </div>
                </div>
                <table border="0" width="100%">
                    <tr valign="middle">
                        <td align="right" style="width:80px">Lot 1 :</td>
                        <td align="left" style="width:41px">
                            <asp:TextBox ID="txtGLot1" runat="server" Text="0.00" style="text-align:right" Width="40" />
                        </td>
                        <td align="left">min
                            <AjaxToolkit:MaskedEditExtender ID="meGLot1" runat="server"
                                TargetControlID="txtGLot1"
                                MaskType="Number"
                                Mask="9999.99"
                                InputDirection="RightToLeft" />
                            <AjaxToolkit:MaskedEditValidator ID="mevGLot1" runat="server"
                                ControlToValidate="txtGLot1"
                                ControlExtender="meGLot1"
                                EmptyValueMessage="Tidak boleh kosong! Min. diisi 0"
                                IsValidEmpty="false"
                                MinimumValue="0"
                                MinimumValueMessage="Min. 0"
                                ValidationGroup="G" />
                        </td>
                        <td align="right">mc Lot 1 :</td>
                        <td align="left" style="width:61px">
                            <asp:TextBox ID="txtGMcLot1" runat="server" Text="0.00" style="text-align:right" Width="60px" />
                        </td>
                        <td align="left">%
                            <AjaxToolkit:MaskedEditExtender ID="meGMcLot1" runat="server"
                                TargetControlID="txtGMcLot1"
                                MaskType="Number"
                                Mask="99.99"
                                InputDirection="RightToLeft" />
                            <AjaxToolkit:MaskedEditValidator ID="mevGMcLot1" runat="server"
                                ControlToValidate="txtGMcLot1"
                                ControlExtender="meGMcLot1"
                                EmptyValueMessage="Tidak boleh kosong! Min. diisi 0"
                                IsValidEmpty="false"
                                MinimumValue="0"
                                MinimumValueMessage="Min. 0"
                                ValidationGroup="G" />
                        </td>
                    </tr>
                    <tr valign="middle">
                        <td align="right">Lot 2 :</td>
                        <td align="left">
                            <asp:TextBox ID="txtGLot2" runat="server" Text="0.00" style="text-align:right" Width="40" />
                        </td>
                        <td align="left">min
                            <AjaxToolkit:MaskedEditExtender ID="meGLot2" runat="server"
                                TargetControlID="txtGLot2"
                                MaskType="Number"
                                Mask="9999.99"
                                InputDirection="RightToLeft" />
                            <AjaxToolkit:MaskedEditValidator ID="mevGLot2" runat="server"
                                ControlToValidate="txtGLot2"
                                ControlExtender="meGLot2"
                                EmptyValueMessage="Tidak boleh kosong! Min. diisi 0"
                                IsValidEmpty="false"
                                MinimumValue="0"
                                MinimumValueMessage="Min. 0"
                                ValidationGroup="G" />
                        </td>
                        <td align="right">mc Lot 2 :</td>
                        <td align="left">
                            <asp:TextBox ID="txtGMcLot2" runat="server" Text="0.00" style="text-align:right" Width="60px" />
                        </td>
                        <td align="left">%
                            <AjaxToolkit:MaskedEditExtender ID="meGMcLot2" runat="server"
                                TargetControlID="txtGMcLot2"
                                MaskType="Number"
                                Mask="99.99"
                                InputDirection="RightToLeft" />
                            <AjaxToolkit:MaskedEditValidator ID="mevGMcLot2" runat="server"
                                ControlToValidate="txtGMcLot2"
                                ControlExtender="meGMcLot2"
                                EmptyValueMessage="Tidak boleh kosong! Min. diisi 0"
                                IsValidEmpty="false"
                                MinimumValue="0"
                                MinimumValueMessage="Min. 0"
                                ValidationGroup="G" />
                        </td>
                    </tr>
                    <tr valign="middle">
                        <td align="right">Lot 3 :</td>
                        <td align="left">
                            <asp:TextBox ID="txtGLot3" runat="server" Text="0.00" style="text-align:right" Width="40" />
                        </td>
                        <td align="left">min
                            <AjaxToolkit:MaskedEditExtender ID="meGLot3" runat="server"
                                TargetControlID="txtGLot3"
                                MaskType="Number"
                                Mask="9999.99"
                                InputDirection="RightToLeft" />
                            <AjaxToolkit:MaskedEditValidator ID="mevGLot3" runat="server"
                                ControlToValidate="txtGLot3"
                                ControlExtender="meGLot3"
                                EmptyValueMessage="Tidak boleh kosong! Min. diisi 0"
                                IsValidEmpty="false"
                                MinimumValue="0"
                                MinimumValueMessage="Min. 0"
                                ValidationGroup="G" />
                        </td>
                        <td align="right">mc Lot 3 :</td>
                        <td align="left">
                            <asp:TextBox ID="txtGMcLot3" runat="server" Text="0.00" style="text-align:right" Width="60px" />
                        </td>
                        <td align="left">%
                            <AjaxToolkit:MaskedEditExtender ID="meGMcLot3" runat="server"
                                TargetControlID="txtGMcLot3"
                                MaskType="Number"
                                Mask="99.99"
                                InputDirection="RightToLeft" />
                            <AjaxToolkit:MaskedEditValidator ID="mevGMcLot3" runat="server"
                                ControlToValidate="txtGMcLot3"
                                ControlExtender="meGMcLot3"
                                EmptyValueMessage="Tidak boleh kosong! Min. diisi 0"
                                IsValidEmpty="false"
                                MinimumValue="0"
                                MinimumValueMessage="Min. 0"
                                ValidationGroup="G" />
                        </td>
                    </tr>
                    <tr valign="middle">
                        <td align="right">Lot 4 :</td>
                        <td align="left">
                            <asp:TextBox ID="txtGLot4" runat="server" Text="0.00" style="text-align:right" Width="40" />
                        </td>
                        <td align="left">min
                            <AjaxToolkit:MaskedEditExtender ID="meGLot4" runat="server"
                                TargetControlID="txtGLot4"
                                MaskType="Number"
                                Mask="9999.99"
                                InputDirection="RightToLeft" />
                            <AjaxToolkit:MaskedEditValidator ID="mevGLot4" runat="server"
                                ControlToValidate="txtGLot4"
                                ControlExtender="meGLot4"
                                EmptyValueMessage="Tidak boleh kosong! Min. diisi 0"
                                IsValidEmpty="false"
                                MinimumValue="0"
                                MinimumValueMessage="Min. 0"
                                ValidationGroup="G" />
                        </td>
                        <td align="right">mc Lot 4 :</td>
                        <td align="left">
                            <asp:TextBox ID="txtGMcLot4" runat="server" Text="0.00" style="text-align:right" Width="60px" />
                        </td>
                        <td align="left">%
                            <AjaxToolkit:MaskedEditExtender ID="meGMcLot4" runat="server"
                                TargetControlID="txtGMcLot4"
                                MaskType="Number"
                                Mask="99.99"
                                InputDirection="RightToLeft" />
                            <AjaxToolkit:MaskedEditValidator ID="mevGMcLot4" runat="server"
                                ControlToValidate="txtGMcLot4"
                                ControlExtender="meGMcLot4"
                                EmptyValueMessage="Tidak boleh kosong! Min. diisi 0"
                                IsValidEmpty="false"
                                MinimumValue="0"
                                MinimumValueMessage="Min. 0"
                                ValidationGroup="G" />
                        </td>
                    </tr>
                    <tr valign="middle">
                        <td align="right">Lot 5 :</td>
                        <td align="left">
                            <asp:TextBox ID="txtGLot5" runat="server" Text="0.00" style="text-align:right" Width="40" />
                        </td>
                        <td align="left">min
                            <AjaxToolkit:MaskedEditExtender ID="meGLot5" runat="server"
                                TargetControlID="txtGLot5"
                                MaskType="Number"
                                Mask="9999.99"
                                InputDirection="RightToLeft" />
                            <AjaxToolkit:MaskedEditValidator ID="mevGLot5" runat="server"
                                ControlToValidate="txtGLot5"
                                ControlExtender="meGLot5"
                                EmptyValueMessage="Tidak boleh kosong! Min. diisi 0"
                                IsValidEmpty="false"
                                MinimumValue="0"
                                MinimumValueMessage="Min. 0"
                                ValidationGroup="G" />
                        </td>
                        <td align="right">mc Lot 5 :</td>
                        <td align="left">
                            <asp:TextBox ID="txtGMcLot5" runat="server" Text="0.00" style="text-align:right" Width="60px" />
                        </td>
                        <td align="left">%
                            <AjaxToolkit:MaskedEditExtender ID="meGMcLot5" runat="server"
                                TargetControlID="txtGMcLot5"
                                MaskType="Number"
                                Mask="99.99"
                                InputDirection="RightToLeft" />
                            <AjaxToolkit:MaskedEditValidator ID="mevGMcLot5" runat="server"
                                ControlToValidate="txtGMcLot5"
                                ControlExtender="meGMcLot5"
                                EmptyValueMessage="Tidak boleh kosong! Min. diisi 0"
                                IsValidEmpty="false"
                                MinimumValue="0"
                                MinimumValueMessage="Min. 0"
                                ValidationGroup="G" />
                        </td>
                    </tr>
                </table>
             </div>   
            <div style="width:575px; text-align:right">
                <asp:LinkButton ID="btnSaveG" CssClass="LinkButton" runat="server" ValidationGroup="G" Text="Save" OnClientClick="return isEmptyBatch()" />
            </div>  
        </asp:Panel>
    </div>
</asp:Content>

