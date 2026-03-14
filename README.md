# Cinema Management System

## 1. Project Overview

The **Cinema Management System** is an academic ASP.NET Web Forms application designed to automate core operations of a cinema environment, including master data management, show scheduling, ticket processing, payment tracking, and analytical reporting.

The system is implemented using **C# on .NET Framework 4.7.2** with an **Oracle database** backend configured through `Web.config`.

### Objectives

- Model a real-world cinema workflow using relational database design.
- Implement CRUD-based transaction processing with Web Forms controls.
- Demonstrate reporting through multi-table SQL joins and aggregate analysis.
- Provide a consistent, responsive user interface for administrative tasks.

### Technology Stack

- **Framework:** ASP.NET Web Forms (`.NET Framework 4.7.2`)
- **Language:** C#
- **Database:** Oracle XE (via `System.Data.OracleClient` provider)
- **UI:** Bootstrap + Font Awesome + ASP.NET server controls
- **Data Access:** `SqlDataSource`, `DbProviderFactory`, custom `DBHelper`

---

## 2. Database Structure

### 2.1 Core Tables

| Table | Primary Key | Significant Attributes | Purpose |
|------|-------------|------------------------|---------|
| `USER_ACCOUNT` | `USERID` | `USERNAME`, `USERCONTACT` | Stores user/customer information |
| `MOVIE` | `MOVIEID` | `MOVIETITLE`, `MOVIELANGUAGE`, `MOVIEDURATION`, `RELEASEDATE` | Stores movie metadata |
| `THEATER` | `THEATERID` | `THEATERNAME` | Stores theater details |
| `HALL` | `HALLID` | `THEATERID`, `HALLNUMBER`, `HALLCAPACITY` | Stores hall capacity and mapping to theater |
| `SHOW` | `SHOWID` | `MOVIEID`, `HALLID`, `SHOWDATE`, `SHOWTIME` | Stores movie schedule instances |
| `BOOKING` | `BOOKINGID` | `USERID`, `SHOWID`, `BOOKINGDATETIME` | Stores booking transactions |
| `TICKET` | `TICKETID` | `BOOKINGID`, `SEATID`, `BASETICKETPRICE`, `FINALTICKETPRICE`, `SEATSTATUS` | Stores ticket-level details |
| `PAYMENT` | `PAYMENTID` | `BOOKINGID`, `AMOUNTPAID`, `PAYMENTDATE`, `PAYMENTMETHOD` | Stores payment records |

### 2.2 Relationship Summary

| Parent | Child | Relationship |
|--------|-------|--------------|
| `THEATER` | `HALL` | One-to-many via `THEATERID` |
| `MOVIE` | `SHOW` | One-to-many via `MOVIEID` |
| `HALL` | `SHOW` | One-to-many via `HALLID` |
| `USER_ACCOUNT` | `BOOKING` | One-to-many via `USERID` |
| `SHOW` | `BOOKING` | One-to-many via `SHOWID` |
| `BOOKING` | `TICKET` | One-to-many via `BOOKINGID` |
| `BOOKING` | `PAYMENT` | One-to-many via `BOOKINGID` |

---

## 3. Functional Modules

| Module | Page | Description |
|--------|------|-------------|
| Dashboard | `Default.aspx` | Central navigation hub for all management and report modules |
| User Management | `UserDetails.aspx` | Create, update, and view user accounts |
| Movie Management | `MovieDetails.aspx` | Manage movie title, language, duration, and release date |
| Theater & Hall Management | `TheaterCityHallDetails.aspx` | Manage theater entities and hall capacities |
| Show Scheduling | `ShowDetails.aspx` | Manage movie show date/time and hall assignment |
| Ticket Management | `TicketDetails.aspx` | Manage ticket price, seat status, and booking linkage |
| Payment Management | `PaymentDetails.aspx` | Maintain payment information by booking |
| User Ticket Report | `UserTicket.aspx` | Shows a selected user's booked tickets for last 6 months |
| Theater Movie Report | `TheaterMovie.aspx` | Lists scheduled movies per selected theater |
| Occupancy Performer Report | `OccupancyPerformer.aspx` | Shows top 3 hall performers by occupancy percentage |

---

## 4. Test Case Table

| Objective | Action | Expected Result | Actual Result | Conclusion |
| --------- | ------ | --------------- | ------------- | ---------- |
| Insert User | Enter user details and click **Insert** | User is added to `USER_ACCOUNT` | User successfully added and displayed in grid | Pass |
| Update Movie | Modify movie language and click **Update** | Movie record is updated | Updated values persisted after refresh | Pass |
| Delete Ticket | Select ticket and click **Delete** | Ticket record removed from `TICKET` | Record removed and grid refreshed | Pass |
| Insert Show | Enter valid `MOVIEID`, `HALLID`

, date/time and submit | New show appears in show list | Show inserted and displayed in `GridView` | Pass |
| Insert Payment | Add payment for existing booking | Payment saved in `PAYMENT` | Payment stored and visible in listing | Pass |
| Run User Ticket Report | Select user and click **Filter** | Last 6-month ticket rows and totals displayed | Correct rows and totals shown | Pass |
| Run Theater Movie Report | Select theater and click **Filter** | Theater-wise movie schedule displayed | Matching hall/movie rows displayed | Pass |
| Run Occupancy Report | Select movie and click **Filter** | Top 3 halls by occupancy shown | Top 3 rows with occupancy percentage displayed | Pass |

---

## 5. Failure Case Table

| Scenario | Observed Failure | Correction Measure | Result |
| -------- | ---------------- | ------------------ | ------ |
| Invalid foreign key in `SHOW` insert (`MOVIEID`/`HALLID` not found) | Insert operation fails at DB constraint level | Restrict entry with validated dropdowns and FK checks before submit | Invalid IDs rejected before DB commit |
| Duplicate primary key value on insert | Transaction fails due to uniqueness violation | Use controlled key generation or pre-insert duplicate validation | Duplicate-entry failure reduced |
| Invalid email/phone format during user entry | Incorrect contact data accepted | Add input validators (`RegularExpressionValidator`, server-side checks) | Invalid format now rejected |
| Non-standard seat status value in `TICKET` | Reporting inconsistency for booked count | Constrain allowed values (`Booked`, `Available`, etc.) | Report results become consistent |
| String-concatenated query segments in some edit flows | Increased SQL injection risk | Replace with parameterized commands consistently | Query safety improved |

---

## 6. SQL Insert Examples

```sql
-- USER_ACCOUNT
INSERT INTO USER_ACCOUNT (USERID, USERNAME, USERCONTACT)
VALUES ('U001', 'Aarav Sharma', '9800000001');

-- MOVIE
INSERT INTO MOVIE (MOVIEID, MOVIETITLE, MOVIELANGUAGE, MOVIEDURATION, RELEASEDATE)
VALUES ('M001', 'Everest Dawn', 'Nepali', 125, TO_DATE('2025-01-12', 'YYYY-MM-DD'));

-- THEATER
INSERT INTO THEATER (THEATERID, THEATERNAME)
VALUES ('T001', 'Pokhara Theater');

-- HALL
INSERT INTO HALL (HALLID, THEATERID, HALLNUMBER, HALLCAPACITY)
VALUES ('H001', 'T001', 1, 150);

-- SHOW
INSERT INTO SHOW (SHOWID, MOVIEID, HALLID, SHOWDATE, SHOWTIME)
VALUES ('S001', 'M001', 'H001', TO_DATE('2025-02-01', 'YYYY-MM-DD'), TO_DATE('18:30', 'HH24:MI'));

-- BOOKING
INSERT INTO BOOKING (BOOKINGID, USERID, SHOWID, BOOKINGDATETIME)
VALUES ('B001', 'U001', 'S001', TO_TIMESTAMP('2025-02-01 10:15:00', 'YYYY-MM-DD HH24:MI:SS'));

-- TICKET
INSERT INTO TICKET (TICKETID, BOOKINGID, SEATID, BASETICKETPRICE, FINALTICKETPRICE, SEATSTATUS)
VALUES ('TK001', 'B001', 'A10', 500, 500, 'Booked');

-- PAYMENT
INSERT INTO PAYMENT (PAYMENTID, BOOKINGID, AMOUNTPAID, PAYMENTDATE, PAYMENTMETHOD)
VALUES ('P001', 'B001', 500, TO_DATE('2025-02-01', 'YYYY-MM-DD'), 'eSewa');
```

---

## 7. Implementation Explanation

### 7.1 System Design Approach

The project follows an event-driven **ASP.NET Web Forms** design where each module is implemented as:
- an `.aspx` interface page,
- a C# code-behind class,
- and associated data source controls.

`GridView` is used for tabular display and selection, while `FormView` supports insert/edit/read-only mode transitions.

### 7.2 Data Access Strategy

Two data-access approaches are used:
1. **Declarative data binding** via `SqlDataSource` for CRUD modules.
2. **Programmatic query execution** via `DbProviderFactory` and `DataTable` for reporting modules.

Additionally, `App_Code/DBHelper.cs` provides reusable methods:
- `ExecuteQuery()`
- `ExecuteNonQuery()`
- `ExecuteScalar()`

### 7.3 Module Execution Flow

1. User navigates through `Site.Master` menu or dashboard cards.
2. Module page loads and binds relevant records.
3. Edit/insert actions trigger `FormView` lifecycle events.
4. Operations are persisted to Oracle tables.
5. UI is reset and rebound to display updated state.

### 7.4 Reporting Implementation

- **User Ticket Report:** filters booking history for last six months using `ADD_MONTHS(SYSDATE, -6)` and computes total amount.
- **Theater Movie Report:** performs joins across `THEATER`, `HALL`, `SHOW`, and `MOVIE`.
- **Occupancy Performer Report:** calculates occupancy percentage and retrieves top 3 halls using ordered aggregate query and `ROWNUM`.

### 7.5 Reliability Considerations

- Exception handling is implemented in insert/update/delete event handlers.
- Data rebinding after operations improves consistency.
- Parameterized query usage in report pages improves query safety.
- Further standardization to parameterized CRUD commands is recommended.

---

## Conclusion

This project provides a complete academic demonstration of database-driven web application development using ASP.NET Web Forms and Oracle. It integrates transactional modules and analytical reports within a consistent interface and can be extended for advanced features such as authentication, role-based access, and stronger validation layers.
