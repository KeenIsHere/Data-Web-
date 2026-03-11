<%@ Page Title="Movie Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MovieDetails.aspx.cs" Inherits="WebApplication3.MovieDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="page-header">
        <h2><i class="fas fa-film"></i> Movie Management</h2>
    </div>

    <div class="formview-container">
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="MOVIEID" DataSourceID="SqlDataSource1" DefaultMode="Insert" AllowPaging="True">
            <EditItemTemplate>
                <div class="row">
                    <div class="col-md-6">
                        <label class="form-label">Movie ID:</label>
                        <asp:Label ID="MOVIEIDLabel1" runat="server" Text='<%# Eval("MOVIEID") %>' CssClass="form-control-plaintext" />
                        
                        <label class="form-label">Movie Title:</label>
                        <asp:TextBox ID="MOVIETITLETextBox" runat="server" Text='<%# Bind("MOVIETITLE") %>' CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ControlToValidate="MOVIETITLETextBox" 
                            ErrorMessage="Movie Title is required" ForeColor="Red" Display="Dynamic" />
                        
                        <label class="form-label">Language:</label>
                        <asp:TextBox ID="MOVIELANGUAGETextBox" runat="server" Text='<%# Bind("MOVIELANGUAGE") %>' CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvLanguage" runat="server" ControlToValidate="MOVIELANGUAGETextBox" 
                            ErrorMessage="Language is required" ForeColor="Red" Display="Dynamic" />
                        
                        <label class="form-label">Duration (minutes):</label>
                        <asp:TextBox ID="MOVIEDURATIONTextBox" runat="server" Text='<%# Bind("MOVIEDURATION") %>' CssClass="form-control" TextMode="Number" />
                        <asp:RequiredFieldValidator ID="rfvDuration" runat="server" ControlToValidate="MOVIEDURATIONTextBox" 
                            ErrorMessage="Duration is required" ForeColor="Red" Display="Dynamic" />
                        <asp:RangeValidator ID="rvDuration" runat="server" ControlToValidate="MOVIEDURATIONTextBox"
                            MinimumValue="1" MaximumValue="500" Type="Integer"
                            ErrorMessage="Duration must be between 1-500 minutes" ForeColor="Red" Display="Dynamic" />
                        
                        <label class="form-label">Release Date:</label>
                        <asp:TextBox ID="RELEASEDATETextBox" runat="server" Text='<%# Bind("RELEASEDATE", "{0:dd-MMM-yyyy}") %>' CssClass="form-control" />
                        <asp:Calendar ID="CalendarEdit" runat="server" BackColor="White" BorderColor="#999999" 
                            CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" 
                            ForeColor="Black" Height="180px" Width="100%" OnSelectionChanged="CalendarEdit_SelectionChanged">
                            <SelectedDayStyle BackColor="#E0A80D" Font-Bold="True" ForeColor="White" />
                            <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                            <WeekendDayStyle BackColor="#FFFFCC" />
                        </asp:Calendar>
                        
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
                        <label class="form-label">Movie ID:</label>
                        <asp:TextBox ID="MOVIEIDTextBox" runat="server" Text='<%# Bind("MOVIEID") %>' CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvMovieId" runat="server" ControlToValidate="MOVIEIDTextBox" 
                            ErrorMessage="Movie ID is required" ForeColor="Red" Display="Dynamic" />
                        
                        <label class="form-label">Movie Title:</label>
                        <asp:TextBox ID="MOVIETITLETextBox" runat="server" Text='<%# Bind("MOVIETITLE") %>' CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ControlToValidate="MOVIETITLETextBox" 
                            ErrorMessage="Movie Title is required" ForeColor="Red" Display="Dynamic" />
                        
                        <label class="form-label">Language:</label>
                        <asp:TextBox ID="MOVIELANGUAGETextBox" runat="server" Text='<%# Bind("MOVIELANGUAGE") %>' CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvLanguage" runat="server" ControlToValidate="MOVIELANGUAGETextBox" 
                            ErrorMessage="Language is required" ForeColor="Red" Display="Dynamic" />
                        
                        <label class="form-label">Duration (minutes):</label>
                        <asp:TextBox ID="MOVIEDURATIONTextBox" runat="server" Text='<%# Bind("MOVIEDURATION") %>' CssClass="form-control" TextMode="Number" />
                        <asp:RequiredFieldValidator ID="rfvDuration" runat="server" ControlToValidate="MOVIEDURATIONTextBox" 
                            ErrorMessage="Duration is required" ForeColor="Red" Display="Dynamic" />
                        <asp:RangeValidator ID="rvDuration" runat="server" ControlToValidate="MOVIEDURATIONTextBox"
                            MinimumValue="1" MaximumValue="500" Type="Integer"
                            ErrorMessage="Duration must be between 1-500 minutes" ForeColor="Red" Display="Dynamic" />
                        
                        <label class="form-label">Release Date:</label>
                        <asp:TextBox ID="RELEASEDATETextBox" runat="server" Text='<%# Bind("RELEASEDATE") %>' CssClass="form-control" ReadOnly="true" />
                        <asp:Calendar ID="CalendarInsert" runat="server" BackColor="White" BorderColor="#999999" 
                            CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" 
                            ForeColor="Black" Height="180px" Width="100%" OnSelectionChanged="CalendarInsert_SelectionChanged">
                            <SelectedDayStyle BackColor="#E0A80D" Font-Bold="True" ForeColor="White" />
                            <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                            <WeekendDayStyle BackColor="#FFFFCC" />
                        </asp:Calendar>
                        
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
                        <label class="form-label">Movie ID:</label>
                        <asp:Label ID="MOVIEIDLabel" runat="server" Text='<%# Eval("MOVIEID") %>' CssClass="form-control-plaintext" />
                        
                        <label class="form-label">Movie Title:</label>
                        <asp:Label ID="MOVIETITLELabel" runat="server" Text='<%# Eval("MOVIETITLE") %>' CssClass="form-control-plaintext" />
                        
                        <label class="form-label">Language:</label>
                        <asp:Label ID="MOVIELANGUAGELabel" runat="server" Text='<%# Eval("MOVIELANGUAGE") %>' CssClass="form-control-plaintext" />
                        
                        <label class="form-label">Duration:</label>
                        <asp:Label ID="MOVIEDURATIONLabel" runat="server" Text='<%# Eval("MOVIEDURATION") %>' CssClass="form-control-plaintext" />
                        
                        <label class="form-label">Release Date:</label>
                        <asp:Label ID="RELEASEDATELabel" runat="server" Text='<%# Eval("RELEASEDATE", "{0:dd-MMM-yyyy}") %>' CssClass="form-control-plaintext" />
                        
                        <div class="mt-3">
                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" CssClass="btn-update" />
                            <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" CssClass="btn-delete" 
                                OnClientClick="return confirm('Are you sure you want to delete this movie?');" />
                            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add New" CssClass="btn-insert" />
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:FormView>
    </div>

    <div class="mt-4">
        <h3 class="mb-3" style="color: #0D1B2A;"><i class="fas fa-list"></i> All Movies</h3>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="MOVIEID" 
            DataSourceID="SqlDataSource1" CssClass="table table-striped table-hover gridview-styled"
            AllowPaging="True" AllowSorting="True" PageSize="10">
            <Columns>
                <asp:BoundField DataField="MOVIEID" HeaderText="Movie ID" ReadOnly="True" SortExpression="MOVIEID" />
                <asp:BoundField DataField="MOVIETITLE" HeaderText="Title" SortExpression="MOVIETITLE" />
                <asp:BoundField DataField="MOVIELANGUAGE" HeaderText="Language" SortExpression="MOVIELANGUAGE" />
                <asp:BoundField DataField="MOVIEDURATION" HeaderText="Duration (min)" SortExpression="MOVIEDURATION" />
                <asp:BoundField DataField="RELEASEDATE" HeaderText="Release Date" SortExpression="RELEASEDATE" DataFormatString="{0:dd-MMM-yyyy}" />
                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" ButtonType="Button" 
                    ControlStyle-CssClass="btn btn-sm btn-primary me-1" />
            </Columns>
            <PagerStyle CssClass="pagination" HorizontalAlign="Center" />
        </asp:GridView>
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" 
        SelectCommand="SELECT MOVIEID, MOVIETITLE, MOVIELANGUAGE, MOVIEDURATION, RELEASEDATE FROM MOVIE ORDER BY MOVIEID"
        InsertCommand="INSERT INTO MOVIE (MOVIEID, MOVIETITLE, MOVIELANGUAGE, MOVIEDURATION, RELEASEDATE) VALUES (:MOVIEID, :MOVIETITLE, :MOVIELANGUAGE, :MOVIEDURATION, TO_DATE(:RELEASEDATE, 'DD-MON-YYYY'))"
        UpdateCommand="UPDATE MOVIE SET MOVIETITLE = :MOVIETITLE, MOVIELANGUAGE = :MOVIELANGUAGE, MOVIEDURATION = :MOVIEDURATION, RELEASEDATE = TO_DATE(:RELEASEDATE, 'DD-MON-YYYY') WHERE MOVIEID = :MOVIEID"
        DeleteCommand="DELETE FROM MOVIE WHERE MOVIEID = :MOVIEID">
        <InsertParameters>
            <asp:Parameter Name="MOVIEID" Type="String" />
            <asp:Parameter Name="MOVIETITLE" Type="String" />
            <asp:Parameter Name="MOVIELANGUAGE" Type="String" />
            <asp:Parameter Name="MOVIEDURATION" Type="Int32" />
            <asp:Parameter Name="RELEASEDATE" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="MOVIETITLE" Type="String" />
            <asp:Parameter Name="MOVIELANGUAGE" Type="String" />
            <asp:Parameter Name="MOVIEDURATION" Type="Int32" />
            <asp:Parameter Name="RELEASEDATE" Type="String" />
            <asp:Parameter Name="MOVIEID" Type="String" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="MOVIEID" Type="String" />
        </DeleteParameters>
    </asp:SqlDataSource>

</asp:Content>
