<?php if (!defined('APPLICATION')) exit();
$Session = Gdn::Session();
$this->EventArguments['FormCssClass'] = 'MessageForm CommentForm';
$this->FireEvent('BeforeMessageForm');
?>
<div id="MessageForm" class="fulix <?php echo $this->EventArguments['FormCssClass']; ?> olm">
   <label class=""><?php echo T("Add a Message"); ?></label>
   <div class="MessageFormWrap">

      <div class="Form-BodyWrap">
         <div class="Form-Body">
            <div class="FormWrapper FormWrapper-Condensed olt">
               <?php
               echo $this->Form->Open(array('id' => 'Form_ConversationMessage', 'action' => Url('/messages/addmessage/')));
               echo $this->Form->Errors();
//               echo Wrap($this->Form->TextBox('Body', array('MultiLine' => TRUE, 'class' => 'TextBox')), 'div', array('class' => 'TextBoxWrapper'));
               echo $this->Form->BodyBox('Body', array('Table' => 'ConversationMessage'));
               echo '<div class="row"><div class="col-md-4"></div><div class="col-md-4"><div class="Buttons">',
                  $this->Form->Button('Send Message', array('class' => 'Button Primary')),
                  '</div></div></div>';
               echo $this->Form->Close();
               ?>
            </div>
         </div>
      </div>
   </div>
</div>
