<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <title>The Job</title>
    <link rel="stylesheet" href="../css/style-02.css?version=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXlrzF1/+3v/HaBwiW+kWimz1lOMl3Z83O+OrCXaRkf" crossorigin="anonymous">
    
    <!-- Boxicons CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <style>
     .input{
     padding:5px 15px;
     border: 2px solid green;
     }
     .search-button{
     padding:5px 5px;
     border:none;
     background-color: green;
     color:white;
     border-radius:5px;
     }
     .search-button:hover{
     padding:5px 5px;
     border:2px solid green;
     background-color: white;
     color:green;
     border-radius:5px;
     cursor: pointer;
     }
     </style>
   </head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="<%= request.getContextPath() %>/admin">The Job</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarText">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="<%= request.getContextPath() %>/admin">Dashboard</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="<%= request.getContextPath() %>/admin/clients">Clients </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="<%= request.getContextPath() %>/admin/consultants">Consultants <span class="sr-only">(current)</span></a>
      </li>
    </ul>
    <span class="navbar-text">
      Welcome <%= session.getAttribute("username") %> !
      <a href="<%= request.getContextPath() %>/login"><i class='bx bx-log-out' id="log_out" ></i></a>
    </span>
  </div>
</nav>
  <section class="home-section">
    
      	<h2><div class="text">Consultants</div><input type="text" id="searchInput" class="input"  placeholder="Search by country...">
        <button type="button" id="searchButton" class="search-button">search</button></h2>

	<!-- Consultant Details -->
  <div class="column-3">
			<div class="right-column">
			  <div class="container">
			    <div class="table-container">
  <!-- <h2 class="header">Job Seekers' Details</h2>  -->
  <br>
  <ul class="responsive-table">
    <li class="table-header">
      <div class="col col-1" >Consultant</div>
      <div class="col col-2">Country</div>
      <div class="col col-3">Mobile</div>
      <div class="col col-4">Date</div>
      <div class="col col-5">Time</div>
      <div class="col col-6">Actions</div>
    </li>
    
    
    <c:forEach items="${consultants}" var="consultant">
    <form method="post" action="<%= request.getContextPath() %>/jobseeker/appointments" >
       <li class="table-row">
            <div class="col col-1" data-label="Username" >${consultant.username}</div>
            <div class="col col-2" data-label="Email" >${consultant.country}</div>
            <div class="col col-3" data-label="Mobile" >${consultant.mobile}</div>
            <div class="col col-4" data-label="Date" ><input type="date" name="appointmentDate"></div>
            <div class="col col-5" data-label="Time">
            <select name="appointmentTime">
                <option >Select</option>
            	<option value="9.30">9.30</option>
            	<option value="10.30">10.30</option>
            	<option value="11.30">11.30</option>
            	<option value="12.30">12.30</option>
            	<option value="2.30">2.30</option>
            	<option value="3.30">3.30</option>
            	<option value="4.30">4.30</option>
            </select>
            </div>
             <input type="hidden" name="consultantUsername" value="${consultant.username}">
   			 <input type="hidden" name="consultantEmail" value="${consultant.email}">
   			 <input type="hidden" name="consultantMobile" value="${consultant.mobile}">
            <div class="col col-6" data-label="More"><button class="book-button" type="submit">Book</button></div>
       </li>
        </form>
     </c:forEach>
    
  </ul>
</div> 
			  </div>
			</div>  </div>
  </section>
  <script>
  let sidebar = document.querySelector(".sidebar");
  let closeBtn = document.querySelector("#btn");
  let searchBtn = document.querySelector(".bx-search");

  closeBtn.addEventListener("click", ()=>{
    sidebar.classList.toggle("open");
    menuBtnChange();//calling the function(optional)
  });

  searchBtn.addEventListener("click", ()=>{ // Sidebar open when you click on the search iocn
    sidebar.classList.toggle("open");
    menuBtnChange(); //calling the function(optional)
  });

  // following are the code to change sidebar button(optional)
  function menuBtnChange() {
   if(sidebar.classList.contains("open")){
     closeBtn.classList.replace("bx-menu", "bx-menu-alt-right");//replacing the iocns class
   }else {
     closeBtn.classList.replace("bx-menu-alt-right","bx-menu");//replacing the iocns class
   }
  }
  

  </script>
</body>
</html>