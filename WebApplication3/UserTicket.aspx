<%@ Page Title="User Ticket History" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserTicket.aspx.cs" Inherits="WebApplication3.UserTicket" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="page-header">
        <h2><i class="fas fa-user-tag"></i> User Ticket History (Last 6 Months)</h2>
    </div>

    <div class="formview-container">
        <div class="row">
            <div class="col-md-6">
                <label class="form-label">Select User:</label>
                <asp:DropDownList ID="ddlUser" runat="server" DataSourceID="SqlDataSourceUsers" 
                    DataTextField="USERNAME" DataValueField="USERID" 
                    AutoPostBack="True" CssClass="form-control"
                    OnSelectedIndexChanged="ddlUser_SelectedIndexChanged">
                </asp:DropDownList>
                
                <div class="mt-3">
                    <asp:Button ID="btnFilter" runat="server" Text="View Tickets" OnClick="btnFilter_Click" CssClass="btn-filter" />
                </div>
            </div>
        </div>
    </div>

    <div class="mt-4">
        <div class="alert alert-info alert-custom">
            <h4><i class="fas fa-info-circle"></i> Ticket Summary</h4>
            <p>
                <strong>Total Tickets:</strong> <asp:Label ID="lblTotalTickets" runat="server" Text="0"></asp:Label><br />
                <strong>Total Amount:</strong> <asp:Label ID="lblTotalAmount" runat="server" Text="Rs. 0.00"></asp:Label>
            </p>
        </div>
    </div>

    <div class="mt-4">
        <h3 class="mb-3" style="color: #0D1B2A;"><i class="fas fa-list"></i> Ticket History</h3>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
            CssClass="table table-striped table-hover gridview-styled"
            AllowPaging="True" AllowSorting="True" PageSize="10" EmptyDataText="No tickets found for this user in the last 6 months.">
            <Columns>
                <asp:BoundField DataField="USERNAME" HeaderText="User Name" SortExpression="USERNAME" />
                <asp:BoundField DataField="BOOKINGDATETIME" HeaderText="Booking Date" SortExpression="BOOKINGDATETIME" DataFormatString="{0:dd-MMM-yyyy HH:mm}" />
                <asp:BoundField DataField="TICKETID" HeaderText="Ticket ID" SortExpression="TICKETID" />
                <asp:BoundField DataField="MOVIETITLE" HeaderText="Movie" SortExpression="MOVIETITLE" />
                <asp:BoundField DataField="SHOWDATE" HeaderText="Show Date" SortExpression="SHOWDATE" DataFormatString="{0:dd-MMM-yyyy}" />
                <asp:BoundField DataField="SHOWTIME" HeaderText="Show Time" SortExpression="SHOWTIME" />
                <asp:BoundField DataField="FINALTICKETPRICE" HeaderText="Price" SortExpression="FINALTICKETPRICE" DataFormatString="{0:C}" />
            </Columns>
        </asp:GridView>
    </div>

    <asp:SqlDataSource ID="SqlDataSourceUsers" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" 
        SelectCommand="SELECT USERID, USERNAME FROM USER_ACCOUNT ORDER BY USERNAME">
    </asp:SqlDataSource>

</asp:Content>
