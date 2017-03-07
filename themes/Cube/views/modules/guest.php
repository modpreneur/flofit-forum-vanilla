<?php if (!defined('APPLICATION')) exit(); ?>
<div class="Box GuestBox">
   <?php $this->FireEvent('BeforeSignInButton'); ?>
   <?php $this->FireEvent('AfterSignInButton'); ?>
</div>