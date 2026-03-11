<%@ Page Title="Payment Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PaymentDetails.aspx.cs" Inherits="WebApplication3.PaymentDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="page-header">
        <h2><i class="fas fa-money-bill-wave"></i> Payment Management</h2>
    </div>

    <div class="mt-4">
        <h3 class="mb-3" style="color: #0D1B2A;"><i class="fas fa-list"></i> All Payments</h3>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="PAYMENTID" 
            DataSourceID="SqlDataSource1" CssClass="table table-striped table-hover gridview-styled"
            AllowPaging="True" AllowSorting="True" PageSize="10">
            <Columns>
                <asp:BoundField DataField="PAYMENTID" HeaderText="Payment ID" ReadOnly="True" SortExpression="PAYMENTID" />
                <asp:BoundField DataField="BOOKINGID" HeaderText="Booking ID" SortExpression="BOOKINGID" />
                <asp:BoundField DataField="USERNAME" HeaderText="User" SortExpression="USERNAME" />
                <asp:BoundField DataField="AMOUNTPAID" HeaderText="Amount Paid" SortExpression="AMOUNTPAID" DataFormatString="{0:C}" />
                <asp:BoundField DataField="PAYMENTDATE" HeaderText="Payment Date" SortExpression="PAYMENTDATE" DataFormatString="{0:dd-MMM-yyyy}" />
                <asp:BoundField DataField="PAYMENTMETHOD" HeaderText="Method" SortExpression="PAYMENTMETHOD" />
            </Columns>
        </asp:GridView>
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" 
        SelectCommand="SELECT p.PAYMENTID, p.BOOKINGID, u.USERNAME, p.AMOUNTPAID, p.PAYMENTDATE, p.PAYMENTMETHOD FROM PAYMENT p INNER JOIN BOOKING b ON p.BOOKINGID = b.BOOKINGID INNER JOIN USER_ACCOUNT u ON b.USERID = u.USERID ORDER BY p.PAYMENTDATE DESC">
    </asp:SqlDataSource>

</asp:Content>
