<?php
/**
 * @copyright 2009-2016 Vanilla Forums Inc.
 * @license http://www.opensource.org/licenses/gpl-2.0.php GNU GPL v2
 * @package vanilla-smarty
 * @since 2.0
 */

/**
 *
 *
 * @param array $Params
 * @param object $Smarty
 * @return string
 */
function smarty_function_inbox_link($Params, &$Smarty) {
    $Wrap = GetValue('wrap', $Params, 'li');
    $CountInbox = GetValue('CountUnreadConversations', Gdn::Session()->User);
    $CountInbox = (is_numeric($CountInbox))? $CountInbox : 0;
    return Gdn_Theme::Link('inbox',
        GetValue('text', $Params, T('Inbox')),
        GetValue('format', $Params, Wrap('<i class="ff-chat-dotted-bold"><i class="ff-circle-negative ">
                <span class="number-notification">'. $CountInbox . '</span>
            </i></i><a href="%url" class="%class">Messages</a>', $Wrap)));
}