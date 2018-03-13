
<%
	String username = "";
%>
<%
	System.out.println(("About to confirm null status"));
%>
<%
	if ((session.getAttribute("Email") == null)) {
		System.out.println("Forwarding to error because null  ");
		out.println("<script type=\"text/javascript\">");
		out.println("alert(' Please login first with the right credentials !!');");
		out.println("</script>");
		out.println("<script>");
		out.println(" var timer = setTimeout(function() {");
		out.println("window.location='index.html'");
		out.print("window.location='index.html'},100)");
		out.println("</script>");
		return;
	} else {

		username = session.getAttribute("Email").toString();
	}
%>



<%
	System.out.println("on Jsp page now because status is not null ");
%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>VFR || LOGGED IN</title>
<!-- custom-theme -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Funding Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
				Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript">
	
					 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
						function hideURLbar(){ window.scrollTo(0,1); } 

</script>

<style>
	
	input:checked + input[type = "text"] {
 border: 2px solid red;
    border-radius: 4px;
   
}

	</style>
<!-- Jsp imports -->
<%@ page import="models.Sqlhelper2"%>
<%@ page import="models.User"%>
<%@  page import="java.util.ArrayList"%>
<!-- Jsp imports  -->



<!-- //custom-theme -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="css/mainStyles.css" />
<link rel='stylesheet' href='css/dscountdown.css' type='text/css'
	media='all' />

<link rel="stylesheet" href="css/flexslider.css" type="text/css"
	media="screen" />
<!-- gallery -->
<link href="css/lsb.css" rel="stylesheet" type="text/css">
<!-- //gallery -->
<!-- font-awesome-icons -->
<link href="css/font-awesome.css" rel="stylesheet">
<link
	href="//fonts.googleapis.com/css?family=Source+Sans+Pro:300,300i,400,400i,600,600i,700,900"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />

</head>
<body>
	<!-- banner -->
	<div class="header">


		<div class="w3layouts_header_left">
			<form action="Controller" method="post">

				<div class="containerlogout">
					<input class="submitt" type="submit" name="logout" value="Logout" />
					<input type="hidden" name="action" value="logout">
				</div>
			</form>

		</div>
		<div class="clearfix"></div>

	</div>

	<div class="banner">

		<div class="navbar-header navbar-left">

			<h1>
				<a class="navbar-brand"><span>V</span><span>F</span><span>R</span>
				</a>
			</h1>

		</div>

		<!-- /banner -->
		<div class="banner1">
			<div class="wthree_banner1_info">
				<h3>
					<span>Welcome</span>
					<span style ="color:white;"><%
						if (username != null) {

							out.println("<h1>" + "<center>" + username + "</center>" + "</h1>");
						}
					%></span>
				</h3>

			</div>
			<!--timer-->
			<div class="agileits-timer">
				<div class="main-title">
					<h4>Hours to Go !</h4>
					<div class="demo2"></div>
				</div>
			</div>

			<!--//timer-->
		</div>
		<div class="container" style="margin-left: 3em;">
			<div class="w3_agile_team_grid">
				<div class="w3_agile_team_grid_left">
					<br> <br> <br> <br> <br>
					<h3 class="w3l_header w3_agileits_header">
						Please ensure you have written a <span> Letter on paper </span>
						before submitting.
					</h3>

					<p class="sub_para_agile">Please check a box, and enter the
						corresponding number of letter(s) you have in order to submit. ...</p>
				</div>
			</div>
		</div>
		<!-- //banner -->
		</nav>
	</div>
	<br>
	<br>
	<br>
	<!-- cases  -->

	<div style="float: left;">
		<form action="Controller" name = Letterform method="post" style="margin-left: 6em;">
			<input type="checkbox" name="Case1" value="case1" class="myCheckBox">
			CASE 1 : <input type="text" name="quantity1" class="myInputValue" value="0"
				onkeyup="this.value=this.value.replace(/[^\d]/,'')">
				 <br> <br>
			<input type="checkbox" name="Case2" value="case2" class="myCheckBox">
			CASE 2 : <input type= "text" name="quantity2" class="myInputValue" value="0"
				onkeyup="this.value=this.value.replace(/[^\d]/,'')">
			<br> <br> 
			<input type="checkbox" name="Case3" value="case3"
				class="myCheckBox"> CASE 3 : <input type="text"
				name="quantity3" class="myInputValue" value="0"
				onkeyup="this.value=this.value.replace(/[^\d]/,'')"> 
				<br> <br> 
			<input
				type="checkbox" name="Case4" value="case4" class="myCheckBox">
			CASE 4 : <input type="text" name="quantity4" class="myInputValue" value="0"
				onkeyup="this.value=this.value.replace(/[^\d]/,'')">
			<br> <br>
			 <input type="checkbox" name="Case5" value="case5"
				class="myCheckBox"> CASE 5 : <input type="text"
				name="quantity5" class="myInputValue" value="0"
				onkeyup="this.value=this.value.replace(/[^\d]/,'')">
				 <br> <br> 
		   <input
				type="checkbox" name="Case6" value="case6" class="myCheckBox">
			CASE 6 : <input type="text" name="quantity6" class="myInputValue" value="0"
				onkeyup="this.value=this.value.replace(/[^\d]/,'')">
			<br> <br> <input type="checkbox" name="Case7" value="case7"
				class="myCheckBox"> CASE 7 : <input type="text"
				name="quantity7" class="myInputValue" value="0"
				onkeyup="this.value=this.value.replace(/[^\d]/,'')"> <br> <br> <input
				type="submit" name="submit" class="submitt" onclick="valthis(); ">
			<input type="hidden" name="action" value="submitletter">
		</form>

	</div>

	<br>

	<form action="Controller" method="post" style="float: right;">
		<h3 class="w3l_header w3_agileits_header">
			Here without <span> Permission ? </span>
		</h3>
		<br> <input type="text" name="recipient" required size="50"
			placeholder="Teacher's email" /> <br> <br> <input
			type="submit" class="submitt" value="Send Email" /> <input
			type="hidden" name="action" value="teacherPermission">
	</form>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>


	<script>
	
	function valthis() {
		var checkBoxes = document.getElementsByClassName('myCheckBox');
		var isChecked = false;
		    for (var i = 0; i < checkBoxes.length; i++) {
		        if ( checkBoxes[i].checked ) {
		            isChecked = true;
		            
		        };
		    };
		    if ( isChecked) {
		    	
		    	
		    	
		        } else {
		        	
		            alert( 'Please, check at least one Case type! ' );
		          
		        }   
		}
	
	</script>

	
	<!--cases  -->

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>


	<!-- stats -->


	<!-- Jsp to handle Stats -->

	<%
		int number = Sqlhelper2.user_total_submitted(session.getAttribute("Email").toString());
		//it will return the list of letters per user session email.

		Sqlhelper2.user_submitted_per_case(session.getAttribute("Email").toString());

		ArrayList<Integer> list = Sqlhelper2.Per_case_results();
	%>

	<!-- Jsp to handle Stats -->


	<div class="stats">
		<div class="col-md-3 w3layouts_stats_left w3_counter_grid">
			<p class="counter">
				<%
					out.println(number);
				%>
			</p>
			<h3>Total letters so far</h3>
		</div>


		<div class="col-md-3 w3layouts_stats_left w3_counter_grid1">
			<p class="counter">
				<%
					out.println(list.get(0));
				%>
			</p>
			<h3>Case 1 Letter(s)</h3>
		</div>
		<div class="col-md-3 w3layouts_stats_left w3_counter_grid2">
			<p class="counter">
				<%
					out.println(list.get(1));
				%>
			</p>
			<h3>Case 2 Letter(s)</h3>
		</div>
		<div class="col-md-3 w3layouts_stats_left w3_counter_grid3">
			<p class="counter">
				<%
					out.println(list.get(2));
				%>
			</p>
			<h3>Case 3 Letter(s)</h3>
		</div>
		<div class="col-md-3 w3layouts_stats_left w3_counter_grid"
			style="background-color: #47cf73;">
			<p class="counter">
				<%
					out.println(list.get(3));
				%>
			</p>
			<h3>Case 4 Letter(s)</h3>
		</div>
		<div class="col-md-3 w3layouts_stats_left w3_counter_grid1"
			style="background-color: #ccc;">
			<p class="counter">
				<%
					out.println(list.get(4));
				%>
			</p>
			<h3>Case 5 Letter(s)</h3>
		</div>
		<div class="col-md-3 w3layouts_stats_left w3_counter_grid"
			style="background-color: #47cf73;">
			<p class="counter">
				<%
					out.println(list.get(5));
				%>
			</p>
			<h3>Case 6 Letter(s)</h3>
		</div>
		<div class="col-md-3 w3layouts_stats_left w3_counter_grid"
			style="background-color: #fc636b;">
			<p class="counter">
				<%
					out.println(list.get(6));
				%>
			</p>
			<h3>Case 7 Letter(s)</h3>
		</div>
		<div class="clearfix"></div>
	</div>


	<!-- stats -->
	<!-- stats -->
	<!-- stats -->
	<!-- stats -->
	<!-- //stats -->
	<!-- stats -->

	<!-- footer -->
	<div class="footer_agile_w3ls">
		<div class="container">

			<div class="agileits_w3layouts_logo logo2">
				<h2>
					<a href="index.html"> Voices For Refugees || Write for Rights</a>
				</h2>
				<div class="agileits-social">
					<ul>
						<li><a
							href="https://www.facebook.com/groups/1293212817359495/"><i
								class="fa fa-facebook"></i></a></li>

					</ul>
				</div>

			</div>
		</div>
	</div>
	<div class="wthree_copy_right">
		<div class="container">
			<p>
				© 2017 Voices for Refugees.. All rights reserved | Design by W3
				Layouts <a href="http://resonanceafrica.com" target="_blank">Implemented
					by Resonance </a>
			</p>
		</div>
	</div>
	<!-- //footer -->

	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>

					<div class="signin-form profile">
						<h3 class="agileinfo_sign">Sign In</h3>
						<div class="login-form">
							<form action="#" method="post">
								<input type="email" name="email" placeholder="E-mail"
									required=""> <input type="password" name="password"
									placeholder="Password" required="">
								<div class="tp">
									<input type="submit" value="Sign In">
								</div>
							</form>
						</div>
						<div class="login-social-grids">
							<ul>
								<li><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li><a href="#"><i class="fa fa-rss"></i></a></li>
							</ul>
						</div>
						<p>
							<a href="#" data-toggle="modal" data-target="#myModal3">
								Don't have an account?</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //Modal1 -->
	<!-- Modal2 -->
	<div class="modal fade" id="myModal3" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>

					<div class="signin-form profile">
						<h3 class="agileinfo_sign">Sign Up</h3>
						<div class="login-form">
							<form action="#" method="post">
								<input type="text" name="name" placeholder="Username"
									required=""> <input type="email" name="email"
									placeholder="Email" required=""> <input type="password"
									name="password" placeholder="Password" required=""> <input
									type="password" name="password" placeholder="Confirm Password"
									required=""> <input type="submit" value="Sign Up">
							</form>
						</div>
						<p>
							<a href="#"> By clicking register, I agree to your terms</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //Modal2 -->

	<!-- //bootstrap-pop-up -->
	<!-- js -->
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<!-- //js -->
	<script src="js/bars.js"></script>
	<!-- stats -->
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.countup.js"></script>
	<script>
		$('.counter').countUp();
	</script>
	<!-- //stats -->
	<!-- carousal -->
	<script src="js/slick.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
		$(document).on('ready', function() {
			$(".center").slick({
				dots : true,
				infinite : true,
				centerMode : true,
				slidesToShow : 2,
				slidesToScroll : 2,
				responsive : [ {
					breakpoint : 768,
					settings : {
						arrows : true,
						centerMode : false,
						slidesToShow : 2
					}
				}, {
					breakpoint : 480,
					settings : {
						arrows : true,
						centerMode : false,
						centerPadding : '40px',
						slidesToShow : 1
					}
				} ]
			});
		});
	</script>
	<!-- //carousal -->
	<!-- start-smooth-scrolling -->
	<script type="text/javascript" src="js/move-top.js"></script>
	<script type="text/javascript" src="js/easing.js"></script>
	<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event) {
				event.preventDefault();
				$('html,body').animate({
					scrollTop : $(this.hash).offset().top
				}, 1000);
			});
		});
	</script>
	<!-- start-smooth-scrolling -->
	<!-- for bootstrap working -->
	<script src="js/bootstrap.js"></script>
	<!-- //for bootstrap working -->
	<!-- here stars scrolling icon -->
	<script type="text/javascript">
		$(document).ready(function() {
			/*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
			 */

			$().UItoTop({
				easingType : 'easeOutQuart'
			});

		});
	</script>
	<!-- //here ends scrolling icon -->



	<!-- js -->
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<!-- //js -->
	<!-- Counter required files -->
	<script type="text/javascript" src="js/dscountdown.min.js"></script>
	<script src="js/demo-1.js"></script>
	<script>
		jQuery(document).ready(function($) {
			$('.demo2').dsCountDown({
				endDate : new Date("December 8, 2017 17:00:00"),
				theme : 'white'
			});
		});
	</script>
	<!-- //Counter required files -->
</body>
</html>