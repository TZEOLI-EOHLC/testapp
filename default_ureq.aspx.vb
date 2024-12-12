Public Class default_ureq
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'If Not Page.IsPostBack Then mainform.Style.Add("display", "none")
    End Sub

    Private Sub gvReqData_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gvReqData.SelectedIndexChanged

        With gvReqData.Rows(gvReqData.SelectedIndex)
            hfUReqID.Value = .Cells(1).Text.ToString
            hfFiscalYear.Value = .Cells(2).Text.ToString
            hfDateReceived.Value = .Cells(3).Text.ToString
            hfDateCompleted.Value = .Cells(4).Text.ToString
            hfInitiator.Value = .Cells(5).Text.ToString
            hfOrgDiv.Value = .Cells(6).Text.ToString
            hfOBJCode.Value = .Cells(7).Text.ToString
            hfReqType.Value = .Cells(8).Text.ToString
            hfAccountNo.Value = .Cells(9).Text.ToString
            hfAmount.Value = .Cells(10).Text.ToString
            hfABE.Value = .Cells(11).Text.ToString
            hfVendor.Value = .Cells(12).Text.ToString
            hfComments.Value = .Cells(14).Text.ToString

            LoadEntry()

        End With
    End Sub

    Private Sub Blank_Req()

        hfUReqID.Value = ""
        hfFiscalYear.Value = ""
        hfDateReceived.Value = ""
        hfDateCompleted.Value = ""
        hfInitiator.Value = ""
        hfOrgDiv.Value = ""
        hfOBJCode.Value = ""
        hfReqType.Value = ""
        hfAccountNo.Value = ""
        hfAmount.Value = 0.00
        hfABE.Value = ""
        hfVendor.Value = ""
        hfComments.Value = ""

        LoadEntry()

    End Sub
    Private Sub LoadEntry()

        txtURID.Text = hfUReqID.Value.ToString
        txtFY.Text = hfFiscalYear.Value.ToString
        txtDateReceived.Text = hfDateReceived.Value.ToString
        txtDateCompleted.Text = hfDateCompleted.Value.ToString
        ddlInitiator.Text = hfInitiator.Value.ToString
        ddlOrgDiv.Text = hfOrgDiv.Value.ToString
        ddlObjCode.Text = hfOBJCode.Value.ToString
        ddlReqType.Text = hfReqType.Value.ToString
        ddlAccountNumber.Text = hfAccountNo.Value.ToString
        txtAmount.Text = hfAmount.Value.ToString
        ddlAmountType.Text = hfABE.Value.ToString
        ddlVendors.Text = LTrim(hfVendor.Value.ToString)
        txtDescription.Text = hfComments.Value.ToString
    End Sub

    Private Sub gvReqData_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles gvReqData.RowDataBound
        e.Row.Cells(14).Visible = False
    End Sub

    Private Sub gvReqData_DataBound(sender As Object, e As EventArgs) Handles gvReqData.DataBound
        If Not Page.IsPostBack Then
            If gvReqData.Rows.Count <> 0 Then
                gvReqData.SelectedIndex = 0
                With gvReqData.Rows(gvReqData.SelectedIndex)
                    hfUReqID.Value = .Cells(1).Text.ToString
                    hfFiscalYear.Value = .Cells(2).Text.ToString
                    hfDateReceived.Value = .Cells(3).Text.ToString
                    hfDateCompleted.Value = .Cells(4).Text.ToString
                    hfInitiator.Value = .Cells(5).Text.ToString
                    hfOrgDiv.Value = .Cells(6).Text.ToString
                    hfOBJCode.Value = .Cells(7).Text.ToString
                    hfReqType.Value = .Cells(8).Text.ToString
                    hfAccountNo.Value = .Cells(9).Text.ToString
                    hfAmount.Value = .Cells(10).Text.ToString
                    hfABE.Value = .Cells(11).Text.ToString
                    hfVendor.Value = .Cells(12).Text.ToString
                    hfComments.Value = .Cells(14).Text.ToString

                    LoadEntry()

                End With
            Else
                Blank_Req()
            End If
        End If
    End Sub

    Protected Sub btnUseList_Click(sender As Object, e As EventArgs)
        If txtReqID.Style("display") = "none" Then
            txtReqID.Style.Add("display", "inline-block")
            ddlReqIDs.Style.Add("display", "none")
        Else
            txtReqID.Style.Add("display", "none")
            ddlReqIDs.Style.Add("display", "inline-block")
        End If
    End Sub

    Private Sub txtReqID_TextChanged(sender As Object, e As EventArgs) Handles txtReqID.TextChanged

        SqlSingleReq.SelectParameters("UREQID").DefaultValue = txtReqID.Text.ToString
        SqlSingleReq.DataBind()
        gvSingleReq.DataBind()

        If gvSingleReq.Rows.Count = 0 Then
            Blank_Req()
            Exit Sub
        End If

        With gvSingleReq.Rows(0)
            hfUReqID.Value = .Cells(0).Text.ToString
            hfFiscalYear.Value = .Cells(1).Text.ToString
            hfDateReceived.Value = .Cells(2).Text.ToString
            hfDateCompleted.Value = .Cells(3).Text.ToString
            hfInitiator.Value = .Cells(4).Text.ToString
            hfOrgDiv.Value = .Cells(5).Text.ToString
            hfOBJCode.Value = .Cells(6).Text.ToString
            hfReqType.Value = .Cells(7).Text.ToString
            hfAccountNo.Value = .Cells(8).Text.ToString
            hfAmount.Value = .Cells(9).Text.ToString
            hfABE.Value = .Cells(10).Text.ToString
            hfVendor.Value = .Cells(11).Text.ToString
            hfComments.Value = .Cells(13).Text.ToString

            LoadEntry()

        End With
    End Sub

    Private Sub ddlReqIDs_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlReqIDs.SelectedIndexChanged

        SqlSingleReq.SelectParameters("UREQID").DefaultValue = ddlReqIDs.Text.ToString
        SqlSingleReq.DataBind()
        gvSingleReq.DataBind()

        If gvSingleReq.Rows.Count = 0 Then
            Blank_Req()
            Exit Sub
        End If

        With gvSingleReq.Rows(0)
            hfUReqID.Value = .Cells(0).Text.ToString
            hfFiscalYear.Value = .Cells(1).Text.ToString
            hfDateReceived.Value = .Cells(2).Text.ToString
            hfDateCompleted.Value = .Cells(3).Text.ToString
            hfInitiator.Value = .Cells(4).Text.ToString
            hfOrgDiv.Value = .Cells(5).Text.ToString
            hfOBJCode.Value = .Cells(6).Text.ToString
            hfReqType.Value = .Cells(7).Text.ToString
            hfAccountNo.Value = .Cells(8).Text.ToString
            hfAmount.Value = .Cells(9).Text.ToString
            hfABE.Value = .Cells(10).Text.ToString
            hfVendor.Value = .Cells(11).Text.ToString
            hfComments.Value = .Cells(13).Text.ToString

            LoadEntry()

        End With

    End Sub

    Protected Sub btnShowGrid_Click(sender As Object, e As EventArgs)
        If gvReqData.Style("display") Is Nothing Then
            'gvReqData.Style.Add("display", "block")
            Response.Write("1")
        Else
            If gvReqData.Style("display") = "none" Then
                'gvReqData.Style.Add("display", "block")
                Response.Write("2")
            Else
                'gvReqData.Style.Add("display", "none")
                Response.Write("3")
            End If
        End If
    End Sub
End Class