<?php if (!defined('APPLICATION')) exit(); ?>
<div class="blackit"><a href="../"><i class="fa fa-arrow-circle-left"></i> <span>Back to Home</span></a></div>


<div class="FormTitleWrapper">
<h1><?php echo T("Apply for Membership") ?></h1>
<div class="FormWrapper">
   <?php
   $TermsOfServiceUrl = Gdn::Config('Garden.TermsOfService', '#');
   $TermsOfServiceText = sprintf(T('I agree to the <a id="TermsOfService" class="Popup" target="terms" href="%s">terms of service</a>'), Url($TermsOfServiceUrl));
   
   // Make sure to force this form to post to the correct place in case the view is
   // rendered within another view (ie. /dashboard/entry/index/):
   echo $this->Form->Open(array('Action' => Url('/entry/register'), 'id' => 'Form_User_Register'));
   echo $this->Form->Errors();
   ?>
   <ul>
      <?php if (!$this->Data('NoEmail')): ?>
      <li><div class="fulix">
         <?php
            echo $this->Form->Label('Email', 'Email');
            echo $this->Form->TextBox('Email', array('type' => 'email', 'Wrap' => TRUE, 'Placeholder' => 'Example@domain.com'));
				echo '<span id="EmailUnavailable" class="Incorrect" style="display: none;">'.T('Email Unavailable').'</span>';
         ?>
      </div></li>
      <?php endif; ?>
      <li><div class="fulix">
         <?php
            echo $this->Form->Label('Username', 'Name');
            echo $this->Form->TextBox('Name', array('Wrap' => TRUE, 'Placeholder' => 'Username'));
            echo '<span id="NameUnavailable" class="Incorrect" style="display: none;">'.T('Name Unavailable').'</span>';
         ?>
      </div></li>
      <?php $this->FireEvent('RegisterBeforePassword'); ?>
      <li><div class="fulix">
         <?php
            echo $this->Form->Label('Password', 'Password');
            echo Wrap(sprintf(T('Your password must be at least %d characters long.'), C('Garden.Registration.MinPasswordLength')), 'div', array('class' => 'Gloss')); 
            echo $this->Form->Input('Password', 'password', array('Wrap' => TRUE, 'Strength' => TRUE, 'Placeholder' => '&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;'));
         ?>
      </div></li>
      <li><div class="fulix">
         <?php
            echo $this->Form->Label('Confirm Password', 'PasswordMatch');
            echo $this->Form->Input('PasswordMatch', 'password', array('Wrap' => TRUE, 'Placeholder' => '&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;'));
            echo '<span id="PasswordsDontMatch" class="Incorrect" style="display: none;">'.T("Passwords don't match").'</span>';
         ?>
      </div></li>
      <li class="Gender"><div class="fulix">
         <?php
            echo $this->Form->Label('Gender', 'Gender');
            echo $this->Form->RadioList('Gender', $this->GenderOptions, array('default' => 'u'))
         ?>
      </div></li>
      <li><div class="fulix">
         <?php
            echo $this->Form->Label('Why do you want to join?', 'DiscoveryText');
            echo $this->Form->TextBox('DiscoveryText', array('MultiLine' => TRUE, 'Wrap' => TRUE, 'Placeholder' => 'Your Reason ...'));
         ?>
      </div></li>
      <?php $this->FireEvent('RegisterFormBeforeTerms'); ?>
      <li class="pgo">
         <?php
            echo $this->Form->CheckBox('TermsOfService', $TermsOfServiceText, array('value' => '1'));
         ?>
      </li>
      <li class="Buttons">
         <?php echo $this->Form->Button('Apply for Membership', array('class' => 'Button Primary')); ?>
      </li>
   </ul>
   <?php echo $this->Form->Close(); ?>
</div>
</div>

<style type="text/css" >

.foldmenu,.origamit,.menucol,.footerw,.rightl,.fic,.BreadcrumbsWrapper {display:none;}

.logocol {width:100% !important;text-align:center;color:#333333;}
.SiteTitle a {
color: #333333;position: relative;
top: 40px;
}


.orifooter {background:none;border:none;}
.leftl {float:none;width:100%;text-align:center;padding:0px;}
.footcop {
font-size: 13px;
color: #000000;
opacity: 0.9;
font-weight: normal;
margin-left: -15px;
font-family: "Open Sans", helvetica, arial, sans-serif;
}

body.Entry form ul li label {
padding: 8px 0 0;}
.orifooter {padding-bottom:0px;margin-top: 64px;}
a.ForgotPassword {font-size:14px;font-family:'Open Sans';font-weight: 400;
font-size: 13px;color:#333333;}

.icheckbox_flat-blue, .iradio_flat-blue {
top: -1px;
}

::-webkit-input-placeholder {
   color: black;
}
:-moz-placeholder { /* Firefox 18- */
   color: black;  
}
::-moz-placeholder {  /* Firefox 19+ */
   color: black;  
}
:-ms-input-placeholder {  
   color: black;  
}
body.Section-Entry .Primary {
margin: 14px 0px 0px;position: relative;
top: 19px;
}
.pgo{position: relative;top: 10px;}
</style>