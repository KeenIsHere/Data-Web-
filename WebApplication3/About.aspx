<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="WebApplication3.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="about-hero">
        <div class="about-hero-overlay">
            <h1><i class="fas fa-clapperboard"></i> About Cinema Management System</h1>
            <p class="lead mb-0">A professional academic platform for cinema operations, reporting, and business insights.</p>
        </div>
    </div>

    <div class="row g-4 mt-2">
        <div class="col-lg-4">
            <div class="info-card h-100">
                <div class="info-icon"><i class="fas fa-bullseye"></i></div>
                <h4>Vision</h4>
                <p>Deliver a secure and practical cinema management solution with clean workflows for administration, bookings, and analytics.</p>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="info-card h-100">
                <div class="info-icon"><i class="fas fa-layer-group"></i></div>
                <h4>Technology</h4>
                <p>Built with ASP.NET Web Forms, C#, Oracle database integration, Bootstrap UI, and modular CRUD/report pages.</p>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="info-card h-100">
                <div class="info-icon"><i class="fas fa-shield-halved"></i></div>
                <h4>Professional Focus</h4>
                <p>Structured implementation with validation, dependency-safe delete flows, parameterized reporting queries, and consistent UX.</p>
            </div>
        </div>
    </div>

    <section class="mt-5">
        <div class="page-header text-center">
            <h2><i class="fas fa-route"></i> Guided Tour of the Complete System</h2>
        </div>

        <div class="tour-step">
            <div class="tour-badge">1</div>
            <div>
                <h5>Dashboard Entry Point</h5>
                <p class="mb-0">Use the homepage dashboard for fast navigation to all management modules and analytical reports.</p>
            </div>
        </div>

        <div class="tour-step">
            <div class="tour-badge">2</div>
            <div>
                <h5>Master Data Setup</h5>
                <p class="mb-0">Create foundational records in <strong>Users</strong>, <strong>Movies</strong>, and <strong>Theaters & Halls</strong> modules.</p>
            </div>
        </div>

        <div class="tour-step">
            <div class="tour-badge">3</div>
            <div>
                <h5>Operational Scheduling</h5>
                <p class="mb-0">Configure shows by mapping movies with halls and defining show date/time schedules.</p>
            </div>
        </div>

        <div class="tour-step">
            <div class="tour-badge">4</div>
            <div>
                <h5>Transaction Processing</h5>
                <p class="mb-0">Manage ticket records and payment details to maintain booking and revenue consistency.</p>
            </div>
        </div>

        <div class="tour-step">
            <div class="tour-badge">5</div>
            <div>
                <h5>Business Reporting</h5>
                <p class="mb-0">Analyze performance using User Ticket history, Theater Movie schedule mapping, and Occupancy Top Performers.</p>
            </div>
        </div>
    </section>

    <section class="mt-4 mb-2">
        <div class="row g-4">
            <div class="col-md-6">
                <div class="guide-panel h-100">
                    <h5><i class="fas fa-sitemap"></i> Core Modules</h5>
                    <ul class="mb-0">
                        <li>User Management</li>
                        <li>Movie Management</li>
                        <li>Theater & Hall Management</li>
                        <li>Show Scheduling</li>
                        <li>Ticket & Payment Processing</li>
                    </ul>
                </div>
            </div>
            <div class="col-md-6">
                <div class="guide-panel h-100">
                    <h5><i class="fas fa-chart-pie"></i> Analytics Modules</h5>
                    <ul class="mb-0">
                        <li>User Ticket Report (last 6 months)</li>
                        <li>Theater-wise Movie Schedule</li>
                        <li>Top Occupancy Performers</li>
                        <li>Joined relational insights</li>
                        <li>Operational decision support</li>
                    </ul>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
