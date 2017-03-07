<!DOCTYPE html>
<html>
<head>
{asset name="Head"}
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="/themes/Cube/design/steam/enable.css" media="all" />
{literal}
<style type="text/css">
/* Abi */
.orifooter p::selection,.orifooter a::selection,.orifooter span::selection,.orifooter img::selection,.orifooter h3::selection { background:{/literal}#{text code="BlueColor" default=$BlueColor};{literal};color:#ffffff; }
.orifooter p::-moz-selection,.orifooter a::-moz-selection,.orifooter span::-moz-selection,.orifooter img::-moz-selection,.orifooter h3::-moz-selection{ background:{/literal}#{text code="BlueColor" default=$BlueColor};{literal};color:#ffffff; }
body.Section-Entry .CreateAccount a{color:{/literal}#{text code="BlueColor" default=$BlueColor};{literal};transition: all 0.3s;}
body.EditMode .ProfileOptions .ProfileButtons:before {content: "\f0a8";position:absolute;top:0px;left:-18px;margin-right:7px;font-family:'FontAwesome';color:{/literal}#{text code="BlueColor" default=$BlueColor};{literal};font-size:16px;}
body.Section-Conversation .fulix input {background:{/literal}#{text code="BlueColor" default=$BlueColor};{literal};color:white;}
body.Section-Conversation .fulix input:hover {background:{/literal}#{text code="BlueColor" default=$BlueColor};{literal};opacity:0.8;}
body.Section-PostConversation .ContentColumn .Button {background: {/literal}#{text code="BlueColor" default=$BlueColor};{literal};}
.nocommentwrap{background: {/literal}#{text code="BlueColor" default=$BlueColor};{literal};}
.Note {transition: all 0.3s;background:{/literal}#{text code="BlueColor" default=$BlueColor};{literal};margin: 0px 25px 50px 72px;color:white;position:relative;}
.PageDescription {background:{/literal}#{text code="BlueColor" default=$BlueColor};{literal};margin: 45px 18px 0px 0px;color:white;position:relative;}
.blackit a:hover i {color: {/literal}#{text code="BlueColor" default=$BlueColor};{literal};}
body.Section-Profile .PanelInfo li a:hover{text-decoration:none;background:{/literal}#{text code="BlueColor" default=$BlueColor};{literal};color:white;}
a.cube-btn{color: {/literal}#{text code="BlueColor" default=$BlueColor};{literal};border:1px solid {/literal}#{text code="BlueColor" default=$BlueColor};{literal};}
a.cube-btn{color: {/literal}#{text code="BlueColor" default=$BlueColor};{literal};border:1px solid {/literal}#{text code="BlueColor" default=$BlueColor};{literal};}
a.cube-btn:hover{text-decoration:none;opacity:0.8;background:{/literal}#{text code="BlueColor" default=$BlueColor};{literal};color: #ffffff;}
#cssmenu > ul > li > i {top:7px;position:relative;z-index:10;font-size:39px;color: {/literal}#{text code="BlueColor" default=$BlueColor};{literal};}
#cssmenu ul ul li:hover > a {background: {/literal}#{text code="BlueColor" default=$BlueColor};{literal};}
#cssmenumob > ul > li > i {top:7px;position:relative;z-index:10;font-size:39px;color: {/literal}#{text code="BlueColor" default=$BlueColor};{literal};}
#cssmenumob ul ul li:hover > a {background: {/literal}#{text code="BlueColor" default=$BlueColor};{literal};}
#cssmenu ul ul li:hover > a {background: {/literal}#{text code="BlueColor" default=$BlueColor};{literal};}
#cssmenumob ul ul li:hover > a {background: {/literal}#{text code="BlueColor" default=$BlueColor};{literal};}
a {color: {/literal}#{text code="BlueColor" default=$BlueColor};{literal};}
#social a:hover{color:{/literal}#{text code="BlueColor" default=$BlueColor};{literal};text-decoration:none;}
.Button {transition: all 0.3s;background:{/literal}#{text code="BlueColor" default=$BlueColor};{literal};border:none;box-shadow:none;text-shadow:none;color:#ffffff;font-family:'Open Sans';}
.Button:hover,.Button:focus{background: {/literal}#{text code="BlueColor" default=$BlueColor};{literal};color:#ffffff;opacity:0.8;}
.PanelColumn li.steam-btn a:hover{opacity:1;background:{/literal}#{text code="BlueColor" default=$BlueColor};{literal};text-decoration:none;}
.LastCommentBy a {color:{/literal}#{text code="BlueColor" default=$BlueColor};{literal};}
.registerbtn .Button:hover,.registerbtn .Button:focus{background:{/literal}#{text code="BlueColor" default=$BlueColor};{literal};color:white;}
.Count {background: {/literal}#{text code="BlueColor" default=$BlueColor};{literal};border-radius: 50px;padding:3px 6px 3px 7px}
#Panel .FilterMenu li.AllCategories:hover {transition: all 0.4s;border-left:3px solid #ffffff;background:{/literal}#{text code="BlueColor" default=$BlueColor};{literal};}
#Panel .FilterMenu li.Activities:hover {transition: all 0.4s;border-left:3px solid #ffffff;background:{/literal}#{text code="BlueColor" default=$BlueColor};{literal};}
#Panel .FilterMenu li.Discussions:hover {transition: all 0.4s;border-left:3px solid #ffffff;background:{/literal}#{text code="BlueColor" default=$BlueColor};{literal};}
#Panel .FilterMenu li:hover {transition: all 0.4s;border-left:3px solid #ffffff;background:{/literal}#{text code="BlueColor" default=$BlueColor};{literal};}
#Panel .FilterMenu li:hover .Count {color:{/literal}#{text code="BlueColor" default=$BlueColor};{literal};background:white;}
.CategoryFilter a {color:{/literal}#{text code="BlueColor" default=$BlueColor};{literal};}
.PanelCategories a:hover{color:{/literal}#{text code="BlueColor" default=$BlueColor};{literal};}
.PanelCategories li:hover{background: {/literal}#{text code="BlueColor" default=$BlueColor};{literal};}
.PanelCategories li:hover .Count {color:{/literal}#{text code="BlueColor" default=$BlueColor};{literal};background:white;}
.ifmag img {border:1px solid {/literal}#{text code="BlueColor" default=$BlueColor};{literal};}
.uiusx a {color:{/literal}#{text code="BlueColor" default=$BlueColor};{literal};font-size:13px;font-weight:bold;font-family:'Open Sans';}
.iipo a {color:{/literal}#{text code="BlueColor" default=$BlueColor};{literal};font-size:14px !important;font-weight:bold;font-family:'Open Sans';}
.ffg a:link{color:{/literal}#{text code="BlueColor" default=$BlueColor};{literal};}
.AuthorWrap a{color: {/literal}#{text code="BlueColor" default=$BlueColor};{literal};font-size: 14px !important;}
.PageDescription {background: {/literal}#{text code="BlueColor" default=$BlueColor};{literal} url(p.png) 2.5% 53% no-repeat;}

/* banafsh */
#cssmenu > ul > li:hover > a,#cssmenumob > ul > li > a:hover,#cssmenu > ul > li > a:hover,#cssmenumob > ul > li:hover > a{background: {/literal}#{text code="VioletColor" default=$VioletColor};{literal};}


/* soorati */
.Tag-Announcement {background: {/literal}#{text code="PinkColor" default=$PinkColor};{literal};
body.Section-Entry .CreateAccount a:hover{color:{/literal}#{text code="PinkColor" default=$PinkColor};{literal};}
.Connection-Connect .Button:hover{background:{/literal}#{text code="PinkColor" default=$PinkColor};{literal};opacity:1;}
.ore{background:{/literal}#{text code="PinkColor" default=$PinkColor};{literal};margin-top:7px;}
.Errors ul li {background: {/literal}#{text code="PinkColor" default=$PinkColor};{literal} !important;
.Errors ul {background: {/literal}#{text code="PinkColor" default=$PinkColor};{literal} !important;border: 1px solid #EB3D59 !important;
.Errors ul {background: #EB3D59 !important;border: 1px solid {/literal}#{text code="PinkColor" default=$PinkColor};{literal} !important;
.nocommentwrap:hover {background: {/literal}#{text code="PinkColor" default=$PinkColor};{literal};}
.DataBox-Comments:hover .nocommentwrap{background: {/literal}#{text code="PinkColor" default=$PinkColor};{literal};}
.Note:hover {background: {/literal}#{text code="PinkColor" default=$PinkColor};{literal};}
.AuthorWrap a:hover,.uiusx a:hover {color: {/literal}#{text code="PinkColor" default=$PinkColor};{literal};}
.MenuItems a:hover{background: {/literal}#{text code="PinkColor" default=$PinkColor};{literal} !important;color:white !important;}
.HasNew{background: {/literal}#{text code="PinkColor" default=$PinkColor};{literal}; color: white; padding: 2px 12px; float: right; position: relative; top: 4px;}
a:hover {color: {/literal}#{text code="PinkColor" default=$PinkColor};{literal};}
.fic > li > a {font-weight: 400; background:{/literal}#{text code="PinkColor" default=$PinkColor};{literal};0;transition: all 0.5s;padding-right:55px;padding-left:55px;
.fic > li > a:hover,.fic > li > a:focus{ color:#ffffff !important;background:{/literal}#{text code="PinkColor" default=$PinkColor};{literal} !important;border-top:3px solid #f9f9f9 !important;}
.dropdown-menu > li > a:hover .ofolddropdown  {border-bottom: 11px solid {/literal}#{text code="PinkColor" default=$PinkColor};{literal};}
.navbar-brand, .navbar-nav > li > a:hover {border-top:3px solid {/literal}#{text code="PinkColor" default=$PinkColor};{literal};background:#f9f9f9;}
.navbar-nav > li.hguest{position:relative;background:{/literal}#{text code="PinkColor" default=$PinkColor};{literal};padding:12px 25px;color:#fff;margin-top:17px;margin-left:27px;}
.dropdown-menu > li > a:hover,.dropdown-menu > li > a:focus {background: {/literal}#{text code="PinkColor" default=$PinkColor};{literal} !important;color:#ffffff;transition: all 0.3s;}
L.ofoldright{border-bottom: 15px solid {/literal}#{text code="PinkColor" default=$PinkColor};{literal};
.ofoldleft {border-bottom: 15px solid {/literal}#{text code="PinkColor" default=$PinkColor};{literal};
.foldbottom {margin-top:-36px;margin-bottom:1px;background:{/literal}#{text code="PinkColor" default=$PinkColor};{literal};}
.e1 {background:{/literal}#{text code="PinkColor" default=$PinkColor};{literal};}
input.agree {line-height: 36px;font-family:'Open Sans';background:{/literal}#{text code="PinkColor" default=$PinkColor};{literal};display: block;width: 100%;padding: 6px;text-align: center;border-radius: 0px;color: #ffffff;font-size: 15px;border:none;margin-bottom:0px;}
a.newtopicr {transition: all 0.3s;float:right;background:{/literal}#{text code="PinkColor" default=$PinkColor};{literal};border-radius:2px;padding:10px 20px;color:#ffffff;font-family:'Open Sans';font-size:14px;}
#navigation #active-subsection a:link,#navigation #active-subsection a:visited {background:{/literal}#{text code="PinkColor" default=$PinkColor};{literal};}
.PageControls li.steam-btn a:hover{opacity:1;background:{/literal}#{text code="PinkColor" default=$PinkColor};{literal};color:#ffffff;text-decoration:none;}
.iipo img {border: 1px solid {/literal}#{text code="PinkColor" default=$PinkColor};{literal};

</style>

{/literal}
    <link rel="stylesheet" href="/themes/Cube/design/webvalley/css/custom.css"/>
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,100italic,100,300,300italic,400italic,500,500italic,700,900,700italic,900italic' rel='stylesheet'>
</head>

<body id="{$BodyID}" class="{$BodyClass}">


<!-- Begin of Header -->
	<header>
		<div class="container">
			<div class="row">

			
<!-- Begin of Logo -->
					<div class="col-md-3 logocol">
					    <a href="http://my.flofit.com"><i class="ff-flofitlogo"></i></a>
                        <span>Community</span>
						{logout_link}
					</div>
<!-- End of Logo -->

<!-- Begin of Menu -->
					<div id="cssmenu" class="respcfulix">
					<ul>
					    {steamhome_link}
                        {steamcats_link}
                        {inbox_link}
                        {steamactivity_link}

                        {*{steamdiscus_link}*}
                        {if $User.SignedIn}
					{*<li class="active has-sub"><i class="icon-eq"></i><a class="demarket" href="#">More</a>*}
					{*<ul>*}
					{*{dashboard_link}*}

					{*{profile_link}	*}
					{*{signinout_link}*}
					{*</li>*}
					{*</ul>*}
					{*</li>*}
					{/if}
					
					{if !$User.SignedIn}
					<li class="steamlogin"><i class="icon-direction"></i><a href="{link path="entry/signin"}" rel="nofollow" class="">Sign In</a></li>
					{*<li class="steamlogin"><i class="icon-user-add"></i><a href="{link path="entry/register"}" rel="nofollow">Register</a></li>*}
					{/if}
                        {*<li style="top: -8px;"><i class="ff-FF-logo" style="font-size: 60px !important;"></i><a href="http://my.flofit.sandbox.modpreneur.com/" style="top: -76px;"></a></li>*}
					</ul>
					</div>
<!-- End of Menu -->



<!-- Begin of Mobile Menu -->
					<div class="thecover"></div>
					<div id="cssmenumob" class="resmobifulix">
					<ul class="ramnova">
					<li class="active hassub"><i class="icon-eq"></i><a class="demarket">Menu</a>
					<ul class="reiva">
		  
					{dashboard_link}
					{discussions_link}
					{categories_link}
					{activity_link}
					{inbox_link}
					
					{if !$User.SignedIn}
					<li><a href="{link path="entry/register"}" rel="nofollow">Register</a></li>
					{/if}

					</ul>
					</li>

					</ul>
					</div>
<!-- End of Mobile Menu -->


			</div>
		</div>
	</header>
<!-- End of Header -->


<!-- Begin of Search Section -->
	<section id="searching"><h6>search</h6>
		<div class="container">
			
			{*<div class="BreadcrumbsWrapper">{breadcrumbs}</div>*}
			<!-- Search Input --><div class="searchio">{searchbox}<i class="pe-7s-search"></i></div>
			
		</div>
	</section>
<!-- End of Search Section -->


<!-- Begin of Content -->
	<section id="Frame"><h6>frame</h6>
		<section id="Body">
			<div class="container relative">
			
<!-- Begin of Sidebar -->
				<div class="steam-line"></div>
				<div class="Column PanelColumn" id="Panel">
				{module name="MeModule"}
				{asset name="Panel"}
<!-- Sidebar Widgets -->
				</div>
<!-- End of Sidebar -->
<!-- Begin of Main -->
				<div class="Column ContentColumn" id="Content">{asset name="Content"}</div>
<!-- End of Main -->
            </div>
        </section>
  
  
<!-- Begin of Foot -->
		<section id="Foot"><h6>foot</h6>
			
			<div class="container">
			{asset name="Foot"}
			</div>
			
		</section>
		
	</section>
   {event name="AfterBody"}
<!-- End of Foot -->
<!-- End of Content -->

   
   
   
<!-- Begin of Footer -->
	<section id="orifooter">
		<div class="container">
			<div class="pou">

			<!-- Begin of row --><div class="row footrip">
				
<!-- Footer Widgets -->


			</div>
<!-- End of row -->



<!-- Begin of Copyrights -->
	<div class="row footdw">
		<div class="row block">
            <div class="block-left">
                <p><span>FloFit © 2015</span> Digital Shelf Space™. All Rights reserved.</p>
            </div>
            <div class="block-center">
                <a href="{link path="/"}"><i class="ff-flofitlogo"></i></a>
            </div>
            <div class="block-right">
                <span class="footcop">© 2015 Powered by <a class="fixf" href="http://vanillaforums.org/">VanillaForums</a></span>
            </div>

		</div>
	</div>
<!-- End of Copyrights -->

			</div>
		</div>
	</section>
	
<!-- End of Footer --><a href="http://www.themesteam.com" title="Vanilla Themes" style="display:none;">Vanilla Themes</a>

<!-- Import Jquery Scripts -->

<script src="/themes/Cube/jquery/icheck.min.js" type="text/javascript"></script>
<script src="/themes/Cube/jquery/ichecken.js" type="text/javascript"></script>
<script src="/themes/Cube/jquery/components.js" type="text/javascript"></script>

<!-- Ajax -->
<script src="/themes/Cube/jquery/viewportchecker.js" type="text/javascript"></script>
<script src="/themes/Cube/jquery/ajax.js" type="text/javascript"></script>


{literal}
<script type="text/javascript">
$(document).ready(function(){
  $('input').iCheck({
    checkboxClass: 'icheckbox_flat-blue',
    radioClass: 'iradio_flat-blue',
    increaseArea: '20%' // optional
  });
});
</script>
{/literal}

<!-- End of Import Jquery Scripts -->


</body>
</html>