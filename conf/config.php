<?php if (!defined('APPLICATION')) exit();

// Conversations
$Configuration['Conversations']['Version'] = '2.3';

// Database
$Configuration['Database']['Name'] = 'vanilla';
$Configuration['Database']['Host'] = 'database';
$Configuration['Database']['User'] = 'user';
$Configuration['Database']['Password'] = 'pass';

// EnabledApplications
$Configuration['EnabledApplications']['Conversations'] = 'conversations';
$Configuration['EnabledApplications']['Vanilla'] = 'vanilla';

// EnabledPlugins
$Configuration['EnabledPlugins']['GettingStarted'] = 'GettingStarted';
$Configuration['EnabledPlugins']['HtmLawed'] = 'HtmLawed';
$Configuration['EnabledPlugins']['jsconnect'] = true;
$Configuration['EnabledPlugins']['jsconnectAutoSignIn'] = true;

// Garden
$Configuration['Garden']['Title'] = 'Vanilla';
$Configuration['Garden']['Cookie']['Salt'] = 'zOJXVRhOpSfsHf1G';
$Configuration['Garden']['Cookie']['Domain'] = '';
$Configuration['Garden']['Registration']['ConfirmEmail'] = false;
$Configuration['Garden']['Registration']['Method'] = 'Connect';
$Configuration['Garden']['Registration']['InviteExpiration'] = '1 week';
$Configuration['Garden']['Registration']['CaptchaPrivateKey'] = '';
$Configuration['Garden']['Registration']['CaptchaPublicKey'] = '';
$Configuration['Garden']['Registration']['InviteRoles']['3'] = '0';
$Configuration['Garden']['Registration']['InviteRoles']['4'] = '0';
$Configuration['Garden']['Registration']['InviteRoles']['8'] = '0';
$Configuration['Garden']['Registration']['InviteRoles']['16'] = '0';
$Configuration['Garden']['Registration']['InviteRoles']['32'] = '0';
$Configuration['Garden']['Email']['SupportName'] = 'Vanilla 2';
$Configuration['Garden']['Email']['Format'] = 'text';
$Configuration['Garden']['SystemUserID'] = 1;
$Configuration['Garden']['InputFormatter'] = 'Markdown';
$Configuration['Garden']['Version'] = '2.3';
$Configuration['Garden']['Cdns']['Disable'] = false;
$Configuration['Garden']['CanProcessImages'] = false;
$Configuration['Garden']['Installed'] = true;
$Configuration['Garden']['HomepageTitle'] = 'Vanilla';
$Configuration['Garden']['Description'] = '';

// Plugins
$Configuration['Plugins']['GettingStarted']['Dashboard'] = '1';
$Configuration['Plugins']['GettingStarted']['Profile'] = '1';
$Configuration['Plugins']['GettingStarted']['Plugins'] = '1';
$Configuration['Plugins']['GettingStarted']['Registration'] = '1';

// Routes
$Configuration['Routes']['DefaultController'] = 'discussions';

// Vanilla
$Configuration['Vanilla']['Version'] = '2.3';

// Last edited by superAdmin (172.19.0.1)2016-12-21 13:02:40