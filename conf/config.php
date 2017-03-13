<?php if (!defined('APPLICATION')) exit();

// Conversations
$Configuration['Conversations']['Version'] = '2.3';

// Database
$Configuration['Database']['Name'] = 'vanilla';
$Configuration['Database']['Host'] = 'flofit-forum-dev-mysql.cdnilimdj29x.us-east-1.rds.amazonaws.com';
$Configuration['Database']['User'] = 'admin';
$Configuration['Database']['Password'] = 'c8ENGhPGvsbdg6eP';

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


// Modules
$Configuration['Modules']['Dashboard']['Panel'] = ['MeModule', 'UserBoxModule', 'ActivityFilterModule', 'UserPhotoModule', 'ProfileFilterModule', 'SideMenuModule', 'UserInfoModule', 'GuestModule', 'Ads'];
$Configuration['Modules']['Dashboard']['Content'] = ['MessageModule', 'MeModule', 'UserBoxModule', 'ProfileOptionsModule', 'Notices', 'ActivityFilterModule', 'ProfileFilterModule', 'Content', 'Ads'];
$Configuration['Modules']['Vanilla']['Panel'] = ['MeModule', 'UserBoxModule', 'GuestModule', 'NewDiscussionModule', 'DiscussionFilterModule', 'SignedInModule', 'Ads'];
$Configuration['Modules']['Vanilla']['Content'] = ['MessageModule', 'MeModule', 'UserBoxModule', 'NewDiscussionModule', 'ProfileOptionsModule', 'Notices', 'NewConversationModule', 'NewDiscussionModule', 'DiscussionFilterModule', 'CategoryModeratorsModule', 'Content', 'Ads'];
$Configuration['Modules']['Conversations']['Panel'] = ['MeModule', 'UserBoxModule', 'NewConversationModule', 'SignedInModule', 'GuestModule', 'Ads'];
$Configuration['Modules']['Conversations']['Content'] = ['MessageModule', 'MeModule', 'UserBoxModule', 'NewConversationModule', 'Notices', 'Content', 'Ads'];

// Routes
$Configuration['Routes']['DefaultController'] = 'discussions';
$Configuration['Routes']['DefaultForumRoot'] = 'discussions';
$Configuration['Routes']['Default404'] = ['dashboard/home/filenotfound', 'NotFound'];
$Configuration['Routes']['DefaultPermission'] = ['dashboard/home/unauthorized', 'NotAuthorized'];
$Configuration['Routes']['UpdateMode'] = 'dashboard/home/updatemode';

// Vanilla
$Configuration['Vanilla']['Version'] = '2.3';
$Configuration['Garden']['Theme']    = 'Cube';
$Configuration['Debug'] = false;

// Formatting
$Configuration['Garden']['Format']['Mentions']                  = TRUE;
$Configuration['Garden']['Format']['Hashtags']                  = TRUE;
$Configuration['Garden']['Format']['YouTube']                   = TRUE;
$Configuration['Garden']['Format']['Vimeo']                     = TRUE;
$Configuration['Garden']['Format']['EmbedSize']                 = 'normal'; // tiny/small/normal/big/huge or WIDTHxHEIGHT


$Configuration['Custom']['Flofit']['PublicProfileLink'] = 'http://my.flofit.com/p/';
$Configuration['Custom']['Flofit']['Production'] = 'http://my.flofit.com';
$Configuration['Custom']['Flofit']['Sandbox'] = 'http://community.flofit.getnecktie.com';
$Configuration['Custom']['Flofit']['Localhost'] = 'http://localhost/FlofitVenice/web';
$Configuration['Custom']['Flofit']['Environment'] = 'Localhost';

// Last edited by superAdmin (172.19.0.1)2016-12-21 13:02:40
