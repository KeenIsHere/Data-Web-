# Cinema Management System

A comprehensive web-based cinema management system built with ASP.NET Web Forms and Oracle Database.

## ?? Project Overview

This is a full-featured Cinema Management System for Pokhara Theater that handles:
- User account management
- Movie catalog management
- Theater and hall administration
- Show scheduling
- Ticket booking and management
- Payment tracking
- Advanced reporting features

## ??? Technology Stack

- **Framework**: ASP.NET Web Forms (.NET Framework 4.7.2)
- **Database**: Oracle Database
- **Frontend**: Bootstrap 5, Font Awesome 6.4.0, Custom CSS
- **Architecture**: 3-tier architecture with proper separation of concerns

## ? Features

### Phase 2: Dashboard & Homepage (5 Marks)
- ? Modern responsive dashboard with cards
- ? Navigation menu with icons
- ? Professional color theme (Dark Navy #0D1B2A + Gold #E0A80D)
- ? Quick access to all modules

### Phase 3: Basic WebForms (15 Marks)
1. **User Management** - Full CRUD operations with validation
2. **Theater & Hall Management** - Demonstrates foreign key relationships
3. **Movie Management** - Calendar control for date selection
4. **Show Management** - Complex dropdowns with foreign keys
5. **Ticket Management** - Multi-table joins and relationships

### Phase 4: Complex Forms (20 Marks)
1. **User Ticket History (6 Months)** - Filter tickets by user for last 6 months
2. **Theater Movie Schedule** - View all movies and showtimes per theater
3. **Occupancy Performance** - Top 3 halls by occupancy percentage

## ?? Key Features

- **Foreign Key Implementation**: Proper use of DropDownLists for related data
- **TemplateFields**: Custom formatted GridView columns with icons
- **Calendar Controls**: Interactive date selection for movies and shows
- **Complex Queries**: Multi-table joins with aggregation functions
- **Validation**: Client-side and server-side validation
- **Responsive Design**: Mobile-friendly interface
- **Professional UI**: Consistent styling across all pages

## ??? Database Schema

### Tables
- **USER_ACCOUNT**: User information
- **THEATER**: Theater locations
- **HALL**: Theater halls with capacity
- **MOVIE**: Movie catalog
- **SHOW**: Show schedules
- **SEAT**: Seat configurations
- **BOOKING**: Booking records
- **TICKET**: Ticket details
- **PAYMENT**: Payment transactions

## ?? Setup Instructions

### Prerequisites
- Visual Studio 2019 or later
- Oracle Database (XE or higher)
- .NET Framework 4.7.2
- IIS Express (comes with Visual Studio)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/KeenIsHere/Data-Web-.git
   cd Data-Web-
   git checkout Work-UpTo-UI
   ```

2. **Configure Database Connection**
   - Open `Web.config`
   - Update the connection string with your Oracle credentials:
   ```xml
   <add name="ConnectionString2" 
        connectionString="Data Source=xe;Persist Security Info=True;User ID=YOUR_USERNAME;Password=YOUR_PASSWORD;Unicode=True"
        providerName="System.Data.OracleClient" />
   ```

3. **Restore NuGet Packages**
   - Open solution in Visual Studio
   - Right-click solution ? "Restore NuGet Packages"

4. **Build the Solution**
   - Press `Ctrl+Shift+B` or go to Build ? Build Solution

5. **Run the Application**
   - Press `F5` or click the "IIS Express" button
   - Default page will open in your browser

## ?? Pages Overview

| Page | Description | Features |
|------|-------------|----------|
| Default.aspx | Dashboard | Main navigation hub with cards |
| UserDetails.aspx | User Management | CRUD operations with validation |
| MovieDetails.aspx | Movie Catalog | Calendar control for release dates |
| TheaterCityHallDetails.aspx | Theater & Halls | Foreign key relationships |
| ShowDetails.aspx | Show Schedule | Complex dropdowns, joins |
| TicketDetails.aspx | Ticket Management | Multi-table relationships |
| UserTicket.aspx | User History | 6-month filter report |
| TheaterMovie.aspx | Theater Schedule | Theater-wise movie listing |
| OccupancyPerformer.aspx | Top Performers | Top 3 halls by occupancy |

## ?? UI Design

### Color Scheme
- **Primary**: #0D1B2A (Dark Navy)
- **Secondary**: #1B263B
- **Accent**: #E0A80D (Gold)
- **Background**: #F5F7FA

### Components
- Bootstrap 5 cards with hover effects
- Font Awesome icons throughout
- Styled GridViews with alternating rows
- Color-coded buttons (Green=Insert, Blue=Update, Red=Delete, Gold=Filter)

## ?? Database Queries

### Complex Queries Implemented
1. **6-Month Ticket History**: Uses `ADD_MONTHS(SYSDATE, -6)` for date filtering
2. **Theater Schedule**: 4-table join across Theater, Hall, Show, and Movie
3. **Occupancy Calculation**: 6-table join with aggregate functions and `ROWNUM` for Top 3

## ?? Security Notes

- Web.config contains database credentials (use environment variables in production)
- Input validation implemented on all forms
- SQL injection prevention through parameterized queries
- XSS protection through proper encoding

## ?? Project Team

**Pokhara Theater Management**

## ?? License

This is an academic project for educational purposes.

## ?? Known Issues

- System.Data.OracleClient is deprecated (migrated to DbProviderFactory for compatibility)
- Some pages require Oracle database to be running

## ?? Future Enhancements

- [ ] Add authentication and authorization
- [ ] Implement email notifications for bookings
- [ ] Add payment gateway integration
- [ ] Create mobile app companion
- [ ] Add reporting dashboard with charts
- [ ] Implement seat selection interface

## ?? Support

For issues and questions, please create an issue in the GitHub repository.

---

**Built with ?? for Pokhara Theater**
