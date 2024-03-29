<?php if (!defined('APPLICATION')) exit();
$Session = Gdn::Session();
$loggedUser = $Session->User;
$Alt = FALSE;
$SubjectsVisible = C('Conversations.Subjects.Visible');

foreach ($this->Data('Conversations') as $Conversation) {
   $Conversation = (object)$Conversation;
   $Alt = $Alt == TRUE ? FALSE : TRUE;

   $countOfUsers = 0;
   $LastPhoto = userCustomProfilePhotoElement($loggedUser->Name);
   foreach ($Conversation->Participants as $User) {
      $countOfUsers++;
   }

   if($countOfUsers > 2)
   {
      $LastPhoto = groupCustomProfilePhotoElement();
   }
   else
   {
      foreach($Conversation->Participants as $User)
      {
         if($User["Name"] == "System")
         {
            $LastPhoto = userCustomProfilePhotoElement();
            break;
         }

         if($User["Name"] != $loggedUser->Name)
         {
            $LastPhoto = userCustomProfilePhotoElement($User["Name"]);
            break;
         }
      }
   }
   
   $CssClass = 'Item';
   $CssClass .= $Alt ? ' Alt' : '';
   $CssClass .= $Conversation->CountNewMessages > 0 ? ' New' : '';
   $CssClass .= $LastPhoto != '' ? ' HasPhoto' : '';
   $CssClass .= ' '.($Conversation->CountNewMessages <= 0 ? 'Read' : 'Unread');
   
   $JumpToItem = $Conversation->CountMessages - $Conversation->CountNewMessages;
   if ($Conversation->LastFormat == 'Text')
      $Message = (SliceString(Gdn_Format::To($Conversation->LastBody, $Conversation->LastFormat), 100));
   else
      $Message = (SliceString(Gdn_Format::Text(Gdn_Format::To($Conversation->LastBody, $Conversation->LastFormat), FALSE), 100));

   if (StringIsNullOrEmpty(trim($Message)))
      $Message = T('Blank Message');


   $this->EventArguments['Conversation'] = $Conversation;
?>

<li class="<?php echo $CssClass; ?>">
   <?php
   $Names = '';
   $countOfUsers = 0;
   foreach ($Conversation->Participants as $User) {
      $Names = ConcatSep(', ', $Names, FormatUsername($User, 'You'));
      $countOfUsers++;
   }
   ?>
   <div class="ItemContent Conversation">
      <?php
      $Url = '/messages/'.$Conversation->ConversationID.'/#Item_'.$JumpToItem;

      if ($Names) {
         echo '<h3 class="Users">';
         
         if ($LastPhoto) {
            echo '<div class="Author Photo">'.$LastPhoto.'</div></h3>';
         }
		 echo '<div class="fox">';
         echo Anchor(htmlspecialchars($Names), $Url), '</div>';
      }
      if ($SubjectsVisible && $Subject = GetValue('Subject', $Conversation)) {
         echo '<div class="Subject"><b>'.Anchor(htmlspecialchars($Subject), $Url).'</b></div>';
      }
      ?>
      <div class="Meta">
         <?php 
         $this->FireEvent('BeforeConversationMeta');

         echo ' <span class="MItem CountMessages">'.sprintf(Plural($Conversation->CountMessages, '%s message', '%s messages'), $Conversation->CountMessages).'</span> ';

         if ($Conversation->CountNewMessages > 0) {
            echo ' <strong class="HasNew"> '.Plural($Conversation->CountNewMessages, '%s new', '%s new').'</strong> ';
         }
         
         echo ' <span class="MItem LastDateInserted">'.Gdn_Format::Date($Conversation->LastDateInserted).'</span> ';
         ?>
      </div>
       <div class="Excerpt"><i class="ff ff-chat-conversation"></i> <?php echo Anchor($Message, $Url, 'Message'); ?></div>
   </div>
</li>
<?php
}