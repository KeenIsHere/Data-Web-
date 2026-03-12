<%@ Page Title="User Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserDetails.aspx.cs" Inherits="WebApplication3.UserDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="page-header">
        <h2><i class="fas fa-users"></i> User Account Management</h2>
    </div>

    <div class="formview-container">
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="USERID" DataSourceID="SqlDataSource1" DefaultMode="Insert">
            <EditItemTemplate>
                <div class="row">
                    <div class="col-md-6">
                        <label class="form-label">User ID:</label>
                        <asp:Label ID="USERIDLabel1" runat="server" Text='<%# Eval("USERID") %>' CssClass="form-control-plaintext" />
                        
                        <label class="form-label">User Name:</label>
                        <asp:TextBox ID="USERNAMETextBox" runat="server" Text='<%# Bind("USERNAME") %>' CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ControlToValidate="USERNAMETextBox" 
                            ErrorMessage="User Name is required" ForeColor="Red" Display="Dynamic" />
                        
                        <label class="form-label">User Contact:</label>
                        <asp:TextBox ID="USERCONTACTTextBox" runat="server" Text='<%# Bind("USERCONTACT") %>' CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvUserContact" runat="server" ControlToValidate="USERCONTACTTextBox" 
                            ErrorMessage="Contact is required" ForeColor="Red" Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="revContact" runat="server" ControlToValidate="USERCONTACTTextBox"
                            ErrorMessage="Enter valid phone number" ForeColor="Red" Display="Dynamic"
                            ValidationExpression="^\d{10}$" />
                        
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
                        <label class="form-label">User ID:</label>
                        <asp:TextBox ID="USERIDTextBox" runat="server" Text='<%# Bind("USERID") %>' CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvUserId" runat="server" ControlToValidate="USERIDTextBox" 
                            ErrorMessage="User ID is required" ForeColor="Red" Display="Dynamic" />
                        
                        <label class="form-label">User Name:</label>
                        <asp:TextBox ID="USERNAMETextBox" runat="server" Text='<%# Bind("USERNAME") %>' CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ControlToValidate="USERNAMETextBox" 
                            ErrorMessage="User Name is required" ForeColor="Red" Display="Dynamic" />
                        
                        <label class="form-label">User Contact:</label>
                        <asp:TextBox ID="USERCONTACTTextBox" runat="server" Text='<%# Bind("USERCONTACT") %>' CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvUserContact" runat="server" ControlToValidate="USERCONTACTTextBox" 
                            ErrorMessage="Contact is required" ForeColor="Red" Display="Dynamic" />
                        <asp:RegularExpressionValidator ID="revContact" runat="server" ControlToValidate="USERCONTACTTextBox"
                            ErrorMessage="Enter valid 10-digit phone number" ForeColor="Red" Display="Dynamic"
                            ValidationExpression="^\d{10}$" />
                        
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
                        <label class="form-label">User ID:</label>
                        <asp:Label ID="USERIDLabel" runat="server" Text='<%# Eval("USERID") %>' CssClass="form-control-plaintext" />
                        
                        <label class="form-label">User Name:</label>
                        <asp:Label ID="USERNAMELabel" runat="server" Text='<%# Eval("USERNAME") %>' CssClass="form-control-plaintext" />
                        
                        <label class="form-label">User Contact:</label>
                        <asp:Label ID="USERCONTACTLabel" runat="server" Text='<%# Eval("USERCONTACT") %>' CssClass="form-control-plaintext" />
                        
                        <div class="mt-3">
                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" CssClass="btn-update" />
                            <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" CssClass="btn-delete" 
                                OnClientClick="return confirm('?? WARNING: Deleting this user will also remove:\n\n• All their bookings\n• All their tickets\n• All their payments\n\nThis action cannot be undone!\n\nAre you sure you want to proceed?');" />
                            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add New" CssClass="btn-insert" />
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:FormView>
    </div>

    <div class="mt-4">
        <h3 class="mb-3" style="color: #0D1B2A;"><i class="fas fa-list"></i> All Users</h3>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="USERID" 
            DataSourceID="SqlDataSource1" CssClass="table table-striped table-hover gridview-styled"
            AllowPaging="True" AllowSorting="True" PageSize="10">
            <Columns>
                <asp:BoundField DataField="USERID" HeaderText="User ID" ReadOnly="True" SortExpression="USERID" />
                <asp:BoundField DataField="USERNAME" HeaderText="User Name" SortExpression="USERNAME" />
                <asp:BoundField DataField="USERCONTACT" HeaderText="Contact" SortExpression="USERCONTACT" />
                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" ButtonType="Button" 
                    ControlStyle-CssClass="btn btn-sm btn-primary me-1" />
            </Columns>
            <PagerStyle CssClass="pagination" HorizontalAlign="Center" />
        </asp:GridView>
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" 
        SelectCommand="SELECT USERID, USERNAME, USERCONTACT FROM USER_ACCOUNT ORDER BY USERID"
        InsertCommand="INSERT INTO USER_ACCOUNT (USERID, USERNAME, USERCONTACT) VALUES (:USERID, :USERNAME, :USERCONTACT)"
        UpdateCommand="UPDATE USER_ACCOUNT SET USERNAME = :USERNAME, USERCONTACT = :USERCONTACT WHERE USERID = :USERID"
        DeleteCommand="BEGIN DELETE FROM PAYMENT WHERE BOOKINGID IN (SELECT BOOKINGID FROM BOOKING WHERE USERID = :USERID); DELETE FROM TICKET WHERE BOOKINGID IN (SELECT BOOKINGID FROM BOOKING WHERE USERID = :USERID); DELETE FROM BOOKING WHERE USERID = :USERID; DELETE FROM USER_ACCOUNT WHERE USERID = :USERID; END;">
        <InsertParameters>
            <asp:Parameter Name="USERID" Type="String" />
            <asp:Parameter Name="USERNAME" Type="String" />
            <asp:Parameter Name="USERCONTACT" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="USERNAME" Type="String" />
            <asp:Parameter Name="USERCONTACT" Type="String" />
            <asp:Parameter Name="USERID" Type="String" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="USERID" Type="String" />
        </DeleteParameters>
    </asp:SqlDataSource>

</asp:Content>
