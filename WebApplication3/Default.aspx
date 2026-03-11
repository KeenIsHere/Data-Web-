<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication3._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="cinema-header text-center">
        <h1><i class="fas fa-film"></i> CINEMA MANAGEMENT SYSTEM</h1>
        <p class="lead">Pokhara Theater - Complete Management Dashboard</p>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <a href="UserDetails.aspx" style="text-decoration: none;">
                    <div class="card dashboard-card">
                        <div class="card-body">
                            <div class="card-icon">
                                <i class="fas fa-users"></i>
                            </div>
                            <h5 class="card-title">Users</h5>
                            <p class="card-text">Manage user accounts and customer information</p>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-4">
                <a href="MovieDetails.aspx" style="text-decoration: none;">
                    <div class="card dashboard-card">
                        <div class="card-body">
                            <div class="card-icon">
                                <i class="fas fa-film"></i>
                            </div>
                            <h5 class="card-title">Movies</h5>
                            <p class="card-text">Add and manage movie catalog</p>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-4">
                <a href="TicketDetails.aspx" style="text-decoration: none;">
                    <div class="card dashboard-card">
                        <div class="card-body">
                            <div class="card-icon">
                                <i class="fas fa-ticket-alt"></i>
                            </div>
                            <h5 class="card-title">Tickets</h5>
                            <p class="card-text">Track and manage ticket bookings</p>
                        </div>
                    </div>
                </a>
            </div>
        </div>

        <div class="row mt-3">
            <div class="col-md-4">
                <a href="TheaterCityHallDetails.aspx" style="text-decoration: none;">
                    <div class="card dashboard-card">
                        <div class="card-body">
                            <div class="card-icon">
                                <i class="fas fa-building"></i>
                            </div>
                            <h5 class="card-title">Theaters & Halls</h5>
                            <p class="card-text">Manage theater locations and halls</p>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-4">
                <a href="ShowDetails.aspx" style="text-decoration: none;">
                    <div class="card dashboard-card">
                        <div class="card-body">
                            <div class="card-icon">
                                <i class="fas fa-calendar-alt"></i>
                            </div>
                            <h5 class="card-title">Shows</h5>
                            <p class="card-text">Schedule movie showtimes</p>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-4">
                <a href="PaymentDetails.aspx" style="text-decoration: none;">
                    <div class="card dashboard-card">
                        <div class="card-body">
                            <div class="card-icon">
                                <i class="fas fa-money-bill-wave"></i>
                            </div>
                            <h5 class="card-title">Payments</h5>
                            <p class="card-text">View payment transactions</p>
                        </div>
                    </div>
                </a>
            </div>
        </div>

        <div class="page-header text-center mt-5">
            <h2><i class="fas fa-chart-line"></i> Quick Reports</h2>
        </div>

        <div class="row mt-3">
            <div class="col-md-4">
                <a href="UserTicket.aspx" style="text-decoration: none;">
                    <div class="card dashboard-card">
                        <div class="card-body">
                            <div class="card-icon">
                                <i class="fas fa-user-tag"></i>
                            </div>
                            <h5 class="card-title">User Tickets (6 Months)</h5>
                            <p class="card-text">View user ticket history</p>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-4">
                <a href="TheaterMovie.aspx" style="text-decoration: none;">
                    <div class="card dashboard-card">
                        <div class="card-body">
                            <div class="card-icon">
                                <i class="fas fa-theater-masks"></i>
                            </div>
                            <h5 class="card-title">Theater Movies</h5>
                            <p class="card-text">View movies by theater</p>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-4">
                <a href="OccupancyPerformer.aspx" style="text-decoration: none;">
                    <div class="card dashboard-card">
                        <div class="card-body">
                            <div class="card-icon">
                                <i class="fas fa-trophy"></i>
                            </div>
                            <h5 class="card-title">Top Performers</h5>
                            <p class="card-text">View top 3 halls by occupancy</p>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>

</asp:Content>
