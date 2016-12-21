-- Adminer 4.2.5 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `GDN_Activity`;
CREATE TABLE `GDN_Activity` (
  `ActivityID` int(11) NOT NULL AUTO_INCREMENT,
  `ActivityTypeID` int(11) NOT NULL,
  `NotifyUserID` int(11) NOT NULL DEFAULT '0',
  `ActivityUserID` int(11) DEFAULT NULL,
  `RegardingUserID` int(11) DEFAULT NULL,
  `Photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HeadlineFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Story` text COLLATE utf8_unicode_ci,
  `Format` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Route` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RecordType` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RecordID` int(11) DEFAULT NULL,
  `InsertUserID` int(11) DEFAULT NULL,
  `DateInserted` datetime NOT NULL,
  `InsertIPAddress` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DateUpdated` datetime NOT NULL,
  `Notified` tinyint(4) NOT NULL DEFAULT '0',
  `Emailed` tinyint(4) NOT NULL DEFAULT '0',
  `Data` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ActivityID`),
  KEY `IX_Activity_Notify` (`NotifyUserID`,`Notified`),
  KEY `IX_Activity_Recent` (`NotifyUserID`,`DateUpdated`),
  KEY `IX_Activity_Feed` (`NotifyUserID`,`ActivityUserID`,`DateUpdated`),
  KEY `IX_Activity_DateUpdated` (`DateUpdated`),
  KEY `FK_Activity_InsertUserID` (`InsertUserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `GDN_Activity` (`ActivityID`, `ActivityTypeID`, `NotifyUserID`, `ActivityUserID`, `RegardingUserID`, `Photo`, `HeadlineFormat`, `Story`, `Format`, `Route`, `RecordType`, `RecordID`, `InsertUserID`, `DateInserted`, `InsertIPAddress`, `DateUpdated`, `Notified`, `Emailed`, `Data`) VALUES
(1,	17,	-1,	3,	NULL,	NULL,	'{ActivityUserID,You} joined.',	'Welcome Aboard!',	NULL,	NULL,	NULL,	NULL,	NULL,	'2016-12-21 11:32:31',	'10.211.55.2',	'2016-12-21 11:45:38',	0,	0,	'a:1:{s:15:\"ActivityUserIDs\";a:1:{i:0;i:2;}}'),
(2,	15,	-1,	2,	1,	NULL,	'{RegardingUserID,you} &rarr; {ActivityUserID,you}',	'Ping! An activity post is a public way to talk at someone. When you update your status here, it posts it on your activity feed.',	'Html',	NULL,	NULL,	NULL,	1,	'2016-12-21 11:32:32',	NULL,	'2016-12-21 11:32:32',	0,	0,	NULL);

DROP TABLE IF EXISTS `GDN_ActivityComment`;
CREATE TABLE `GDN_ActivityComment` (
  `ActivityCommentID` int(11) NOT NULL AUTO_INCREMENT,
  `ActivityID` int(11) NOT NULL,
  `Body` text COLLATE utf8_unicode_ci NOT NULL,
  `Format` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `InsertUserID` int(11) NOT NULL,
  `DateInserted` datetime NOT NULL,
  `InsertIPAddress` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ActivityCommentID`),
  KEY `FK_ActivityComment_ActivityID` (`ActivityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `GDN_ActivityType`;
CREATE TABLE `GDN_ActivityType` (
  `ActivityTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `AllowComments` tinyint(4) NOT NULL DEFAULT '0',
  `ShowIcon` tinyint(4) NOT NULL DEFAULT '0',
  `ProfileHeadline` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FullHeadline` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RouteCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Notify` tinyint(4) NOT NULL DEFAULT '0',
  `Public` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ActivityTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `GDN_ActivityType` (`ActivityTypeID`, `Name`, `AllowComments`, `ShowIcon`, `ProfileHeadline`, `FullHeadline`, `RouteCode`, `Notify`, `Public`) VALUES
(1,	'SignIn',	0,	0,	'%1$s signed in.',	'%1$s signed in.',	NULL,	0,	1),
(2,	'Join',	1,	0,	'%1$s joined.',	'%1$s joined.',	NULL,	0,	1),
(3,	'JoinInvite',	1,	0,	'%1$s accepted %4$s invitation for membership.',	'%1$s accepted %4$s invitation for membership.',	NULL,	0,	1),
(4,	'JoinApproved',	1,	0,	'%1$s approved %4$s membership application.',	'%1$s approved %4$s membership application.',	NULL,	0,	1),
(5,	'JoinCreated',	1,	0,	'%1$s created an account for %3$s.',	'%1$s created an account for %3$s.',	NULL,	0,	1),
(6,	'AboutUpdate',	1,	0,	'%1$s updated %6$s profile.',	'%1$s updated %6$s profile.',	NULL,	0,	1),
(7,	'WallComment',	1,	1,	'%1$s wrote:',	'%1$s wrote on %4$s %5$s.',	NULL,	0,	1),
(8,	'PictureChange',	1,	0,	'%1$s changed %6$s profile picture.',	'%1$s changed %6$s profile picture.',	NULL,	0,	1),
(9,	'RoleChange',	1,	0,	'%1$s changed %4$s permissions.',	'%1$s changed %4$s permissions.',	NULL,	1,	1),
(10,	'ActivityComment',	0,	1,	'%1$s',	'%1$s commented on %4$s %8$s.',	'activity',	1,	1),
(11,	'Import',	0,	0,	'%1$s imported data.',	'%1$s imported data.',	NULL,	1,	0),
(12,	'Banned',	0,	0,	'%1$s banned %3$s.',	'%1$s banned %3$s.',	NULL,	0,	1),
(13,	'Unbanned',	0,	0,	'%1$s un-banned %3$s.',	'%1$s un-banned %3$s.',	NULL,	0,	1),
(14,	'Applicant',	0,	0,	'%1$s applied for membership.',	'%1$s applied for membership.',	NULL,	1,	0),
(15,	'WallPost',	1,	1,	'%3$s wrote:',	'%3$s wrote on %2$s %5$s.',	NULL,	0,	1),
(16,	'Default',	0,	0,	NULL,	NULL,	NULL,	0,	1),
(17,	'Registration',	0,	0,	NULL,	NULL,	NULL,	0,	1),
(18,	'Status',	0,	0,	NULL,	NULL,	NULL,	0,	1),
(19,	'Ban',	0,	0,	NULL,	NULL,	NULL,	0,	1),
(20,	'ConversationMessage',	0,	0,	'%1$s sent you a %8$s.',	'%1$s sent you a %8$s.',	'message',	1,	0),
(21,	'AddedToConversation',	0,	0,	'%1$s added %3$s to a %8$s.',	'%1$s added %3$s to a %8$s.',	'conversation',	1,	0),
(22,	'NewDiscussion',	0,	0,	'%1$s started a %8$s.',	'%1$s started a %8$s.',	'discussion',	0,	0),
(23,	'NewComment',	0,	0,	'%1$s commented on a discussion.',	'%1$s commented on a discussion.',	'discussion',	0,	0),
(24,	'DiscussionComment',	0,	0,	'%1$s commented on %4$s %8$s.',	'%1$s commented on %4$s %8$s.',	'discussion',	1,	0),
(25,	'DiscussionMention',	0,	0,	'%1$s mentioned %3$s in a %8$s.',	'%1$s mentioned %3$s in a %8$s.',	'discussion',	1,	0),
(26,	'CommentMention',	0,	0,	'%1$s mentioned %3$s in a %8$s.',	'%1$s mentioned %3$s in a %8$s.',	'comment',	1,	0),
(27,	'BookmarkComment',	0,	0,	'%1$s commented on your %8$s.',	'%1$s commented on your %8$s.',	'bookmarked discussion',	1,	0),
(28,	'Discussion',	0,	0,	NULL,	NULL,	NULL,	0,	1),
(29,	'Comment',	0,	0,	NULL,	NULL,	NULL,	0,	1);

DROP TABLE IF EXISTS `GDN_AnalyticsLocal`;
CREATE TABLE `GDN_AnalyticsLocal` (
  `TimeSlot` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `Views` int(11) DEFAULT NULL,
  `EmbedViews` int(11) DEFAULT NULL,
  UNIQUE KEY `UX_AnalyticsLocal` (`TimeSlot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `GDN_AnalyticsLocal` (`TimeSlot`, `Views`, `EmbedViews`) VALUES
('20161221',	2,	0);

DROP TABLE IF EXISTS `GDN_Attachment`;
CREATE TABLE `GDN_Attachment` (
  `AttachmentID` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `ForeignID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ForeignUserID` int(11) NOT NULL,
  `Source` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `SourceID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `SourceURL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Attributes` text COLLATE utf8_unicode_ci,
  `DateInserted` datetime NOT NULL,
  `InsertUserID` int(11) NOT NULL,
  `InsertIPAddress` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `UpdateUserID` int(11) DEFAULT NULL,
  `UpdateIPAddress` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`AttachmentID`),
  KEY `IX_Attachment_ForeignID` (`ForeignID`),
  KEY `FK_Attachment_ForeignUserID` (`ForeignUserID`),
  KEY `FK_Attachment_InsertUserID` (`InsertUserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `GDN_Ban`;
CREATE TABLE `GDN_Ban` (
  `BanID` int(11) NOT NULL AUTO_INCREMENT,
  `BanType` enum('IPAddress','Name','Email') COLLATE utf8_unicode_ci NOT NULL,
  `BanValue` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Notes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CountUsers` int(10) unsigned NOT NULL DEFAULT '0',
  `CountBlockedRegistrations` int(10) unsigned NOT NULL DEFAULT '0',
  `InsertUserID` int(11) NOT NULL,
  `DateInserted` datetime NOT NULL,
  `InsertIPAddress` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UpdateUserID` int(11) DEFAULT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `UpdateIPAddress` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`BanID`),
  UNIQUE KEY `UX_Ban` (`BanType`,`BanValue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `GDN_Category`;
CREATE TABLE `GDN_Category` (
  `CategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `ParentCategoryID` int(11) DEFAULT NULL,
  `TreeLeft` int(11) DEFAULT NULL,
  `TreeRight` int(11) DEFAULT NULL,
  `Depth` int(11) DEFAULT NULL,
  `CountDiscussions` int(11) NOT NULL DEFAULT '0',
  `CountComments` int(11) NOT NULL DEFAULT '0',
  `DateMarkedRead` datetime DEFAULT NULL,
  `AllowDiscussions` tinyint(4) NOT NULL DEFAULT '1',
  `Archived` tinyint(4) NOT NULL DEFAULT '0',
  `Name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `UrlCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Description` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Sort` int(11) DEFAULT NULL,
  `CssClass` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PermissionCategoryID` int(11) NOT NULL DEFAULT '-1',
  `PointsCategoryID` int(11) NOT NULL DEFAULT '0',
  `HideAllDiscussions` tinyint(4) NOT NULL DEFAULT '0',
  `DisplayAs` enum('Categories','Discussions','Heading','Default') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Default',
  `InsertUserID` int(11) NOT NULL,
  `UpdateUserID` int(11) DEFAULT NULL,
  `DateInserted` datetime NOT NULL,
  `DateUpdated` datetime NOT NULL,
  `LastCommentID` int(11) DEFAULT NULL,
  `LastDiscussionID` int(11) DEFAULT NULL,
  `LastDateInserted` datetime DEFAULT NULL,
  `AllowedDiscussionTypes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DefaultDiscussionType` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`CategoryID`),
  KEY `FK_Category_InsertUserID` (`InsertUserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `GDN_Category` (`CategoryID`, `ParentCategoryID`, `TreeLeft`, `TreeRight`, `Depth`, `CountDiscussions`, `CountComments`, `DateMarkedRead`, `AllowDiscussions`, `Archived`, `Name`, `UrlCode`, `Description`, `Sort`, `CssClass`, `Photo`, `PermissionCategoryID`, `PointsCategoryID`, `HideAllDiscussions`, `DisplayAs`, `InsertUserID`, `UpdateUserID`, `DateInserted`, `DateUpdated`, `LastCommentID`, `LastDiscussionID`, `LastDateInserted`, `AllowedDiscussionTypes`, `DefaultDiscussionType`) VALUES
(-1,	NULL,	1,	4,	0,	0,	0,	NULL,	1,	0,	'Root',	'root',	'Root of category tree. Users should never see this.',	1,	NULL,	NULL,	-1,	0,	0,	'Default',	1,	1,	'2016-12-21 11:32:32',	'2016-12-21 11:32:32',	NULL,	NULL,	NULL,	NULL,	NULL),
(1,	-1,	2,	3,	1,	1,	1,	NULL,	1,	0,	'General',	'general',	'General discussions',	2,	NULL,	NULL,	-1,	0,	0,	'Default',	1,	1,	'2016-12-21 11:32:32',	'2016-12-21 11:32:32',	1,	1,	NULL,	NULL,	NULL);

DROP TABLE IF EXISTS `GDN_Comment`;
CREATE TABLE `GDN_Comment` (
  `CommentID` int(11) NOT NULL AUTO_INCREMENT,
  `DiscussionID` int(11) NOT NULL,
  `InsertUserID` int(11) DEFAULT NULL,
  `UpdateUserID` int(11) DEFAULT NULL,
  `DeleteUserID` int(11) DEFAULT NULL,
  `Body` text COLLATE utf8_unicode_ci NOT NULL,
  `Format` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DateInserted` datetime DEFAULT NULL,
  `DateDeleted` datetime DEFAULT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `InsertIPAddress` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UpdateIPAddress` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Flag` tinyint(4) NOT NULL DEFAULT '0',
  `Score` float DEFAULT NULL,
  `Attributes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`CommentID`),
  KEY `IX_Comment_1` (`DiscussionID`,`DateInserted`),
  KEY `IX_Comment_DateInserted` (`DateInserted`),
  KEY `FK_Comment_InsertUserID` (`InsertUserID`),
  FULLTEXT KEY `TX_Comment` (`Body`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `GDN_Comment` (`CommentID`, `DiscussionID`, `InsertUserID`, `UpdateUserID`, `DeleteUserID`, `Body`, `Format`, `DateInserted`, `DateDeleted`, `DateUpdated`, `InsertIPAddress`, `UpdateIPAddress`, `Flag`, `Score`, `Attributes`) VALUES
(1,	1,	1,	NULL,	NULL,	'This is the first comment on your site and it&rsquo;s an important one.\n\nDon&rsquo;t see your must-have feature? We keep Vanilla nice and simple by default. Use <b>addons</b> to get the special sauce your community needs.\n\nNot sure which addons to enable? Our favorites are Button Bar and Tagging. They&rsquo;re almost always a great start.',	'Html',	'2016-12-21 11:32:32',	NULL,	NULL,	NULL,	NULL,	0,	NULL,	NULL);

DROP TABLE IF EXISTS `GDN_Conversation`;
CREATE TABLE `GDN_Conversation` (
  `ConversationID` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ForeignID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Contributors` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FirstMessageID` int(11) DEFAULT NULL,
  `InsertUserID` int(11) NOT NULL,
  `DateInserted` datetime DEFAULT NULL,
  `InsertIPAddress` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UpdateUserID` int(11) NOT NULL,
  `DateUpdated` datetime NOT NULL,
  `UpdateIPAddress` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CountMessages` int(11) NOT NULL DEFAULT '0',
  `CountParticipants` int(11) NOT NULL DEFAULT '0',
  `LastMessageID` int(11) DEFAULT NULL,
  `RegardingID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ConversationID`),
  KEY `IX_Conversation_Type` (`Type`),
  KEY `IX_Conversation_RegardingID` (`RegardingID`),
  KEY `FK_Conversation_FirstMessageID` (`FirstMessageID`),
  KEY `FK_Conversation_InsertUserID` (`InsertUserID`),
  KEY `FK_Conversation_DateInserted` (`DateInserted`),
  KEY `FK_Conversation_UpdateUserID` (`UpdateUserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `GDN_ConversationMessage`;
CREATE TABLE `GDN_ConversationMessage` (
  `MessageID` int(11) NOT NULL AUTO_INCREMENT,
  `ConversationID` int(11) NOT NULL,
  `Body` text COLLATE utf8_unicode_ci NOT NULL,
  `Format` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `InsertUserID` int(11) DEFAULT NULL,
  `DateInserted` datetime NOT NULL,
  `InsertIPAddress` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MessageID`),
  KEY `FK_ConversationMessage_ConversationID` (`ConversationID`),
  KEY `FK_ConversationMessage_InsertUserID` (`InsertUserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `GDN_Discussion`;
CREATE TABLE `GDN_Discussion` (
  `DiscussionID` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ForeignID` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CategoryID` int(11) NOT NULL,
  `InsertUserID` int(11) NOT NULL,
  `UpdateUserID` int(11) DEFAULT NULL,
  `FirstCommentID` int(11) DEFAULT NULL,
  `LastCommentID` int(11) DEFAULT NULL,
  `Name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Body` text COLLATE utf8_unicode_ci NOT NULL,
  `Format` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Tags` text COLLATE utf8_unicode_ci,
  `CountComments` int(11) NOT NULL DEFAULT '0',
  `CountBookmarks` int(11) DEFAULT NULL,
  `CountViews` int(11) NOT NULL DEFAULT '1',
  `Closed` tinyint(4) NOT NULL DEFAULT '0',
  `Announce` tinyint(4) NOT NULL DEFAULT '0',
  `Sink` tinyint(4) NOT NULL DEFAULT '0',
  `DateInserted` datetime NOT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `InsertIPAddress` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UpdateIPAddress` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DateLastComment` datetime DEFAULT NULL,
  `LastCommentUserID` int(11) DEFAULT NULL,
  `Score` float DEFAULT NULL,
  `Attributes` text COLLATE utf8_unicode_ci,
  `RegardingID` int(11) DEFAULT NULL,
  PRIMARY KEY (`DiscussionID`),
  KEY `IX_Discussion_Type` (`Type`),
  KEY `IX_Discussion_ForeignID` (`ForeignID`),
  KEY `IX_Discussion_DateInserted` (`DateInserted`),
  KEY `IX_Discussion_DateLastComment` (`DateLastComment`),
  KEY `IX_Discussion_RegardingID` (`RegardingID`),
  KEY `IX_Discussion_CategoryPages` (`CategoryID`,`DateLastComment`),
  KEY `IX_Discussion_CategoryInserted` (`CategoryID`,`DateInserted`),
  KEY `FK_Discussion_InsertUserID` (`InsertUserID`),
  FULLTEXT KEY `TX_Discussion` (`Name`,`Body`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `GDN_Discussion` (`DiscussionID`, `Type`, `ForeignID`, `CategoryID`, `InsertUserID`, `UpdateUserID`, `FirstCommentID`, `LastCommentID`, `Name`, `Body`, `Format`, `Tags`, `CountComments`, `CountBookmarks`, `CountViews`, `Closed`, `Announce`, `Sink`, `DateInserted`, `DateUpdated`, `InsertIPAddress`, `UpdateIPAddress`, `DateLastComment`, `LastCommentUserID`, `Score`, `Attributes`, `RegardingID`) VALUES
(1,	NULL,	'stub',	1,	1,	NULL,	NULL,	1,	'BAM! You&rsquo;ve got a sweet forum',	'There&rsquo;s nothing sweeter than a fresh new forum, ready to welcome your community. A Vanilla Forum has all the bits and pieces you need to build an awesome discussion platform customized to your needs. Here&rsquo;s a few tips:\n<ul>\n   <li>Use the <a href=\"/dashboard/settings/gettingstarted\">Getting Started</a> list in the Dashboard to configure your site.</li>\n   <li>Don&rsquo;t use too many categories. We recommend 3-8. Keep it simple!</li>\n   <li>&ldquo;Announce&rdquo; a discussion (click the gear) to stick to the top of the list, and &ldquo;Close&rdquo; it to stop further comments.</li>\n   <li>Use &ldquo;Sink&rdquo; to take attention away from a discussion. New comments will no longer bring it back to the top of the list.</li>\n   <li>Bookmark a discussion (click the star) to get notifications for new comments. You can edit notification settings from your profile.</li>\n</ul>\nGo ahead and edit or delete this discussion, then spread the word to get this place cooking. Cheers!',	'Html',	NULL,	1,	NULL,	1,	0,	0,	0,	'2016-12-21 11:32:32',	NULL,	NULL,	NULL,	'2016-12-21 11:32:32',	1,	NULL,	NULL,	NULL);

DROP TABLE IF EXISTS `GDN_Draft`;
CREATE TABLE `GDN_Draft` (
  `DraftID` int(11) NOT NULL AUTO_INCREMENT,
  `DiscussionID` int(11) DEFAULT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  `InsertUserID` int(11) NOT NULL,
  `UpdateUserID` int(11) NOT NULL,
  `Name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Tags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Closed` tinyint(4) NOT NULL DEFAULT '0',
  `Announce` tinyint(4) NOT NULL DEFAULT '0',
  `Sink` tinyint(4) NOT NULL DEFAULT '0',
  `Body` text COLLATE utf8_unicode_ci NOT NULL,
  `Format` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DateInserted` datetime NOT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  PRIMARY KEY (`DraftID`),
  KEY `FK_Draft_DiscussionID` (`DiscussionID`),
  KEY `FK_Draft_CategoryID` (`CategoryID`),
  KEY `FK_Draft_InsertUserID` (`InsertUserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `GDN_Invitation`;
CREATE TABLE `GDN_Invitation` (
  `InvitationID` int(11) NOT NULL AUTO_INCREMENT,
  `Email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RoleIDs` text COLLATE utf8_unicode_ci,
  `Code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `InsertUserID` int(11) DEFAULT NULL,
  `DateInserted` datetime NOT NULL,
  `AcceptedUserID` int(11) DEFAULT NULL,
  `DateExpires` datetime DEFAULT NULL,
  PRIMARY KEY (`InvitationID`),
  UNIQUE KEY `UX_Invitation` (`Code`),
  UNIQUE KEY `UX_Invitation_code` (`Code`),
  KEY `IX_Invitation_Email` (`Email`),
  KEY `IX_Invitation_userdate` (`InsertUserID`,`DateInserted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `GDN_Log`;
CREATE TABLE `GDN_Log` (
  `LogID` int(11) NOT NULL AUTO_INCREMENT,
  `Operation` enum('Delete','Edit','Spam','Moderate','Pending','Ban','Error') COLLATE utf8_unicode_ci NOT NULL,
  `RecordType` enum('Discussion','Comment','User','Registration','Activity','ActivityComment','Configuration','Group') COLLATE utf8_unicode_ci NOT NULL,
  `TransactionLogID` int(11) DEFAULT NULL,
  `RecordID` int(11) DEFAULT NULL,
  `RecordUserID` int(11) DEFAULT NULL,
  `RecordDate` datetime NOT NULL,
  `RecordIPAddress` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `InsertUserID` int(11) NOT NULL,
  `DateInserted` datetime NOT NULL,
  `InsertIPAddress` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OtherUserIDs` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `ParentRecordID` int(11) DEFAULT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  `Data` mediumtext COLLATE utf8_unicode_ci,
  `CountGroup` int(11) DEFAULT NULL,
  PRIMARY KEY (`LogID`),
  KEY `IX_Log_Operation` (`Operation`),
  KEY `IX_Log_RecordType` (`RecordType`),
  KEY `IX_Log_RecordID` (`RecordID`),
  KEY `IX_Log_RecordUserID` (`RecordUserID`),
  KEY `IX_Log_RecordIPAddress` (`RecordIPAddress`),
  KEY `IX_Log_DateInserted` (`DateInserted`),
  KEY `IX_Log_ParentRecordID` (`ParentRecordID`),
  KEY `FK_Log_CategoryID` (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `GDN_Log` (`LogID`, `Operation`, `RecordType`, `TransactionLogID`, `RecordID`, `RecordUserID`, `RecordDate`, `RecordIPAddress`, `InsertUserID`, `DateInserted`, `InsertIPAddress`, `OtherUserIDs`, `DateUpdated`, `ParentRecordID`, `CategoryID`, `Data`, `CountGroup`) VALUES
(1,	'Edit',	'Configuration',	NULL,	NULL,	NULL,	'2016-12-21 11:32:32',	NULL,	2,	'2016-12-21 11:32:32',	'10.211.55.2',	'',	NULL,	NULL,	NULL,	'a:1:{s:4:\"_New\";a:7:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.2.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:8:\"database\";s:4:\"User\";s:4:\"user\";s:8:\"Password\";s:4:\"pass\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:10:{s:5:\"Title\";s:9:\"Vanilla 2\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"RNQfajZL9H1q95Ik\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:9:\"Vanilla 2\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";s:1:\"1\";s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.2.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:0;s:9:\"Installed\";b:1;}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.2.1\";}}}',	NULL),
(2,	'Edit',	'Configuration',	NULL,	NULL,	NULL,	'2016-12-21 11:32:35',	NULL,	2,	'2016-12-21 11:32:35',	'10.211.55.2',	'',	NULL,	NULL,	NULL,	'a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.2.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:8:\"database\";s:4:\"User\";s:4:\"user\";s:8:\"Password\";s:4:\"pass\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:10:{s:5:\"Title\";s:9:\"Vanilla 2\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"RNQfajZL9H1q95Ik\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:9:\"Vanilla 2\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";s:1:\"1\";s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.2.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:0;s:9:\"Installed\";b:1;}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.2.1\";}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:5:\"2.2.1\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:8:\"database\";s:4:\"User\";s:4:\"user\";s:8:\"Password\";s:4:\"pass\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:10:{s:5:\"Title\";s:9:\"Vanilla 2\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"RNQfajZL9H1q95Ik\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:9:\"Vanilla 2\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";s:1:\"1\";s:14:\"InputFormatter\";s:4:\"Html\";s:7:\"Version\";s:5:\"2.2.1\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:0;s:9:\"Installed\";b:1;}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:1:{s:9:\"Dashboard\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:5:\"2.2.1\";}}}',	NULL),
(3,	'Edit',	'Configuration',	NULL,	NULL,	NULL,	'2016-12-21 11:45:38',	NULL,	3,	'2016-12-21 11:45:38',	'10.211.55.2',	'',	NULL,	NULL,	NULL,	'a:1:{s:4:\"_New\";a:7:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:3:\"2.3\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:8:\"database\";s:4:\"User\";s:4:\"user\";s:8:\"Password\";s:4:\"pass\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:10:{s:5:\"Title\";s:9:\"Vanilla 2\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"zOJXVRhOpSfsHf1G\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:9:\"Vanilla 2\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:3:\"2.3\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:0;s:9:\"Installed\";b:1;}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:3:\"2.3\";}}}',	NULL),
(4,	'Edit',	'Configuration',	NULL,	NULL,	NULL,	'2016-12-21 11:45:40',	NULL,	3,	'2016-12-21 11:45:40',	'10.211.55.2',	'',	NULL,	NULL,	NULL,	'a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:3:\"2.3\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:8:\"database\";s:4:\"User\";s:4:\"user\";s:8:\"Password\";s:4:\"pass\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:10:{s:5:\"Title\";s:9:\"Vanilla 2\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"zOJXVRhOpSfsHf1G\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:9:\"Vanilla 2\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:3:\"2.3\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:0;s:9:\"Installed\";b:1;}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:3:\"2.3\";}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:3:\"2.3\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:8:\"database\";s:4:\"User\";s:4:\"user\";s:8:\"Password\";s:4:\"pass\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:10:{s:5:\"Title\";s:9:\"Vanilla 2\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"zOJXVRhOpSfsHf1G\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:9:\"Vanilla 2\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:3:\"2.3\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:0;s:9:\"Installed\";b:1;}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:1:{s:9:\"Dashboard\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:3:\"2.3\";}}}',	NULL),
(5,	'Edit',	'Configuration',	NULL,	NULL,	NULL,	'2016-12-21 12:51:18',	NULL,	2,	'2016-12-21 12:51:18',	'172.19.0.1',	'',	NULL,	NULL,	NULL,	'a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:3:\"2.3\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:8:\"database\";s:4:\"User\";s:4:\"user\";s:8:\"Password\";s:4:\"pass\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:10:{s:5:\"Title\";s:9:\"Vanilla 2\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"zOJXVRhOpSfsHf1G\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:9:\"Vanilla 2\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:3:\"2.3\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:0;s:9:\"Installed\";b:1;}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:1:{s:9:\"Dashboard\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:3:\"2.3\";}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:3:\"2.3\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:8:\"database\";s:4:\"User\";s:4:\"user\";s:8:\"Password\";s:4:\"pass\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:10:{s:5:\"Title\";s:9:\"Vanilla 2\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"zOJXVRhOpSfsHf1G\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:9:\"Vanilla 2\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:3:\"2.3\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:0;s:9:\"Installed\";b:1;}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:2:{s:9:\"Dashboard\";s:1:\"1\";s:7:\"Profile\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:3:\"2.3\";}}}',	NULL),
(6,	'Edit',	'Configuration',	NULL,	NULL,	NULL,	'2016-12-21 12:52:55',	NULL,	2,	'2016-12-21 12:52:55',	'172.19.0.1',	'',	NULL,	NULL,	NULL,	'a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:3:\"2.3\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:8:\"database\";s:4:\"User\";s:4:\"user\";s:8:\"Password\";s:4:\"pass\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:10:{s:5:\"Title\";s:9:\"Vanilla 2\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"zOJXVRhOpSfsHf1G\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:9:\"Vanilla 2\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:3:\"2.3\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:0;s:9:\"Installed\";b:1;}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:2:{s:9:\"Dashboard\";s:1:\"1\";s:7:\"Profile\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:3:\"2.3\";}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:3:\"2.3\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:8:\"database\";s:4:\"User\";s:4:\"user\";s:8:\"Password\";s:4:\"pass\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:10:{s:5:\"Title\";s:9:\"Vanilla 2\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"zOJXVRhOpSfsHf1G\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:9:\"Vanilla 2\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:3:\"2.3\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:0;s:9:\"Installed\";b:1;}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:3:{s:9:\"Dashboard\";s:1:\"1\";s:7:\"Profile\";s:1:\"1\";s:7:\"Plugins\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:3:\"2.3\";}}}',	NULL),
(7,	'Edit',	'Configuration',	NULL,	NULL,	NULL,	'2016-12-21 12:52:58',	NULL,	2,	'2016-12-21 12:52:58',	'172.19.0.1',	'',	NULL,	NULL,	NULL,	'a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:3:\"2.3\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:8:\"database\";s:4:\"User\";s:4:\"user\";s:8:\"Password\";s:4:\"pass\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:2:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";}s:6:\"Garden\";a:10:{s:5:\"Title\";s:9:\"Vanilla 2\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"zOJXVRhOpSfsHf1G\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:9:\"Vanilla 2\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:3:\"2.3\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:0;s:9:\"Installed\";b:1;}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:3:{s:9:\"Dashboard\";s:1:\"1\";s:7:\"Profile\";s:1:\"1\";s:7:\"Plugins\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:3:\"2.3\";}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:3:\"2.3\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:8:\"database\";s:4:\"User\";s:4:\"user\";s:8:\"Password\";s:4:\"pass\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:3:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";s:9:\"jsconnect\";b:1;}s:6:\"Garden\";a:10:{s:5:\"Title\";s:9:\"Vanilla 2\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"zOJXVRhOpSfsHf1G\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:9:\"Vanilla 2\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:3:\"2.3\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:0;s:9:\"Installed\";b:1;}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:3:{s:9:\"Dashboard\";s:1:\"1\";s:7:\"Profile\";s:1:\"1\";s:7:\"Plugins\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:3:\"2.3\";}}}',	NULL),
(8,	'Edit',	'Configuration',	NULL,	NULL,	NULL,	'2016-12-21 12:59:33',	NULL,	2,	'2016-12-21 12:59:33',	'172.19.0.1',	'',	NULL,	NULL,	NULL,	'a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:3:\"2.3\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:8:\"database\";s:4:\"User\";s:4:\"user\";s:8:\"Password\";s:4:\"pass\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:3:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";s:9:\"jsconnect\";b:1;}s:6:\"Garden\";a:10:{s:5:\"Title\";s:9:\"Vanilla 2\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"zOJXVRhOpSfsHf1G\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:1:{s:12:\"ConfirmEmail\";b:1;}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:9:\"Vanilla 2\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:3:\"2.3\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:0;s:9:\"Installed\";b:1;}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:3:{s:9:\"Dashboard\";s:1:\"1\";s:7:\"Profile\";s:1:\"1\";s:7:\"Plugins\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:3:\"2.3\";}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:3:\"2.3\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:8:\"database\";s:4:\"User\";s:4:\"user\";s:8:\"Password\";s:4:\"pass\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:3:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";s:9:\"jsconnect\";b:1;}s:6:\"Garden\";a:10:{s:5:\"Title\";s:9:\"Vanilla 2\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"zOJXVRhOpSfsHf1G\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:6:{s:12:\"ConfirmEmail\";b:0;s:6:\"Method\";s:7:\"Connect\";s:16:\"InviteExpiration\";s:6:\"1 week\";s:17:\"CaptchaPrivateKey\";s:0:\"\";s:16:\"CaptchaPublicKey\";s:0:\"\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:16;s:1:\"0\";i:32;s:1:\"0\";}}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:9:\"Vanilla 2\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:3:\"2.3\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:0;s:9:\"Installed\";b:1;}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:4:{s:9:\"Dashboard\";s:1:\"1\";s:7:\"Profile\";s:1:\"1\";s:7:\"Plugins\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:3:\"2.3\";}}}',	NULL),
(9,	'Edit',	'Configuration',	NULL,	NULL,	NULL,	'2016-12-21 13:01:44',	NULL,	2,	'2016-12-21 13:01:44',	'172.19.0.1',	'',	NULL,	NULL,	NULL,	'a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:3:\"2.3\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:8:\"database\";s:4:\"User\";s:4:\"user\";s:8:\"Password\";s:4:\"pass\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:3:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";s:9:\"jsconnect\";b:1;}s:6:\"Garden\";a:10:{s:5:\"Title\";s:9:\"Vanilla 2\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"zOJXVRhOpSfsHf1G\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:6:{s:12:\"ConfirmEmail\";b:0;s:6:\"Method\";s:7:\"Connect\";s:16:\"InviteExpiration\";s:6:\"1 week\";s:17:\"CaptchaPrivateKey\";s:0:\"\";s:16:\"CaptchaPublicKey\";s:0:\"\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:16;s:1:\"0\";i:32;s:1:\"0\";}}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:9:\"Vanilla 2\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:3:\"2.3\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:0;s:9:\"Installed\";b:1;}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:4:{s:9:\"Dashboard\";s:1:\"1\";s:7:\"Profile\";s:1:\"1\";s:7:\"Plugins\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:3:\"2.3\";}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:3:\"2.3\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:8:\"database\";s:4:\"User\";s:4:\"user\";s:8:\"Password\";s:4:\"pass\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:3:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";s:9:\"jsconnect\";b:1;}s:6:\"Garden\";a:12:{s:5:\"Title\";s:7:\"Vanilla\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"zOJXVRhOpSfsHf1G\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:6:{s:12:\"ConfirmEmail\";b:0;s:6:\"Method\";s:7:\"Connect\";s:16:\"InviteExpiration\";s:6:\"1 week\";s:17:\"CaptchaPrivateKey\";s:0:\"\";s:16:\"CaptchaPublicKey\";s:0:\"\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:16;s:1:\"0\";i:32;s:1:\"0\";}}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:9:\"Vanilla 2\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:3:\"2.3\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:0;s:9:\"Installed\";b:1;s:13:\"HomepageTitle\";s:7:\"Vanilla\";s:11:\"Description\";s:0:\"\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:4:{s:9:\"Dashboard\";s:1:\"1\";s:7:\"Profile\";s:1:\"1\";s:7:\"Plugins\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:3:\"2.3\";}}}',	NULL),
(10,	'Edit',	'Configuration',	NULL,	NULL,	NULL,	'2016-12-21 13:02:40',	NULL,	2,	'2016-12-21 13:02:40',	'172.19.0.1',	'',	NULL,	NULL,	NULL,	'a:9:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:3:\"2.3\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:8:\"database\";s:4:\"User\";s:4:\"user\";s:8:\"Password\";s:4:\"pass\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:3:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";s:9:\"jsconnect\";b:1;}s:6:\"Garden\";a:12:{s:5:\"Title\";s:7:\"Vanilla\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"zOJXVRhOpSfsHf1G\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:6:{s:12:\"ConfirmEmail\";b:0;s:6:\"Method\";s:7:\"Connect\";s:16:\"InviteExpiration\";s:6:\"1 week\";s:17:\"CaptchaPrivateKey\";s:0:\"\";s:16:\"CaptchaPublicKey\";s:0:\"\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:16;s:1:\"0\";i:32;s:1:\"0\";}}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:9:\"Vanilla 2\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:3:\"2.3\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:0;s:9:\"Installed\";b:1;s:13:\"HomepageTitle\";s:7:\"Vanilla\";s:11:\"Description\";s:0:\"\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:4:{s:9:\"Dashboard\";s:1:\"1\";s:7:\"Profile\";s:1:\"1\";s:7:\"Plugins\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:3:\"2.3\";}s:4:\"_New\";a:8:{s:13:\"Conversations\";a:1:{s:7:\"Version\";s:3:\"2.3\";}s:8:\"Database\";a:4:{s:4:\"Name\";s:7:\"vanilla\";s:4:\"Host\";s:8:\"database\";s:4:\"User\";s:4:\"user\";s:8:\"Password\";s:4:\"pass\";}s:19:\"EnabledApplications\";a:2:{s:13:\"Conversations\";s:13:\"conversations\";s:7:\"Vanilla\";s:7:\"vanilla\";}s:14:\"EnabledPlugins\";a:4:{s:14:\"GettingStarted\";s:14:\"GettingStarted\";s:8:\"HtmLawed\";s:8:\"HtmLawed\";s:9:\"jsconnect\";b:1;s:19:\"jsconnectAutoSignIn\";b:1;}s:6:\"Garden\";a:12:{s:5:\"Title\";s:7:\"Vanilla\";s:6:\"Cookie\";a:2:{s:4:\"Salt\";s:16:\"zOJXVRhOpSfsHf1G\";s:6:\"Domain\";s:0:\"\";}s:12:\"Registration\";a:6:{s:12:\"ConfirmEmail\";b:0;s:6:\"Method\";s:7:\"Connect\";s:16:\"InviteExpiration\";s:6:\"1 week\";s:17:\"CaptchaPrivateKey\";s:0:\"\";s:16:\"CaptchaPublicKey\";s:0:\"\";s:11:\"InviteRoles\";a:5:{i:3;s:1:\"0\";i:4;s:1:\"0\";i:8;s:1:\"0\";i:16;s:1:\"0\";i:32;s:1:\"0\";}}s:5:\"Email\";a:2:{s:11:\"SupportName\";s:9:\"Vanilla 2\";s:6:\"Format\";s:4:\"text\";}s:12:\"SystemUserID\";i:1;s:14:\"InputFormatter\";s:8:\"Markdown\";s:7:\"Version\";s:3:\"2.3\";s:4:\"Cdns\";a:1:{s:7:\"Disable\";b:0;}s:16:\"CanProcessImages\";b:0;s:9:\"Installed\";b:1;s:13:\"HomepageTitle\";s:7:\"Vanilla\";s:11:\"Description\";s:0:\"\";}s:7:\"Plugins\";a:1:{s:14:\"GettingStarted\";a:4:{s:9:\"Dashboard\";s:1:\"1\";s:7:\"Profile\";s:1:\"1\";s:7:\"Plugins\";s:1:\"1\";s:12:\"Registration\";s:1:\"1\";}}s:6:\"Routes\";a:1:{s:17:\"DefaultController\";s:11:\"discussions\";}s:7:\"Vanilla\";a:1:{s:7:\"Version\";s:3:\"2.3\";}}}',	NULL);

DROP TABLE IF EXISTS `GDN_Media`;
CREATE TABLE `GDN_Media` (
  `MediaID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Type` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `Size` int(11) NOT NULL,
  `InsertUserID` int(11) NOT NULL,
  `DateInserted` datetime NOT NULL,
  `ForeignID` int(11) DEFAULT NULL,
  `ForeignTable` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ImageWidth` smallint(5) unsigned DEFAULT NULL,
  `ImageHeight` smallint(5) unsigned DEFAULT NULL,
  `ThumbWidth` smallint(5) unsigned DEFAULT NULL,
  `ThumbHeight` smallint(5) unsigned DEFAULT NULL,
  `ThumbPath` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MediaID`),
  KEY `IX_Media_Foreign` (`ForeignID`,`ForeignTable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `GDN_Message`;
CREATE TABLE `GDN_Message` (
  `MessageID` int(11) NOT NULL AUTO_INCREMENT,
  `Content` text COLLATE utf8_unicode_ci NOT NULL,
  `Format` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AllowDismiss` tinyint(4) NOT NULL DEFAULT '1',
  `Enabled` tinyint(4) NOT NULL DEFAULT '1',
  `Application` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Controller` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  `IncludeSubcategories` tinyint(4) NOT NULL DEFAULT '0',
  `AssetTarget` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CssClass` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`MessageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `GDN_Permission`;
CREATE TABLE `GDN_Permission` (
  `PermissionID` int(11) NOT NULL AUTO_INCREMENT,
  `RoleID` int(11) NOT NULL DEFAULT '0',
  `JunctionTable` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `JunctionColumn` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `JunctionID` int(11) DEFAULT NULL,
  `Garden.Email.View` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Settings.Manage` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Settings.View` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.SignIn.Allow` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Users.Add` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Users.Edit` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Users.Delete` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Users.Approve` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Activity.Delete` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Activity.View` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Profiles.View` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Profiles.Edit` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Curation.Manage` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Moderation.Manage` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.PersonalInfo.View` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.AdvancedNotifications.Allow` tinyint(4) NOT NULL DEFAULT '0',
  `Garden.Community.Manage` tinyint(4) NOT NULL DEFAULT '0',
  `Conversations.Moderation.Manage` tinyint(4) NOT NULL DEFAULT '0',
  `Conversations.Conversations.Add` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Approval.Require` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Comments.Me` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Discussions.View` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Discussions.Add` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Discussions.Edit` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Discussions.Announce` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Discussions.Sink` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Discussions.Close` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Discussions.Delete` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Comments.Add` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Comments.Edit` tinyint(4) NOT NULL DEFAULT '0',
  `Vanilla.Comments.Delete` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`PermissionID`),
  KEY `FK_Permission_RoleID` (`RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `GDN_Permission` (`PermissionID`, `RoleID`, `JunctionTable`, `JunctionColumn`, `JunctionID`, `Garden.Email.View`, `Garden.Settings.Manage`, `Garden.Settings.View`, `Garden.SignIn.Allow`, `Garden.Users.Add`, `Garden.Users.Edit`, `Garden.Users.Delete`, `Garden.Users.Approve`, `Garden.Activity.Delete`, `Garden.Activity.View`, `Garden.Profiles.View`, `Garden.Profiles.Edit`, `Garden.Curation.Manage`, `Garden.Moderation.Manage`, `Garden.PersonalInfo.View`, `Garden.AdvancedNotifications.Allow`, `Garden.Community.Manage`, `Conversations.Moderation.Manage`, `Conversations.Conversations.Add`, `Vanilla.Approval.Require`, `Vanilla.Comments.Me`, `Vanilla.Discussions.View`, `Vanilla.Discussions.Add`, `Vanilla.Discussions.Edit`, `Vanilla.Discussions.Announce`, `Vanilla.Discussions.Sink`, `Vanilla.Discussions.Close`, `Vanilla.Discussions.Delete`, `Vanilla.Comments.Add`, `Vanilla.Comments.Edit`, `Vanilla.Comments.Delete`) VALUES
(1,	0,	NULL,	NULL,	NULL,	3,	2,	2,	3,	2,	2,	2,	2,	2,	3,	3,	3,	2,	2,	2,	2,	2,	2,	3,	2,	3,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0),
(2,	0,	'Category',	'PermissionCategoryID',	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	3,	3,	2,	2,	2,	2,	2,	3,	2,	2),
(3,	2,	NULL,	NULL,	NULL,	0,	0,	0,	0,	0,	0,	0,	0,	0,	1,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0),
(4,	2,	'Category',	'PermissionCategoryID',	-1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0),
(5,	3,	NULL,	NULL,	NULL,	1,	0,	0,	1,	0,	0,	0,	0,	0,	1,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0),
(6,	3,	'Category',	'PermissionCategoryID',	-1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0),
(7,	4,	NULL,	NULL,	NULL,	1,	0,	0,	1,	0,	0,	0,	0,	0,	1,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0),
(8,	4,	'Category',	'PermissionCategoryID',	-1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0),
(9,	8,	NULL,	NULL,	NULL,	1,	0,	0,	1,	0,	0,	0,	0,	0,	1,	1,	0,	0,	0,	0,	0,	0,	0,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0),
(10,	8,	'Category',	'PermissionCategoryID',	-1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	1,	1,	0,	0,	0,	0,	0,	1,	0,	0),
(11,	32,	NULL,	NULL,	NULL,	1,	0,	0,	1,	0,	0,	0,	0,	0,	1,	1,	0,	1,	1,	1,	0,	0,	0,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0),
(12,	32,	'Category',	'PermissionCategoryID',	-1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	1,	1,	1,	1,	1,	1,	1,	1,	1,	1),
(13,	16,	NULL,	NULL,	NULL,	1,	1,	1,	1,	1,	1,	1,	1,	1,	1,	1,	1,	1,	1,	1,	1,	1,	0,	1,	0,	0,	1,	1,	1,	1,	1,	1,	1,	1,	1,	1),
(14,	16,	'Category',	'PermissionCategoryID',	-1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	1,	1,	1,	1,	1,	1,	1,	1,	1,	1);

DROP TABLE IF EXISTS `GDN_Regarding`;
CREATE TABLE `GDN_Regarding` (
  `RegardingID` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `InsertUserID` int(11) NOT NULL,
  `DateInserted` datetime NOT NULL,
  `ForeignType` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `ForeignID` int(11) NOT NULL,
  `OriginalContent` text COLLATE utf8_unicode_ci,
  `ParentType` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ParentID` int(11) DEFAULT NULL,
  `ForeignURL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Comment` text COLLATE utf8_unicode_ci NOT NULL,
  `Reports` int(11) DEFAULT NULL,
  PRIMARY KEY (`RegardingID`),
  KEY `FK_Regarding_Type` (`Type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `GDN_Role`;
CREATE TABLE `GDN_Role` (
  `RoleID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Description` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Type` enum('guest','unconfirmed','applicant','member','moderator','administrator') COLLATE utf8_unicode_ci DEFAULT NULL,
  `Sort` int(11) DEFAULT NULL,
  `Deletable` tinyint(4) NOT NULL DEFAULT '1',
  `CanSession` tinyint(4) NOT NULL DEFAULT '1',
  `PersonalInfo` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `GDN_Role` (`RoleID`, `Name`, `Description`, `Type`, `Sort`, `Deletable`, `CanSession`, `PersonalInfo`) VALUES
(2,	'Guest',	'Guests can only view content. Anyone browsing the site who is not signed in is considered to be a \"Guest\".',	'guest',	1,	0,	0,	0),
(3,	'Unconfirmed',	'Users must confirm their emails before becoming full members. They get assigned to this role.',	'unconfirmed',	2,	0,	1,	0),
(4,	'Applicant',	'Users who have applied for membership, but have not yet been accepted. They have the same permissions as guests.',	'applicant',	3,	0,	1,	0),
(8,	'Member',	'Members can participate in discussions.',	'member',	4,	1,	1,	0),
(16,	'Administrator',	'Administrators have permission to do anything.',	'administrator',	6,	1,	1,	0),
(32,	'Moderator',	'Moderators have permission to edit most content.',	'moderator',	5,	1,	1,	0);

DROP TABLE IF EXISTS `GDN_Session`;
CREATE TABLE `GDN_Session` (
  `SessionID` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `UserID` int(11) NOT NULL DEFAULT '0',
  `DateInserted` datetime NOT NULL,
  `DateUpdated` datetime NOT NULL,
  `TransientKey` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `Attributes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`SessionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `GDN_Spammer`;
CREATE TABLE `GDN_Spammer` (
  `UserID` int(11) NOT NULL,
  `CountSpam` smallint(5) unsigned NOT NULL DEFAULT '0',
  `CountDeletedSpam` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `GDN_Tag`;
CREATE TABLE `GDN_Tag` (
  `TagID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `FullName` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ParentTagID` int(11) DEFAULT NULL,
  `InsertUserID` int(11) DEFAULT NULL,
  `DateInserted` datetime NOT NULL,
  `CategoryID` int(11) NOT NULL DEFAULT '-1',
  `CountDiscussions` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`TagID`),
  UNIQUE KEY `UX_Tag` (`Name`,`CategoryID`),
  KEY `IX_Tag_FullName` (`FullName`),
  KEY `IX_Tag_Type` (`Type`),
  KEY `FK_Tag_ParentTagID` (`ParentTagID`),
  KEY `FK_Tag_InsertUserID` (`InsertUserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `GDN_TagDiscussion`;
CREATE TABLE `GDN_TagDiscussion` (
  `TagID` int(11) NOT NULL,
  `DiscussionID` int(11) NOT NULL,
  `CategoryID` int(11) NOT NULL,
  `DateInserted` datetime NOT NULL,
  PRIMARY KEY (`TagID`,`DiscussionID`),
  KEY `IX_TagDiscussion_CategoryID` (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `GDN_User`;
CREATE TABLE `GDN_User` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Password` varbinary(100) NOT NULL,
  `HashMethod` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Location` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `About` text COLLATE utf8_unicode_ci,
  `Email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ShowEmail` tinyint(4) NOT NULL DEFAULT '0',
  `Gender` enum('u','m','f') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'u',
  `CountVisits` int(11) NOT NULL DEFAULT '0',
  `CountInvitations` int(11) NOT NULL DEFAULT '0',
  `CountNotifications` int(11) DEFAULT NULL,
  `InviteUserID` int(11) DEFAULT NULL,
  `DiscoveryText` text COLLATE utf8_unicode_ci,
  `Preferences` text COLLATE utf8_unicode_ci,
  `Permissions` text COLLATE utf8_unicode_ci,
  `Attributes` text COLLATE utf8_unicode_ci,
  `DateSetInvitations` datetime DEFAULT NULL,
  `DateOfBirth` datetime DEFAULT NULL,
  `DateFirstVisit` datetime DEFAULT NULL,
  `DateLastActive` datetime DEFAULT NULL,
  `LastIPAddress` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AllIPAddresses` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DateInserted` datetime NOT NULL,
  `InsertIPAddress` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `UpdateIPAddress` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HourOffset` int(11) NOT NULL DEFAULT '0',
  `Score` float DEFAULT NULL,
  `Admin` tinyint(4) NOT NULL DEFAULT '0',
  `Confirmed` tinyint(4) NOT NULL DEFAULT '1',
  `Verified` tinyint(4) NOT NULL DEFAULT '0',
  `Banned` tinyint(4) NOT NULL DEFAULT '0',
  `Deleted` tinyint(4) NOT NULL DEFAULT '0',
  `Points` int(11) NOT NULL DEFAULT '0',
  `CountUnreadConversations` int(11) DEFAULT NULL,
  `CountDiscussions` int(11) DEFAULT NULL,
  `CountUnreadDiscussions` int(11) DEFAULT NULL,
  `CountComments` int(11) DEFAULT NULL,
  `CountDrafts` int(11) DEFAULT NULL,
  `CountBookmarks` int(11) DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  KEY `FK_User_Name` (`Name`),
  KEY `IX_User_Email` (`Email`),
  KEY `IX_User_DateLastActive` (`DateLastActive`),
  KEY `IX_User_DateInserted` (`DateInserted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `GDN_User` (`UserID`, `Name`, `Password`, `HashMethod`, `Photo`, `Title`, `Location`, `About`, `Email`, `ShowEmail`, `Gender`, `CountVisits`, `CountInvitations`, `CountNotifications`, `InviteUserID`, `DiscoveryText`, `Preferences`, `Permissions`, `Attributes`, `DateSetInvitations`, `DateOfBirth`, `DateFirstVisit`, `DateLastActive`, `LastIPAddress`, `AllIPAddresses`, `DateInserted`, `InsertIPAddress`, `DateUpdated`, `UpdateIPAddress`, `HourOffset`, `Score`, `Admin`, `Confirmed`, `Verified`, `Banned`, `Deleted`, `Points`, `CountUnreadConversations`, `CountDiscussions`, `CountUnreadDiscussions`, `CountComments`, `CountDrafts`, `CountBookmarks`) VALUES
(1,	'System',	UNHEX('4641304A334D554B43535658484B46524B4C4838'),	'Random',	'http://necktie.docker:8888/applications/dashboard/design/images/usericon.png',	NULL,	NULL,	NULL,	'system@domain.com',	0,	'u',	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'2016-12-21 11:32:30',	NULL,	NULL,	NULL,	0,	NULL,	2,	1,	0,	0,	0,	0,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL),
(2,	'superAdmin',	UNHEX('243261243038246F4238697375765A4A6B39586A6245635A5A7956367574376C75746B3272444634574151694E53654D74315A665261524F39667A32'),	'Vanilla',	NULL,	NULL,	NULL,	NULL,	'superAdmin@webvalley.cz',	0,	'u',	1,	0,	NULL,	NULL,	NULL,	NULL,	'a:38:{i:0;s:17:\"Garden.Email.View\";i:1;s:22:\"Garden.Settings.Manage\";i:2;s:20:\"Garden.Settings.View\";i:3;s:19:\"Garden.SignIn.Allow\";i:4;s:16:\"Garden.Users.Add\";i:5;s:17:\"Garden.Users.Edit\";i:6;s:19:\"Garden.Users.Delete\";i:7;s:20:\"Garden.Users.Approve\";i:8;s:22:\"Garden.Activity.Delete\";i:9;s:20:\"Garden.Activity.View\";i:10;s:20:\"Garden.Profiles.View\";i:11;s:20:\"Garden.Profiles.Edit\";i:12;s:22:\"Garden.Curation.Manage\";i:13;s:24:\"Garden.Moderation.Manage\";i:14;s:24:\"Garden.PersonalInfo.View\";i:15;s:34:\"Garden.AdvancedNotifications.Allow\";i:16;s:23:\"Garden.Community.Manage\";i:17;s:31:\"Conversations.Conversations.Add\";i:18;s:24:\"Vanilla.Discussions.View\";i:19;s:23:\"Vanilla.Discussions.Add\";i:20;s:24:\"Vanilla.Discussions.Edit\";i:21;s:28:\"Vanilla.Discussions.Announce\";i:22;s:24:\"Vanilla.Discussions.Sink\";i:23;s:25:\"Vanilla.Discussions.Close\";i:24;s:26:\"Vanilla.Discussions.Delete\";i:25;s:20:\"Vanilla.Comments.Add\";i:26;s:21:\"Vanilla.Comments.Edit\";i:27;s:23:\"Vanilla.Comments.Delete\";s:24:\"Vanilla.Discussions.View\";a:1:{i:0;i:-1;}s:23:\"Vanilla.Discussions.Add\";a:1:{i:0;i:-1;}s:24:\"Vanilla.Discussions.Edit\";a:1:{i:0;i:-1;}s:28:\"Vanilla.Discussions.Announce\";a:1:{i:0;i:-1;}s:24:\"Vanilla.Discussions.Sink\";a:1:{i:0;i:-1;}s:25:\"Vanilla.Discussions.Close\";a:1:{i:0;i:-1;}s:26:\"Vanilla.Discussions.Delete\";a:1:{i:0;i:-1;}s:20:\"Vanilla.Comments.Add\";a:1:{i:0;i:-1;}s:21:\"Vanilla.Comments.Edit\";a:1:{i:0;i:-1;}s:23:\"Vanilla.Comments.Delete\";a:1:{i:0;i:-1;}}',	'a:3:{s:12:\"TransientKey\";s:16:\"pZfmSaJYoS4dTszN\";s:16:\"LastLoginAttempt\";i:1482324642;s:9:\"LoginRate\";i:1;}',	NULL,	'1975-09-16 00:00:00',	'2016-12-21 11:32:31',	'2016-12-21 13:03:19',	'172.19.0.1',	'172.19.0.1,10.211.55.2',	'2016-12-21 11:32:31',	'10.211.55.2',	'2016-12-21 13:04:37',	'172.19.0.1',	1,	NULL,	1,	1,	0,	0,	0,	0,	NULL,	0,	NULL,	0,	NULL,	NULL),
(3,	'[Deleted User]',	UNHEX('384433584C454F45564F'),	'Vanilla',	NULL,	NULL,	NULL,	'',	'user_3@deleted.email',	0,	'u',	0,	0,	0,	NULL,	'',	NULL,	'',	'a:1:{s:5:\"State\";s:7:\"Deleted\";}',	NULL,	NULL,	'2016-12-21 11:45:38',	'2016-12-21 11:45:38',	'10.211.55.2',	'10.211.55.2',	'2016-12-21 11:45:38',	'10.211.55.2',	'2016-12-21 13:00:22',	NULL,	0,	NULL,	0,	1,	0,	0,	1,	0,	0,	0,	0,	0,	0,	0);

DROP TABLE IF EXISTS `GDN_UserAuthentication`;
CREATE TABLE `GDN_UserAuthentication` (
  `ForeignUserKey` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ProviderKey` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `UserID` int(11) NOT NULL,
  PRIMARY KEY (`ForeignUserKey`,`ProviderKey`),
  KEY `FK_UserAuthentication_UserID` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `GDN_UserAuthentication` (`ForeignUserKey`, `ProviderKey`, `UserID`) VALUES
('2',	'4_1hgk0m3gerhcows8o04c8o4ckco4o8kk44wg84gc4c44wk8k40',	2);

DROP TABLE IF EXISTS `GDN_UserAuthenticationNonce`;
CREATE TABLE `GDN_UserAuthenticationNonce` (
  `Nonce` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Token` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Nonce`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `GDN_UserAuthenticationProvider`;
CREATE TABLE `GDN_UserAuthenticationProvider` (
  `AuthenticationKey` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `AuthenticationSchemeAlias` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `Name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AssociationSecret` text COLLATE utf8_unicode_ci,
  `AssociationHashMethod` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AuthenticateUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RegisterUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SignInUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SignOutUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PasswordUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ProfileUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Attributes` text COLLATE utf8_unicode_ci,
  `Active` tinyint(4) NOT NULL DEFAULT '1',
  `IsDefault` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`AuthenticationKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `GDN_UserAuthenticationProvider` (`AuthenticationKey`, `AuthenticationSchemeAlias`, `Name`, `URL`, `AssociationSecret`, `AssociationHashMethod`, `AuthenticateUrl`, `RegisterUrl`, `SignInUrl`, `SignOutUrl`, `PasswordUrl`, `ProfileUrl`, `Attributes`, `Active`, `IsDefault`) VALUES
('4_1hgk0m3gerhcows8o04c8o4ckco4o8kk44wg84gc4c44wk8k40',	'jsconnect',	'Necktie',	NULL,	'61a3kru5g4w8cc88c04cs8ggsc0w8ssckg44wkcks40wg4s8kg',	NULL,	'http://localhost/app_dev.php/community/vanilla/auth',	'',	'http://localhost/app_dev.php/oauth/v2/auth?client_id=4_1hgk0m3gerhcows8o04c8o4ckco4o8kk44wg84gc4c44wk8k40&client_secret=61a3kru5g4w8cc88c04cs8ggsc0w8ssckg44wkcks40wg4s8kg&response_type=code&state=xxx&redirect_uri={target}',	'http://localhost/app_dev.php/community/logout?redirect_uri={target}',	NULL,	NULL,	'a:3:{s:8:\"HashType\";s:3:\"md5\";s:7:\"Trusted\";b:0;s:8:\"TestMode\";b:0;}',	1,	1);

DROP TABLE IF EXISTS `GDN_UserAuthenticationToken`;
CREATE TABLE `GDN_UserAuthenticationToken` (
  `Token` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `ProviderKey` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `ForeignUserKey` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TokenSecret` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `TokenType` enum('request','access') COLLATE utf8_unicode_ci NOT NULL,
  `Authorized` tinyint(4) NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Lifetime` int(11) NOT NULL,
  PRIMARY KEY (`Token`,`ProviderKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `GDN_UserCategory`;
CREATE TABLE `GDN_UserCategory` (
  `UserID` int(11) NOT NULL,
  `CategoryID` int(11) NOT NULL,
  `DateMarkedRead` datetime DEFAULT NULL,
  `Unfollow` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UserID`,`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `GDN_UserComment`;
CREATE TABLE `GDN_UserComment` (
  `UserID` int(11) NOT NULL,
  `CommentID` int(11) NOT NULL,
  `Score` float DEFAULT NULL,
  `DateLastViewed` datetime DEFAULT NULL,
  PRIMARY KEY (`UserID`,`CommentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `GDN_UserConversation`;
CREATE TABLE `GDN_UserConversation` (
  `UserID` int(11) NOT NULL,
  `ConversationID` int(11) NOT NULL,
  `CountReadMessages` int(11) NOT NULL DEFAULT '0',
  `LastMessageID` int(11) DEFAULT NULL,
  `DateLastViewed` datetime DEFAULT NULL,
  `DateCleared` datetime DEFAULT NULL,
  `Bookmarked` tinyint(4) NOT NULL DEFAULT '0',
  `Deleted` tinyint(4) NOT NULL DEFAULT '0',
  `DateConversationUpdated` datetime DEFAULT NULL,
  PRIMARY KEY (`UserID`,`ConversationID`),
  KEY `IX_UserConversation_Inbox` (`UserID`,`Deleted`,`DateConversationUpdated`),
  KEY `FK_UserConversation_ConversationID` (`ConversationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `GDN_UserDiscussion`;
CREATE TABLE `GDN_UserDiscussion` (
  `UserID` int(11) NOT NULL,
  `DiscussionID` int(11) NOT NULL,
  `Score` float DEFAULT NULL,
  `CountComments` int(11) NOT NULL DEFAULT '0',
  `DateLastViewed` datetime DEFAULT NULL,
  `Dismissed` tinyint(4) NOT NULL DEFAULT '0',
  `Bookmarked` tinyint(4) NOT NULL DEFAULT '0',
  `Participated` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UserID`,`DiscussionID`),
  KEY `FK_UserDiscussion_DiscussionID` (`DiscussionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `GDN_UserMerge`;
CREATE TABLE `GDN_UserMerge` (
  `MergeID` int(11) NOT NULL AUTO_INCREMENT,
  `OldUserID` int(11) NOT NULL,
  `NewUserID` int(11) NOT NULL,
  `DateInserted` datetime NOT NULL,
  `InsertUserID` int(11) NOT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `UpdateUserID` int(11) DEFAULT NULL,
  `Attributes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`MergeID`),
  KEY `FK_UserMerge_OldUserID` (`OldUserID`),
  KEY `FK_UserMerge_NewUserID` (`NewUserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `GDN_UserMergeItem`;
CREATE TABLE `GDN_UserMergeItem` (
  `MergeID` int(11) NOT NULL,
  `Table` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `Column` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `RecordID` int(11) NOT NULL,
  `OldUserID` int(11) NOT NULL,
  `NewUserID` int(11) NOT NULL,
  KEY `FK_UserMergeItem_MergeID` (`MergeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `GDN_UserMeta`;
CREATE TABLE `GDN_UserMeta` (
  `UserID` int(11) NOT NULL,
  `Name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`UserID`,`Name`),
  KEY `IX_UserMeta_Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `GDN_UserPoints`;
CREATE TABLE `GDN_UserPoints` (
  `SlotType` enum('d','w','m','y','a') COLLATE utf8_unicode_ci NOT NULL,
  `TimeSlot` datetime NOT NULL,
  `Source` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Total',
  `CategoryID` int(11) NOT NULL DEFAULT '0',
  `UserID` int(11) NOT NULL,
  `Points` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`SlotType`,`TimeSlot`,`Source`,`CategoryID`,`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `GDN_UserRole`;
CREATE TABLE `GDN_UserRole` (
  `UserID` int(11) NOT NULL,
  `RoleID` int(11) NOT NULL,
  PRIMARY KEY (`UserID`,`RoleID`),
  KEY `IX_UserRole_RoleID` (`RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `GDN_UserRole` (`UserID`, `RoleID`) VALUES
(2,	16);

-- 2016-12-21 13:08:30