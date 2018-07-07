	
<style>
	/* The sidebar menu */
	.leftArea {
	    height: 100%; /* Full-height: remove this if you want "auto" height */
	    width: 15%; /* Set the width of the sidebar */
	    position: fixed; /* Fixed Sidebar (stay in place on scroll) */
	    z-index: 1; /* Stay on top */
	    top: 0; /* Stay at the top */
	    left: 0;
	    background-color: #f3f3f3; /* Black */
	    overflow-x: hidden; /* Disable horizontal scroll */
	    padding-top: 20px;
	    margin-top:200px;
	}
	
	/* The navigation menu links */
	.leftArea a {
	    padding: 6px 8px 6px 16px;
	    text-decoration: none;
	    font-size: 25px;
	    color: #464242;
	    display: block;
	}
	
	/* When you mouse over the navigation links, change their color */
	.leftArea a:hover {
	    color: black;
	}
	
</style>
	
	
<div>
	<nav class="leftArea">
        <ul class="list-unstyled components">
           <li>
               <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Home</a>
               <ul class="collapse list-unstyled" id="homeSubmenu">
                   <li>
                       <a href="#home1Submenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Home 1</a>
						<ul class="collapse list-unstyled" id="home1Submenu">
							<li>
                       			<a href="#">Home1_1</a>
                  			</li>
                   			<li>
                       			<a href="#">Home1_2</a>
                   			</li>
                   			<li>
                       			<a href="#">Home1_3</a>
                   			</li>
               			</ul>
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
       </ul> 
   </nav>
</div>