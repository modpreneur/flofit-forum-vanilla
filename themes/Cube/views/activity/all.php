<?php if (!defined('APPLICATION')) exit(); ?>
<div class="ActivityFormWrap">
<h1 class="H"><?php echo $this->Data('Title'); ?></h1>
<?php
include_once $this->FetchViewLocation('helper_functions');

$this->FireEvent('BeforeStatusForm');
$Session = Gdn::Session();
if ($Session->CheckPermission('Garden.Profiles.Edit')) {
   echo '<div class="fulix"><label class="blackit"><span>Share an Activity</span></label><div class="FormWrapper FormWrapper-Condensed">';
   echo $this->Form->Open(array('action' => Url('/activity/post/'.$this->Data('Filter')), 'class' => 'Activity'));
   echo $this->Form->Errors();
   echo Wrap($this->Form->TextBox('Comment', array('MultiLine' => TRUE)), 'div', array('class' => 'TextBoxWrapper'));
   
   echo '<div class="row"><div class="col-md-4"></div><div class="col-md-4"><div class="Buttons">';
   echo $this->Form->Button('Share', array('class' => 'Button Primary'));
   echo '</div></div></div>';
   
   echo $this->Form->Close();
   echo '</div>';
}
echo '</div></div>';
echo '<ul class="DataList Activities"><li class="iop ol"></li>';

$Activities = $this->Data('Activities', array());
if (count($Activities) > 0) {
   include($this->FetchViewLocation('activities', 'activity', 'dashboard'));
} else {
   ?>
<li><div class="Empty"><?php echo T('Not much happening here, yet.'); ?></div></li>
   <?php
}

echo '</ul>';

if (count($Activities) > 0)
   PagerModule::Write(array('CurrentRecords' => count($Activities)));