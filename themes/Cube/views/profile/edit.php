<?php if (!defined('APPLICATION')) exit(); ?>
<h2 class="H"><?php echo $this->Data('Title'); ?></h2>
<?php
echo $this->Form->Open();
echo $this->Form->Errors();
?>
<ul>
   <li class="User-Name"><div class="fulix">
      <?php
         echo $this->Form->Label('Username', 'Name');
         $Attributes = array();
         
         if (!$this->CanEditUsername) {
            $Attributes['disabled'] = 'disabled';
         }
         echo $this->Form->TextBox('Name', $Attributes);
      ?>
   </div></li>
   
   <?php if (!UserModel::NoEmail() || Gdn::Session()->CheckPermission('Garden.Users.Edit')): ?>
   <li class="User-Email"><div class="fulix">
      <?php
         echo $this->Form->Label('Email', 'Email');
         
         if (UserModel::NoEmail()) {
            echo '<div class="Gloss">',
               T('Email addresses are disabled.', 'Email addresses are disabled. You can only add an email address if you are an administrator.'),
               '</div>';
         }
         
         $Attributes2 = array();
         if (!$this->CanEditEmail) {
            $Attributes2['disabled'] = 'disabled';
         }
         echo $this->Form->TextBox('Email', $Attributes2);
      ?>
   </div></li>
   <li class="User-ShowEmail"><div class="fulix"><label class="blackit"><span>Permission</span></label>
      <?php
         echo $this->Form->CheckBox('ShowEmail', T('Allow other members to see your email?'), array('value' => '1'));
      ?>
   </div></li>
   <?php endif ?>
   
   <li class="Gender User-Gender"><div class="fulix">
      <?php
         echo $this->Form->Label('Gender', 'Gender');
         echo $this->Form->RadioList('Gender', $this->GenderOptions, array('default' => 'u'))
      ?>
   </div></li>

   
   <?php if (C('Garden.Profile.Titles', FALSE)): ?>
   <li class="User-Title"><div class="fulix">
      <?php
         echo $this->Form->Label('Title', 'Title');
         echo $this->Form->TextBox('Title');
      ?>
   </div></li>
   <?php endif; ?>
   
   <?php if (C('Garden.Profile.Locations', FALSE)): ?>
   <li class="User-Location"><div class="fulix">
      <?php
         echo $this->Form->Label('Location', 'Location');
         echo $this->Form->TextBox('Location');
      ?>
   </div></li>
   

   <?php endif; ?>
   
   <?php
      $this->FireEvent('EditMyAccountAfter');
   ?>
</ul>
<?php echo'<div class="row"><div class="col-md-4"></div><div class="col-md-4">'; ?>
<?php echo $this->Form->Close('Save', '', array('class' => 'Button Primary'));
echo'</div></div><br />';