<%@ Page Title="Ticket Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TicketDetails.aspx.cs" Inherits="WebApplication3.TicketDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="page-header">
        <h2><i class="fas fa-ticket-alt"></i> Ticket Management</h2>
    </div>

    <div class="formview-container">
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="TICKETID" DataSourceID="SqlDataSource1" DefaultMode="ReadOnly"
            OnItemInserted="FormView1_ItemInserted"
            OnItemUpdated="FormView1_ItemUpdated"
            OnItemDeleted="FormView1_ItemDeleted"
            OnModeChanging="FormView1_ModeChanging">

            <EditItemTemplate>
                <label class="form-label">Ticket ID:</label>
                <asp:Label ID="TICKETIDLabel1" runat="server" Text='<%# Eval("TICKETID") %>' CssClass="form-control-plaintext" />

                <label class="form-label">Booking:</label>
                <asp:DropDownList ID="BOOKINGIDDropDown" runat="server" DataSourceID="SqlDataSourceBookings" DataTextField="BOOKINGDISPLAY" DataValueField="BOOKINGID" SelectedValue='<%# Bind("BOOKINGID") %>' CssClass="form-control" />

                <label class="form-label">Seat:</label>
                <asp:DropDownList ID="SEATIDDropDown" runat="server" DataSourceID="SqlDataSourceSeats" DataTextField="SEATDISPLAY" DataValueField="SEATID" SelectedValue='<%# Bind("SEATID") %>' CssClass="form-control" />

                <label class="form-label">Base Ticket Price:</label>
                <asp:TextBox ID="BASETICKETPRICETextBox" runat="server" Text='<%# Bind("BASETICKETPRICE") %>' CssClass="form-control" TextMode="Number" />

                <label class="form-label">Final Ticket Price:</label>
                <asp:TextBox ID="FINALTICKETPRICETextBox" runat="server" Text='<%# Bind("FINALTICKETPRICE") %>' CssClass="form-control" TextMode="Number" />

                <label class="form-label">Seat Status:</label>
                <asp:DropDownList ID="SEATSTATUSDropDown" runat="server" SelectedValue='<%# Bind("SEATSTATUS") %>' CssClass="form-control">
                    <asp:ListItem Text="Available" Value="Available" />
                    <asp:ListItem Text="Booked" Value="Booked" />
                    <asp:ListItem Text="Blocked" Value="Blocked" />
                </asp:DropDownList>

                <div class="mt-3">
                    <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update" Text="Update" CssClass="btn-update" />
                    <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn-cancel" CausesValidation="False" />
                </div>
            </EditItemTemplate>

            <InsertItemTemplate>
                <label class="form-label">Ticket ID:</label>
                <asp:TextBox ID="TICKETIDTextBox" runat="server" Text='<%# Bind("TICKETID") %>' CssClass="form-control" />

                <label class="form-label">Booking:</label>
                <asp:DropDownList ID="BOOKINGIDDropDown" runat="server" DataSourceID="SqlDataSourceBookings" DataTextField="BOOKINGDISPLAY" DataValueField="BOOKINGID" SelectedValue='<%# Bind("BOOKINGID") %>' CssClass="form-control" />

                <label class="form-label">Seat:</label>
                <asp:DropDownList ID="SEATIDDropDown" runat="server" DataSourceID="SqlDataSourceSeats" DataTextField="SEATDISPLAY" DataValueField="SEATID" SelectedValue='<%# Bind("SEATID") %>' CssClass="form-control" />

                <label class="form-label">Base Ticket Price:</label>
                <asp:TextBox ID="BASETICKETPRICETextBox" runat="server" Text='<%# Bind("BASETICKETPRICE") %>' CssClass="form-control" TextMode="Number" />

                <label class="form-label">Final Ticket Price:</label>
                <asp:TextBox ID="FINALTICKETPRICETextBox" runat="server" Text='<%# Bind("FINALTICKETPRICE") %>' CssClass="form-control" TextMode="Number" />

                <label class="form-label">Seat Status:</label>
                <asp:DropDownList ID="SEATSTATUSDropDown" runat="server" SelectedValue='<%# Bind("SEATSTATUS") %>' CssClass="form-control">
                    <asp:ListItem Text="Available" Value="Available" />
                    <asp:ListItem Text="Booked" Value="Booked" />
                    <asp:ListItem Text="Blocked" Value="Blocked" />
                </asp:DropDownList>

                <div class="mt-3">
                    <asp:LinkButton ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" CssClass="btn-insert" />
                    <asp:LinkButton ID="CancelInsertButton" runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn-cancel" CausesValidation="False" />
                </div>
            </InsertItemTemplate>

            <ItemTemplate>
                <div class="alert alert-info">
                    <i class="fas fa-info-circle"></i>
                    <strong>Select a ticket to edit:</strong> Click the Edit button in the table below.
                </div>
                <div class="mt-3">
                    <asp:LinkButton ID="NewButton" runat="server" CommandName="New" Text="Add New Ticket" CssClass="btn-insert" CausesValidation="False" />
                </div>
            </ItemTemplate>
        </asp:FormView>
    </div>

    <div class="mt-4">
        <h3 class="mb-3" style="color: #0D1B2A;"><i class="fas fa-list"></i> All Tickets</h3>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="TICKETID"
            DataSourceID="SqlDataSourceTicketView" CssClass="table table-striped table-hover gridview-styled"
            AllowPaging="True" AllowSorting="True" PageSize="10" OnRowCommand="GridView1_RowCommand">
            <Columns>
                <asp:BoundField DataField="TICKETID" HeaderText="Ticket ID" />
                <asp:BoundField DataField="BOOKINGID" HeaderText="Booking ID" />
                <asp:BoundField DataField="USERNAME" HeaderText="User" />
                <asp:BoundField DataField="SEATNUMBER" HeaderText="Seat" />
                <asp:BoundField DataField="BASETICKETPRICE" HeaderText="Base Price" />
                <asp:BoundField DataField="FINALTICKETPRICE" HeaderText="Final Price"  />
                <asp:BoundField DataField="SEATSTATUS" HeaderText="Status" />
                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CommandName="EditTicket" CommandArgument='<%# Eval("TICKETID") %>' CssClass="btn btn-sm btn-primary me-1" />
                        <asp:LinkButton ID="lnkDelete" runat="server" Text="Delete" CommandName="DeleteTicket" CommandArgument='<%# Eval("TICKETID") %>' OnClientClick="return confirm('Delete this ticket?');" CssClass="btn btn-sm btn-danger" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
        ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>"
        ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>"
        SelectCommand="SELECT TICKETID, BOOKINGID, SEATID, BASETICKETPRICE, FINALTICKETPRICE, SEATSTATUS FROM TICKET ORDER BY TICKETID"
        InsertCommand="INSERT INTO TICKET (TICKETID, BOOKINGID, SEATID, BASETICKETPRICE, FINALTICKETPRICE, SEATSTATUS) VALUES (:TICKETID, :BOOKINGID, :SEATID, :BASETICKETPRICE, :FINALTICKETPRICE, :SEATSTATUS)"
        UpdateCommand="UPDATE TICKET SET BOOKINGID=:BOOKINGID, SEATID=:SEATID, BASETICKETPRICE=:BASETICKETPRICE, FINALTICKETPRICE=:FINALTICKETPRICE, SEATSTATUS=:SEATSTATUS WHERE TICKETID=:TICKETID"
        DeleteCommand="DELETE FROM TICKET WHERE TICKETID=:TICKETID">
        <InsertParameters>
            <asp:Parameter Name="TICKETID" Type="String" />
            <asp:Parameter Name="BOOKINGID" Type="String" />
            <asp:Parameter Name="SEATID" Type="String" />
            <asp:Parameter Name="BASETICKETPRICE" Type="Decimal" />
            <asp:Parameter Name="FINALTICKETPRICE" Type="Decimal" />
            <asp:Parameter Name="SEATSTATUS" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="BOOKINGID" Type="String" />
            <asp:Parameter Name="SEATID" Type="String" />
            <asp:Parameter Name="BASETICKETPRICE" Type="Decimal" />
            <asp:Parameter Name="FINALTICKETPRICE" Type="Decimal" />
            <asp:Parameter Name="SEATSTATUS" Type="String" />
            <asp:Parameter Name="TICKETID" Type="String" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="TICKETID" Type="String" />
        </DeleteParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceBookings" runat="server"
        ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>"
        ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>"
        SelectCommand="SELECT b.BOOKINGID, (b.BOOKINGID || ' - ' || u.USERNAME) AS BOOKINGDISPLAY FROM BOOKING b INNER JOIN USER_ACCOUNT u ON b.USERID = u.USERID ORDER BY b.BOOKINGID" />

    <asp:SqlDataSource ID="SqlDataSourceSeats" runat="server"
        ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>"
        ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>"
        SelectCommand="SELECT SEATID, ('Seat ' || SEATNUMBER || ' - ' || SEATTYPE) AS SEATDISPLAY FROM SEAT ORDER BY SEATNUMBER" />

    <asp:SqlDataSource ID="SqlDataSourceTicketView" runat="server"
        ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>"
        ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>"
        SelectCommand="SELECT t.TICKETID, t.BOOKINGID, u.USERNAME, s.SEATNUMBER, t.BASETICKETPRICE, t.FINALTICKETPRICE, t.SEATSTATUS FROM TICKET t INNER JOIN BOOKING b ON t.BOOKINGID = b.BOOKINGID INNER JOIN USER_ACCOUNT u ON b.USERID = u.USERID INNER JOIN SEAT s ON t.SEATID = s.SEATID ORDER BY t.TICKETID" />

</asp:Content>
