# Cinema Management System - Validation & User Message Guide

## ?? Overview
This document provides comprehensive validation messages and user feedback guidelines for all pages in the Cinema Management System.

---

## ?? Types of Messages

### 1. **Success Messages** (Green Alert)
- Used when operations complete successfully
- Format: `? SUCCESS: [Action] completed successfully!`

### 2. **Error Messages** (Red Alert)
- Used when operations fail
- Format: `? ERROR: Failed to [action]. [User-friendly explanation]`

### 3. **Warning Messages** (Yellow Alert)
- Used for non-critical issues
- Format: `? WARNING: [Issue description]`

### 4. **Info Messages** (Blue Alert)
- Used for informational feedback
- Format: `? INFO: [Information]`

---

## ?? Validation Messages by Field Type

### **Text Fields (Names, Titles)**
```csharp
// Required Field
ErrorMessage="[Field Name] is required"

// Length Validation
ErrorMessage="[Field Name] must be between [min]-[max] characters"

// Pattern Validation
ErrorMessage="[Field Name] must contain only letters, numbers, and basic punctuation"

// Example
<asp:RequiredFieldValidator 
    ControlToValidate="UsernameTextBox"
    ErrorMessage="Username is required"
    Display="Dynamic"
    ForeColor="Red">
    * Username is required
</asp:RequiredFieldValidator>

<asp:RegularExpressionValidator
    ControlToValidate="UsernameTextBox"
    ValidationExpression="^[a-zA-Z0-9]{3,20}$"
    ErrorMessage="Username must be 3-20 characters (letters and numbers only)"
    Display="Dynamic"
    ForeColor="Red" />
```

### **ID Fields**
```csharp
// Required + Format
<asp:RequiredFieldValidator 
    ControlToValidate="MovieIDTextBox"
    ErrorMessage="Movie ID is required"
    SetFocusOnError="true" />

<asp:RegularExpressionValidator
    ControlToValidate="MovieIDTextBox"
    ValidationExpression="^[A-Z0-9]{3,10}$"
    ErrorMessage="Movie ID must be 3-10 uppercase letters/numbers (e.g., MOV001)" />

Helper Text: "Use format: MOV001, MOVIE01, etc."
```

### **Phone/Contact Numbers**
```csharp
// Pattern: 10 digits
<asp:RequiredFieldValidator 
    ControlToValidate="ContactTextBox"
    ErrorMessage="Contact number is required" />

<asp:RegularExpressionValidator
    ControlToValidate="ContactTextBox"
    ValidationExpression="^\d{10}$"
    ErrorMessage="Enter a valid 10-digit phone number" />

Helper Text: "Format: 9841234567"
```

### **Email Addresses**
```csharp
<asp:RequiredFieldValidator 
    ControlToValidate="EmailTextBox"
    ErrorMessage="Email is required" />

<asp:RegularExpressionValidator
    ControlToValidate="EmailTextBox"
    ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$"
    ErrorMessage="Enter a valid email address (e.g., user@example.com)" />

Helper Text: "We'll never share your email"
```

### **Number Fields (Duration, Capacity, Price)**
```csharp
// Required + Range
<asp:RequiredFieldValidator 
    ControlToValidate="DurationTextBox"
    ErrorMessage="Duration is required" />

<asp:RangeValidator
    ControlToValidate="DurationTextBox"
    MinimumValue="1"
    MaximumValue="500"
    Type="Integer"
    ErrorMessage="Duration must be between 1-500 minutes" />

<asp:CompareValidator
    ControlToValidate="DurationTextBox"
    Operator="DataTypeCheck"
    Type="Integer"
    ErrorMessage="Duration must be a valid number" />

Helper Text: "Typical movie duration: 90-180 minutes"
```

### **Date Fields**
```csharp
// With Calendar Control
<asp:RequiredFieldValidator
    ControlToValidate="ReleaseDateTextBox"
    ErrorMessage="Release Date is required">
    * Please select a release date from the calendar
</asp:RequiredFieldValidator>

Helper Text: "Click a date on the calendar below to select"
```

### **Dropdown Lists**
```csharp
<asp:RequiredFieldValidator
    ControlToValidate="MovieDropDown"
    InitialValue=""
    ErrorMessage="Please select a movie">
    * Movie selection is required
</asp:RequiredFieldValidator>

Helper Text: "Select from available movies"
```

---

## ?? Operation-Specific Messages

### **INSERT Operations**

#### Success:
```
? SUCCESS: [Entity] added successfully! The [entity] is now available in the system.

Examples:
- "? SUCCESS: Movie added successfully! The movie is now available in the system."
- "? SUCCESS: User account created successfully! The user can now access the system."
- "? SUCCESS: Show scheduled successfully! Tickets can now be booked for this show."
```

#### Errors:
```
? ERROR: Failed to add [entity]. [Reason]

Common Reasons:
- "A [entity] with this ID already exists. Please use a different ID."
- "All required fields must be filled. Please check your input and try again."
- "Invalid date format. Please select a date from the calendar."
- "The value exceeds the maximum allowed length."

Examples:
- "? ERROR: Failed to add movie. A movie with ID 'MOV001' already exists."
- "? ERROR: Failed to create user. Phone number format is invalid."
```

### **UPDATE Operations**

#### Success:
```
? SUCCESS: [Entity] updated successfully! All changes have been saved.

Examples:
- "? SUCCESS: Movie updated successfully! All changes have been saved."
- "? SUCCESS: User information updated successfully!"
- "? SUCCESS: Show schedule updated successfully!"
```

#### Warnings:
```
? WARNING: No changes were made to the [entity].

Example:
- "? WARNING: No changes were made to the movie. The data is identical to the previous version."
```

#### Errors:
```
? ERROR: Failed to update [entity]. [Reason]

Examples:
- "? ERROR: Failed to update movie. This movie no longer exists in the system."
- "? ERROR: Failed to update user. Invalid input data provided."
```

### **DELETE Operations**

#### Confirmation Dialogs:
```javascript
// Simple Delete
return confirm('Are you sure you want to delete this [entity]?');

// Complex Delete (with dependencies)
return confirm('?? WARNING: Deleting this [entity] will also remove:\n\n' +
              '• [Related Entity 1]\n' +
              '• [Related Entity 2]\n' +
              '• [Related Entity 3]\n\n' +
              'This action cannot be undone!\n\n' +
              'Are you sure you want to proceed?');

Examples:
// Movie Delete
return confirm('?? WARNING: Deleting this movie will also remove:\n\n' +
              '• All show schedules\n' +
              '• All bookings\n' +
              '• All tickets\n\n' +
              'This action cannot be undone!\n\n' +
              'Are you sure you want to proceed?');

// User Delete
return confirm('Are you sure you want to delete this user?\n\n' +
              'Note: This will not delete their booking history.');
```

#### Success:
```
? SUCCESS: [Entity] deleted successfully [along with related data].

Examples:
- "? SUCCESS: Movie deleted successfully along with all related shows and bookings."
- "? SUCCESS: User deleted successfully."
- "? SUCCESS: Show deleted successfully."
```

#### Warnings:
```
? WARNING: [Entity] could not be deleted. [Reason]

Examples:
- "? WARNING: Movie could not be deleted. It may have already been removed."
- "? WARNING: User deletion failed. The user has active bookings."
```

#### Errors:
```
? ERROR: Failed to delete [entity]. [Reason]

Examples:
- "? ERROR: Failed to delete movie. This movie has active show schedules. Please delete those first."
- "? ERROR: Failed to delete theater. Halls must be deleted first."
```

### **CANCEL Operations**
```
? Operation cancelled. No changes were made.
```

---

## ?? Database Error Translations

### Common Oracle Errors ? User-Friendly Messages

```csharp
private string GetUserFriendlyErrorMessage(Exception ex)
{
    string message = ex.Message.ToLower();
    
    if (message.Contains("unique constraint"))
        return "A record with this ID already exists. Please use a different ID.";
    
    if (message.Contains("cannot insert null"))
        return "All required fields must be filled. Please check your input and try again.";
    
    if (message.Contains("value larger than specified precision"))
        return "One or more values are too large. Please check your input.";
    
    if (message.Contains("invalid number"))
        return "Please enter a valid number for numeric fields.";
    
    if (message.Contains("not a valid date"))
        return "The date format is invalid. Please select a date from the calendar.";
    
    if (message.Contains("foreign key constraint") || message.Contains("child record found"))
        return "This record has related data. Please delete the related records first.";
    
    if (message.Contains("parent key not found"))
        return "The selected reference does not exist. Please refresh and try again.";
    
    if (message.Contains("connection"))
        return "Database connection error. Please check if the database is running and try again.";
    
    if (message.Contains("timeout"))
        return "The operation took too long. Please try again.";
    
    if (message.Contains("deadlock"))
        return "The system is busy. Please wait a moment and try again.";
    
    // Default
    return "An unexpected error occurred. Please contact support if this persists.";
}
```

---

## ?? UI Helper Messages

### **Empty States**
```html
<EmptyDataTemplate>
    <div class="alert alert-warning text-center">
        <i class="fas fa-exclamation-triangle"></i> 
        <strong>No [entities] found.</strong><br/>
        Get started by clicking the "Add New [Entity]" button above.
    </div>
</EmptyDataTemplate>
```

### **Loading States**
```
? Loading [entities]... Please wait.
? Processing your request... Please wait.
? Saving changes... Please wait.
? Deleting [entity]... Please wait.
```

### **Info Boxes**
```html
<div class="alert alert-info">
    <i class="fas fa-info-circle"></i> 
    <strong>Quick Guide:</strong> [Instructions]
</div>

Examples:
- "Click Edit to modify, or Delete to remove. Use pagination to navigate."
- "Select a date from the calendar to schedule the show."
- "All fields marked with * are required."
```

### **Tips**
```html
<small class="text-muted">
    <i class="fas fa-lightbulb"></i> <strong>Tip:</strong> [Helpful tip]
</small>

Examples:
- "You can sort the list by clicking on column headers."
- "Use CTRL+F to search within the page."
- "Typical movie duration is 90-180 minutes."
```

---

## ?? Page-Specific Validation Messages

### **UserDetails.aspx**
```
Fields:
- UserID: "User ID must be 3-10 characters (e.g., USR001)"
- UserName: "Name must be 2-50 characters (letters only)"
- UserContact: "Enter a valid 10-digit phone number (e.g., 9841234567)"

Success: "User account [created/updated] successfully!"
Delete Confirm: "Are you sure you want to delete this user?"
```

### **MovieDetails.aspx**
```
Fields:
- MovieID: "Movie ID must be 3-10 uppercase letters/numbers (e.g., MOV001)"
- MovieTitle: "Title must be 2-100 characters"
- Language: "Language must contain only letters (e.g., English, Nepali)"
- Duration: "Duration must be between 1-500 minutes"
- ReleaseDate: "Please select a release date from the calendar"

Delete Confirm: "Deleting this movie will also remove all shows, bookings, and tickets!"
```

### **TheaterCityHallDetails.aspx**
```
Theater Fields:
- TheaterID: "Theater ID must be 3-10 characters (e.g., TH001)"
- TheaterName: "Theater name must be 2-100 characters"

Hall Fields:
- HallID: "Hall ID must be 3-10 characters (e.g., HALL001)"
- HallNumber: "Hall number must be between 1-50"
- HallCapacity: "Capacity must be between 10-1000 seats"

Delete Confirm: "Deleting this theater will remove all halls and related shows!"
```

### **ShowDetails.aspx**
```
Fields:
- ShowID: "Show ID must be 3-15 characters (e.g., SHOW001)"
- Movie: "Please select a movie from the dropdown"
- Hall: "Please select a hall from the dropdown"
- ShowDate: "Please select a show date from the calendar"
- ShowTime: "Enter time in HH:MM format (e.g., 14:30)"

Delete Confirm: "Deleting this show will remove all bookings and tickets!"
```

### **TicketDetails.aspx**
```
Fields:
- TicketID: "Ticket ID must be 3-15 characters (e.g., TKT001)"
- Booking: "Please select a booking from the dropdown"
- Seat: "Please select a seat from the dropdown"
- BasePrice: "Price must be between 0-10000"
- FinalPrice: "Final price must be between 0-10000"
- Status: "Please select a valid seat status"

Delete Confirm: "Are you sure you want to delete this ticket?"
```

### **UserTicket.aspx (6-Month Filter)**
```
Messages:
- No User Selected: "? Please select a user to view their ticket history."
- No Results: "No tickets found for this user in the last 6 months."
- Success: "? Showing [X] tickets for [Username] (Last 6 months)"
- Summary: "Total Tickets: [X] | Total Amount: Rs. [amount]"
```

### **TheaterMovie.aspx**
```
Messages:
- No Theater Selected: "? Please select a theater to view the movie schedule."
- No Results: "No movies are currently scheduled for this theater."
- Success: "? Showing movie schedule for [Theater Name]"
```

### **OccupancyPerformer.aspx**
```
Messages:
- No Movie Selected: "? Please select a movie to view top performing halls."
- No Results: "No occupancy data available for this movie."
- Success: "? Showing top 3 halls for [Movie Title]"
- Info: "Only PAID and BOOKED tickets are counted in occupancy calculation."
```

---

## ? Implementation Checklist

For each page, ensure you have:

- [ ] ValidationSummary control
- [ ] RequiredFieldValidators for all required fields
- [ ] RegularExpressionValidators for format validation
- [ ] RangeValidators for numeric fields
- [ ] CompareValidators for data type checking
- [ ] Success message panel
- [ ] Error message panel
- [ ] Warning message panel
- [ ] Info message panel
- [ ] Delete confirmation dialogs
- [ ] Empty state templates
- [ ] Helper text for complex fields
- [ ] User-friendly error translation
- [ ] Event handlers for all operations
- [ ] GridView EmptyDataTemplate
- [ ] Loading indicators (optional)

---

## ?? Best Practices

1. **Always provide context**: Tell users what happened and why
2. **Be specific**: "Duration must be 1-500 minutes" not just "Invalid"
3. **Be actionable**: Tell users what to do next
4. **Be consistent**: Use the same message patterns across pages
5. **Be visual**: Use icons (?, ?, ?, ?) for quick recognition
6. **Be friendly**: Avoid technical jargon
7. **Be helpful**: Provide examples and tips
8. **Test thoroughly**: Verify all validation scenarios work

---

## ?? Reference Code

### Complete FormView Event Handler Template:
```csharp
protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
{
    if (e.Exception == null)
    {
        if (e.AffectedRows > 0)
            ShowMessage("? SUCCESS: [Entity] added successfully!", "success");
        else
            ShowMessage("? WARNING: No [entity] was added.", "warning");
    }
    else
    {
        ShowMessage("? ERROR: " + GetUserFriendlyErrorMessage(e.Exception), "error");
        e.ExceptionHandled = true;
    }
}

protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
{
    if (e.Exception == null)
    {
        if (e.AffectedRows > 0)
            ShowMessage("? SUCCESS: [Entity] updated successfully!", "success");
        else
            ShowMessage("? WARNING: No changes were made.", "warning");
    }
    else
    {
        ShowMessage("? ERROR: " + GetUserFriendlyErrorMessage(e.Exception), "error");
        e.ExceptionHandled = true;
    }
}

protected void FormView1_ItemDeleted(object sender, FormViewDeletedEventArgs e)
{
    if (e.Exception == null)
    {
        if (e.AffectedRows > 0)
            ShowMessage("? SUCCESS: [Entity] deleted successfully!", "success");
        else
            ShowMessage("? WARNING: [Entity] could not be deleted.", "warning");
    }
    else
    {
        ShowMessage("? ERROR: " + GetUserFriendlyErrorMessage(e.Exception), "error");
        e.ExceptionHandled = true;
    }
}

private void ShowMessage(string message, string type)
{
    pnlMessage.Visible = true;
    lblMessage.Text = message;
    pnlMessage.CssClass = $"alert alert-{type} alert-custom";
}
```

---

**Document Version:** 1.0  
**Last Updated:** 2024  
**Project:** Cinema Management System - Pokhara Theater

