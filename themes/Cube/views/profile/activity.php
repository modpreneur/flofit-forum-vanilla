<?php if (!defined('APPLICATION')) exit();
// Include the activities
  echo '<h2 class="H">'.T('Activity').'</h2>';

include($this->FetchViewLocation('index', 'activity', 'dashboard'));
 
echo '<div class="fulix olaq"><label class="H">'.T('Activity').'</label>';

$Session = Gdn::Session();
if ($Session->IsValid() && CheckPermission('Garden.Profiles.Edit')) {
   $this->FireEvent('BeforeStatusForm');      
   $ButtonText = $Session->UserID == $this->User->UserID ? 'Share' : 'Add Comment';
   
   
   echo '<div class="FormWrapper FormWrapper-Condensed">';
   echo $this->Form->Open(array('action' => Url("/activity/post/{$this->User->UserID}?Target=".urlencode(UserUrl($this->User))), 'class' => 'Activity'));
   echo $this->Form->Errors();
   echo Wrap($this->Form->BodyBox('Comment'), 'div', array('class' => 'TextBoxWrapper'));
   echo '<div class="row"><div class="col-md-4"></div><div class="col-md-4"><div class="Buttons">';
   echo $this->Form->Button($ButtonText, array('class' => 'Button Primary'));
   echo '</div></div></div>';
   echo $this->Form->Close();
   echo '</div></div><br /><br /><br /><br /><br />';

}


