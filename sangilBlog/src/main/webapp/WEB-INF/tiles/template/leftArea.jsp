	
<style>
	/* The sidebar menu */
	.sidenav {
	    height: 100%; /* Full-height: remove this if you want "auto" height */
	    width: 15%; /* Set the width of the sidebar */
	    position: fixed; /* Fixed Sidebar (stay in place on scroll) */
	    z-index: 1; /* Stay on top */
	    top: 0; /* Stay at the top */
	    left: 0;
	    background-color: #f3f3f3; /* Black */
	    overflow-x: hidden; /* Disable horizontal scroll */
	    padding-top: 20px;
	    margin-top:140px;
	}
	
	/* The navigation menu links */
	.sidenav a {
	    padding: 6px 8px 6px 16px;
	    text-decoration: none;
	    font-size: 25px;
	    color: #818181;
	    display: block;
	}
	
	/* When you mouse over the navigation links, change their color */
	.sidenav a:hover {
	    color: #f1f1f1;
	}
	
	/* Style page content */
	.main {
	    margin-left: 160px; /* Same as the width of the sidebar */
	    padding: 0px 10px;
	}
	
	/* On smaller screens, where height is less than 450px, change the style of the sidebar (less padding and a smaller font size) */
	@media screen and (max-height: 450px) {
	    .sidenav {padding-top: 15px;}
	    .sidenav a {font-size: 18px;}
	}
</style>
	
	<nav class="sidenav d-none d-sm-block">
       <div class="sidebar-header">
           <h3>sidebar</h3>
       </div>
       
       <a href="#">123t</a>

       <!-- <ul class="list-unstyled components">
           <li class="active">
               <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Home</a>
               <ul class="collapse list-unstyled" id="homeSubmenu">
                   <li>
                       <a href="#">Home 1</a>
                   </li>
                   <li>
                       <a href="#">Home 2</a>
                   </li>
                   <li>
                       <a href="#">Home 3</a>
                   </li>
               </ul>
           </li>
           <li>
               <a href="#">About</a>
           </li>
           <li>
               <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Pages</a>
               <ul class="collapse list-unstyled" id="pageSubmenu">
                   <li>
                       <a href="#">Page 1</a>
                   </li>
                   <li>
                       <a href="#">Page 2</a>
                   </li>
                   <li>
                       <a href="#">Page 3</a>
                   </li>
               </ul>
           </li>
           <li>
               <a href="#">Portfolio</a>
           </li>
           <li>
               <a href="#">Contact</a>
           </li>
       </ul> -->
   </nav>