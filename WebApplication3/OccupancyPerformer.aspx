<%@ Page Title="Top Performers" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OccupancyPerformer.aspx.cs" Inherits="WebApplication3.OccupancyPerformer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="page-header">
        <h2><i class="fas fa-trophy"></i> Top 3 Hall Performers by Occupancy</h2>
    </div>

    <div class="formview-container">
        <div class="row">
            <div class="col-md-6">
                <label class="form-label">Select Movie:</label>
                <asp:DropDownList ID="ddlMovie" runat="server" DataSourceID="SqlDataSourceMovies" 
                    DataTextField="MOVIETITLE" DataValueField="MOVIEID" 
                    AutoPostBack="True" CssClass="form-control"
                    OnSelectedIndexChanged="ddlMovie_SelectedIndexChanged">
                </asp:DropDownList>
                
                <div class="mt-3">
                    <asp:Button ID="btnFilter" runat="server" Text="View Top Performers" OnClick="btnFilter_Click" CssClass="btn-filter" />
                </div>
            </div>
        </div>
    </div>

    <div class="mt-4">
        <div class="alert alert-warning alert-custom" style="background-color: #fff9e6; border-left: 5px solid #E0A80D;">
            <h4><i class="fas fa-star"></i> Top Performer Information</h4>
            <p>
                This report shows the <strong>Top 3 halls</strong> with the highest occupancy percentage for the selected movie.<br />
                Only <strong>PAID and BOOKED</strong> tickets are counted in the calculation.
            </p>
        </div>
    </div>

    <div class="mt-4">
        <h3 class="mb-3" style="color: #0D1B2A;"><i class="fas fa-chart-bar"></i> Top 3 Halls</h3>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
            CssClass="table table-striped table-hover gridview-styled"
            AllowPaging="False" AllowSorting="False" 
            EmptyDataText="No data available for this movie."
            OnRowDataBound="GridView1_RowDataBound">
            <Columns>
                <asp:TemplateField HeaderText="Rank">
                    <ItemTemplate>
                        <i class="" style="color: #E0A80D; font-size: 1.5rem;"></i>
                        <strong><%# Container.DataItemIndex + 1 %></strong>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Theater" SortExpression="THEATERNAME">
                    <ItemTemplate>
                        <i class="" style="color: #0D1B2A;"></i>
                        <asp:Label ID="TheaterLabel" runat="server" Text='<%# Eval("THEATERNAME") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Hall" SortExpression="HALLNUMBER">
                    <ItemTemplate>
                        <i class="" style="color: #1B263B;"></i>
                        <asp:Label ID="HallLabel" runat="server" Text='<%# "Hall " + Eval("HALLNUMBER") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="BOOKEDSEATS" HeaderText="Booked Seats" SortExpression="BOOKEDSEATS" />
                <asp:BoundField DataField="HALLCAPACITY" HeaderText="Total Capacity" SortExpression="HALLCAPACITY" />
                <asp:TemplateField HeaderText="Occupancy %" SortExpression="OCCUPANCYPERCENTAGE">
                    <ItemTemplate>
                        <strong style="color: #E0A80D; font-size: 1.1rem;">
                            <%# Eval("OCCUPANCYPERCENTAGE") %>%
                        </strong>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>

    <asp:SqlDataSource ID="SqlDataSourceMovies" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" 
        SelectCommand="SELECT MOVIEID, MOVIETITLE FROM MOVIE ORDER BY MOVIETITLE">
    </asp:SqlDataSource>

</asp:Content>
