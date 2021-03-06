﻿
Partial Class Produksi_DataMaster_ProductReview_Prod
    Inherits System.Web.UI.Page
    Private oProdReview As New ProductReview
    Protected PostBackStr As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        PostBackStr = Page.ClientScript.GetPostBackEventReference(Me, "PostBackFromClient")

        If Not IsPostBack Then
            If Request.QueryString("ProdID") IsNot Nothing Then
                txtProdID.Text = Request.QueryString("ProdID")
                lblProdName.Text = oProdReview.GetItemNameByCode(txtProdID.Text)
                txtNoBatch.Focus()
                Select Case Mid(txtProdID.Text, 1, 3).ToUpper
                    Case "OIL"
                        pnlOIL.Visible = True
                        pnlINA.Visible = False
                        pnlSYK.Visible = False
                        pnlSYR.Visible = False
                        pnlTAB.Visible = False
                        pnlINV.Visible = False
                        pnlMOT.Visible = False
                        PnlG.Visible = False
                    Case "SYR"
                        pnlOIL.Visible = False
                        pnlINA.Visible = False
                        pnlSYK.Visible = False
                        pnlSYR.Visible = True
                        pnlTAB.Visible = False
                        pnlINV.Visible = False
                        pnlMOT.Visible = False
                        PnlG.Visible = False
                    Case "INA"
                        pnlOIL.Visible = False
                        pnlINA.Visible = True
                        pnlSYK.Visible = False
                        pnlSYR.Visible = False
                        pnlTAB.Visible = False
                        pnlINV.Visible = False
                        pnlMOT.Visible = False
                        PnlG.Visible = False
                    Case "INV"
                        pnlOIL.Visible = False
                        pnlINA.Visible = False
                        pnlSYK.Visible = False
                        pnlSYR.Visible = False
                        pnlTAB.Visible = False
                        pnlINV.Visible = True
                        pnlMOT.Visible = False
                        PnlG.Visible = False
                    Case "SYK"
                        pnlOIL.Visible = False
                        pnlINA.Visible = False
                        pnlSYK.Visible = True
                        pnlSYR.Visible = False
                        pnlTAB.Visible = False
                        pnlINV.Visible = False
                        pnlMOT.Visible = False
                        PnlG.Visible = False
                    Case "TAB", "KPS", "KPT"
                        pnlOIL.Visible = False
                        pnlINA.Visible = False
                        pnlSYK.Visible = False
                        pnlSYR.Visible = False
                        pnlTAB.Visible = True
                        pnlINV.Visible = False
                        pnlMOT.Visible = False
                        PnlG.Visible = False
                    Case "MOT"
                        pnlOIL.Visible = False
                        pnlINA.Visible = False
                        pnlSYK.Visible = False
                        pnlSYR.Visible = False
                        pnlTAB.Visible = False
                        pnlINV.Visible = False
                        pnlMOT.Visible = True
                        PnlG.Visible = False
                    Case "G00"
                        pnlOIL.Visible = False
                        pnlINA.Visible = False
                        pnlSYK.Visible = False
                        pnlSYR.Visible = False
                        pnlTAB.Visible = False
                        pnlINV.Visible = False
                        pnlMOT.Visible = False
                        PnlG.Visible = True
                    Case "MTR"
                        Select Case UCase(txtProdID.Text)
                            Case "MTR001", "MTR003"
                                pnlOIL.Visible = False
                                pnlINA.Visible = False
                                pnlSYK.Visible = False
                                pnlSYR.Visible = False
                                pnlTAB.Visible = True
                                pnlINV.Visible = False
                                pnlMOT.Visible = False
                                PnlG.Visible = False
                            Case "MTR002", "MTR004"
                                pnlOIL.Visible = False
                                pnlINA.Visible = True
                                pnlSYK.Visible = False
                                pnlSYR.Visible = False
                                pnlTAB.Visible = False
                                pnlINV.Visible = False
                                pnlMOT.Visible = False
                                PnlG.Visible = False
                        End Select
                End Select
            End If
        Else
            Dim EventArg As String = Request("__EVENTARGUMENT")
            If EventArg = "PostBackFromClient" Then
                GetDataQC()
            End If
        End If
    End Sub

    Private Sub GetDataQC()
        Dim dt As New Data.DataTable

        Try
            dt = oProdReview.GetProductReview("PROD", txtProdID.Text, txtNoBatch.Text)
            If dt.Rows.Count > 0 Then
                txtProdDate.Text = If(IsDBNull(dt.Rows(0)("TglProd")), String.Empty, Format(CDate(dt.Rows(0)("TglProd")), "dd-MMM-yy"))
                If Mid(txtProdID.Text, 1, 3).ToUpper = "MOT" OrElse Mid(txtProdID.Text, 1, 1).ToUpper = "G" Then
                    If Mid(txtProdID.Text, 1, 3).ToUpper = "MOT" Then
                        txtMotFilling.Text = dt.Rows(0)("MotFill")
                        txtMotBSCuci.Text = dt.Rows(0)("MotBsCuci")
                        txtMotBSFill.Text = dt.Rows(0)("MotBsFill")
                        txtMotClarity.Text = dt.Rows(0)("MotBsClarity")
                        txtMotHasilBaik.Text = dt.Rows(0)("MotHasilBaik")
                        txtMotCMC.Text = dt.Rows(0)("MotCMC")
                        txtMotAvicel.Text = dt.Rows(0)("MotAvicel")
                        txtMotXanthan.Text = dt.Rows(0)("MotXanthan")
                        txtMotMix.Text = dt.Rows(0)("MotMix")
                        txtMotFill2.Text = dt.Rows(0)("MotFill2")
                    ElseIf Mid(txtProdID.Text, 1, 1).ToUpper = "G" Then
                        txtGTotAir.Text = dt.Rows(0)("GtotAir")
                        txtGTotAlk.Text = dt.Rows(0)("GTotAlk")
                        txtGTotWaktuMix.Text = dt.Rows(0)("GTotMix")
                        txtGLot1.Text = dt.Rows(0)("GLot1")
                        txtGMcLot1.Text = dt.Rows(0)("GLot1Mc")
                        txtGLot2.Text = dt.Rows(0)("GLot2")
                        txtGMcLot2.Text = dt.Rows(0)("GLot2Mc")
                        txtGLot3.Text = dt.Rows(0)("GLot3")
                        txtGMcLot3.Text = dt.Rows(0)("GLot3Mc")
                        txtGLot4.Text = dt.Rows(0)("GLot4")
                        txtGMcLot1.Text = dt.Rows(0)("GLot4Mc")
                        txtGLot5.Text = dt.Rows(0)("GLot5")
                        txtGMcLot5.Text = dt.Rows(0)("GLot5Mc")
                    End If
                Else
                    txtPBAJamKerja.Text = If(IsDBNull(dt.Rows(0)("PBAJam")), 0, dt.Rows(0)("PBAJam"))
                    txtPBARendemen.Text = If(IsDBNull(dt.Rows(0)("PBARendemen")), 0, dt.Rows(0)("PBARendemen"))
                    Select Case Mid(txtProdID.Text, 1, 3).ToUpper
                        Case "OIL"
                            txtOilFilling.Text = If(IsDBNull(dt.Rows(0)("OilJamMix")), 0, dt.Rows(0)("OilJamMix"))
                            txtOilMix.Text = If(IsDBNull(dt.Rows(0)("OilJamFill")), 0, dt.Rows(0)("OilJamFill"))
                        Case "SYR"
                            txtCMC.Text = If(IsDBNull(dt.Rows(0)("CMC")), 0, dt.Rows(0)("CMC"))
                            txtAvicel.Text = If(IsDBNull(dt.Rows(0)("Avicel")), 0, dt.Rows(0)("Avicel"))
                            txtXanthan.Text = If(IsDBNull(dt.Rows(0)("Xanthan")), 0, dt.Rows(0)("Xanthan"))
                            txtSyrMix.Text = If(IsDBNull(dt.Rows(0)("SyrJamMix")), 0, dt.Rows(0)("SyrJamMix"))
                            txtSyrFilling.Text = If(IsDBNull(dt.Rows(0)("SyrJamFill")), 0, dt.Rows(0)("SyrJamFill"))
                        Case "INA"
                            txtInaFilling.Text = If(IsDBNull(dt.Rows(0)("InaJamFill")), 0, dt.Rows(0)("InaJamFill"))
                            txtInaBSCuci.Text = If(IsDBNull(dt.Rows(0)("InaBsCuci")), 0, dt.Rows(0)("InaBsCuci"))
                            txtBSFilling.Text = If(IsDBNull(dt.Rows(0)("InaBsFill")), 0, dt.Rows(0)("InaBsCuci"))
                            txtBSClarity.Text = If(IsDBNull(dt.Rows(0)("InaBsClarity")), 0, dt.Rows(0)("InaBsClarity"))
                            txtHasilBaik.Text = If(IsDBNull(dt.Rows(0)("InaHasilBaik")), 0, dt.Rows(0)("InaHasilBaik"))
                        Case "SYK"
                            txtSykFilling.Text = If(IsDBNull(dt.Rows(0)("SykJamFill")), 0, dt.Rows(0)("SykJamFill"))
                            txtSykMix.Text = If(IsDBNull(dt.Rows(0)("SykJamMix")), 0, dt.Rows(0)("SykJamMix"))
                        Case "TAB", "KPS", "KPT"
                            txtTotAir.Text = If(IsDBNull(dt.Rows(0)("GranTotAir")), 0, dt.Rows(0)("GranTotAir"))
                            txtTotAlk.Text = If(IsDBNull(dt.Rows(0)("GranTotAlk")), 0, dt.Rows(0)("GranTotAlk"))
                            txtTotWaktuMix.Text = If(IsDBNull(dt.Rows(0)("GranTotMix")), 0, dt.Rows(0)("GranTotMix"))
                            txtLot1.Text = If(IsDBNull(dt.Rows(0)("FBDLot1")), 0, dt.Rows(0)("FBDLot1"))
                            txtMcLot1.Text = If(IsDBNull(dt.Rows(0)("FBDLot1Mc")), 0, dt.Rows(0)("FBDLot1Mc"))
                            txtLot2.Text = If(IsDBNull(dt.Rows(0)("FBDLot2")), 0, dt.Rows(0)("FBDLot2"))
                            txtMcLot2.Text = If(IsDBNull(dt.Rows(0)("FBDLot2Mc")), 0, dt.Rows(0)("FBDLot2Mc"))
                            txtLot3.Text = If(IsDBNull(dt.Rows(0)("FBDLot3")), 0, dt.Rows(0)("FBDLot3"))
                            txtMcLot3.Text = If(IsDBNull(dt.Rows(0)("FBDLot3Mc")), 0, dt.Rows(0)("FBDLot3Mc"))
                            txtLot4.Text = If(IsDBNull(dt.Rows(0)("FBDLot4")), 0, dt.Rows(0)("FBDLot4"))
                            txtMcLot4.Text = If(IsDBNull(dt.Rows(0)("FBDLot4Mc")), 0, dt.Rows(0)("FBDLot4Mc"))
                            txtLot5.Text = If(IsDBNull(dt.Rows(0)("FBDLot5")), 0, dt.Rows(0)("FBDLot5"))
                            txtMcLot5.Text = If(IsDBNull(dt.Rows(0)("FBDLot5Mc")), 0, dt.Rows(0)("FBDLot5Mc"))
                            txtWaktuCetak.Text = If(IsDBNull(dt.Rows(0)("WaktuCetak")), 0, dt.Rows(0)("WaktuCetak"))
                            txtCoatLot1.Text = If(IsDBNull(dt.Rows(0)("CoatLot1")), 0, dt.Rows(0)("CoatLot1"))
                            txtCoatLot2.Text = If(IsDBNull(dt.Rows(0)("CoatLot2")), 0, dt.Rows(0)("CoatLot2"))
                            txtCoatLot3.Text = If(IsDBNull(dt.Rows(0)("CoatLot3")), 0, dt.Rows(0)("CoatLot3"))
                            txtCoatLot4.Text = If(IsDBNull(dt.Rows(0)("CoatLot4")), 0, dt.Rows(0)("CoatLot4"))
                            txtPGA.Text = If(IsDBNull(dt.Rows(0)("PGA")), 0, dt.Rows(0)("PGA"))
                        Case "MTR"
                            Select Case UCase(txtProdID.Text)
                                Case "MTR001", "MTR003"
                                    txtTotAir.Text = If(IsDBNull(dt.Rows(0)("GranTotAir")), 0, dt.Rows(0)("GranTotAir"))
                                    txtTotAlk.Text = If(IsDBNull(dt.Rows(0)("GranTotAlk")), 0, dt.Rows(0)("GranTotAlk"))
                                    txtTotWaktuMix.Text = If(IsDBNull(dt.Rows(0)("GranTotMix")), 0, dt.Rows(0)("GranTotMix"))
                                    txtLot1.Text = If(IsDBNull(dt.Rows(0)("FBDLot1")), 0, dt.Rows(0)("FBDLot1"))
                                    txtMcLot1.Text = If(IsDBNull(dt.Rows(0)("FBDLot1Mc")), 0, dt.Rows(0)("FBDLot1Mc"))
                                    txtLot2.Text = If(IsDBNull(dt.Rows(0)("FBDLot2")), 0, dt.Rows(0)("FBDLot2"))
                                    txtMcLot2.Text = If(IsDBNull(dt.Rows(0)("FBDLot2Mc")), 0, dt.Rows(0)("FBDLot2Mc"))
                                    txtLot3.Text = If(IsDBNull(dt.Rows(0)("FBDLot3")), 0, dt.Rows(0)("FBDLot3"))
                                    txtMcLot3.Text = If(IsDBNull(dt.Rows(0)("FBDLot3Mc")), 0, dt.Rows(0)("FBDLot3Mc"))
                                    txtLot4.Text = If(IsDBNull(dt.Rows(0)("FBDLot4")), 0, dt.Rows(0)("FBDLot4"))
                                    txtMcLot4.Text = If(IsDBNull(dt.Rows(0)("FBDLot4Mc")), 0, dt.Rows(0)("FBDLot4Mc"))
                                    txtLot5.Text = If(IsDBNull(dt.Rows(0)("FBDLot5")), 0, dt.Rows(0)("FBDLot5"))
                                    txtMcLot5.Text = If(IsDBNull(dt.Rows(0)("FBDLot5Mc")), 0, dt.Rows(0)("FBDLot5Mc"))
                                    txtWaktuCetak.Text = If(IsDBNull(dt.Rows(0)("WaktuCetak")), 0, dt.Rows(0)("WaktuCetak"))
                                    txtCoatLot1.Text = If(IsDBNull(dt.Rows(0)("CoatLot1")), 0, dt.Rows(0)("CoatLot1"))
                                    txtCoatLot2.Text = If(IsDBNull(dt.Rows(0)("CoatLot2")), 0, dt.Rows(0)("CoatLot2"))
                                    txtCoatLot3.Text = If(IsDBNull(dt.Rows(0)("CoatLot3")), 0, dt.Rows(0)("CoatLot3"))
                                    txtCoatLot4.Text = If(IsDBNull(dt.Rows(0)("CoatLot4")), 0, dt.Rows(0)("CoatLot4"))
                                    txtPGA.Text = If(IsDBNull(dt.Rows(0)("PGA")), 0, dt.Rows(0)("PGA"))
                                Case "MTR002", "MTR004"
                                    txtInaFilling.Text = If(IsDBNull(dt.Rows(0)("InaJamFill")), 0, dt.Rows(0)("InaJamFill"))
                                    txtInaBSCuci.Text = If(IsDBNull(dt.Rows(0)("InaBsCuci")), 0, dt.Rows(0)("InaBsCuci"))
                                    txtBSFilling.Text = If(IsDBNull(dt.Rows(0)("InaBsFill")), 0, dt.Rows(0)("InaBsCuci"))
                                    txtBSClarity.Text = If(IsDBNull(dt.Rows(0)("InaBsClarity")), 0, dt.Rows(0)("InaBsClarity"))
                                    txtHasilBaik.Text = If(IsDBNull(dt.Rows(0)("InaHasilBaik")), 0, dt.Rows(0)("InaHasilBaik"))
                            End Select
                    End Select
                End If

            End If
            txtProdDate.Focus()
        Catch ex As Exception
            Throw ex
        Finally
            dt.Dispose()
        End Try
    End Sub

    Protected Sub btnSaveOIL_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSaveOIL.Click

        Try
            oProdReview.ProdOIL_UpdateProdReview(txtProdID.Text, txtNoBatch.Text, CDate(txtProdDate.Text), txtPBAJamKerja.Text, txtPBARendemen.Text, _
                txtOilMix.Text, txtOilFilling.Text)

        Catch ex As Exception
            Throw ex

        End Try

    End Sub

    Protected Sub btnSaveSYR_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSaveSYR.Click

        Try
            oProdReview.ProdSYR_ProductReview(txtProdID.Text, txtNoBatch.Text, CDate(txtProdDate.Text), txtPBAJamKerja.Text, txtPBARendemen.Text, _
                txtCMC.Text, txtAvicel.Text, txtXanthan.Text, txtSyrMix.Text, txtSyrFilling.Text)

        Catch ex As Exception
            Throw ex
        End Try

    End Sub

    Protected Sub btnSaveINV_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSaveINV.Click

        Try
            oProdReview.ProdINV_ProductReview(txtProdID.Text, txtNoBatch.Text, CDate(txtProdDate.Text), txtPBAJamKerja.Text, txtPBARendemen.Text)

        Catch ex As Exception
            Throw ex
        End Try
    End Sub

    Protected Sub btnSaveSYK_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSaveSYK.Click

        Try
            oProdReview.ProdSYK_ProductReview(txtProdID.Text, txtNoBatch.Text, CDate(txtProdDate.Text), txtPBAJamKerja.Text, txtPBARendemen.Text, _
                txtSykFilling.Text, txtSykMix.Text)

        Catch ex As Exception

        End Try

    End Sub

    Protected Sub btnSaveINA_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSaveINA.Click

        Try
            oProdReview.ProdINA_ProductReview(txtProdID.Text, txtNoBatch.Text, CDate(txtProdDate.Text), txtPBAJamKerja.Text, txtPBARendemen.Text, _
                txtInaFilling.Text, txtInaBSCuci.Text, txtBSFilling.Text, txtBSClarity.Text, txtHasilBaik.Text)

        Catch ex As Exception
            Throw ex
        End Try

    End Sub

    Protected Sub btnSaveTAB_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSaveTAB.Click

        Try
            oProdReview.ProdTAB_ProductReview(txtProdID.Text, txtNoBatch.Text, CDate(txtProdDate.Text), txtPBAJamKerja.Text, txtPBARendemen.Text, _
                txtTotAir.Text, txtTotAlk.Text, txtTotWaktuMix.Text, txtLot1.Text, txtMcLot1.Text, txtLot2.Text, txtMcLot2.Text, _
                txtLot3.Text, txtMcLot3.Text, txtLot4.Text, txtMcLot4.Text, txtLot5.Text, txtMcLot5.Text, txtWaktuCetak.Text, _
                txtCoatLot1.Text, txtCoatLot2.Text, txtCoatLot3.Text, txtCoatLot4.Text, txtPGA.Text)

        Catch ex As Exception
            Throw ex
        End Try

    End Sub

    Protected Sub btnSaveMOT_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSaveMOT.Click

        Try
            oProdReview.ProdMOT_ProductReview(txtProdID.Text, txtNoBatch.Text, CDate(txtProdDate.Text), txtMotFilling.Text, txtMotBSCuci.Text, txtMotBSFill.Text, _
                txtMotClarity.Text, txtMotHasilBaik.Text, txtMotCMC.Text, txtMotAvicel.Text, txtMotXanthan.Text, txtMotMix.Text, txtMotFill2.Text)

        Catch ex As Exception
            Throw ex
        End Try

    End Sub

    Protected Sub btnSaveG_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSaveG.Click

        Try
            oProdReview.ProdG_ProductReview(txtProdID.Text, txtNoBatch.Text, CDate(txtProdDate.Text), txtGTotAir.Text, txtGTotAlk.Text, txtGTotWaktuMix.Text, _
                txtGLot1.Text, txtGMcLot1.Text, txtGLot2.Text, txtGMcLot2.Text, txtGLot3.Text, txtGMcLot3.Text, txtGLot4.Text, txtGMcLot4.Text, _
                txtGLot5.Text, txtGMcLot5.Text)

        Catch ex As Exception
            Throw ex
        End Try

    End Sub

End Class
