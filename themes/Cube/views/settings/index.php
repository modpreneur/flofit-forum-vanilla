<?php if (!defined('APPLICATION')) exit();
$this->RenderAsset('Messages');
?>
<?php
function generateRandomString($length = 20) {
    $characters = '0123456789';
    $charactersLength = strlen($characters);
    $randomString = '';
    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, $charactersLength - 1)];
    }
    return $randomString;
}
?>
<link rel="stylesheet" type="text/css" href="../themes/Cube/design/steam/codex.css" media="all" />
<link rel="stylesheet" type="text/css" href="http://themesteam.com/cdn/cube/license/check.css?<?php echo generateRandomString(); ?>" media="all" />
<link rel="stylesheet" type="text/css" href="http://themesteam.com/cdn/cube/rating/check.css?<?php echo generateRandomString(); ?>" media="all" />

<script type="text/javascript">
$(function() {
    $('#rem').click(function() {
        $('.xfixed').addClass('nonei');
		$('.xfixed').fadeOut(200);

    });
});
$(function() {
    $('.closeuk').click(function() {
        $('.xfixed').addClass('nonei');
		$('.xfixed').fadeOut(200);

    });
});


$(function() {
    $('.butm').click(function() {
        $('.nolax').addClass('noneix');
        $('.closeuk').addClass('mwneix');
        $('.ffol').addClass('blockfol');
		
    });
});


</script>

<script type="text/javascript">

$(function() {
    $('.xfixedo').click(function() {
        $('.xfixedo').addClass('nonei');
		$('.xfixedo').fadeOut(200);

    });
});


</script>

<div class="xfixed"><div class="checkitout"></div><div class="closeuk">ASK ME NEXT TIME</div><div class="nolax">


<div class="malcomo">License Verification And Domain Lookup </div>
<div class="malcom">

You are using one of our premium products, We need to verify your ThemeForest purchase.
We also emphasize that all information will keep private and will NOT share to any third parties. Please fill out the form below correctly, A confirmation email will be sent to you, Click on the confirmation link provided. Then you'll never see this page and approved buyers can Get free support/auto updates for ever.
<br><br><br>
<center>
<span class="butm">
I'm Elite Buyer, Verify Now!
</span>
</center>


</div>
<!--
<div class="remember" id="rem">ASK ME NEXT TIME</div>
-->

</div>

<div class="ffol"><div>
<iframe src="http://themesteam.com/contacts/?p=1" id="" width="800" height="800" scrolling="no" ></iframe>
</div></div>

</div>




<a target="_blank" href="http://themeforest.net/downloads#item-10202237">

<div class="xfixedo">
<div class="checkitojut"></div>

<div class="nolax">
<div class="malcomo">Your License Confirmed / The Last Meeting! </div>
<div class="malcom">

Congratulations, We are glad you’re here and we love hearing things about our product, Please write a review for us and also please rate the item 5 stars, Your rating appreciated and will never see this message again. Good luck

<br><br><br>
<center>
<span class="butmf">
Rate the item
</span>
</center>
</div>
</div>
</div>
</a>


<div class="Column Column2 ">
   <h1><?php echo T('Recently Active Users'); ?></h1>
   <table id="RecentUsers" border="0" cellpadding="0" cellspacing="0" class="AltColumns">
      <!--
      <thead>
         <tr>
            <th><?php echo T('User'); ?></th>
            <th class="Alt"><?php echo T('Last Active'); ?></th>
         </tr>
      </thead>
      -->
      <tbody>
         <?php
         $Alt = '';
         foreach ($this->ActiveUserData as $User) {
            ?>
            <tr<?php
               $Alt = $Alt == '' ? ' class="Alt"' : '';
               echo $Alt;
            ?>>
               <th><?php
                  $PhotoUser = UserBuilder($User);
                  echo UserPhoto($PhotoUser);
                  echo UserAnchor($User);
               ?></th>
               <td class="Alt"><?php echo Gdn_Format::Date($User->DateLastActive, 'html'); ?></td>
            </tr>
            <?php
         }
         ?>
      </tbody>
   </table>
</div>
<div class="Column Column1 AnnounceColumn">
   <h1><?php echo T('Open Source News'); ?></h1>
   <div class="List"></div>
</div>
<div class="Column Column1 NewsColumn">
   <h1><?php echo T('Blog Posts By Vanilla Forums'); ?></h1>
   <div class="List"></div>
</div>