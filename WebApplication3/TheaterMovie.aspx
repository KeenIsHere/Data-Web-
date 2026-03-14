<%@ Page Title="Theater Movies" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TheaterMovie.aspx.cs" Inherits="WebApplication3.TheaterMovie" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="page-header">
        <h2><i class="fas fa-theater-masks"></i> Theater Movie Schedule</h2>
    </div>

    <div class="formview-container">
        <div class="row">
            <div class="col-md-6">
                <label class="form-label">Select Theater:</label>
                <asp:DropDownList ID="ddlTheater" runat="server" DataSourceID="SqlDataSourceTheaters" 
                    DataTextField="THEATERDISPLAY" DataValueField="THEATERID" 
                    AutoPostBack="True" CssClass="form-control"
                    OnSelectedIndexChanged="ddlTheater_SelectedIndexChanged">
                </asp:DropDownList>
                
                <div class="mt-3">
                    <asp:Button ID="btnFilter" runat="server" Text="View Schedule" OnClick="btnFilter_Click" CssClass="btn-filter" />
                </div>
            </div>
        </div>
    </div>

    <div class="mt-4">
        <h3 class="mb-3" style="color: #0D1B2A;"><i class="fas fa-list"></i> Movie Schedule</h3>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
            CssClass="table table-striped table-hover gridview-styled"
            AllowPaging="True" AllowSorting="True" PageSize="10" EmptyDataText="No movies scheduled for this theater.">
            <Columns>
                <asp:TemplateField HeaderText="Theater" SortExpression="THEATERNAME">
                    <ItemTemplate>
                        <i class="" style="color: #E0A80D;"></i>
                        <asp:Label ID="TheaterLabel" runat="server" Text='<%# Eval("THEATERNAME") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Hall" SortExpression="HALLNUMBER">
                    <ItemTemplate>
                        <i class="" style="color: #1B263B;"></i>
                        <asp:Label ID="HallLabel" runat="server" Text='<%# "Hall " + Eval("HALLNUMBER") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Movie" SortExpression="MOVIETITLE">
                    <ItemTemplate>
                        <i class="" style="color: #E0A80D;"></i>
                        <asp:Label ID="MovieLabel" runat="server" Text='<%# Eval("MOVIETITLE") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="MOVIELANGUAGE" HeaderText="Language" SortExpression="MOVIELANGUAGE" />
                <asp:BoundField DataField="SHOWDATE" HeaderText="Show Date" SortExpression="SHOWDATE" DataFormatString="{0:dd-MMM-yyyy}" />
                <asp:BoundField DataField="SHOWTIME" HeaderText="Show Time" SortExpression="SHOWTIME" />
            </Columns>
        </asp:GridView>
    </div>

    <asp:SqlDataSource ID="SqlDataSourceTheaters" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" 
        SelectCommand="SELECT THEATERID, THEATERNAME AS THEATERDISPLAY FROM THEATER ORDER BY THEATERNAME">
    </asp:SqlDataSource>

</asp:Content>
