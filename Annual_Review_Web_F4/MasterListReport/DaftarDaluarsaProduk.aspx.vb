﻿Imports Microsoft.Reporting.WebForms

Partial Class MasterListReport_DaftarDaluarsaProduk

    Inherits System.Web.UI.Page


    Protected Sub btnGetRpt_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGetRpt.Click

        Dim ds As New dsOttoTableAdapters.MasterListProdukJadiTableAdapter
        Dim dt As New Data.DataTable
        Dim lsParam As New List(Of ReportParameter)
        Dim dsRpt As ReportDataSource
        Dim ItemCode As String
        Dim FullAccess As String() = {"QA", "RD"}

        RptMasterList.Visible = True
        RptMasterList.Reset()
        RptMasterList.ShowExportControls = FullAccess.Contains(Session("DeptID").ToString)
        RptMasterList.ShowPrintButton = FullAccess.Contains(Session("DeptID").ToString)

        ItemCode = If(String.IsNullOrEmpty(txtProdID.Text), "ALL", txtProdID.Text)
        lsParam.Add(New ReportParameter("ItemCode", ItemCode.ToUpper))

        Try
            RptMasterList.LocalReport.ReportPath = "Report/DaftarDaluarsaProduk.rdlc"

            dt = ds.GetMasterListDN(ItemCode, "4")
            dsRpt = New ReportDataSource("dsOtto_MasterListProdukJadi", dt)

            RptMasterList.LocalReport.DataSources.Clear()
            RptMasterList.LocalReport.DataSources.Add(dsRpt)
            RptMasterList.LocalReport.SetParameters(lsParam)
            RptMasterList.LocalReport.Refresh()

        Catch ex As ReportViewerException
            Throw ex

        End Try

    End Sub

End Class
