<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <title>The Job</title>
    <!-- Boxicons CDN Link -->
    
    <link href="../css/style-02.css?version=1" rel="stylesheet" >
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">

   </head>
<body>
  <div class="sidebar">
    <div class="logo-details">
      <i class='bx bx-briefcase icon'></i>
        <div class="logo_name">The Job</div>
        <i class='bx bx-menu' id="btn" ></i>
    </div>
    <ul class="nav-list">
     <!--   <li>
          <i class='bx bx-search' ></i>
         <input type="text" placeholder="Search...">
         <span class="tooltip">Search</span>
      </li> -->
      <li>
        <a href="<%= request.getContextPath() %>/admin">
          <i class='bx bx-grid-alt'></i>
          <span class="links_name">Dashboard</span>
        </a>
         <span class="tooltip">Dashboard</span>
      </li>
      <li>
       <a href="<%= request.getContextPath() %>/admin/clients">
         <i class='bx bx-briefcase' ></i>
         <span class="links_name">Clients</span>
       </a>
       <span class="tooltip">Clients</span>
     </li>
     
     <li>
       <a href="<%= request.getContextPath() %>/admin/consultants">
		<i class='bx bx-bulb' ></i>
         <span class="links_name">Consultants</span>
       </a>
       <span class="tooltip">Consultants</span>
     </li>
     <li>
       <a href="<%= request.getContextPath() %>/admin/appointments">
         <i class='bx bx-calendar'></i>
         <span class="links_name">Appointments</span>
       </a>
       <span class="tooltip">Appointments</span>
     </li>
      <li>
       <a href="<%= request.getContextPath() %>/admin/reports">
         <i class='bx bxs-report'></i>
         <span class="links_name">Reports</span>
       </a>
       <span class="tooltip">Reports</span>
     </li>
     
     <li class="profile">
         <div class="profile-details">
           <img src="${pageContext.request.contextPath}/images/profile.png" alt="profileImg">
           <div class="name_job">
             <div class="name"><%= session.getAttribute("username") %></div>
             <div class="job">Web designer</div>
           </div>
         </div>
         <a href="<%= request.getContextPath() %>/login"><i class='bx bx-log-out' id="log_out" ></i></a>
     </li>
    </ul>
  </div>
  <section class="home-section">
   <h2><div class="text">Clients</div></h2>
	<!-- Details priting -->
  <div class="column-3">
			<div class="right-column">
			  <div class="container">
			    <div class="table-container">
  <!-- <h2 class="header">Job Seekers' Details</h2>  -->
				  <br>
				  <ul class="responsive-table">
				    <li class="table-header">
				      <div class="col col-1">Client Id</div>
				      <div class="col col-2">Email</div>
				      <div class="col col-3">Mobile</div>
				      <div class="col col-4">Delete</div>
				    </li>
				    
				    <c:forEach items="${jobSeekers}" var="jobSeeker">
				       <li class="table-row">
				            <div class="col col-1" data-label="Username">${jobSeeker.username}</div>
				            <div class="col col-2" data-label="Email">${jobSeeker.email}</div>
				            <div class="col col-3" data-label="Phone">${jobSeeker.mobile}</div>
				            <div class="col col-4" data-label="More">
				            <form method="post" action="<%= request.getContextPath()%>/admin/client/delete">
						        <input type="hidden" name="action" value="delete">
						        <input type="hidden" name="jobseekeremail" value="${jobSeeker.email}">
						        <button type="submit" class="delete-button">Delete</button>
						    </form>
						    </div>
				       </li>
				     </c:forEach>
				  </ul>
				</div> 
			 </div>
		</div>  
	</div>
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