
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String username = "";
%>

<!-- Jsp Imports -->
<%@ page import="models.Admin"%>
<%@ page import="models.Sqlhelper2"%>
<%@ page import="java.util.ArrayList"%>

<!-- Jsp Imports -->

<!-- Jsp to handle Stats -->

<%
	int number = Sqlhelper2.admin_get_total_users();
	//it will return the list of letters per user session email.

	Sqlhelper2.admin_total_percase();
	ArrayList<Integer> list = Sqlhelper2.Total_per_Case_results();

	int Total_letters_at_Event = list.get(0) + list.get(1) + list.get(2) + list.get(3) + list.get(4)+ list.get(5)+list.get(6);
%>

<!-- Jsp to handle Stats -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>VFR || Track</title>
<!-- custom-theme -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- <meta http-equiv="refresh" content="60"> -->
<meta name="keywords"
	content="Funding Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
				Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript">
	
	
	
	

					 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
						function hideURLbar(){ window.scrollTo(0,1); } 




</script>

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


		<div class="w3layouts_header_left" style="padding-top: 30px;">

			<button onclick="location.href = 'index.html'">Go to
				homepage</button>

		</div>
		<div class="clearfix"></div>

	</div>

	<div class="banner">
		<nav class="navbar navbar-default">
		<div class="navbar-header navbar-left">

			<h1>
				<a class="navbar-brand"><span>V</span><span>F</span><span>R</span>
				</a>
			</h1>

		</div>

		<!-- /banner -->
		<div class="banner1">
			<div class="wthree_banner1_info">
				<div id="load">
					<h3>
						<span style="font-size: 2.9em; color: white;"> <%
 	out.println(Total_letters_at_Event);
 %>
						</span> Letters written in total.
					</h3>
				</div>
			</div>

		</div>

		<!-- //banner --> </nav>
	</div>
	<br>
	<br>
	<br>
	<div id="load1">
		<div class="container">
			<div class="jumbotron">


				<h3>
					<span style="font-size: 2em; color: green;"> <%
 	out.println(list.get(0));
 %>
					</span> Case 1 Letter(s) have been written so far.
				</h3>

			</div>
		</div>
	</div>

	<div id="load2">
		<div class="container">
			<div class="jumbotron">

				<h3>
					<span style="font-size: 2em; color: green;"> <%
 	out.println(list.get(1));
 %>
					</span> Case 2 Letter(s) have been written so far.
				</h3>
			</div>
		</div>
	</div>

	<div id="load3">
		<div class="container">
			<div class="jumbotron">

				<h3>
					<span style="font-size: 2em; color: green;"> <%
 	out.println(list.get(2));
 %>
					</span> Case 3 Letter(s) have been written so far.
				</h3>
			</div>
		</div>
	</div>

	<div id="load4">
		<div class="container">
			<div class="jumbotron">

				<h3>
					<span style="font-size: 2em; color: green;"> <%
 	out.println(list.get(3));
 %>
					</span> Case 4 Letter(s) have been written so far.
				</h3>
			</div>
		</div>

	</div>

	<div id="load5">
		<div class="container">
			<div class="jumbotron">

				<h3>
					<span style="font-size: 2em; color: green;"> <%
 	out.println(list.get(4));
 %>
					</span> Case 5 Letter(s) have been written so far.
				</h3>

			</div>

		</div>
	</div>
	
	<div id="load6">
		<div class="container">
			<div class="jumbotron">

				<h3>
					<span style="font-size: 2em; color: green;"> <%
 	out.println(list.get(5));
 %>
					</span> Case 6 Letter(s) have been written so far.
				</h3>

			</div>

		</div>
	</div>
	<div id="load7">
		<div class="container">
			<div class="jumbotron">

				<h3>
					<span style="font-size: 2em; color: green;"> <%
 	out.println(list.get(6));
 %>
					</span> Case 7 Letter(s) have been written so far.
				</h3>

			</div>

		</div>
	</div>
	
	<br>
	<br>
	<br>



<!-- ----------------------Script for auto reload of Stats --------------------------- -->

	<script>
		var auto_refresh = setInterval(function() {
			jQuery('#load').load('Track.jsp #load');
		}, 30000); //autorefresh the content of the stats after
		//every 30000 milliseconds(1sec)
	</script>
	<script>
		var auto_refresh = setInterval(function() {
			jQuery('#load1').load('Track.jsp #load1');
		}, 30000); // autorefresh the content of the stats after
		//every 30000 milliseconds(30secs)
	</script>
	<script>
		var auto_refresh = setInterval(function() {
			jQuery('#load2').load('Track.jsp #load2');
		}, 30000); // autorefresh the content of the stats after
		//every 30000 milliseconds(30secs)
	</script>
	<script>
		var auto_refresh = setInterval(function() {
			jQuery('#load3').load('Track.jsp #load3');
		}, 30000); //autorefresh the content of the stats after
		//every 30000 milliseconds(30secs)
	</script>
	<script>
		var auto_refresh = setInterval(function() {
			jQuery('#load4').load('Track.jsp #load4');
		}, 30000); // autorefresh the content of the stats after
		//every 30000 milliseconds(30secs)
	</script>
	<script>
		var auto_refresh = setInterval(function() {
			jQuery('#load5').load('Track.jsp #load5');
		}, 30000); // autorefresh the content of the stats after
		//every 30000 milliseconds(30secs)
	</script>
<script>
		var auto_refresh = setInterval(function() {
			jQuery('#load6').load('Track.jsp #load6');
		}, 30000); //autorefresh the content of the stats after
		//every 30000 milliseconds(1sec)
	</script><script>
		var auto_refresh = setInterval(function() {
			jQuery('#load7').load('Track.jsp #load7');
		}, 30000); //autorefresh the content of the stats after
		//every 30000 milliseconds(1sec)
	</script>

<!-- -----------------------Script for auto reload of Stats --------------------------- -->

	<!-- footer -->
	<div class="footer_agile_w3ls">
		<div class="container">
			
				<div class="clearfix"></div>

			</div>
			<div class="agileits_w3layouts_logo logo2">
				<h2>
					<a href="index.html"> Voices For Refugees || Write for Rights</a>
				</h2>
				<div class="agileits-social">
					<ul>
						<li><a href="https://www.facebook.com/groups/1293212817359495/"><i class="fa fa-facebook"></i></a></li>
					
					</ul>
				</div>

			</div>
		</div>
	</div>
	<div class="wthree_copy_right">
		<div class="container">
			<p>
				© 2017 Voices for Refugees.. All rights reserved | Design by W3 Layouts <a
					href="http://resonanceafrica.com" target= "_blank">Implemented by Resonance </a>
			</p>
		</div>
	</div>
	<!-- //footer -->

	
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
				endDate : new Date("December 24, 2020 23:59:00"),
				theme : 'white'
			});
		});
	</script>
	<!-- //Counter required files -->
</body>
</html>