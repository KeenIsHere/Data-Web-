<%@ Page Title="Payment Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PaymentDetails.aspx.cs" Inherits="WebApplication3.PaymentDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="page-header">
        <h2><i class="fas fa-money-bill-wave"></i> Payment Management</h2>
    </div>

    <div class="formview-container">
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="PAYMENTID" DataSourceID="SqlDataSource1" DefaultMode="ReadOnly"
            OnItemInserted="FormView1_ItemInserted"
            OnItemUpdated="FormView1_ItemUpdated"
            OnItemDeleted="FormView1_ItemDeleted"
            OnModeChanging="FormView1_ModeChanging">

            <EditItemTemplate>
                <label class="form-label">Payment ID:</label>
                <asp:Label ID="PAYMENTIDLabel1" runat="server" Text='<%# Eval("PAYMENTID") %>' CssClass="form-control-plaintext" />

                <label class="form-label">Booking:</label>
                <asp:DropDownList ID="BOOKINGIDDropDown" runat="server" DataSourceID="SqlDataSourceBookings" DataTextField="BOOKINGDISPLAY" DataValueField="BOOKINGID" SelectedValue='<%# Bind("BOOKINGID") %>' CssClass="form-control" />

                <label class="form-label">Amount Paid:</label>
                <asp:TextBox ID="AMOUNTPAIDTextBox" runat="server" Text='<%# Bind("AMOUNTPAID") %>' CssClass="form-control" TextMode="Number" />

                <label class="form-label">Payment Date:</label>
                <asp:TextBox ID="PAYMENTDATETextBox" runat="server" Text='<%# Bind("PAYMENTDATE", "{0:yyyy-MM-dd}") %>' CssClass="form-control" TextMode="Date" />

                <label class="form-label">Payment Method:</label>
                <asp:TextBox ID="PAYMENTMETHODTextBox" runat="server" Text='<%# Bind("PAYMENTMETHOD") %>' CssClass="form-control" />

                <div class="mt-3">
                    <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update" Text="Update" CssClass="btn-update" />
                    <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn-cancel" CausesValidation="False" />
                </div>
            </EditItemTemplate>

            <InsertItemTemplate>
                <label class="form-label">Payment ID:</label>
                <asp:TextBox ID="PAYMENTIDTextBox" runat="server" Text='<%# Bind("PAYMENTID") %>' CssClass="form-control" />

                <label class="form-label">Booking:</label>
                <asp:DropDownList ID="BOOKINGIDDropDown" runat="server" DataSourceID="SqlDataSourceBookings" DataTextField="BOOKINGDISPLAY" DataValueField="BOOKINGID" SelectedValue='<%# Bind("BOOKINGID") %>' CssClass="form-control" />

                <label class="form-label">Amount Paid:</label>
                <asp:TextBox ID="AMOUNTPAIDTextBox" runat="server" Text='<%# Bind("AMOUNTPAID") %>' CssClass="form-control" TextMode="Number" />

                <label class="form-label">Payment Date:</label>
                <asp:TextBox ID="PAYMENTDATETextBox" runat="server" Text='<%# Bind("PAYMENTDATE", "{0:yyyy-MM-dd}") %>' CssClass="form-control" TextMode="Date" />

                <label class="form-label">Payment Method:</label>
                <asp:TextBox ID="PAYMENTMETHODTextBox" runat="server" Text='<%# Bind("PAYMENTMETHOD") %>' CssClass="form-control" />

                <div class="mt-3">
                    <asp:LinkButton ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" CssClass="btn-insert" />
                    <asp:LinkButton ID="CancelInsertButton" runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn-cancel" CausesValidation="False" />
                </div>
            </InsertItemTemplate>

            <ItemTemplate>
                <div class="alert alert-info">
                    <i class="fas fa-info-circle"></i>
                    <strong>Select a payment to edit:</strong> Click the "Edit" button in the table below.
                </div>
                <div class="mt-3">
                    <asp:LinkButton ID="NewButton" runat="server" CommandName="New" Text="➕ Add New Payment" CssClass="btn-insert" CausesValidation="False" />
                </div>
            </ItemTemplate>
        </asp:FormView>
    </div>

    <div class="mt-4">
        <h3 class="mb-3" style="color: #0D1B2A;"><i class="fas fa-list"></i> All Payments</h3>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="PAYMENTID" 
            DataSourceID="SqlDataSourcePaymentView" CssClass="table table-striped table-hover gridview-styled"
            AllowPaging="True" AllowSorting="True" PageSize="10" OnRowCommand="GridView1_RowCommand">
            <Columns>
                <asp:BoundField DataField="PAYMENTID" HeaderText="Payment ID" ReadOnly="True" SortExpression="PAYMENTID" />
                <asp:BoundField DataField="BOOKINGID" HeaderText="Booking ID" SortExpression="BOOKINGID" />
                <asp:BoundField DataField="USERNAME" HeaderText="User" SortExpression="USERNAME" />
                <asp:BoundField DataField="AMOUNTPAID" HeaderText="Amount Paid" SortExpression="AMOUNTPAID" DataFormatString="{0:C}" />
                <asp:BoundField DataField="PAYMENTDATE" HeaderText="Payment Date" SortExpression="PAYMENTDATE" DataFormatString="{0:dd-MMM-yyyy}" />
                <asp:BoundField DataField="PAYMENTMETHOD" HeaderText="Method" SortExpression="PAYMENTMETHOD" />
                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkEdit" runat="server" Text="✏️ Edit" CommandName="EditPayment" CommandArgument='<%# Eval("PAYMENTID") %>' CssClass="btn btn-sm btn-primary me-1" />
                        <asp:LinkButton ID="lnkDelete" runat="server" Text="🗑️ Delete" CommandName="DeletePayment" CommandArgument='<%# Eval("PAYMENTID") %>' OnClientClick="return confirm('Delete this payment record?');" CssClass="btn btn-sm btn-danger" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
        ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>"
        ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>"
        SelectCommand="SELECT PAYMENTID, BOOKINGID, AMOUNTPAID, PAYMENTDATE, PAYMENTMETHOD FROM PAYMENT ORDER BY PAYMENTID"
        InsertCommand="INSERT INTO PAYMENT (PAYMENTID, BOOKINGID, AMOUNTPAID, PAYMENTDATE, PAYMENTMETHOD) VALUES (:PAYMENTID, :BOOKINGID, :AMOUNTPAID, TO_DATE(:PAYMENTDATE, 'YYYY-MM-DD'), :PAYMENTMETHOD)"
        UpdateCommand="UPDATE PAYMENT SET BOOKINGID=:BOOKINGID, AMOUNTPAID=:AMOUNTPAID, PAYMENTDATE=TO_DATE(:PAYMENTDATE, 'YYYY-MM-DD'), PAYMENTMETHOD=:PAYMENTMETHOD WHERE PAYMENTID=:PAYMENTID"
        DeleteCommand="DELETE FROM PAYMENT WHERE PAYMENTID=:PAYMENTID">
        <InsertParameters>
            <asp:Parameter Name="PAYMENTID" Type="String" />
            <asp:Parameter Name="BOOKINGID" Type="String" />
            <asp:Parameter Name="AMOUNTPAID" Type="Decimal" />
            <asp:Parameter Name="PAYMENTDATE" Type="String" />
            <asp:Parameter Name="PAYMENTMETHOD" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="BOOKINGID" Type="String" />
            <asp:Parameter Name="AMOUNTPAID" Type="Decimal" />
            <asp:Parameter Name="PAYMENTDATE" Type="String" />
            <asp:Parameter Name="PAYMENTMETHOD" Type="String" />
            <asp:Parameter Name="PAYMENTID" Type="String" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="PAYMENTID" Type="String" />
        </DeleteParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourcePaymentView" runat="server"
        ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>"
        ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>"
        SelectCommand="SELECT p.PAYMENTID, p.BOOKINGID, u.USERNAME, p.AMOUNTPAID, p.PAYMENTDATE, p.PAYMENTMETHOD FROM PAYMENT p INNER JOIN BOOKING b ON p.BOOKINGID = b.BOOKINGID INNER JOIN USER_ACCOUNT u ON b.USERID = u.USERID ORDER BY p.PAYMENTDATE DESC" />

    <asp:SqlDataSource ID="SqlDataSourceBookings" runat="server"
        ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>"
        ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>"
        SelectCommand="SELECT b.BOOKINGID, (b.BOOKINGID || ' - ' || u.USERNAME) AS BOOKINGDISPLAY FROM BOOKING b INNER JOIN USER_ACCOUNT u ON b.USERID = u.USERID ORDER BY b.BOOKINGID" />

</asp:Content>
