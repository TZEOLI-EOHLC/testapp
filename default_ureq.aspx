<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="default_ureq.aspx.vb" Inherits="testapp.default_ureq" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

    <div id="mainform" runat="server" style="display:none">

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <asp:UpdatePanel ID="upGridView" runat="server" UpdateMode="Conditional">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnShowGrid" EventName="Click" />
            </Triggers>
            <ContentTemplate>
                
                <div id="main_data" runat="server" style="display:block">
                    <asp:SqlDataSource ID="sqlReqData" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionConnectionString %>" 
                                       SelectCommand="SELECT [URID],[FY],[DATERECV],[DATEDONE],[INITIATOR],[ORGDESC],[OBJCODE],[REQUEST],[ACNTNO],[AMT],[AMTTYPE],[VENDOR],
                                                             IIF(LEN(CONVERT(varchar(max),[COMMENTS])) > 150,LEFT(CONVERT(varchar(max),[COMMENTS]),150) + '...',[COMMENTS]) As [COMMENTS],
                                                             [COMMENTS] AS [FULL_COMMENT],
                                                             [SPY]
                                                      FROM [iis].[UREQ_JPEOPLE]
                                                      ORDER BY [FY] DESC, [DATERECV] DESC">
                    </asp:SqlDataSource>

                    <asp:SqlDataSource ID="SqlReqIDs" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionConnectionString %>" 
                                       SelectCommand="SELECT [URID]
                                                      FROM [iis].[UREQ_JPEOPLE]
                                                      ORDER BY [FY] DESC, [DATERECV] DESC">
                    </asp:SqlDataSource>

                    <asp:SqlDataSource ID="SqlSingleReq" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionConnectionString %>" 
                                       SelectCommand="SELECT [URID],[FY],[DATERECV],[DATEDONE],[INITIATOR],[ORGDESC],[OBJCODE],[REQUEST],[ACNTNO],[AMT],[AMTTYPE],[VENDOR],
                                                             IIF(LEN(CONVERT(varchar(max),[COMMENTS])) > 150,LEFT(CONVERT(varchar(max),[COMMENTS]),150) + '...',[COMMENTS]) As [COMMENTS],
                                                             [COMMENTS] AS [FULL_COMMENT],
                                                             [SPY]
                                                      FROM [iis].[UREQ_JPEOPLE]
                                                      WHERE [URID] = @UREQID">
                    <SelectParameters>
                        <asp:Parameter Name="UREQID" Type="String" />
                    </SelectParameters>
                    
                    </asp:SqlDataSource>

                    <asp:GridView ID="gvSingleReq" runat="server" AutoGenerateColumns="False" DataSourceID="SqlSingleReq" Style="display:none">
                        <Columns>
                            <asp:BoundField DataField="URID" HeaderText="URID" InsertVisible="False" ReadOnly="True" SortExpression="URID" />
                            <asp:BoundField DataField="FY" HeaderText="FY" SortExpression="FY" />
                            <asp:BoundField DataField="DATERECV" HeaderText="DATERECV" SortExpression="DATERECV" />
                            <asp:BoundField DataField="DATEDONE" HeaderText="DATEDONE" SortExpression="DATEDONE" />
                            <asp:BoundField DataField="INITIATOR" HeaderText="INITIATOR" SortExpression="INITIATOR" />
                            <asp:BoundField DataField="ORGDESC" HeaderText="ORGDESC" SortExpression="ORGDESC" />
                            <asp:BoundField DataField="OBJCODE" HeaderText="OBJCODE" SortExpression="OBJCODE" />
                            <asp:BoundField DataField="REQUEST" HeaderText="REQUEST" SortExpression="REQUEST" />
                            <asp:BoundField DataField="ACNTNO" HeaderText="ACNTNO" SortExpression="ACNTNO" />
                            <asp:BoundField DataField="AMT" HeaderText="AMT" SortExpression="AMT" />
                            <asp:BoundField DataField="AMTTYPE" HeaderText="AMTTYPE" SortExpression="AMTTYPE" />
                            <asp:BoundField DataField="VENDOR" HeaderText="VENDOR" SortExpression="VENDOR" />
                            <asp:BoundField DataField="COMMENTS" HeaderText="COMMENTS" ReadOnly="True" SortExpression="COMMENTS" />
                            <asp:BoundField DataField="FULL_COMMENT" HeaderText="FULL_COMMENT" SortExpression="FULL_COMMENT" />
                            <asp:BoundField DataField="SPY" HeaderText="SPY" SortExpression="SPY" />
                        </Columns>
                    </asp:GridView>

                    <asp:SqlDataSource ID="sqlVendors" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionConnectionString %>" 
                                        SelectCommand="SELECT '' AS [VENDORS]
                                                       UNION
                                                       SELECT DISTINCT LTRIM(RTRIM(ISNULL([VENDOR],''))) AS [VENDORS]
                                                       FROM [iis].[UREQ_JPEOPLE]
                                                       UNION
                                                       SELECT DISTINCT LTRIM(RTRIM([VENDORS])) AS [VENDORS] 
                                                       FROM [iis].[UREQ_TVENDOR] 
                                                       ORDER BY VENDORS">
                    </asp:SqlDataSource>

                    <asp:SqlDataSource ID="sqlInitiators" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionConnectionString %>" 
                                        SelectCommand="SELECT '' AS [EMPS]
                                                       UNION
                                                       SELECT DISTINCT [EMPS]
                                                       FROM [iis].[UREQ_EMPTBLE]
                                                       ORDER BY [EMPS]">
                    </asp:SqlDataSource>

                    <asp:SqlDataSource ID="sqlObjCodes" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionConnectionString %>" 
                                        SelectCommand="SELECT '' AS [OBJC]
                                                       UNION
                                                       SELECT DISTINCT [OBJC]
                                                       FROM [iis].[UREQ_OBJCODES]
                                                       ORDER BY [OBJC]">
                    </asp:SqlDataSource>

                    <asp:SqlDataSource ID="SqlReqTypes" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionConnectionString %>" 
                                        SelectCommand="SELECT '' AS [RID],'' AS [RDESC]
                                                       UNION
                                                       SELECT DISTINCT [RID],[RDESC]
                                                       FROM [iis].[UREQ_TREQTBLE]
                                                       ORDER BY [RDESC]">
                    </asp:SqlDataSource>

                    <asp:SqlDataSource ID="SqlAccounts" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionConnectionString %>" 
                                        SelectCommand="SELECT '' AS [AKOUNT]
                                                       UNION
                                                       SELECT DISTINCT [AKOUNT]
                                                       FROM [iis].[UREQ_AKOUNTS]
                                                       ORDER BY [AKOUNT]">
                    </asp:SqlDataSource>

                    <asp:SqlDataSource ID="SqlANE" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionConnectionString %>" 
                                        SelectCommand="SELECT '' AS [ACTNEST]
                                                       UNION
                                                       SELECT DISTINCT [ACTNEST]
                                                       FROM [iis].[UREQ_ANE]
                                                       ORDER BY [ACTNEST]">
                    </asp:SqlDataSource>

                    <asp:SqlDataSource ID="SqlOrgDiv" runat="server" ConnectionString="<%$ ConnectionStrings:ProductionConnectionString %>" 
                                        SelectCommand="SELECT '' AS [JDP]
                                                       UNION
                                                       SELECT DISTINCT [JDP]
                                                       FROM [iis].[UREQ_TDPTBLE]
                                                       ORDER BY [JDP]">
                    </asp:SqlDataSource>

                </div>

                <br />
                <br />
                <table style="width:100%">
                    <tr>
                        <td width="100%">
                            <div style="width:96%;height:44px">
                                <table style="background-color:darkslateblue;color:white;font-size:small;font-weight:600;vertical-align:bottom">
                                    <tr>
                                        <td style="width:1%;text-align:center">&nbsp;</td>
                                        <td style="width:4%;text-align:right">Req&nbsp;<br />ID&nbsp;</td>
                                        <td style="width:5%;text-align:center">Fiscal<br />Year</td>
                                        <td style="width:2%;text-align:Right">Date<br />Rcvd</td>
                                        <td style="width:4%;text-align:Right">Date<br />Done</td>
                                        <td style="width:10%;text-align:center">Initiator</td>
                                        <td style="width:8%;text-align:center">Organization Code<br /> / Description</td>
                                        <td style="width:3%;text-align:center">OBJ<br />Code</td>
                                        <td style="width:9%;text-align:center">Request</td>
                                        <td style="width:6%;text-align:center">Account<br />Number</td>
                                        <td style="width:7%;text-align:Right">Amount</td>
                                        <td style="width:8%;text-align:center">Amount<br />Type</td>
                                        <td style="width:10%;text-align:center">Vendor</td>
                                        <td style="width:23%;text-align:center">Comments</td>
                                        <td style="width:3%;text-align:center">&nbsp;</td>
                                    </tr>
                                </table>
                                <br />
                            </div>

                            <div style="overflow-x:auto;width:96%;overflow-y:auto;min-height:100px;max-height:250px">
                            <asp:GridView ID="gvReqData" runat="server" AllowSorting="True" DataSourceID="sqlReqData" AutoGenerateColumns="False" ShowHeader="False">
                                <RowStyle Font-Size="Smaller" />
                                <AlternatingRowStyle BackColor="lightgray" />
                                <HeaderStyle Font-Size="Small" Font-Bold="True" BackColor="DarkSlateBlue" ForeColor="White" />
                                <Columns>
                                    <asp:CommandField ShowSelectButton="True" ButtonType="Button" />
                                    <asp:BoundField DataField="URID" HeaderText="Req ID" InsertVisible="False" SortExpression="URID"  HeaderStyle-Width="3%" HeaderStyle-HorizontalAlign="Right" ItemStyle-Width="3%" ItemStyle-HorizontalAlign="Right" />
                                    <asp:BoundField DataField="FY" HeaderText="Fiscal Year" SortExpression="FY" HeaderStyle-Width="3%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Bottom" ItemStyle-Width="3%" ItemStyle-HorizontalAlign="Center"/>
                                    <asp:BoundField DataField="DATERECV" HeaderText="Date Rcvd" SortExpression="DATERECV" DataFormatString="{0:MM/dd/yyyy}" HeaderStyle-Width="4%" HeaderStyle-HorizontalAlign="Right" HeaderStyle-VerticalAlign="Bottom" ItemStyle-Width="4%" ItemStyle-HorizontalAlign="Right" />
                                    <asp:BoundField DataField="DATEDONE" HeaderText="Date Done" SortExpression="DATEDONE" DataFormatString="{0:MM/dd/yyyy}" HeaderStyle-Width="4%" HeaderStyle-HorizontalAlign="Right" HeaderStyle-VerticalAlign="Bottom" ItemStyle-Width="4%" ItemStyle-HorizontalAlign="Right" />
                                    <asp:BoundField DataField="INITIATOR" HeaderText="Initiator" SortExpression="INITIATOR" HeaderStyle-Width="10%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Bottom" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Left" />
                                    <asp:BoundField DataField="ORGDESC" HeaderText="Organization Code Description" SortExpression="ORGDESC" HeaderStyle-Width="10%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Bottom" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Left"/>
                                    <asp:BoundField DataField="OBJCODE" HeaderText="OBJ Code" SortExpression="OBJCODE" HeaderStyle-Width="2%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Bottom" ItemStyle-Width="2%" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="REQUEST" HeaderText="Request" SortExpression="REQUEST" HeaderStyle-Width="10%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Bottom" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Left" />
                                    <asp:BoundField DataField="ACNTNO" HeaderText="Account Number" SortExpression="ACNTNO" HeaderStyle-Width="6%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Bottom" ItemStyle-Width="6%" ItemStyle-HorizontalAlign="Center" />
                                    <asp:BoundField DataField="AMT" HeaderText="Amount" SortExpression="AMT" DataFormatString="{0:C2}" HeaderStyle-Width="8%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Bottom" ItemStyle-Width="8%" ItemStyle-HorizontalAlign="Right" />
                                    <asp:BoundField DataField="AMTTYPE" HeaderText="Amount Type" SortExpression="AMTTYPE" HeaderStyle-Width="8%" HeaderStyle-HorizontalAlign="Right" HeaderStyle-VerticalAlign="Bottom" ItemStyle-Width="8%" ItemStyle-HorizontalAlign="Left" />
                                    <asp:BoundField DataField="VENDOR" HeaderText="Vendor" SortExpression="VENDOR" HeaderStyle-Width="10%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Bottom" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Left" />
                                    <asp:BoundField DataField="COMMENTS" HeaderText="Comments" SortExpression="COMMENTS" HeaderStyle-Width="14%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Bottom" ItemStyle-Width="14%" ItemStyle-HorizontalAlign="Left" />
                                    <asp:BoundField DataField="FULL_COMMENT" HeaderText="Full Comments" SortExpression="FULL_COMMENTS" />
                                </Columns>
                                <EmptyDataTemplate>
                                    NO DATA FOUND
                                </EmptyDataTemplate>
                            </asp:GridView>
                            </div>
                        </td>
                    </tr>
                </table>

                <asp:HiddenField ID="hfUReqID" runat="server" Value="" />
                <asp:HiddenField ID="hfFiscalYear" runat="server" Value="" />
                <asp:HiddenField ID="hfDateReceived" runat="server" Value="" />
                <asp:HiddenField ID="hfDateCompleted" runat="server" Value="" />
                <asp:HiddenField ID="hfInitiator" runat="server" Value="" />
                <asp:HiddenField ID="hfOrgDiv" runat="server" Value="" />
                <asp:HiddenField ID="hfOBJCode" runat="server" Value="" />
                <asp:HiddenField ID="hfReqType" runat="server" Value="" />
                <asp:HiddenField ID="hfAccountNo" runat="server" Value="" />
                <asp:HiddenField ID="hfAmount" runat="server" Value="0.00" />
                <asp:HiddenField ID="hfABE" runat="server" Value="" />
                <asp:HiddenField ID="hfVendor" runat="server" Value="" />
                <asp:HiddenField ID="hfComments" runat="server" Value="" />

            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <hr style="width:96%; text-align:left; color=black"/>

    <table>
        <tr>
            <td colspan="8" width="40%" style="vertical-align:bottom">
                <asp:ImageButton ID="ibtnFirst" runat="server" Height="25px" ImageAlign="Top" ImageUrl="~/images/first.png" Width="25px" BorderStyle="Solid" BorderWidth="2px" />
                <asp:ImageButton ID="ibtnPrev" runat="server" Height="25px" ImageAlign="Top" ImageUrl="~/images/prev.png" Width="25px" BorderStyle="Solid" BorderWidth="2px" />
                <asp:TextBox ID="txtReqID" runat="server" Width="100px" ></asp:TextBox>
                <asp:DropDownList ID="ddlReqIDs" runat="server" style="display:none" Height="25px" Width="100px" DataSourceID="SqlReqIDs" DataTextField="URID" DataValueField="URID"></asp:DropDownList>
                <asp:Button ID="btnUseList" runat="server" Text="..." ToolTip="Click to switch between text and list to specify ID" Width="25px" OnClick="btnUseList_Click"/>
                <asp:ImageButton ID="ibtnNext" runat="server" Height="25px" ImageAlign="Top" ImageUrl="~/images/next.png" BorderStyle="Solid" BorderWidth="2px" />
                <asp:ImageButton ID="ibtnLast" runat="server" Height="25px" ImageAlign="Top" ImageUrl="~/images/last.png" Width="25px" BorderStyle="Solid" BorderWidth="2px" />
                <asp:Button ID="btnShowGrid" runat="server" Text="Show/Hide Grid" OnClick="btnShowGrid_Click" Autopostback="true" />
            </td>
            <td colspan="2" width="10%">&nbsp;</td>
            <td colspan="10" width="50%">&nbsp;</td>
        </tr>
    </table>

    <hr style="width:96%; text-align:left; color:black"/>

    <div id="dataentry" runat="server" style="display:block;width:96%;text-align:center">
        <asp:UpdatePanel ID="updDataEntry" runat="server" UpdateMode="Conditional">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="ddlReqIDs" EventName="SelectedIndexChanged" />
                <asp:AsyncPostBackTrigger ControlID="txtReqID" EventName="TextChanged" />
                <asp:AsyncPostBackTrigger ControlID="gvReqData" EventName="SelectedIndexChanged" />
            </Triggers>
           <ContentTemplate>
        <table style="border-style:solid;border-color:black;border-width:1px;background-color:white">
            <tr><td colspan="13" width="100%">&nbsp;</td></tr>
            <tr>
                <td width="10%" style="text-align:right">UR ID#</td>
                <td width="10%" style="padding-left:3em; width: 46px;">
                    <asp:TextBox ID="txtURID" runat="server" Text="UR ID Number" width="90%"></asp:TextBox>
                </td>
                <td width="10%" style="text-align:right">Fiscal Year</td>
                <td style="padding-left:3em;text-align:left">
                    <asp:TextBox ID="txtFY" runat="server" Width="75%"></asp:TextBox>
                </td>
                <td colspan="2" width="10%" style="text-align:right">Date Received</td>
                <td width="10%" style="padding-left:3em;text-align:left">
                    <asp:TextBox ID="txtDateReceived" runat="server" Width="75%"></asp:TextBox>
                </td>
                <td colspan="2" width="10%" style="text-align:right">Date Completed</td>
                <td colspan="2" width="10%" style="padding-left:3em;text-align:left">
                    <asp:TextBox ID="txtDateCompleted" runat="server" Width="75%"></asp:TextBox>
                </td>
                <td colspan="2" width="30%">&nbsp;</td>
            </tr>
            <tr  height="2em" ><td colspan="13" width="100%">&nbsp;</td></tr>
            <tr>
                <td width="10%" style="text-align:right">Initiator</td>
                <td colspan="2" width="20%" style="text-align:left;padding-left:3em">
                    <asp:DropDownList ID="ddlInitiator" runat="server" DataSourceID="sqlInitiators" DataTextField="EMPS" DataValueField="EMPS" Width="100%"></asp:DropDownList>
                </td>
                <td colspan="3" width="15%" style="text-align:right">Organization/Division</td>
                <td colspan="6" width="40%" style="text-align:left;padding-left:3em">
                    <asp:DropDownList ID="ddlOrgDiv" runat="server" DataSourceID="SqlOrgDiv" DataTextField="JDP" DataValueField="JDP"  Width="100%"></asp:DropDownList>
                </td>
                <td width="15%" />
            </tr>
            <tr height="2em" ><td colspan="13" width="100%">&nbsp;</td></tr>
            <tr>
                <td width="10%" style="text-align:right">Object Code</td>
                <td width="10%" style="padding-left:3em;text-align:left">
                    <asp:DropDownList ID="ddlObjCode" runat="server" style="width:75%" DataSourceID="sqlObjCodes" DataTextField="OBJC" DataValueField="OBJC"></asp:DropDownList>
                </td>
                <td width="10%" style="text-align:right">Type Of Request</td>
                <td colspan="7" width="40%" style="padding-left:3em;text-align:left">
                    <asp:DropDownList ID="ddlReqType" runat="server" style="text-align:left" DataSourceID="SqlReqTypes" DataTextField="RDESC" DataValueField="RDESC" Width="100%"></asp:DropDownList>
                </td>
                <td colspan="3" width="30%">&nbsp;</td>
            </tr>
            <tr height="2em"><td colspan="13" width="100%">&nbsp;</td></tr>
            <tr>
                <td width="10%" style="text-align:right">Account Number</td>
                <td width="10%" style="text-align:left;padding-left:3em">
                    <asp:DropDownList ID="ddlAccountNumber" runat="server" style="width:75%" DataSourceID="SqlAccounts" DataTextField="AKOUNT" DataValueField="AKOUNT"></asp:DropDownList>
                </td>
                <td width="10%" style="text-align:right">Amount</td>
                <td colspan="2" width="10%" style="text-align:left;padding-left:3em">
                    <asp:TextBox ID="txtAmount" runat="server" Width="75%"></asp:TextBox>
                </td>
                <td colspan="3" width="20%" style="text-align:left">Actual, Budget or Estimate?
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="ddlAmountType" runat="server" style="width:25%;text-align:left" DataSourceID="SqlANE" DataTextField="ACTNEST" DataValueField="ACTNEST"></asp:DropDownList>
                </td>
                <td colspan="5" width="40%">&nbsp;</td>
            </tr>
            <tr height="2em"><td colspan="13" width="100%">&nbsp;</td></tr>
            <tr>
                <td  width="10%" style="text-align:right">Vendor</td>
                <td colspan="11" width="75%" style="text-align:left;padding-left:3em">
                    <asp:DropDownList ID="ddlVendors" runat="server" style="min-width:60%" DataSourceID="sqlVendors" DataTextField="VENDORS" DataValueField="VENDORS"></asp:DropDownList>
                </td>
                <td width="15%">&nbsp;</td>
            <tr height="2em" ><td colspan="13" width="100%">&nbsp;</tr>
            <tr>
                <td width="10%" style="text-align:right">Description</td>
                <td colspan="11" width="75%" style="padding-left:3em;text-align:left">
                    <asp:TextBox ID="txtDescription" runat="server" Rows="6" style="min-width:60%" TextMode="MultiLine"></asp:TextBox>
                </td>
                <td width="15%">&nbsp;</td>
            </tr>
            <tr height="2em" ><td colspan="13" width="100%">&nbsp;</td></tr>
        </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    </form>
</body>
</html>