<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication3._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="cinema-header text-center dashboard-hero">
        <h1><i class="fas fa-film"></i> CINEMA MANAGEMENT SYSTEM</h1>
        <p class="lead mb-1">Professional Operations Dashboard</p>
        <p class="mb-0">Manage cinema workflows, transaction records, and analytical reports from one place.</p>
    </div>

    <div class="row g-3 mb-4">
        <div class="col-md-3">
            <div class="metric-card">
                <i class="fas fa-database"></i>
                <h6>Centralized Data</h6>
                <p class="mb-0">Oracle-backed relational modules</p>
            </div>
        </div>
        <div class="col-md-3">
            <div class="metric-card">
                <i class="fas fa-gears"></i>
                <h6>CRUD Workflow</h6>
                <p class="mb-0">Structured master and transaction handling</p>
            </div>
        </div>
        <div class="col-md-3">
            <div class="metric-card">
                <i class="fas fa-chart-column"></i>
                <h6>Reports</h6>
                <p class="mb-0">Filter-ready performance analytics</p>
            </div>
        </div>
        <div class="col-md-3">
            <div class="metric-card">
                <i class="fas fa-user-shield"></i>
                <h6>Professional UX</h6>
                <p class="mb-0">Clean visual hierarchy and controls</p>
            </div>
        </div>
    </div>

    <div class="page-header text-center">
        <h2><i class="fas fa-compass"></i> Options Menu</h2>
    </div>

    <div class="row">
        <div class="col-md-4">
            <a href="UserDetails.aspx" style="text-decoration: none;">
                <div class="card dashboard-card">
                    <div class="card-body">
                        <div class="card-icon"><i class="fas fa-users"></i></div>
                        <h5 class="card-title">Users</h5>
                        <p class="card-text">Create, update, and manage customer accounts.</p>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-md-4">
            <a href="MovieDetails.aspx" style="text-decoration: none;">
                <div class="card dashboard-card">
                    <div class="card-body">
                        <div class="card-icon"><i class="fas fa-clapperboard"></i></div>
                        <h5 class="card-title">Movies</h5>
                        <p class="card-text">Maintain movie catalog, language, and duration details.</p>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-md-4">
            <a href="TheaterCityHallDetails.aspx" style="text-decoration: none;">
                <div class="card dashboard-card">
                    <div class="card-body">
                        <div class="card-icon"><i class="fas fa-building"></i></div>
                        <h5 class="card-title">Theaters & Halls</h5>
                        <p class="card-text">Manage theater entities and hall capacities.</p>
                    </div>
                </div>
            </a>
        </div>
    </div>

    <div class="row mt-2">
        <div class="col-md-4">
            <a href="ShowDetails.aspx" style="text-decoration: none;">
                <div class="card dashboard-card">
                    <div class="card-body">
                        <div class="card-icon"><i class="fas fa-calendar-days"></i></div>
                        <h5 class="card-title">Shows</h5>
                        <p class="card-text">Schedule shows with movie-hall mapping and time setup.</p>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-md-4">
            <a href="TicketDetails.aspx" style="text-decoration: none;">
                <div class="card dashboard-card">
                    <div class="card-body">
                        <div class="card-icon"><i class="fas fa-ticket-alt"></i></div>
                        <h5 class="card-title">Tickets</h5>
                        <p class="card-text">Maintain seat status, base price, and final ticket price.</p>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-md-4">
            <a href="PaymentDetails.aspx" style="text-decoration: none;">
                <div class="card dashboard-card">
                    <div class="card-body">
                        <div class="card-icon"><i class="fas fa-money-check-dollar"></i></div>
                        <h5 class="card-title">Payments</h5>
                        <p class="card-text">Track payment amount, method, and payment history.</p>
                    </div>
                </div>
            </a>
        </div>
    </div>

    <div class="page-header text-center mt-4">
        <h2><i class="fas fa-chart-line"></i> Analytical Reports</h2>
    </div>

    <div class="row mt-2">
        <div class="col-md-4">
            <a href="UserTicket.aspx" style="text-decoration: none;">
                <div class="card dashboard-card">
                    <div class="card-body">
                        <div class="card-icon"><i class="fas fa-user-clock"></i></div>
                        <h5 class="card-title">User Tickets</h5>
                        <p class="card-text">Last 6-month booking history with amount summary.</p>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-md-4">
            <a href="TheaterMovie.aspx" style="text-decoration: none;">
                <div class="card dashboard-card">
                    <div class="card-body">
                        <div class="card-icon"><i class="fas fa-theater-masks"></i></div>
                        <h5 class="card-title">Theater Movies</h5>
                        <p class="card-text">Theater-wise schedule with hall and movie context.</p>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-md-4">
            <a href="OccupancyPerformer.aspx" style="text-decoration: none;">
                <div class="card dashboard-card">
                    <div class="card-body">
                        <div class="card-icon"><i class="fas fa-trophy"></i></div>
                        <h5 class="card-title">Top Occupancy</h5>
                        <p class="card-text">Top 3 hall performers by occupancy percentage.</p>
                    </div>
                </div>
            </a>
        </div>
    </div>

    <div class="workflow-banner mt-4 mb-2">
        <h4><i class="fas fa-map"></i> System Flow</h4>
        <p class="mb-0">Users → Movies/Theaters → Shows → Bookings/Tickets → Payments → Reports</p>
    </div>
</asp:Content>
