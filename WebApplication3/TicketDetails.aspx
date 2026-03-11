<%@ Page Title="Ticket Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TicketDetails.aspx.cs" Inherits="WebApplication3.TicketDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="page-header">
        <h2><i class="fas fa-ticket-alt"></i> Ticket Management</h2>
    </div>

    <div class="formview-container">
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="TICKETID" DataSourceID="SqlDataSource1" DefaultMode="Insert">
            <EditItemTemplate>
                <div class="row">
                    <div class="col-md-6">
                        <label class="form-label">Ticket ID:</label>
                        <asp:Label ID="TICKETIDLabel1" runat="server" Text='<%# Eval("TICKETID") %>' CssClass="form-control-plaintext" />
                        
                        <label class="form-label">Booking:</label>
                        <asp:DropDownList ID="BOOKINGIDDropDown" runat="server" DataSourceID="SqlDataSourceBookings" 
                            DataTextField="BOOKINGDISPLAY" DataValueField="BOOKINGID" 
                            SelectedValue='<%# Bind("BOOKINGID") %>' CssClass="form-control">
                        </asp:DropDownList>
                        
                        <label class="form-label">Seat:</label>
                        <asp:DropDownList ID="SEATIDDropDown" runat="server" DataSourceID="SqlDataSourceSeats" 
                            DataTextField="SEATDISPLAY" DataValueField="SEATID" 
                            SelectedValue='<%# Bind("SEATID") %>' CssClass="form-control">
                        </asp:DropDownList>
                        
                        <label class="form-label">Base Ticket Price:</label>
                        <asp:TextBox ID="BASETICKETPRICETextBox" runat="server" Text='<%# Bind("BASETICKETPRICE") %>' CssClass="form-control" TextMode="Number" />
                        <asp:RequiredFieldValidator ID="rfvBasePrice" runat="server" ControlToValidate="BASETICKETPRICETextBox" 
                            ErrorMessage="Base Price is required" ForeColor="Red" Display="Dynamic" />
                        
                        <label class="form-label">Final Ticket Price:</label>
                        <asp:TextBox ID="FINALTICKETPRICETextBox" runat="server" Text='<%# Bind("FINALTICKETPRICE") %>' CssClass="form-control" TextMode="Number" />
                        <asp:RequiredFieldValidator ID="rfvFinalPrice" runat="server" ControlToValidate="FINALTICKETPRICETextBox" 
                            ErrorMessage="Final Price is required" ForeColor="Red" Display="Dynamic" />
                        
                        <label class="form-label">Seat Status:</label>
                        <asp:DropDownList ID="SEATSTATUSDropDown" runat="server" SelectedValue='<%# Bind("SEATSTATUS") %>' CssClass="form-control">
                            <asp:ListItem Text="Available" Value="Available"></asp:ListItem>
                            <asp:ListItem Text="Booked" Value="Booked"></asp:ListItem>
                            <asp:ListItem Text="Blocked" Value="Blocked"></asp:ListItem>
                        </asp:DropDownList>
                        
                        <div class="mt-3">
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="btn-update" />
                            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn-cancel" />
                        </div>
                    </div>
                </div>
            </EditItemTemplate>
            
            <InsertItemTemplate>
                <div class="row">
                    <div class="col-md-6">
                        <label class="form-label">Ticket ID:</label>
                        <asp:TextBox ID="TICKETIDTextBox" runat="server" Text='<%# Bind("TICKETID") %>' CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvTicketId" runat="server" ControlToValidate="TICKETIDTextBox" 
                            ErrorMessage="Ticket ID is required" ForeColor="Red" Display="Dynamic" />
                        
                        <label class="form-label">Booking:</label>
                        <asp:DropDownList ID="BOOKINGIDDropDown" runat="server" DataSourceID="SqlDataSourceBookings" 
                            DataTextField="BOOKINGDISPLAY" DataValueField="BOOKINGID" 
                            SelectedValue='<%# Bind("BOOKINGID") %>' CssClass="form-control">
                        </asp:DropDownList>
                        
                        <label class="form-label">Seat:</label>
                        <asp:DropDownList ID="SEATIDDropDown" runat="server" DataSourceID="SqlDataSourceSeats" 
                            DataTextField="SEATDISPLAY" DataValueField="SEATID" 
                            SelectedValue='<%# Bind("SEATID") %>' CssClass="form-control">
                        </asp:DropDownList>
                        
                        <label class="form-label">Base Ticket Price:</label>
                        <asp:TextBox ID="BASETICKETPRICETextBox" runat="server" Text='<%# Bind("BASETICKETPRICE") %>' CssClass="form-control" TextMode="Number" />
                        <asp:RequiredFieldValidator ID="rfvBasePrice" runat="server" ControlToValidate="BASETICKETPRICETextBox" 
                            ErrorMessage="Base Price is required" ForeColor="Red" Display="Dynamic" />
                        
                        <label class="form-label">Final Ticket Price:</label>
                        <asp:TextBox ID="FINALTICKETPRICETextBox" runat="server" Text='<%# Bind("FINALTICKETPRICE") %>' CssClass="form-control" TextMode="Number" />
                        <asp:RequiredFieldValidator ID="rfvFinalPrice" runat="server" ControlToValidate="FINALTICKETPRICETextBox" 
                            ErrorMessage="Final Price is required" ForeColor="Red" Display="Dynamic" />
                        
                        <label class="form-label">Seat Status:</label>
                        <asp:DropDownList ID="SEATSTATUSDropDown" runat="server" SelectedValue='<%# Bind("SEATSTATUS") %>' CssClass="form-control">
                            <asp:ListItem Text="Available" Value="Available"></asp:ListItem>
                            <asp:ListItem Text="Booked" Value="Booked"></asp:ListItem>
                            <asp:ListItem Text="Blocked" Value="Blocked"></asp:ListItem>
                        </asp:DropDownList>
                        
                        <div class="mt-3">
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn-insert" />
                            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn-cancel" />
                        </div>
                    </div>
                </div>
            </InsertItemTemplate>
            
            <ItemTemplate>
                <div class="row">
                    <div class="col-md-6">
                        <label class="form-label">Ticket ID:</label>
                        <asp:Label ID="TICKETIDLabel" runat="server" Text='<%# Eval("TICKETID") %>' CssClass="form-control-plaintext" />
                        
                        <label class="form-label">Booking ID:</label>
                        <asp:Label ID="BOOKINGIDLabel" runat="server" Text='<%# Eval("BOOKINGID") %>' CssClass="form-control-plaintext" />
                        
                        <label class="form-label">Seat ID:</label>
                        <asp:Label ID="SEATIDLabel" runat="server" Text='<%# Eval("SEATID") %>' CssClass="form-control-plaintext" />
                        
                        <label class="form-label">Base Ticket Price:</label>
                        <asp:Label ID="BASETICKETPRICELabel" runat="server" Text='<%# Eval("BASETICKETPRICE", "{0:C}") %>' CssClass="form-control-plaintext" />
                        
                        <label class="form-label">Final Ticket Price:</label>
                        <asp:Label ID="FINALTICKETPRICELabel" runat="server" Text='<%# Eval("FINALTICKETPRICE", "{0:C}") %>' CssClass="form-control-plaintext" />
                        
                        <label class="form-label">Seat Status:</label>
                        <asp:Label ID="SEATSTATUSLabel" runat="server" Text='<%# Eval("SEATSTATUS") %>' CssClass="form-control-plaintext" />
                        
                        <div class="mt-3">
                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" CssClass="btn-update" />
                            <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" CssClass="btn-delete" 
                                OnClientClick="return confirm('Are you sure you want to delete this ticket?');" />
                            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add New" CssClass="btn-insert" />
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:FormView>
    </div>

    <div class="mt-4">
        <h3 class="mb-3" style="color: #0D1B2A;"><i class="fas fa-list"></i> All Tickets</h3>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="TICKETID" 
            DataSourceID="SqlDataSourceTicketView" CssClass="table table-striped table-hover gridview-styled"
            AllowPaging="True" AllowSorting="True" PageSize="10">
            <Columns>
                <asp:BoundField DataField="TICKETID" HeaderText="Ticket ID" ReadOnly="True" SortExpression="TICKETID" />
                <asp:BoundField DataField="BOOKINGID" HeaderText="Booking ID" SortExpression="BOOKINGID" />
                <asp:BoundField DataField="USERNAME" HeaderText="User" SortExpression="USERNAME" />
                <asp:BoundField DataField="SEATNUMBER" HeaderText="Seat" SortExpression="SEATNUMBER" />
                <asp:BoundField DataField="BASETICKETPRICE" HeaderText="Base Price" SortExpression="BASETICKETPRICE" DataFormatString="{0:C}" />
                <asp:BoundField DataField="FINALTICKETPRICE" HeaderText="Final Price" SortExpression="FINALTICKETPRICE" DataFormatString="{0:C}" />
                <asp:BoundField DataField="SEATSTATUS" HeaderText="Status" SortExpression="SEATSTATUS" />
            </Columns>
        </asp:GridView>
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" 
        SelectCommand="SELECT TICKETID, BOOKINGID, SEATID, BASETICKETPRICE, FINALTICKETPRICE, SEATSTATUS FROM TICKET ORDER BY TICKETID"
        InsertCommand="INSERT INTO TICKET (TICKETID, BOOKINGID, SEATID, BASETICKETPRICE, FINALTICKETPRICE, SEATSTATUS) VALUES (:TICKETID, :BOOKINGID, :SEATID, :BASETICKETPRICE, :FINALTICKETPRICE, :SEATSTATUS)"
        UpdateCommand="UPDATE TICKET SET BOOKINGID = :BOOKINGID, SEATID = :SEATID, BASETICKETPRICE = :BASETICKETPRICE, FINALTICKETPRICE = :FINALTICKETPRICE, SEATSTATUS = :SEATSTATUS WHERE TICKETID = :TICKETID"
        DeleteCommand="DELETE FROM TICKET WHERE TICKETID = :TICKETID">
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
        SelectCommand="SELECT b.BOOKINGID, (b.BOOKINGID || ' - ' || u.USERNAME) AS BOOKINGDISPLAY FROM BOOKING b INNER JOIN USER_ACCOUNT u ON b.USERID = u.USERID ORDER BY b.BOOKINGID">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceSeats" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" 
        SelectCommand="SELECT SEATID, ('Seat ' || SEATNUMBER || ' - ' || SEATTYPE) AS SEATDISPLAY FROM SEAT ORDER BY SEATNUMBER">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceTicketView" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" 
        SelectCommand="SELECT t.TICKETID, t.BOOKINGID, u.USERNAME, s.SEATNUMBER, t.BASETICKETPRICE, t.FINALTICKETPRICE, t.SEATSTATUS FROM TICKET t INNER JOIN BOOKING b ON t.BOOKINGID = b.BOOKINGID INNER JOIN USER_ACCOUNT u ON b.USERID = u.USERID INNER JOIN SEAT s ON t.SEATID = s.SEATID ORDER BY t.TICKETID">
    </asp:SqlDataSource>

</asp:Content>
