<%@ Page Title="Movie Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MovieDetails.aspx.cs" Inherits="WebApplication3.MovieDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="page-header">
        <h2><i class="fas fa-film"></i> Movie Management</h2>
    </div>

    <!-- Success/Error Messages Panel -->
    <asp:Panel ID="pnlMessage" runat="server" Visible="false" CssClass="alert-custom mb-3">
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
    </asp:Panel>

    <div class="formview-container">
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="MOVIEID" DataSourceID="SqlDataSource1" 
            DefaultMode="Insert" AllowPaging="True"
            OnItemInserted="FormView1_ItemInserted"
            OnItemUpdated="FormView1_ItemUpdated"
            OnItemDeleted="FormView1_ItemDeleted"
            OnItemCommand="FormView1_ItemCommand">
            
            <EditItemTemplate>
                <div class="row">
                    <div class="col-md-6">
                        <h4 class="mb-3" style="color: #0D1B2A;"><i class="fas fa-edit"></i> Edit Movie</h4>
                        
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                            CssClass="alert alert-danger" 
                            HeaderText="Please correct the following errors:"
                            DisplayMode="BulletList" />
                        
                        <label class="form-label">Movie ID:</label>
                        <asp:Label ID="MOVIEIDLabel1" runat="server" Text='<%# Eval("MOVIEID") %>' CssClass="form-control-plaintext" />
                        
                        <label class="form-label">Movie Title: <span style="color: red;">*</span></label>
                        <asp:TextBox ID="MOVIETITLETextBox" runat="server" Text='<%# Bind("MOVIETITLE") %>' 
                            CssClass="form-control" MaxLength="100" placeholder="Enter movie title" />
                        <asp:RequiredFieldValidator ID="rfvTitle" runat="server" 
                            ControlToValidate="MOVIETITLETextBox" 
                            ErrorMessage="Movie Title is required" 
                            ForeColor="Red" Display="Dynamic"
                            SetFocusOnError="true">* Movie Title is required</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revTitle" runat="server"
                            ControlToValidate="MOVIETITLETextBox"
                            ValidationExpression="^[a-zA-Z0-9\s:&'-]{2,100}$"
                            ErrorMessage="Title must be 2-100 characters and contain only letters, numbers, and basic punctuation"
                            ForeColor="Red" Display="Dynamic" />
                        
                        <label class="form-label">Language: <span style="color: red;">*</span></label>
                        <asp:TextBox ID="MOVIELANGUAGETextBox" runat="server" Text='<%# Bind("MOVIELANGUAGE") %>' 
                            CssClass="form-control" MaxLength="50" placeholder="e.g., English, Nepali, Hindi" />
                        <asp:RequiredFieldValidator ID="rfvLanguage" runat="server" 
                            ControlToValidate="MOVIELANGUAGETextBox" 
                            ErrorMessage="Language is required" 
                            ForeColor="Red" Display="Dynamic"
                            SetFocusOnError="true">* Language is required</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revLanguage" runat="server"
                            ControlToValidate="MOVIELANGUAGETextBox"
                            ValidationExpression="^[a-zA-Z\s,]{2,50}$"
                            ErrorMessage="Language must contain only letters and be 2-50 characters"
                            ForeColor="Red" Display="Dynamic" />
                        
                        <label class="form-label">Duration (minutes): <span style="color: red;">*</span></label>
                        <asp:TextBox ID="MOVIEDURATIONTextBox" runat="server" Text='<%# Bind("MOVIEDURATION") %>' 
                            CssClass="form-control" TextMode="Number" placeholder="60-500 minutes" />
                        <asp:RequiredFieldValidator ID="rfvDuration" runat="server" 
                            ControlToValidate="MOVIEDURATIONTextBox" 
                            ErrorMessage="Duration is required" 
                            ForeColor="Red" Display="Dynamic"
                            SetFocusOnError="true">* Duration is required</asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="rvDuration" runat="server" 
                            ControlToValidate="MOVIEDURATIONTextBox"
                            MinimumValue="1" MaximumValue="500" Type="Integer"
                            ErrorMessage="Duration must be between 1-500 minutes" 
                            ForeColor="Red" Display="Dynamic">* Duration must be between 1-500 minutes</asp:RangeValidator>
                        <asp:CompareValidator ID="cvDuration" runat="server"
                            ControlToValidate="MOVIEDURATIONTextBox"
                            Operator="DataTypeCheck" Type="Integer"
                            ErrorMessage="Duration must be a valid number"
                            ForeColor="Red" Display="Dynamic" />
                        
                        <label class="form-label">Release Date: <span style="color: red;">*</span></label>
                        <asp:TextBox ID="RELEASEDATETextBox" runat="server" Text='<%# Bind("RELEASEDATE", "{0:dd-MMM-yyyy}") %>' 
                            CssClass="form-control" ReadOnly="true" />
                        <asp:RequiredFieldValidator ID="rfvReleaseDate" runat="server"
                            ControlToValidate="RELEASEDATETextBox"
                            ErrorMessage="Release Date is required"
                            ForeColor="Red" Display="Dynamic">* Please select a release date from the calendar</asp:RequiredFieldValidator>
                        <small class="form-text text-muted">Click a date on the calendar below to select</small>
                        <asp:Calendar ID="CalendarEdit" runat="server" BackColor="White" BorderColor="#999999" 
                            CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" 
                            ForeColor="Black" Height="180px" Width="100%" OnSelectionChanged="CalendarEdit_SelectionChanged">
                            <SelectedDayStyle BackColor="#E0A80D" Font-Bold="True" ForeColor="White" />
                            <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                            <WeekendDayStyle BackColor="#FFFFCC" />
                        </asp:Calendar>
                        
                        <div class="mt-3">
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" 
                                Text="Update Movie" CssClass="btn-update" 
                                OnClientClick="return confirm('Are you sure you want to update this movie information?');" />
                            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" 
                                Text="Cancel" CssClass="btn-cancel" />
                        </div>
                        <small class="form-text text-muted mt-2">* Required fields</small>
                    </div>
                </div>
            </EditItemTemplate>
            
            <InsertItemTemplate>
                <div class="row">
                    <div class="col-md-6">
                        <h4 class="mb-3" style="color: #0D1B2A;"><i class="fas fa-plus-circle"></i> Add New Movie</h4>
                        
                        <asp:ValidationSummary ID="ValidationSummary2" runat="server" 
                            CssClass="alert alert-danger" 
                            HeaderText="Please correct the following errors:"
                            DisplayMode="BulletList" />
                        
                        <label class="form-label">Movie ID: <span style="color: red;">*</span></label>
                        <asp:TextBox ID="MOVIEIDTextBox" runat="server" Text='<%# Bind("MOVIEID") %>' 
                            CssClass="form-control" MaxLength="10" placeholder="e.g., MOV001" />
                        <asp:RequiredFieldValidator ID="rfvMovieId" runat="server" 
                            ControlToValidate="MOVIEIDTextBox" 
                            ErrorMessage="Movie ID is required" 
                            ForeColor="Red" Display="Dynamic"
                            SetFocusOnError="true">* Movie ID is required</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revMovieId" runat="server"
                            ControlToValidate="MOVIEIDTextBox"
                            ValidationExpression="^[A-Z0-9]{3,10}$"
                            ErrorMessage="Movie ID must be 3-10 uppercase letters/numbers (e.g., MOV001)"
                            ForeColor="Red" Display="Dynamic" />
                        <small class="form-text text-muted">Use format: MOV001, MOVIE01, etc.</small>
                        
                        <label class="form-label">Movie Title: <span style="color: red;">*</span></label>
                        <asp:TextBox ID="MOVIETITLETextBox" runat="server" Text='<%# Bind("MOVIETITLE") %>' 
                            CssClass="form-control" MaxLength="100" placeholder="Enter movie title" />
                        <asp:RequiredFieldValidator ID="rfvTitle" runat="server" 
                            ControlToValidate="MOVIETITLETextBox" 
                            ErrorMessage="Movie Title is required" 
                            ForeColor="Red" Display="Dynamic"
                            SetFocusOnError="true">* Movie Title is required</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revTitle" runat="server"
                            ControlToValidate="MOVIETITLETextBox"
                            ValidationExpression="^[a-zA-Z0-9\s:&'-]{2,100}$"
                            ErrorMessage="Title must be 2-100 characters and contain only letters, numbers, and basic punctuation"
                            ForeColor="Red" Display="Dynamic" />
                        
                        <label class="form-label">Language: <span style="color: red;">*</span></label>
                        <asp:TextBox ID="MOVIELANGUAGETextBox" runat="server" Text='<%# Bind("MOVIELANGUAGE") %>' 
                            CssClass="form-control" MaxLength="50" placeholder="e.g., English, Nepali, Hindi" />
                        <asp:RequiredFieldValidator ID="rfvLanguage" runat="server" 
                            ControlToValidate="MOVIELANGUAGETextBox" 
                            ErrorMessage="Language is required" 
                            ForeColor="Red" Display="Dynamic"
                            SetFocusOnError="true">* Language is required</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revLanguage" runat="server"
                            ControlToValidate="MOVIELANGUAGETextBox"
                            ValidationExpression="^[a-zA-Z\s,]{2,50}$"
                            ErrorMessage="Language must contain only letters and be 2-50 characters"
                            ForeColor="Red" Display="Dynamic" />
                        
                        <label class="form-label">Duration (minutes): <span style="color: red;">*</span></label>
                        <asp:TextBox ID="MOVIEDURATIONTextBox" runat="server" Text='<%# Bind("MOVIEDURATION") %>' 
                            CssClass="form-control" TextMode="Number" placeholder="60-500 minutes" />
                        <asp:RequiredFieldValidator ID="rfvDuration" runat="server" 
                            ControlToValidate="MOVIEDURATIONTextBox" 
                            ErrorMessage="Duration is required" 
                            ForeColor="Red" Display="Dynamic"
                            SetFocusOnError="true">* Duration is required</asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="rvDuration" runat="server" 
                            ControlToValidate="MOVIEDURATIONTextBox"
                            MinimumValue="1" MaximumValue="500" Type="Integer"
                            ErrorMessage="Duration must be between 1-500 minutes" 
                            ForeColor="Red" Display="Dynamic">* Duration must be between 1-500 minutes</asp:RangeValidator>
                        <asp:CompareValidator ID="cvDuration" runat="server"
                            ControlToValidate="MOVIEDURATIONTextBox"
                            Operator="DataTypeCheck" Type="Integer"
                            ErrorMessage="Duration must be a valid number"
                            ForeColor="Red" Display="Dynamic" />
                        <small class="form-text text-muted">Typical movie duration: 90-180 minutes</small>
                        
                        <label class="form-label">Release Date: <span style="color: red;">*</span></label>
                        <asp:TextBox ID="RELEASEDATETextBox" runat="server" Text='<%# Bind("RELEASEDATE") %>' 
                            CssClass="form-control" ReadOnly="true" placeholder="Select from calendar below" />
                        <asp:RequiredFieldValidator ID="rfvReleaseDate" runat="server"
                            ControlToValidate="RELEASEDATETextBox"
                            ErrorMessage="Release Date is required"
                            ForeColor="Red" Display="Dynamic">* Please select a release date from the calendar</asp:RequiredFieldValidator>
                        <small class="form-text text-muted">Click a date on the calendar below to select</small>
                        <asp:Calendar ID="CalendarInsert" runat="server" BackColor="White" BorderColor="#999999" 
                            CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" 
                            ForeColor="Black" Height="180px" Width="100%" OnSelectionChanged="CalendarInsert_SelectionChanged">
                            <SelectedDayStyle BackColor="#E0A80D" Font-Bold="True" ForeColor="White" />
                            <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                            <WeekendDayStyle BackColor="#FFFFCC" />
                        </asp:Calendar>
                        
                        <div class="mt-3">
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" 
                                Text="Add Movie" CssClass="btn-insert" />
                            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" 
                                Text="Cancel" CssClass="btn-cancel" />
                        </div>
                        <small class="form-text text-muted mt-2">* Required fields</small>
                    </div>
                </div>
            </InsertItemTemplate>
            
            <ItemTemplate>
                <div class="row">
                    <div class="col-md-6">
                        <h4 class="mb-3" style="color: #0D1B2A;"><i class="fas fa-info-circle"></i> Movie Information</h4>
                        
                        <div class="info-group mb-3">
                            <label class="form-label"><strong>Movie ID:</strong></label>
                            <asp:Label ID="MOVIEIDLabel" runat="server" Text='<%# Eval("MOVIEID") %>' CssClass="form-control-plaintext" />
                        </div>
                        
                        <div class="info-group mb-3">
                            <label class="form-label"><strong>Movie Title:</strong></label>
                            <asp:Label ID="MOVIETITLELabel" runat="server" Text='<%# Eval("MOVIETITLE") %>' CssClass="form-control-plaintext" />
                        </div>
                        
                        <div class="info-group mb-3">
                            <label class="form-label"><strong>Language:</strong></label>
                            <asp:Label ID="MOVIELANGUAGELabel" runat="server" Text='<%# Eval("MOVIELANGUAGE") %>' CssClass="form-control-plaintext" />
                        </div>
                        
                        <div class="info-group mb-3">
                            <label class="form-label"><strong>Duration:</strong></label>
                            <asp:Label ID="MOVIEDURATIONLabel" runat="server" Text='<%# Eval("MOVIEDURATION") + " minutes" %>' CssClass="form-control-plaintext" />
                        </div>
                        
                        <div class="info-group mb-3">
                            <label class="form-label"><strong>Release Date:</strong></label>
                            <asp:Label ID="RELEASEDATELabel" runat="server" Text='<%# Eval("RELEASEDATE", "{0:dd-MMM-yyyy}") %>' CssClass="form-control-plaintext" />
                        </div>
                        
                        <div class="mt-4">
                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" 
                                Text="?? Edit" CssClass="btn-update" />
                            <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" 
                                Text="??? Delete" CssClass="btn-delete" 
                                OnClientClick="return confirm('?? WARNING: Deleting this movie will also remove all related shows, bookings, and tickets.\n\nAre you absolutely sure you want to proceed?');" />
                            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" 
                                Text="? Add New Movie" CssClass="btn-insert" />
                        </div>
                        <small class="form-text text-muted mt-2">
                            <i class="fas fa-info-circle"></i> Click Edit to modify this movie or Add New to create another movie
                        </small>
                    </div>
                </div>
            </ItemTemplate>
        </asp:FormView>
    </div>

    <div class="mt-4">
        <h3 class="mb-3" style="color: #0D1B2A;"><i class="fas fa-list"></i> All Movies</h3>
        <div class="alert alert-info">
            <i class="fas fa-info-circle"></i> 
            <strong>Quick Guide:</strong> Click <strong>Edit</strong> to modify a movie, or <strong>Delete</strong> to remove it. 
            Use the <strong>pagination</strong> at the bottom to navigate through pages.
        </div>
        
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="MOVIEID" 
            DataSourceID="SqlDataSource1" CssClass="table table-striped table-hover gridview-styled"
            AllowPaging="True" AllowSorting="True" PageSize="10" 
            EmptyDataText="No movies found. Click 'Add New Movie' above to create your first movie."
            OnRowDeleting="GridView1_RowDeleting"
            OnRowDataBound="GridView1_RowDataBound">
            <Columns>
                <asp:BoundField DataField="MOVIEID" HeaderText="Movie ID" ReadOnly="True" SortExpression="MOVIEID" />
                <asp:BoundField DataField="MOVIETITLE" HeaderText="Title" SortExpression="MOVIETITLE" />
                <asp:BoundField DataField="MOVIELANGUAGE" HeaderText="Language" SortExpression="MOVIELANGUAGE" />
                <asp:BoundField DataField="MOVIEDURATION" HeaderText="Duration (min)" SortExpression="MOVIEDURATION" />
                <asp:BoundField DataField="RELEASEDATE" HeaderText="Release Date" SortExpression="RELEASEDATE" DataFormatString="{0:dd-MMM-yyyy}" />
                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" ButtonType="Button" 
                    ControlStyle-CssClass="btn btn-sm btn-primary me-1" 
                    DeleteText="Delete"
                    EditText="Edit" />
            </Columns>
            <PagerStyle CssClass="pagination" HorizontalAlign="Center" />
            <EmptyDataTemplate>
                <div class="alert alert-warning text-center">
                    <i class="fas fa-exclamation-triangle"></i> 
                    <strong>No movies found.</strong><br/>
                    Get started by clicking the "Add New Movie" button above.
                </div>
            </EmptyDataTemplate>
        </asp:GridView>
        
        <div class="mt-2">
            <small class="text-muted">
                <i class="fas fa-lightbulb"></i> <strong>Tip:</strong> 
                You can sort the list by clicking on column headers. 
                Use the page numbers at the bottom to navigate through multiple pages.
            </small>
        </div>
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" 
        SelectCommand="SELECT MOVIEID, MOVIETITLE, MOVIELANGUAGE, MOVIEDURATION, RELEASEDATE FROM MOVIE ORDER BY MOVIEID"
        InsertCommand="INSERT INTO MOVIE (MOVIEID, MOVIETITLE, MOVIELANGUAGE, MOVIEDURATION, RELEASEDATE) VALUES (:MOVIEID, :MOVIETITLE, :MOVIELANGUAGE, :MOVIEDURATION, TO_DATE(:RELEASEDATE, 'DD-MON-YYYY'))"
        UpdateCommand="UPDATE MOVIE SET MOVIETITLE = :MOVIETITLE, MOVIELANGUAGE = :MOVIELANGUAGE, MOVIEDURATION = :MOVIEDURATION, RELEASEDATE = TO_DATE(:RELEASEDATE, 'DD-MON-YYYY') WHERE MOVIEID = :MOVIEID"
        DeleteCommand="BEGIN DELETE FROM TICKET WHERE BOOKINGID IN (SELECT BOOKINGID FROM BOOKING WHERE SHOWID IN (SELECT SHOWID FROM SHOW WHERE MOVIEID = :MOVIEID)); DELETE FROM BOOKING WHERE SHOWID IN (SELECT SHOWID FROM SHOW WHERE MOVIEID = :MOVIEID); DELETE FROM SHOW WHERE MOVIEID = :MOVIEID; DELETE FROM MOVIE WHERE MOVIEID = :MOVIEID; END;"
        OnInserted="SqlDataSource1_Inserted"
        OnUpdated="SqlDataSource1_Updated"
        OnDeleted="SqlDataSource1_Deleted">
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
