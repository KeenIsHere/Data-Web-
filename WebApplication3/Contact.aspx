<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WebApplication3.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="contact-hero text-center">
        <h1><i class="fas fa-handshake"></i> Contact Us</h1>
        <p class="lead mb-0">Let’s collaborate on software engineering, secure development, and innovation-driven projects.</p>
    </div>

    <div class="row g-4 mt-2">
        <div class="col-lg-4">
            <div class="contact-card h-100">
                <div class="contact-icon"><i class="fas fa-user-graduate"></i></div>
                <h5>Profile</h5>
                <p class="mb-1"><strong>Krishna Kumar Gupta</strong></p>
                <p class="mb-0">Software Engineering Student & Aspiring Ethical Hacker</p>
            </div>
        </div>

        <div class="col-lg-4">
            <div class="contact-card h-100">
                <div class="contact-icon"><i class="fas fa-location-dot"></i></div>
                <h5>Location</h5>
                <p class="mb-1">Pokhara, Nepal</p>
                <p class="mb-0">Focused on tourism-tech and security-first systems.</p>
            </div>
        </div>

        <div class="col-lg-4">
            <div class="contact-card h-100">
                <div class="contact-icon"><i class="fas fa-envelope-open-text"></i></div>
                <h5>Email</h5>
                <p class="mb-1">
                    <a href="mailto:kn.keen.s24@gmail.com">kn.keen.s24@gmail.com</a>
                </p>
                <p class="mb-0">For project collaboration, mentorship, and opportunities.</p>
            </div>
        </div>
    </div>

    <div class="row g-4 mt-2 mb-2">
        <div class="col-md-6">
            <div class="guide-panel h-100">
                <h5><i class="fas fa-network-wired"></i> Collaboration Areas</h5>
                <ul class="mb-0">
                    <li>Secure web application development</li>
                    <li>Tourism and hospitality technology</li>
                    <li>Open source development contributions</li>
                    <li>Ethical hacking and secure coding practices</li>
                </ul>
            </div>
        </div>
        <div class="col-md-6">
            <div class="guide-panel h-100">
                <h5><i class="fas fa-link"></i> Professional Networks</h5>
                <p class="mb-2">Connect through professional channels:</p>
                <div class="d-flex flex-wrap gap-2">
                    <a class="btn btn-dark" href="https://linkedin.com" target="_blank" rel="noopener"><i class="fab fa-linkedin"></i> LinkedIn</a>
                    <a class="btn btn-info text-white" href="https://twitter.com" target="_blank" rel="noopener"><i class="fab fa-x-twitter"></i> Twitter/X</a>
                    <a class="btn btn-danger" href="mailto:kn.keen.s24@gmail.com"><i class="fas fa-paper-plane"></i> Email</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
