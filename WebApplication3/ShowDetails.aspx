 <%@ Page Title="Show Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShowDetails.aspx.cs" Inherits="WebApplication3.ShowDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="page-header">
        <h2><i class="fas fa-calendar-alt"></i> Show Time Management</h2>
    </div>

    <div class="formview-container">
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="SHOWID" DataSourceID="SqlDataSource1" DefaultMode="ReadOnly"
            OnItemInserted="FormView1_ItemInserted"
            OnItemUpdated="FormView1_ItemUpdated"
            OnItemDeleted="FormView1_ItemDeleted"
            OnModeChanging="FormView1_ModeChanging">
            <EditItemTemplate>
                <div class="row">
                    <div class="col-md-6">
                        <label class="form-label">Show ID:</label>
                        <asp:Label ID="SHOWIDLabel1" runat="server" Text='<%# Eval("SHOWID") %>' CssClass="form-control-plaintext" />
                        
                        <label class="form-label">Movie:</label>
                        <asp:DropDownList ID="MOVIEIDDropDown" runat="server" DataSourceID="SqlDataSourceMovies" 
                            DataTextField="MOVIETITLE" DataValueField="MOVIEID" 
                            SelectedValue='<%# Bind("MOVIEID") %>' CssClass="form-control">
                        </asp:DropDownList>
                        
                        <label class="form-label">Hall:</label>
                        <asp:DropDownList ID="HALLIDDropDown" runat="server" DataSourceID="SqlDataSourceHalls" 
                            DataTextField="HALLDISPLAY" DataValueField="HALLID" 
                            SelectedValue='<%# Bind("HALLID") %>' CssClass="form-control">
                        </asp:DropDownList>
                        
                        <label class="form-label">Show Date:</label>
                        <asp:TextBox ID="SHOWDATETextBox" runat="server" Text='<%# Bind("SHOWDATE", "{0:yyyy-MM-dd}") %>' CssClass="form-control" TextMode="Date" />
                        
                        <label class="form-label">Show Time:</label>
                        <asp:TextBox ID="SHOWTIMETextBox" runat="server" Text='<%# Bind("SHOWTIME") %>' CssClass="form-control" placeholder="HH:MM" />
                        <asp:RequiredFieldValidator ID="rfvShowTime" runat="server" ControlToValidate="SHOWTIMETextBox" 
                            ErrorMessage="Show Time is required" ForeColor="Red" Display="Dynamic" />
                        
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
                        <label class="form-label">Show ID:</label>
                        <asp:TextBox ID="SHOWIDTextBox" runat="server" Text='<%# Bind("SHOWID") %>' CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvShowId" runat="server" ControlToValidate="SHOWIDTextBox" 
                            ErrorMessage="Show ID is required" ForeColor="Red" Display="Dynamic" />
                        
                        <label class="form-label">Movie:</label>
                        <asp:DropDownList ID="MOVIEIDDropDown" runat="server" DataSourceID="SqlDataSourceMovies" 
                            DataTextField="MOVIETITLE" DataValueField="MOVIEID" 
                            SelectedValue='<%# Bind("MOVIEID") %>' CssClass="form-control">
                        </asp:DropDownList>
                        
                        <label class="form-label">Hall:</label>
                        <asp:DropDownList ID="HALLIDDropDown" runat="server" DataSourceID="SqlDataSourceHalls" 
                            DataTextField="HALLDISPLAY" DataValueField="HALLID" 
                            SelectedValue='<%# Bind("HALLID") %>' CssClass="form-control">
                        </asp:DropDownList>
                        
                        <label class="form-label">Show Date:</label>
                        <asp:TextBox ID="SHOWDATETextBox" runat="server" Text='<%# Bind("SHOWDATE", "{0:yyyy-MM-dd}") %>' CssClass="form-control" TextMode="Date" />
                        
                        <label class="form-label">Show Time:</label>
                        <asp:TextBox ID="SHOWTIMETextBox" runat="server" Text='<%# Bind("SHOWTIME") %>' CssClass="form-control" placeholder="HH:MM" />
                        <asp:RequiredFieldValidator ID="rfvShowTime" runat="server" ControlToValidate="SHOWTIMETextBox" 
                            ErrorMessage="Show Time is required" ForeColor="Red" Display="Dynamic" />
                        
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
                        <div class="alert alert-info">
                            <i class="fas fa-info-circle"></i>
                            <strong>Select a show to edit:</strong> Click the "Edit" button next to any show in the table below.
                        </div>
                        <div class="mt-3">
                            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="➕ Add New Show" CssClass="btn-insert" />
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:FormView>
    </div>

    <div class="mt-4">
        <h3 class="mb-3" style="color: #0D1B2A;"><i class="fas fa-list"></i> All Shows</h3>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="SHOWID" 
            DataSourceID="SqlDataSourceShowView" CssClass="table table-striped table-hover gridview-styled"
            AllowPaging="True" AllowSorting="True" PageSize="10" OnRowCommand="GridView1_RowCommand">
            <Columns>
                <asp:BoundField DataField="SHOWID" HeaderText="Show ID" ReadOnly="True" SortExpression="SHOWID" />
                <asp:TemplateField HeaderText="Movie Title" SortExpression="MOVIETITLE">
                    <ItemTemplate>
                        <i class="fas fa-film" style="color: #E0A80D;"></i>
                        <asp:Label ID="MovieLabel" runat="server" Text='<%# Eval("MOVIETITLE") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Hall" SortExpression="HALLNUMBER">
                    <ItemTemplate>
                        <i class="fas fa-door-open" style="color: #1B263B;"></i>
                        <asp:Label ID="HallLabel" runat="server" Text='<%# "Hall " + Eval("HALLNUMBER") + " - " + Eval("THEATERNAME") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="SHOWDATE" HeaderText="Show Date" SortExpression="SHOWDATE" DataFormatString="{0:dd-MMM-yyyy}" />
                <asp:BoundField DataField="SHOWTIME" HeaderText="Show Time" SortExpression="SHOWTIME" />
                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkEdit" runat="server" Text="✏️ Edit" CommandName="EditShow" CommandArgument='<%# Eval("SHOWID") %>' CssClass="btn btn-sm btn-primary me-1" />
                        <asp:LinkButton ID="lnkDelete" runat="server" Text="🗑️ Delete" CommandName="DeleteShow" CommandArgument='<%# Eval("SHOWID") %>' OnClientClick="return confirm('Delete this show and related records?');" CssClass="btn btn-sm btn-danger" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" 
        SelectCommand="SELECT SHOWID, MOVIEID, HALLID, SHOWDATE, SHOWTIME FROM SHOW ORDER BY SHOWID"
        InsertCommand="INSERT INTO SHOW (SHOWID, MOVIEID, HALLID, SHOWDATE, SHOWTIME) VALUES (:SHOWID, :MOVIEID, :HALLID, TO_DATE(:SHOWDATE, 'YYYY-MM-DD'), :SHOWTIME)"
        UpdateCommand="UPDATE SHOW SET MOVIEID = :MOVIEID, HALLID = :HALLID, SHOWDATE = TO_DATE(:SHOWDATE, 'YYYY-MM-DD'), SHOWTIME = :SHOWTIME WHERE SHOWID = :SHOWID"
        DeleteCommand="BEGIN DELETE FROM PAYMENT WHERE BOOKINGID IN (SELECT BOOKINGID FROM BOOKING WHERE SHOWID = :SHOWID); DELETE FROM TICKET WHERE BOOKINGID IN (SELECT BOOKINGID FROM BOOKING WHERE SHOWID = :SHOWID); DELETE FROM BOOKING WHERE SHOWID = :SHOWID; DELETE FROM SHOW WHERE SHOWID = :SHOWID; END;">
        <InsertParameters>
            <asp:Parameter Name="SHOWID" Type="String" />
            <asp:Parameter Name="MOVIEID" Type="String" />
            <asp:Parameter Name="HALLID" Type="String" />
            <asp:Parameter Name="SHOWDATE" Type="String" />
            <asp:Parameter Name="SHOWTIME" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="MOVIEID" Type="String" />
            <asp:Parameter Name="HALLID" Type="String" />
            <asp:Parameter Name="SHOWDATE" Type="String" />
            <asp:Parameter Name="SHOWTIME" Type="String" />
            <asp:Parameter Name="SHOWID" Type="String" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="SHOWID" Type="String" />
        </DeleteParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceMovies" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" 
        SelectCommand="SELECT MOVIEID, MOVIETITLE FROM MOVIE ORDER BY MOVIETITLE">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceHalls" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" 
        SelectCommand="SELECT h.HALLID, (t.THEATERNAME || ' - Hall ' || h.HALLNUMBER) AS HALLDISPLAY FROM HALL h INNER JOIN THEATER t ON h.THEATERID = t.THEATERID ORDER BY t.THEATERNAME, h.HALLNUMBER">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceShowView" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" 
        SelectCommand="SELECT s.SHOWID, m.MOVIETITLE, h.HALLNUMBER, t.THEATERNAME, s.SHOWDATE, s.SHOWTIME FROM SHOW s INNER JOIN MOVIE m ON s.MOVIEID = m.MOVIEID INNER JOIN HALL h ON s.HALLID = h.HALLID INNER JOIN THEATER t ON h.THEATERID = t.THEATERID ORDER BY s.SHOWDATE DESC, s.SHOWTIME">
    </asp:SqlDataSource>

</asp:Content>
