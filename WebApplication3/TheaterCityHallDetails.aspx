<%@ Page Title="Theater & Hall Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TheaterCityHallDetails.aspx.cs" Inherits="WebApplication3.TheaterCityHallDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="page-header">
        <h2><i class="fas fa-building"></i> Theater & Hall Management</h2>
    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="formview-container">
                <h4 style="color: #0D1B2A;"><i class="fas fa-building"></i> Theater Information</h4>
                <asp:FormView ID="FormViewTheater" runat="server" DataKeyNames="THEATERID" DataSourceID="SqlDataSourceTheater" DefaultMode="ReadOnly"
                    OnModeChanging="FormViewTheater_ModeChanging"
                    OnItemInserted="FormViewTheater_ItemInserted"
                    OnItemUpdated="FormViewTheater_ItemUpdated"
                    OnItemDeleted="FormViewTheater_ItemDeleted">
                    <EditItemTemplate>
                        <label class="form-label">Theater ID:</label>
                        <asp:Label ID="THEATERIDLabel1" runat="server" Text='<%# Eval("THEATERID") %>' CssClass="form-control-plaintext" />
                        
                        <label class="form-label">Theater Name:</label>
                        <asp:TextBox ID="THEATERNAMETextBox" runat="server" Text='<%# Bind("THEATERNAME") %>' CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvTheaterName" runat="server" ControlToValidate="THEATERNAMETextBox" 
                            ErrorMessage="Theater Name is required" ForeColor="Red" Display="Dynamic" />
                        
                        <div class="mt-3">
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="btn-update" />
                            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn-cancel" />
                        </div>
                    </EditItemTemplate>
                    
                    <InsertItemTemplate>
                        <label class="form-label">Theater ID:</label>
                        <asp:TextBox ID="THEATERIDTextBox" runat="server" Text='<%# Bind("THEATERID") %>' CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvTheaterId" runat="server" ControlToValidate="THEATERIDTextBox" 
                            ErrorMessage="Theater ID is required" ForeColor="Red" Display="Dynamic" />
                        
                        <label class="form-label">Theater Name:</label>
                        <asp:TextBox ID="THEATERNAMETextBox" runat="server" Text='<%# Bind("THEATERNAME") %>' CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvTheaterName" runat="server" ControlToValidate="THEATERNAMETextBox" 
                            ErrorMessage="Theater Name is required" ForeColor="Red" Display="Dynamic" />
                        
                        <div class="mt-3">
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn-insert" />
                            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn-cancel" />
                        </div>
                    </InsertItemTemplate>
                    
                    <ItemTemplate>
                        <div class="alert alert-info">
                            <i class="fas fa-info-circle"></i>
                            <strong>Select a theater to edit:</strong> Click the Edit button from theater table.
                        </div>
                        <div class="mt-3">
                            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="? Add New Theater" CssClass="btn-insert" />
                        </div>
                    </ItemTemplate>
                </asp:FormView>
            </div>

            <div class="mt-4">
                <h4 style="color: #0D1B2A;"><i class="fas fa-list"></i> All Theaters</h4>
                <asp:GridView ID="GridViewTheater" runat="server" AutoGenerateColumns="False" DataKeyNames="THEATERID" 
                    DataSourceID="SqlDataSourceTheater" CssClass="table table-striped table-hover gridview-styled"
                    AllowPaging="True" AllowSorting="True" PageSize="5" OnRowCommand="GridViewTheater_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="THEATERID" HeaderText="Theater ID" ReadOnly="True" SortExpression="THEATERID" />
                        <asp:BoundField DataField="THEATERNAME" HeaderText="Theater Name" SortExpression="THEATERNAME" />
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkEditTheater" runat="server" Text="?? Edit" CommandName="EditTheater" CommandArgument='<%# Eval("THEATERID") %>' CssClass="btn btn-sm btn-primary me-1" />
                                <asp:LinkButton ID="lnkDeleteTheater" runat="server" Text="??? Delete" CommandName="Delete" CssClass="btn btn-sm btn-danger" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>

        <div class="col-md-6">
            <div class="formview-container">
                <h4 style="color: #0D1B2A;"><i class="fas fa-door-open"></i> Hall Information</h4>
                <asp:FormView ID="FormViewHall" runat="server" DataKeyNames="HALLID" DataSourceID="SqlDataSourceHall" DefaultMode="ReadOnly"
                    OnModeChanging="FormViewHall_ModeChanging"
                    OnItemInserted="FormViewHall_ItemInserted"
                    OnItemUpdated="FormViewHall_ItemUpdated"
                    OnItemDeleted="FormViewHall_ItemDeleted">
                    <EditItemTemplate>
                        <label class="form-label">Hall ID:</label>
                        <asp:Label ID="HALLIDLabel1" runat="server" Text='<%# Eval("HALLID") %>' CssClass="form-control-plaintext" />
                        
                        <label class="form-label">Theater:</label>
                        <asp:DropDownList ID="THEATERIDDropDown" runat="server" DataSourceID="SqlDataSourceTheaterDropdown" 
                            DataTextField="THEATERNAME" DataValueField="THEATERID" 
                            SelectedValue='<%# Bind("THEATERID") %>' CssClass="form-control">
                        </asp:DropDownList>
                        
                        <label class="form-label">Hall Number:</label>
                        <asp:TextBox ID="HALLNUMBERTextBox" runat="server" Text='<%# Bind("HALLNUMBER") %>' CssClass="form-control" TextMode="Number" />
                        <asp:RequiredFieldValidator ID="rfvHallNumber" runat="server" ControlToValidate="HALLNUMBERTextBox" 
                            ErrorMessage="Hall Number is required" ForeColor="Red" Display="Dynamic" />
                        
                        <label class="form-label">Hall Capacity:</label>
                        <asp:TextBox ID="HALLCAPACITYTextBox" runat="server" Text='<%# Bind("HALLCAPACITY") %>' CssClass="form-control" TextMode="Number" />
                        <asp:RequiredFieldValidator ID="rfvCapacity" runat="server" ControlToValidate="HALLCAPACITYTextBox" 
                            ErrorMessage="Capacity is required" ForeColor="Red" Display="Dynamic" />
                        
                        <div class="mt-3">
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="btn-update" />
                            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn-cancel" />
                        </div>
                    </EditItemTemplate>
                    
                    <InsertItemTemplate>
                        <label class="form-label">Hall ID:</label>
                        <asp:TextBox ID="HALLIDTextBox" runat="server" Text='<%# Bind("HALLID") %>' CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvHallId" runat="server" ControlToValidate="HALLIDTextBox" 
                            ErrorMessage="Hall ID is required" ForeColor="Red" Display="Dynamic" />
                        
                        <label class="form-label">Theater:</label>
                        <asp:DropDownList ID="THEATERIDDropDown" runat="server" DataSourceID="SqlDataSourceTheaterDropdown" 
                            DataTextField="THEATERNAME" DataValueField="THEATERID" 
                            SelectedValue='<%# Bind("THEATERID") %>' CssClass="form-control">
                        </asp:DropDownList>
                        
                        <label class="form-label">Hall Number:</label>
                        <asp:TextBox ID="HALLNUMBERTextBox" runat="server" Text='<%# Bind("HALLNUMBER") %>' CssClass="form-control" TextMode="Number" />
                        <asp:RequiredFieldValidator ID="rfvHallNumber" runat="server" ControlToValidate="HALLNUMBERTextBox" 
                            ErrorMessage="Hall Number is required" ForeColor="Red" Display="Dynamic" />
                        
                        <label class="form-label">Hall Capacity:</label>
                        <asp:TextBox ID="HALLCAPACITYTextBox" runat="server" Text='<%# Bind("HALLCAPACITY") %>' CssClass="form-control" TextMode="Number" />
                        <asp:RequiredFieldValidator ID="rfvCapacity" runat="server" ControlToValidate="HALLCAPACITYTextBox" 
                            ErrorMessage="Capacity is required" ForeColor="Red" Display="Dynamic" />
                        
                        <div class="mt-3">
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn-insert" />
                            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn-cancel" />
                        </div>
                    </InsertItemTemplate>
                    
                    <ItemTemplate>
                        <div class="alert alert-info">
                            <i class="fas fa-info-circle"></i>
                            <strong>Select a hall to edit:</strong> Click the Edit button from hall table.
                        </div>
                        <div class="mt-3">
                            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="? Add New Hall" CssClass="btn-insert" />
                        </div>
                    </ItemTemplate>
                </asp:FormView>
            </div>
        </div>
    </div>

    <div class="mt-4">
        <h3 class="mb-3" style="color: #0D1B2A;"><i class="fas fa-list"></i> All Halls with Theater Information</h3>
        <asp:GridView ID="GridViewHall" runat="server" AutoGenerateColumns="False" DataKeyNames="HALLID" 
            DataSourceID="SqlDataSourceHallView" CssClass="table table-striped table-hover gridview-styled"
            AllowPaging="True" AllowSorting="True" PageSize="10" OnRowCommand="GridViewHall_RowCommand">
            <Columns>
                <asp:BoundField DataField="HALLID" HeaderText="Hall ID" ReadOnly="True" SortExpression="HALLID" />
                <asp:TemplateField HeaderText="Theater Name" SortExpression="THEATERNAME">
                    <ItemTemplate>
                        <i class="fas fa-building" style="color: #E0A80D;"></i>
                        <asp:Label ID="TheaterNameLabel" runat="server" Text='<%# Eval("THEATERNAME") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="HALLNUMBER" HeaderText="Hall Number" SortExpression="HALLNUMBER" />
                <asp:BoundField DataField="HALLCAPACITY" HeaderText="Capacity" SortExpression="HALLCAPACITY" />
                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkEditHall" runat="server" Text="?? Edit" CommandName="EditHall" CommandArgument='<%# Eval("HALLID") %>' CssClass="btn btn-sm btn-primary me-1" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>

    <asp:SqlDataSource ID="SqlDataSourceTheater" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" 
        SelectCommand="SELECT THEATERID, THEATERNAME FROM THEATER ORDER BY THEATERID"
        InsertCommand="INSERT INTO THEATER (THEATERID, THEATERNAME) VALUES (:THEATERID, :THEATERNAME)"
        UpdateCommand="UPDATE THEATER SET THEATERNAME = :THEATERNAME WHERE THEATERID = :THEATERID"
        DeleteCommand="BEGIN DELETE FROM PAYMENT WHERE BOOKINGID IN (SELECT BOOKINGID FROM BOOKING WHERE SHOWID IN (SELECT SHOWID FROM SHOW WHERE HALLID IN (SELECT HALLID FROM HALL WHERE THEATERID = :THEATERID))); DELETE FROM TICKET WHERE BOOKINGID IN (SELECT BOOKINGID FROM BOOKING WHERE SHOWID IN (SELECT SHOWID FROM SHOW WHERE HALLID IN (SELECT HALLID FROM HALL WHERE THEATERID = :THEATERID))); DELETE FROM BOOKING WHERE SHOWID IN (SELECT SHOWID FROM SHOW WHERE HALLID IN (SELECT HALLID FROM HALL WHERE THEATERID = :THEATERID)); DELETE FROM SHOW WHERE HALLID IN (SELECT HALLID FROM HALL WHERE THEATERID = :THEATERID); DELETE FROM HALL WHERE THEATERID = :THEATERID; DELETE FROM THEATER WHERE THEATERID = :THEATERID; END;">
        <InsertParameters>
            <asp:Parameter Name="THEATERID" Type="String" />
            <asp:Parameter Name="THEATERNAME" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="THEATERNAME" Type="String" />
            <asp:Parameter Name="THEATERID" Type="String" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="THEATERID" Type="String" />
        </DeleteParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceHall" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" 
        SelectCommand="SELECT HALLID, THEATERID, HALLNUMBER, HALLCAPACITY FROM HALL ORDER BY HALLID"
        InsertCommand="INSERT INTO HALL (HALLID, THEATERID, HALLNUMBER, HALLCAPACITY) VALUES (:HALLID, :THEATERID, :HALLNUMBER, :HALLCAPACITY)"
        UpdateCommand="UPDATE HALL SET THEATERID = :THEATERID, HALLNUMBER = :HALLNUMBER, HALLCAPACITY = :HALLCAPACITY WHERE HALLID = :HALLID"
        DeleteCommand="BEGIN DELETE FROM PAYMENT WHERE BOOKINGID IN (SELECT BOOKINGID FROM BOOKING WHERE SHOWID IN (SELECT SHOWID FROM SHOW WHERE HALLID = :HALLID)); DELETE FROM TICKET WHERE BOOKINGID IN (SELECT BOOKINGID FROM BOOKING WHERE SHOWID IN (SELECT SHOWID FROM SHOW WHERE HALLID = :HALLID)); DELETE FROM BOOKING WHERE SHOWID IN (SELECT SHOWID FROM SHOW WHERE HALLID = :HALLID); DELETE FROM SHOW WHERE HALLID = :HALLID; DELETE FROM HALL WHERE HALLID = :HALLID; END;">
        <InsertParameters>
            <asp:Parameter Name="HALLID" Type="String" />
            <asp:Parameter Name="THEATERID" Type="String" />
            <asp:Parameter Name="HALLNUMBER" Type="Int32" />
            <asp:Parameter Name="HALLCAPACITY" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="THEATERID" Type="String" />
            <asp:Parameter Name="HALLNUMBER" Type="Int32" />
            <asp:Parameter Name="HALLCAPACITY" Type="Int32" />
            <asp:Parameter Name="HALLID" Type="String" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="HALLID" Type="String" />
        </DeleteParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceTheaterDropdown" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" 
        SelectCommand="SELECT THEATERID, THEATERNAME FROM THEATER ORDER BY THEATERNAME">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceHallView" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" 
        SelectCommand="SELECT h.HALLID, t.THEATERNAME, h.HALLNUMBER, h.HALLCAPACITY FROM HALL h INNER JOIN THEATER t ON h.THEATERID = t.THEATERID ORDER BY h.HALLID">
    </asp:SqlDataSource>

</asp:Content>
