<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="movie.aspx.cs" Inherits="WebApplication3.movie" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="MOVIEID" DataSourceID="SqlDataSource2" DefaultMode="Insert">
                <EditItemTemplate>
                    MOVIEID:
                    <asp:Label ID="MOVIEIDLabel1" runat="server" Text='<%# Eval("MOVIEID") %>' />
                    <br />
                    MOVIETITLE:
                    <asp:TextBox ID="MOVIETITLETextBox" runat="server" Text='<%# Bind("MOVIETITLE") %>' />
                    <br />
                    MOVIELANGUAGE:
                    <asp:TextBox ID="MOVIELANGUAGETextBox" runat="server" Text='<%# Bind("MOVIELANGUAGE") %>' />
                    <br />
                    MOVIEDURATION:
                    <asp:TextBox ID="MOVIEDURATIONTextBox" runat="server" Text='<%# Bind("MOVIEDURATION") %>' />
                    <br />
                    RELEASEDATE:
                    <asp:TextBox ID="RELEASEDATETextBox" runat="server" Text='<%# Bind("RELEASEDATE") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    MOVIEID:
                    <asp:TextBox ID="MOVIEIDTextBox" runat="server" Text='<%# Bind("MOVIEID") %>' />
                    <br />
                    MOVIETITLE:
                    <asp:TextBox ID="MOVIETITLETextBox" runat="server" Text='<%# Bind("MOVIETITLE") %>' />
                    <br />
                    MOVIELANGUAGE:
                    <asp:TextBox ID="MOVIELANGUAGETextBox" runat="server" Text='<%# Bind("MOVIELANGUAGE") %>' />
                    <br />
                    MOVIEDURATION:
                    <asp:TextBox ID="MOVIEDURATIONTextBox" runat="server" Text='<%# Bind("MOVIEDURATION") %>' />
                    <br />
                    RELEASEDATE:
                    <asp:TextBox ID="RELEASEDATETextBox" runat="server" Text='<%# Bind("RELEASEDATE") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    MOVIEID:
                    <asp:Label ID="MOVIEIDLabel" runat="server" Text='<%# Eval("MOVIEID") %>' />
                    <br />
                    MOVIETITLE:
                    <asp:Label ID="MOVIETITLELabel" runat="server" Text='<%# Bind("MOVIETITLE") %>' />
                    <br />
                    MOVIELANGUAGE:
                    <asp:Label ID="MOVIELANGUAGELabel" runat="server" Text='<%# Bind("MOVIELANGUAGE") %>' />
                    <br />
                    MOVIEDURATION:
                    <asp:Label ID="MOVIEDURATIONLabel" runat="server" Text='<%# Bind("MOVIEDURATION") %>' />
                    <br />
                    RELEASEDATE:
                    <asp:Label ID="RELEASEDATELabel" runat="server" Text='<%# Bind("RELEASEDATE") %>' />
                    <br />

                </ItemTemplate>
            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT * FROM &quot;MOVIE&quot;"></asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="MOVIEID" DataSourceID="SqlDataSource2">
                <Columns>
                    <asp:BoundField DataField="MOVIEID" HeaderText="MOVIEID" ReadOnly="True" SortExpression="MOVIEID" />
                    <asp:BoundField DataField="MOVIETITLE" HeaderText="MOVIETITLE" SortExpression="MOVIETITLE" />
                    <asp:BoundField DataField="MOVIELANGUAGE" HeaderText="MOVIELANGUAGE" SortExpression="MOVIELANGUAGE" />
                    <asp:BoundField DataField="MOVIEDURATION" HeaderText="MOVIEDURATION" SortExpression="MOVIEDURATION" />
                    <asp:BoundField DataField="RELEASEDATE" HeaderText="RELEASEDATE" SortExpression="RELEASEDATE" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;MOVIE&quot;"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
