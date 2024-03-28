<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome Page</title>
    <style>
        /* Add CSS styles as needed */
        /* General Styles */
        body {
          font-family: Arial, sans-serif; /* Set a base font family */
          background: linear-gradient(to right, #1c92d2, #f2fcfe);
          margin: 0; /* Remove default browser margins */
          padding: 0; /* Remove default browser padding */
        }

        .container {
          max-width: 800px; /* Limit container width for responsiveness */
          margin: 0 auto; /* Center the container horizontally */
          padding: 20px; /* Add some padding inside the container */
        }
        .navbar {
        background-color: #000035; /* Dark background color */
        color: white; /* Text color */
        padding: 10px; /* Add padding */
        display: flex; /* Use flexbox layout */
        justify-content: space-between; /* Space items evenly */
        align-items: center; /* Center items vertically */
    }

        
 /* Styling for the logout button */
 .logout-button {
        background-color: #dc3545; /* Red background color */
        color: white; /* Text color */
        border: none; /* Remove border */
        padding: 10px 20px; /* Add padding */
        border-radius: 5px; /* Rounded corners */
        cursor: pointer; /* Show pointer cursor on hover */
        transition: background-color 0.3s; /* Smooth transition for background color */
    }

    /* Hover effect for the logout button */
    .logout-button:hover {
        background-color: #c82333; /* Darker red background color on hover */
    }
        /* Styling for the alert container */
    .alert-container {
        position: fixed;
        top: 20px;
        right: 20px;
        max-width: 300px;
        z-index: 9999;
    }

    /* Styling for the alert */
    .alert {
        padding: 15px;
        border-radius: 5px;
        margin-bottom: 10px;
    }

    /* Success alert */
    .alert-success {
        background-color: #d4edda;
        border-color: #c3e6cb;
        color: #155724;
    }

    /* Close button for the alert */
    .close-btn {
        float: right;
        cursor: pointer;
    }

        h1, h2 {
          margin-bottom: 10px; /* Add some space below headings */
        }

        /* Shared link styles */
        a {
          color: #333; /* Default link color */
          text-decoration: none; /* Remove underline */
          padding: 10px 20px;
          border-radius: 5px; /* Add some rounded corners */
          font-weight: bold;
        }

        /* Healthcare Services link */
        #healthcareLink {
          background-color: #4CAF50; /* Green background */
          color: white;
        }

        /* Insurance Services link */
        #insuranceLink{
          background-color: #3f51b5; /* Blue background */
          color: white;
        }

        ul {
          list-style: none; /* Remove default bullet points */
          padding: 0; /* Remove default padding */
          margin: 0; /* Remove default margin */
        }

        li {
          display: inline-block; /* Display list items inline for horizontal layout */
          margin-right: 20px; /* Add space between list items */
        }

        a {
          text-decoration: none; /* Remove default underline from links */
          color: #000; /* Set link text color */
        }

        a:hover {
          color: #333; /* Change link color on hover */
        }

        /* Table Styles */
        table {
          border-collapse: collapse; /* Ensure table cells collapse borders */
          width: 100%; /* Make table fill the container width */
        }

        th, td {
          padding: 10px; /* Add padding to table cells */
          border: 1px solid#000; /* Add a thin border to table cells */
          text-align: left; /* Align table cell content to the left */
        }

        th {
          background-color: #000035; /* Provide a light background for headers */
          color: white;
        }

        #healthcareServicesTable,
        #insuranceServicesTable {
          margin-top: 20px; /* Add some space above the table */
        }

        /* Button Styles */
        #healthcareServicesBody input[type="button"]{
          padding: 5px 10px; /* Adjust button padding */
          background-color: #4CAF50; /* Green color for booking button */
          color: white; /* White text */
          border: none; /* Remove button border */
          cursor: pointer; /* Indicate clickable behavior */
          border-radius: 5px; /* Add rounded corners */
        }

        #insuranceServicesBody input[type="button"] {
          padding: 5px 10px; /* Adjust button padding */
          background-color: #3f51b5; /* Green color for booking button */
          color: white; /* White text */
          border: none; /* Remove button border */
          cursor: pointer; /* Indicate clickable behavior */
          border-radius: 5px; /* Add rounded corners */
        }

        #healthcareServicesBody input[type="button"]:hover{
          background-color: #3e8e41; /* Darken green color on hover */
        }

        #insuranceServicesBody input[type="button"]:hover {
          background-color: darkblue; /* Darken green color on hover */
        }
    </style>
</head>
<body>
    <div class="navbar">
        <h1 style="color: white;">Welcome, <%= session.getAttribute("username") %></h1>
        <button class="logout-button" onclick="logout()">Logout</button>
    </div>
    
    <div class="container">
        <h2>Choose a Service:</h2>
        <ul>
            <li><a href="#" id="healthcareLink">Healthcare Services</a></li>
            <li><a href="#" id="insuranceLink">Insurance Services</a></li>
        </ul>
        
        <!-- Hidden healthcare services table -->
        <div id="healthcareTable">
            <h2>Healthcare Services</h2>
            <!-- Add a table to display healthcare services -->
            <table id="healthcareServicesTable">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Service Name</th>
                        <th>Doctor Name</th>
                        <th>Cost In Dollars</th>
                        <th>Consulting Area</th>
                        <th>Book Status</th>
                    </tr>
                </thead>
                <tbody id="healthcareServicesBody">
                    <!-- JavaScript will populate this section -->
                </tbody>
            </table>
        </div>
        
        <!-- Hidden insurance services table -->
        <div id="insuranceTable" style="display: none;">
            <h2>Insurance Services</h2>
            <!-- Add a table to display insurance services -->
            <table id="insuranceServicesTable">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Service Name</th>
                        <th>Provider Name</th>
                        <th>$ Premium</th>
                        <th>Coverage Type</th>
                        <th>Buy</th>
                    </tr>
                </thead>
                <tbody id="insuranceServicesBody">
                    <!-- JavaScript will populate this section -->
                </tbody>
            </table>
        </div>
    </div>
    
    <script>
      // Define the toggleHealthcareServices function
      function toggleHealthcareServices(event) {
          event.preventDefault(); // Prevent the default behavior of the anchor tag
          var healthcareTable = document.getElementById("healthcareTable");
          var insuranceTable = document.getElementById("insuranceTable");
          if (healthcareTable.style.display === "none") {
              healthcareTable.style.display = "block";
              insuranceTable.style.display = "none"; // Hide insurance table when healthcare table is shown
              fetchHealthcareServices(); // Fetch healthcare services when table is shown
          }
      }
  
      // Define the toggleInsuranceServices function
      function toggleInsuranceServices(event) {
          event.preventDefault(); // Prevent the default behavior of the anchor tag
          var insuranceTable = document.getElementById("insuranceTable");
          var healthcareTable = document.getElementById("healthcareTable");
          if (insuranceTable.style.display === "none") {
              insuranceTable.style.display = "block";
              healthcareTable.style.display = "none"; // Hide healthcare table when insurance table is shown
              fetchInsuranceServices(); // Fetch insurance services when table is shown
          }
      }
  
      // Define the bookService function
    function bookService(serviceId) {
        // Simulate booking service (replace with actual functionality)
        console.log("Booking service with ID:", serviceId);
        showAlert("Service booked!", "success");
    }

    // Define the buyInsurance function
    function buyInsurance(insuranceId) {
        // Simulate buying insurance (replace with actual functionality)
        console.log("Buying insurance with ID:", insuranceId);
        showAlert("Insurance bought!", "success");
    }

    // Function to display styled alert messages
    function showAlert(message, type) {
        var alertContainer = document.createElement('div');
        alertContainer.className = 'alert-container';

        var alertDiv = document.createElement('div');
        alertDiv.className = 'alert alert-' + type;
        alertDiv.textContent = message;

        var closeBtn = document.createElement('span');
        closeBtn.className = 'close-btn';
        closeBtn.innerHTML = '&times;';
        closeBtn.addEventListener('click', function() {
            alertContainer.parentNode.removeChild(alertContainer);
        });

        alertDiv.appendChild(closeBtn);
        alertContainer.appendChild(alertDiv);
        document.body.appendChild(alertContainer);

        setTimeout(function() {
            alertContainer.parentNode.removeChild(alertContainer);
        }, 5000); // Remove the alert after 5 seconds
    }


      // Function to fetch and populate healthcare services
      function fetchHealthcareServices() {
          fetch('/api/healthcare/services') // Assuming the context path is the root
              .then(response => response.json())
              .then(data => {
                  var tableBody = document.getElementById("healthcareServicesBody");
                  tableBody.innerHTML = ""; // Clear existing table data
                  data.forEach(service => {
                      var row = document.createElement("tr");
                      row.innerHTML = "<td>" + service.id + "</td>" +
                                      "<td>" + service.serviceName + "</td>" +
                                      "<td>" + service.doctorName + "</td>" +
                                      "<td>" + service.cost + "</td>" +
                                      "<td>" + service.consultingArea + "</td>" +
                                      "<td><input type='button' value='Book' onclick='bookService(" + service.id + ")'></td>";
                      tableBody.appendChild(row);
                  });
              })
              .catch(error => {
                  console.error('Error occurred while fetching healthcare services:', error);
              });
      }
  
      // Function to fetch and populate insurance services
      function fetchInsuranceServices() {
          fetch('/insurances') // Assuming the context path is the root
              .then(response => response.json())
              .then(data => {
                  var tableBody = document.getElementById("insuranceServicesBody");
                  tableBody.innerHTML = ""; // Clear existing table data
                  data.forEach(service => {
                      var row = document.createElement("tr");
                      row.innerHTML = "<td>" + service.id + "</td>" +
                                      "<td>" + service.serviceName + "</td>" +
                                      "<td>" + service.providerName + "</td>" +
                                      "<td>" + service.premium + "</td>" +
                                      "<td>" + service.coverageType + "</td>" +
                                      "<td><input type='button' value='Buy' onclick='buyInsurance(" + service.id + ")'></td>";
                      tableBody.appendChild(row);
                  });
              })
              .catch(error => {
                  console.error('Error occurred while fetching insurance services:', error);
              });
      }
  
      // Add event listeners to the healthcare and insurance links after the DOM is loaded
      document.addEventListener('DOMContentLoaded', function() {
          var healthcareLink = document.getElementById("healthcareLink");
          healthcareLink.addEventListener('click', toggleHealthcareServices);
  
          var insuranceLink = document.getElementById("insuranceLink");
          insuranceLink.addEventListener('click', toggleInsuranceServices);
  
          // Fetch and display healthcare services by default
          fetchHealthcareServices();
      });

      function logout() {
        // Redirect the user to the login JSP page
        showAlert("Logout Success!", "success");
        setTimeout(function() {
        window.location.href = '/login';
    }, 1000); // Redirect after 1 second
       
    }
  </script>
  
</body>
</html>

