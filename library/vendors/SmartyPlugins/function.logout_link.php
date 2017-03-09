<?php
/**
 * Created by PhpStorm.
 * User: Jakub
 * Date: 11.09.15
 * Time: 13:56
 */
function smarty_function_logout_link()
{
    $env = config("Custom")["Flofit"]["Environment"];
    $link = config("Custom")["Flofit"][$env];
    return '<a href="' . $link . '/logout" class="logout">Logout</a>';
}
