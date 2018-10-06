
DROP TABLE IF EXISTS `#__acymailing_action`;
CREATE TABLE `#__acymailing_action` (
  `action_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `frequency` int(10) unsigned NOT NULL,
  `nextdate` int(10) unsigned NOT NULL,
  `server` varchar(255) NOT NULL,
  `port` varchar(50) NOT NULL,
  `connection_method` varchar(10) NOT NULL DEFAULT '0',
  `secure_method` varchar(10) NOT NULL DEFAULT '0',
  `self_signed` tinyint(4) NOT NULL DEFAULT 0,
  `username` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL,
  `userid` int(10) unsigned DEFAULT NULL,
  `conditions` text DEFAULT NULL,
  `actions` text DEFAULT NULL,
  `report` text DEFAULT NULL,
  `published` tinyint(4) NOT NULL DEFAULT 0,
  `ordering` smallint(5) unsigned DEFAULT 0,
  `delete_wrong_emails` tinyint(4) NOT NULL DEFAULT 0,
  `senderfrom` tinyint(4) NOT NULL DEFAULT 0,
  `senderto` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`action_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__acymailing_config`;
CREATE TABLE `#__acymailing_config` (
  `namekey` varchar(200) NOT NULL,
  `value` text DEFAULT NULL,
  PRIMARY KEY (`namekey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__acymailing_fields`;
CREATE TABLE `#__acymailing_fields` (
  `fieldid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `fieldname` varchar(250) NOT NULL,
  `namekey` varchar(50) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `value` text NOT NULL,
  `published` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `ordering` smallint(5) unsigned DEFAULT 99,
  `options` text DEFAULT NULL,
  `core` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `required` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `backend` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `frontcomp` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `default` text DEFAULT NULL,
  `listing` tinyint(3) unsigned DEFAULT NULL,
  `frontlisting` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `frontjoomlaprofile` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `frontjoomlaregistration` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `joomlaprofile` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `access` varchar(250) NOT NULL DEFAULT 'all',
  `fieldcat` int(11) NOT NULL DEFAULT 0,
  `listingfilter` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `frontlistingfilter` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `frontform` tinyint(4) DEFAULT 1,
  PRIMARY KEY (`fieldid`),
  UNIQUE KEY `namekey` (`namekey`),
  KEY `orderingindex` (`published`,`ordering`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__acymailing_filter`;
CREATE TABLE `#__acymailing_filter` (
  `filid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `published` tinyint(3) unsigned DEFAULT NULL,
  `lasttime` int(10) unsigned DEFAULT NULL,
  `trigger` text DEFAULT NULL,
  `report` text DEFAULT NULL,
  `action` text DEFAULT NULL,
  `filter` text DEFAULT NULL,
  `daycron` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`filid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__acymailing_forward`;
CREATE TABLE `#__acymailing_forward` (
  `subid` int(10) unsigned NOT NULL,
  `mailid` mediumint(8) unsigned NOT NULL,
  `date` int(10) unsigned NOT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `nbforwarded` int(10) unsigned NOT NULL,
  PRIMARY KEY (`subid`,`mailid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__acymailing_geolocation`;
CREATE TABLE `#__acymailing_geolocation` (
  `geolocation_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `geolocation_subid` int(10) unsigned NOT NULL DEFAULT 0,
  `geolocation_type` varchar(255) NOT NULL DEFAULT 'subscription',
  `geolocation_ip` varchar(255) NOT NULL DEFAULT '',
  `geolocation_created` int(10) unsigned NOT NULL DEFAULT 0,
  `geolocation_latitude` decimal(9,6) NOT NULL DEFAULT 0.000000,
  `geolocation_longitude` decimal(9,6) NOT NULL DEFAULT 0.000000,
  `geolocation_postal_code` varchar(255) NOT NULL DEFAULT '',
  `geolocation_country` varchar(255) NOT NULL DEFAULT '',
  `geolocation_country_code` varchar(255) NOT NULL DEFAULT '',
  `geolocation_state` varchar(255) NOT NULL DEFAULT '',
  `geolocation_state_code` varchar(255) NOT NULL DEFAULT '',
  `geolocation_city` varchar(255) NOT NULL DEFAULT '',
  `geolocation_continent` varchar(255) NOT NULL DEFAULT '',
  `geolocation_timezone` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`geolocation_id`),
  KEY `geolocation_type` (`geolocation_subid`,`geolocation_type`),
  KEY `geolocation_ip_created` (`geolocation_ip`,`geolocation_created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__acymailing_history`;
CREATE TABLE `#__acymailing_history` (
  `subid` int(10) unsigned NOT NULL,
  `date` int(10) unsigned NOT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `action` varchar(50) NOT NULL COMMENT 'different actions: created,modified,confirmed',
  `data` text DEFAULT NULL,
  `source` text DEFAULT NULL,
  `mailid` mediumint(8) unsigned DEFAULT NULL,
  KEY `subid` (`subid`,`date`),
  KEY `dateindex` (`date`),
  KEY `actionindex` (`action`,`mailid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__acymailing_list`;
CREATE TABLE `#__acymailing_list` (
  `name` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `ordering` smallint(5) unsigned DEFAULT 0,
  `listid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `published` tinyint(4) DEFAULT NULL,
  `userid` int(10) unsigned DEFAULT NULL,
  `alias` varchar(250) DEFAULT NULL,
  `color` varchar(30) DEFAULT NULL,
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `welmailid` mediumint(9) DEFAULT NULL,
  `unsubmailid` mediumint(9) DEFAULT NULL,
  `type` enum('list','campaign') NOT NULL DEFAULT 'list',
  `access_sub` varchar(250) NOT NULL DEFAULT 'all',
  `access_manage` varchar(250) NOT NULL DEFAULT 'none',
  `languages` varchar(250) NOT NULL DEFAULT 'all',
  `startrule` varchar(50) NOT NULL DEFAULT '0',
  `category` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`listid`),
  KEY `typeorderingindex` (`type`,`ordering`),
  KEY `useridindex` (`userid`),
  KEY `typeuseridindex` (`type`,`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__acymailing_listcampaign`;
CREATE TABLE `#__acymailing_listcampaign` (
  `campaignid` smallint(5) unsigned NOT NULL,
  `listid` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`campaignid`,`listid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__acymailing_listmail`;
CREATE TABLE `#__acymailing_listmail` (
  `listid` smallint(5) unsigned NOT NULL,
  `mailid` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`listid`,`mailid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__acymailing_listsub`;
CREATE TABLE `#__acymailing_listsub` (
  `listid` smallint(5) unsigned NOT NULL,
  `subid` int(10) unsigned NOT NULL,
  `subdate` int(10) unsigned DEFAULT NULL,
  `unsubdate` int(10) unsigned DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`listid`,`subid`),
  KEY `subidindex` (`subid`),
  KEY `listidstatusindex` (`listid`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__acymailing_mail`;
CREATE TABLE `#__acymailing_mail` (
  `mailid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `subject` text DEFAULT NULL,
  `body` longtext NOT NULL,
  `altbody` longtext NOT NULL,
  `published` tinyint(4) DEFAULT 1,
  `senddate` int(10) unsigned DEFAULT NULL,
  `created` int(10) unsigned DEFAULT NULL,
  `fromname` varchar(250) DEFAULT NULL,
  `fromemail` varchar(250) DEFAULT NULL,
  `replyname` varchar(250) DEFAULT NULL,
  `replyemail` varchar(250) DEFAULT NULL,
  `type` enum('news','autonews','followup','unsub','welcome','notification','joomlanotification','action','article') NOT NULL DEFAULT 'news',
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `userid` int(10) unsigned DEFAULT NULL,
  `alias` varchar(250) DEFAULT NULL,
  `attach` text DEFAULT NULL,
  `html` tinyint(4) NOT NULL DEFAULT 1,
  `tempid` smallint(6) NOT NULL DEFAULT 0,
  `key` varchar(200) DEFAULT NULL,
  `frequency` varchar(50) DEFAULT NULL,
  `params` text DEFAULT NULL,
  `sentby` int(10) unsigned DEFAULT NULL,
  `metakey` text DEFAULT NULL,
  `metadesc` text DEFAULT NULL,
  `filter` text DEFAULT NULL,
  `language` varchar(50) NOT NULL DEFAULT '',
  `abtesting` varchar(250) DEFAULT NULL,
  `thumb` varchar(250) DEFAULT NULL,
  `summary` text NOT NULL,
  `favicon` text DEFAULT NULL,
  `bccaddresses` varchar(250) DEFAULT NULL,
  `lastupdate` int(10) unsigned DEFAULT NULL,
  `userlastupdate` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`mailid`),
  KEY `senddate` (`senddate`),
  KEY `typemailidindex` (`type`,`mailid`),
  KEY `useridindex` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__acymailing_queue`;
CREATE TABLE `#__acymailing_queue` (
  `senddate` int(10) unsigned NOT NULL,
  `subid` int(10) unsigned NOT NULL,
  `mailid` mediumint(8) unsigned NOT NULL,
  `priority` tinyint(3) unsigned DEFAULT 3,
  `try` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `paramqueue` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`subid`,`mailid`),
  KEY `listingindex` (`senddate`,`subid`),
  KEY `mailidindex` (`mailid`),
  KEY `orderingindex` (`priority`,`senddate`,`subid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__acymailing_rules`;
CREATE TABLE `#__acymailing_rules` (
  `ruleid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `ordering` smallint(6) DEFAULT NULL,
  `regex` text NOT NULL,
  `executed_on` text NOT NULL,
  `action_message` text NOT NULL,
  `action_user` text NOT NULL,
  `published` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`ruleid`),
  KEY `ordering` (`published`,`ordering`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__acymailing_stats`;
CREATE TABLE `#__acymailing_stats` (
  `mailid` mediumint(8) unsigned NOT NULL,
  `senthtml` int(10) unsigned NOT NULL DEFAULT 0,
  `senttext` int(10) unsigned NOT NULL DEFAULT 0,
  `senddate` int(10) unsigned NOT NULL,
  `openunique` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `opentotal` int(10) unsigned NOT NULL DEFAULT 0,
  `bounceunique` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `fail` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `clicktotal` int(10) unsigned NOT NULL DEFAULT 0,
  `clickunique` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `unsub` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `forward` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `bouncedetails` text DEFAULT NULL,
  PRIMARY KEY (`mailid`),
  KEY `senddateindex` (`senddate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__acymailing_subscriber`;
CREATE TABLE `#__acymailing_subscriber` (
  `subid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(200) NOT NULL,
  `userid` int(10) unsigned NOT NULL DEFAULT 0,
  `name` varchar(250) NOT NULL DEFAULT '',
  `created` int(10) unsigned DEFAULT NULL,
  `confirmed` tinyint(4) NOT NULL DEFAULT 0,
  `enabled` tinyint(4) NOT NULL DEFAULT 1,
  `accept` tinyint(4) NOT NULL DEFAULT 1,
  `ip` varchar(100) DEFAULT NULL,
  `html` tinyint(4) NOT NULL DEFAULT 1,
  `key` varchar(250) DEFAULT NULL,
  `confirmed_date` int(10) unsigned NOT NULL DEFAULT 0,
  `confirmed_ip` varchar(100) DEFAULT NULL,
  `lastopen_date` int(10) unsigned NOT NULL DEFAULT 0,
  `lastopen_ip` varchar(100) DEFAULT NULL,
  `lastclick_date` int(10) unsigned NOT NULL DEFAULT 0,
  `lastsent_date` int(10) unsigned NOT NULL DEFAULT 0,
  `source` varchar(250) NOT NULL DEFAULT '',
  `filterflags` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`subid`),
  UNIQUE KEY `email` (`email`),
  KEY `userid` (`userid`),
  KEY `queueindex` (`enabled`,`accept`,`confirmed`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__acymailing_tag`;
CREATE TABLE `#__acymailing_tag` (
  `tagid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `userid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`tagid`),
  KEY `useridindex` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__acymailing_tagmail`;
CREATE TABLE `#__acymailing_tagmail` (
  `tagid` smallint(5) unsigned NOT NULL,
  `mailid` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`tagid`,`mailid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__acymailing_template`;
CREATE TABLE `#__acymailing_template` (
  `tempid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `body` longtext DEFAULT NULL,
  `altbody` longtext DEFAULT NULL,
  `created` int(10) unsigned DEFAULT NULL,
  `published` tinyint(4) NOT NULL DEFAULT 1,
  `premium` tinyint(4) NOT NULL DEFAULT 0,
  `ordering` smallint(5) unsigned DEFAULT 0,
  `namekey` varchar(50) NOT NULL,
  `styles` text DEFAULT NULL,
  `subject` varchar(250) DEFAULT NULL,
  `stylesheet` text DEFAULT NULL,
  `fromname` varchar(250) DEFAULT NULL,
  `fromemail` varchar(250) DEFAULT NULL,
  `replyname` varchar(250) DEFAULT NULL,
  `replyemail` varchar(250) DEFAULT NULL,
  `thumb` varchar(250) DEFAULT NULL,
  `readmore` varchar(250) DEFAULT NULL,
  `access` varchar(250) NOT NULL DEFAULT 'all',
  `category` varchar(250) NOT NULL DEFAULT '',
  `header` longtext DEFAULT NULL,
  PRIMARY KEY (`tempid`),
  UNIQUE KEY `namekey` (`namekey`),
  KEY `orderingindex` (`ordering`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__acymailing_url`;
CREATE TABLE `#__acymailing_url` (
  `urlid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `url` text NOT NULL,
  PRIMARY KEY (`urlid`),
  KEY `url` (`url`(250))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__acymailing_urlclick`;
CREATE TABLE `#__acymailing_urlclick` (
  `urlid` int(10) unsigned NOT NULL,
  `mailid` mediumint(8) unsigned NOT NULL,
  `click` smallint(5) unsigned NOT NULL DEFAULT 0,
  `subid` int(10) unsigned NOT NULL,
  `date` int(10) unsigned NOT NULL,
  `ip` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`urlid`,`mailid`,`subid`),
  KEY `dateindex` (`date`),
  KEY `mailidindex` (`mailid`),
  KEY `subidindex` (`subid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__acymailing_userstats`;
CREATE TABLE `#__acymailing_userstats` (
  `mailid` mediumint(8) unsigned NOT NULL,
  `subid` int(10) unsigned NOT NULL,
  `html` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `sent` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `senddate` int(10) unsigned NOT NULL,
  `open` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `opendate` int(11) NOT NULL,
  `bounce` tinyint(4) NOT NULL DEFAULT 0,
  `fail` tinyint(4) NOT NULL DEFAULT 0,
  `ip` varchar(100) DEFAULT NULL,
  `browser` varchar(255) DEFAULT NULL,
  `browser_version` tinyint(3) unsigned DEFAULT NULL,
  `is_mobile` tinyint(3) unsigned DEFAULT NULL,
  `mobile_os` varchar(255) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `bouncerule` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`mailid`,`subid`),
  KEY `senddateindex` (`senddate`),
  KEY `subidindex` (`subid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__assets`;
CREATE TABLE `#__assets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(11) NOT NULL DEFAULT 0 COMMENT 'Nested set parent.',
  `lft` int(11) NOT NULL DEFAULT 0 COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT 0 COMMENT 'Nested set rgt.',
  `level` int(10) unsigned NOT NULL COMMENT 'The cached level in the nested tree.',
  `name` varchar(50) NOT NULL COMMENT 'The unique name for the asset.\n',
  `title` varchar(100) NOT NULL COMMENT 'The descriptive title for the asset.',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_asset_name` (`name`),
  KEY `idx_lft_rgt` (`lft`,`rgt`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=481 DEFAULT CHARSET=utf8;

INSERT INTO `#__assets` (`id`, `parent_id`, `lft`, `rgt`, `level`, `name`, `title`, `rules`) VALUES
(1, 0, 0, 943, 0, 'root.1', 'Root Asset', '{"core.login.site":{"6":1,"2":1},"core.login.admin":{"6":1},"core.login.offline":{"6":1},"core.admin":{"8":1},"core.manage":{"7":1},"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(2, 1, 1, 2, 1, 'com_admin', 'com_admin', '{}'),
(3, 1, 3, 6, 1, 'com_banners', 'com_banners', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(4, 1, 7, 8, 1, 'com_cache', 'com_cache', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(5, 1, 9, 10, 1, 'com_checkin', 'com_checkin', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(6, 1, 11, 12, 1, 'com_config', 'com_config', '{}'),
(7, 1, 13, 16, 1, 'com_contact', 'com_contact', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(8, 1, 17, 54, 1, 'com_content', 'com_content', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(9, 1, 55, 56, 1, 'com_cpanel', 'com_cpanel', '{}'),
(10, 1, 57, 58, 1, 'com_installer', 'com_installer', '{"core.admin":[],"core.manage":{"7":0},"core.delete":{"7":0},"core.edit.state":{"7":0}}'),
(11, 1, 59, 60, 1, 'com_languages', 'com_languages', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(12, 1, 61, 62, 1, 'com_login', 'com_login', '{}'),
(13, 1, 63, 64, 1, 'com_mailto', 'com_mailto', '{}'),
(14, 1, 65, 66, 1, 'com_massmail', 'com_massmail', '{}'),
(15, 1, 67, 68, 1, 'com_media', 'com_media', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":{"5":1}}'),
(16, 1, 69, 70, 1, 'com_menus', 'com_menus', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(17, 1, 71, 72, 1, 'com_messages', 'com_messages', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(18, 1, 73, 192, 1, 'com_modules', 'com_modules', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(19, 1, 193, 196, 1, 'com_newsfeeds', 'com_newsfeeds', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(20, 1, 197, 198, 1, 'com_plugins', 'com_plugins', '{"core.admin":{"7":1},"core.manage":[],"core.edit":[],"core.edit.state":[]}'),
(21, 1, 199, 200, 1, 'com_redirect', 'com_redirect', '{"core.admin":{"7":1},"core.manage":[]}'),
(22, 1, 201, 202, 1, 'com_search', 'com_search', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
(23, 1, 203, 204, 1, 'com_templates', 'com_templates', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(24, 1, 205, 208, 1, 'com_users', 'com_users', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(26, 1, 209, 210, 1, 'com_wrapper', 'com_wrapper', '{}'),
(27, 8, 18, 25, 2, 'com_content.category.2', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(28, 3, 4, 5, 2, 'com_banners.category.3', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(29, 7, 14, 15, 2, 'com_contact.category.4', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(30, 19, 194, 195, 2, 'com_newsfeeds.category.5', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(32, 24, 206, 207, 1, 'com_users.category.7', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(33, 1, 211, 212, 1, 'com_finder', 'com_finder', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
(34, 1, 213, 214, 1, 'com_joomlaupdate', 'com_joomlaupdate', '{"core.admin":[],"core.manage":[],"core.delete":[],"core.edit.state":[]}'),
(35, 1, 215, 216, 1, 'com_tags', 'com_tags', '{"core.admin":[],"core.manage":[],"core.manage":[],"core.delete":[],"core.edit.state":[]}'),
(36, 1, 217, 218, 1, 'com_contenthistory', 'com_contenthistory', '{}'),
(37, 1, 219, 220, 1, 'com_ajax', 'com_ajax', '{}'),
(38, 1, 221, 222, 1, 'com_postinstall', 'com_postinstall', '{}'),
(39, 18, 74, 75, 2, 'com_modules.module.1', 'Sub Nav', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(40, 18, 76, 77, 2, 'com_modules.module.2', 'Login', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(41, 18, 78, 79, 2, 'com_modules.module.3', 'Popular Articles', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(42, 18, 80, 81, 2, 'com_modules.module.4', 'Recently Added Articles', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(43, 18, 82, 83, 2, 'com_modules.module.8', 'Toolbar', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(44, 18, 84, 85, 2, 'com_modules.module.9', 'Quick Icons', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(45, 18, 86, 87, 2, 'com_modules.module.10', 'Logged-in Users', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(46, 18, 88, 89, 2, 'com_modules.module.12', 'Admin Menu', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(47, 18, 90, 91, 2, 'com_modules.module.13', 'Admin Submenu', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(48, 18, 92, 93, 2, 'com_modules.module.14', 'User Status', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(49, 18, 94, 95, 2, 'com_modules.module.15', 'Title', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(50, 18, 96, 97, 2, 'com_modules.module.16', 'Login Form', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(51, 18, 98, 99, 2, 'com_modules.module.17', 'Breadcrumbs', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(52, 18, 100, 101, 2, 'com_modules.module.79', 'Multilanguage status', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(53, 18, 102, 103, 2, 'com_modules.module.86', 'Joomla Version', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(55, 18, 104, 105, 2, 'com_modules.module.87', 'Download the directory app', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(56, 18, 106, 107, 2, 'com_modules.module.88', 'Pricing', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(57, 18, 108, 109, 2, 'com_modules.module.89', 'Clients', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(58, 18, 110, 111, 2, 'com_modules.module.90', 'JA Twitter Module', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(59, 1, 223, 224, 1, 'com_acymailing', 'AcyMailing', '{}'),
(60, 18, 112, 113, 2, 'com_modules.module.91', 'Get Latest Updates ', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(61, 18, 114, 115, 2, 'com_modules.module.92', 'Quick Contact', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(62, 18, 116, 117, 2, 'com_modules.module.93', 'Connect With Us', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(63, 18, 118, 119, 2, 'com_modules.module.94', 'Masthead', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(64, 1, 225, 226, 1, 'com_k2', 'COM_K2', '{"core.admin":[],"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(65, 18, 120, 121, 2, 'com_modules.module.95', 'Top Comments', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(66, 18, 122, 123, 2, 'com_modules.module.96', 'Popular Listing ', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(67, 18, 124, 125, 2, 'com_modules.module.97', 'Browse Listings By Categories', '{}'),
(68, 18, 126, 127, 2, 'com_modules.module.98', 'K2 Users', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(69, 18, 128, 129, 2, 'com_modules.module.99', 'K2 User', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(70, 18, 130, 131, 2, 'com_modules.module.100', 'K2 Quick Icons (admin)', ''),
(71, 18, 132, 133, 2, 'com_modules.module.101', 'K2 Stats (admin)', ''),
(74, 18, 134, 135, 2, 'com_modules.module.103', 'Welcome to Directory', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(75, 18, 136, 137, 2, 'com_modules.module.104', '[About-us] Features', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(76, 18, 138, 139, 2, 'com_modules.module.105', '[About-us] Stastics', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(78, 8, 26, 53, 2, 'com_content.category.8', 'News', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(79, 18, 140, 141, 2, 'com_modules.module.106', 'Search Now', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(80, 18, 142, 143, 2, 'com_modules.module.107', 'Our Team', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(81, 18, 144, 145, 2, 'com_modules.module.108', 'Slideshow', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(82, 78, 27, 28, 3, 'com_content.article.1', 'Flat 40% off Hotel Bookings In 10 Cities Near you', '{"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1}}'),
(83, 18, 146, 147, 2, 'com_modules.module.109', 'Search', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(84, 18, 148, 149, 2, 'com_modules.module.110', 'Recent News', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(85, 18, 150, 151, 2, 'com_modules.module.111', 'Categories', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(86, 18, 152, 153, 2, 'com_modules.module.112', 'Categories', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(87, 18, 154, 155, 2, 'com_modules.module.113', 'Tags', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(88, 18, 156, 157, 2, 'com_modules.module.114', 'News Archived', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(89, 1, 911, 912, 1, '#__ucm_content.1', '#__ucm_content.1', '[]'),
(90, 78, 29, 30, 3, 'com_content.article.2', 'Pay with PayUmoney: Get 5% Instant Discount', '{"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1}}'),
(91, 1, 913, 914, 1, '#__ucm_content.2', '#__ucm_content.2', '[]'),
(92, 78, 31, 32, 3, 'com_content.article.3', 'Get Rs 150 OFF on Bus Ticket Booking', '{"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1}}'),
(93, 1, 915, 916, 1, '#__ucm_content.3', '#__ucm_content.3', '[]'),
(94, 78, 33, 34, 3, 'com_content.article.4', 'Buy Medium Pan Pizza: Get anything from the Menu Free', '{"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1}}'),
(95, 1, 917, 918, 1, '#__ucm_content.4', '#__ucm_content.4', '[]'),
(96, 78, 35, 36, 3, 'com_content.article.5', 'Man With Roses Waiting for his Lady', '{"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1}}'),
(97, 1, 919, 920, 1, '#__ucm_content.5', '#__ucm_content.5', '[]'),
(98, 77, 228, 909, 2, 'com_jak2filter.category.9', 'Location', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(99, 98, 229, 238, 3, 'com_jak2filter.category.10', 'Alabama', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(100, 99, 230, 231, 4, 'com_jak2filter.category.11', 'Birmingham', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(101, 99, 232, 233, 4, 'com_jak2filter.category.12', 'Montgomery', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(102, 99, 234, 235, 4, 'com_jak2filter.category.13', 'Mobile', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(103, 99, 236, 237, 4, 'com_jak2filter.category.14', 'Huntsville', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(104, 108, 240, 241, 4, 'com_jak2filter.category.15', 'Anchorage', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(105, 108, 242, 243, 4, 'com_jak2filter.category.16', 'Phoenix', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(106, 108, 244, 245, 4, 'com_jak2filter.category.17', 'Tucson', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(107, 108, 246, 247, 4, 'com_jak2filter.category.18', 'Mesa', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(108, 98, 239, 262, 3, 'com_jak2filter.category.19', 'Alaska', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(109, 108, 248, 249, 4, 'com_jak2filter.category.20', 'Chandler', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(110, 108, 250, 251, 4, 'com_jak2filter.category.21', 'Glendale', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(111, 108, 252, 253, 4, 'com_jak2filter.category.22', 'Gilbert', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(112, 108, 254, 255, 4, 'com_jak2filter.category.23', 'Scottsdale', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(113, 108, 256, 257, 4, 'com_jak2filter.category.24', 'Tempe', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(114, 108, 258, 259, 4, 'com_jak2filter.category.25', 'Peoria', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(115, 108, 260, 261, 4, 'com_jak2filter.category.26', 'Surprise', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(116, 98, 263, 266, 3, 'com_jak2filter.category.27', 'Arkansas', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(117, 116, 264, 265, 4, 'com_jak2filter.category.28', 'Little Rock', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(118, 98, 267, 406, 3, 'com_jak2filter.category.29', 'California', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(119, 118, 268, 269, 4, 'com_jak2filter.category.30', 'Los Angeles', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(120, 118, 270, 271, 4, 'com_jak2filter.category.31', 'San Diego', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(121, 118, 272, 273, 4, 'com_jak2filter.category.32', 'San Jose', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(122, 118, 274, 275, 4, 'com_jak2filter.category.33', 'San Francisco', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(123, 118, 276, 277, 4, 'com_jak2filter.category.34', 'Fresno', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(124, 118, 278, 279, 4, 'com_jak2filter.category.35', 'Sacramento', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(125, 118, 280, 281, 4, 'com_jak2filter.category.36', 'Long Beach', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(126, 118, 282, 283, 4, 'com_jak2filter.category.37', 'Oakland', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(127, 118, 284, 285, 4, 'com_jak2filter.category.38', 'Bakersfield', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(128, 118, 286, 287, 4, 'com_jak2filter.category.39', 'Anaheim', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(129, 118, 288, 289, 4, 'com_jak2filter.category.40', 'Santa Ana', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(130, 118, 290, 291, 4, 'com_jak2filter.category.41', 'Riverside', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(131, 118, 292, 293, 4, 'com_jak2filter.category.42', 'Stockton', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(132, 118, 294, 295, 4, 'com_jak2filter.category.43', 'Chula Vista', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(133, 118, 296, 297, 4, 'com_jak2filter.category.44', 'Irvine', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(134, 118, 298, 299, 4, 'com_jak2filter.category.45', 'Fremont', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(135, 118, 300, 301, 4, 'com_jak2filter.category.46', 'San Bernardino', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(136, 118, 302, 303, 4, 'com_jak2filter.category.47', 'Modesto', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(137, 118, 304, 305, 4, 'com_jak2filter.category.48', 'Oxnard', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(138, 118, 306, 307, 4, 'com_jak2filter.category.49', 'Fontana', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(139, 118, 308, 309, 4, 'com_jak2filter.category.50', 'Moreno Valley', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(140, 118, 310, 311, 4, 'com_jak2filter.category.51', 'Huntington Beach', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(141, 118, 312, 313, 4, 'com_jak2filter.category.52', 'Glendale', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(142, 118, 314, 315, 4, 'com_jak2filter.category.53', 'Garden Grove', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(143, 118, 316, 317, 4, 'com_jak2filter.category.54', 'Oceanside', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(144, 118, 318, 319, 4, 'com_jak2filter.category.55', 'Santa Rosa', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(145, 118, 320, 321, 4, 'com_jak2filter.category.56', 'Rancho Cucamonga', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(146, 118, 322, 323, 4, 'com_jak2filter.category.57', 'Ontario', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(147, 118, 324, 325, 4, 'com_jak2filter.category.58', 'Elk Grove', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(148, 118, 326, 327, 4, 'com_jak2filter.category.59', 'Lancaster', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(149, 118, 328, 329, 4, 'com_jak2filter.category.60', 'Corona', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(150, 118, 330, 331, 4, 'com_jak2filter.category.61', 'Palmdale', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(151, 118, 332, 333, 4, 'com_jak2filter.category.62', 'Salinas', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(152, 118, 334, 335, 4, 'com_jak2filter.category.63', 'Hayward', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(153, 118, 336, 337, 4, 'com_jak2filter.category.64', 'Pomona', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(154, 118, 338, 339, 4, 'com_jak2filter.category.65', 'Escondido', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(155, 118, 340, 341, 4, 'com_jak2filter.category.66', 'Sunnyvale', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(156, 118, 342, 343, 4, 'com_jak2filter.category.67', 'Torrance', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(157, 118, 344, 345, 4, 'com_jak2filter.category.68', 'Orange', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(158, 118, 346, 347, 4, 'com_jak2filter.category.69', 'Pasadena', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(159, 118, 348, 349, 4, 'com_jak2filter.category.70', 'Fullerton', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(160, 118, 350, 351, 4, 'com_jak2filter.category.71', 'Thousand Oaks', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(161, 118, 352, 353, 4, 'com_jak2filter.category.72', 'Visalia', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(162, 118, 354, 355, 4, 'com_jak2filter.category.73', 'Roseville', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(163, 118, 356, 357, 4, 'com_jak2filter.category.74', 'Simi Valley', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(164, 118, 358, 359, 4, 'com_jak2filter.category.75', 'Concord', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(165, 118, 360, 361, 4, 'com_jak2filter.category.76', 'Victorville', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(166, 118, 362, 363, 4, 'com_jak2filter.category.77', 'Santa Clara', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(167, 118, 364, 365, 4, 'com_jak2filter.category.78', 'Vallejo', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(168, 118, 366, 367, 4, 'com_jak2filter.category.79', 'Berkeley', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(169, 118, 368, 369, 4, 'com_jak2filter.category.80', 'El Monte', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(170, 118, 370, 371, 4, 'com_jak2filter.category.81', 'Downey', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(171, 118, 372, 373, 4, 'com_jak2filter.category.82', 'Costa Mesa', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(172, 118, 374, 375, 4, 'com_jak2filter.category.83', 'Inglewood', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(173, 118, 376, 377, 4, 'com_jak2filter.category.84', 'Carlsbad', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(174, 118, 378, 379, 4, 'com_jak2filter.category.85', 'Fairfield', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(175, 118, 380, 381, 4, 'com_jak2filter.category.86', 'Ventura', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(176, 118, 382, 383, 4, 'com_jak2filter.category.87', 'West Covina', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(177, 118, 384, 385, 4, 'com_jak2filter.category.88', 'Richmond', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(178, 118, 386, 387, 4, 'com_jak2filter.category.89', 'Murrieta', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(179, 118, 388, 389, 4, 'com_jak2filter.category.90', 'Antioch', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(180, 118, 390, 391, 4, 'com_jak2filter.category.91', 'Temecula', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(181, 118, 392, 393, 4, 'com_jak2filter.category.92', 'Norwalk', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(182, 118, 394, 395, 4, 'com_jak2filter.category.93', 'Daly City', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(183, 118, 396, 397, 4, 'com_jak2filter.category.94', 'Burbank', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(184, 118, 398, 399, 4, 'com_jak2filter.category.95', 'Santa Maria', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(185, 118, 400, 401, 4, 'com_jak2filter.category.96', 'El Cajon', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(186, 118, 402, 403, 4, 'com_jak2filter.category.97', 'Rialto', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(187, 118, 404, 405, 4, 'com_jak2filter.category.98', 'San Mateo', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(188, 98, 407, 430, 3, 'com_jak2filter.category.99', 'Colorado', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(189, 188, 408, 409, 4, 'com_jak2filter.category.100', 'Denver', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(190, 188, 410, 411, 4, 'com_jak2filter.category.101', 'Colorado Springs', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(191, 188, 412, 413, 4, 'com_jak2filter.category.102', 'Aurora', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(192, 188, 414, 415, 4, 'com_jak2filter.category.103', 'Fort Collins', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(193, 188, 416, 417, 4, 'com_jak2filter.category.104', 'Lakewood', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(194, 188, 418, 419, 4, 'com_jak2filter.category.105', 'Thornton', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(195, 188, 420, 421, 4, 'com_jak2filter.category.106', 'Arvada', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(196, 188, 422, 423, 4, 'com_jak2filter.category.107', 'Westminster', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(197, 188, 424, 425, 4, 'com_jak2filter.category.108', 'Pueblo', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(198, 188, 426, 427, 4, 'com_jak2filter.category.109', 'Centennial', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(199, 188, 428, 429, 4, 'com_jak2filter.category.110', 'Boulder', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(200, 98, 431, 442, 3, 'com_jak2filter.category.111', 'Connecticut', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(201, 200, 432, 433, 4, 'com_jak2filter.category.112', 'Bridgeport', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(202, 200, 434, 435, 4, 'com_jak2filter.category.113', 'New Haven', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(203, 200, 436, 437, 4, 'com_jak2filter.category.114', 'Stamford', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(204, 200, 438, 439, 4, 'com_jak2filter.category.115', 'Hartford', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(205, 200, 440, 441, 4, 'com_jak2filter.category.116', 'Waterbury', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(206, 98, 443, 446, 3, 'com_jak2filter.category.117', 'District of Columbia', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(207, 206, 444, 445, 4, 'com_jak2filter.category.118', 'Washington[', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(208, 98, 447, 492, 3, 'com_jak2filter.category.119', 'Florida', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(209, 208, 448, 449, 4, 'com_jak2filter.category.120', 'Jacksonville', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(210, 208, 450, 451, 4, 'com_jak2filter.category.121', 'Miami', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(211, 208, 452, 453, 4, 'com_jak2filter.category.122', 'Tampa', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(212, 208, 454, 455, 4, 'com_jak2filter.category.123', 'Orlando', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(213, 208, 456, 457, 4, 'com_jak2filter.category.124', 'St. Petersburg', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(214, 208, 458, 459, 4, 'com_jak2filter.category.125', 'Hialeah', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(215, 208, 460, 461, 4, 'com_jak2filter.category.126', 'Tallahassee', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(216, 208, 462, 463, 4, 'com_jak2filter.category.127', 'Fort Lauderdale', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(217, 208, 464, 465, 4, 'com_jak2filter.category.128', 'Port St. Lucie', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(218, 208, 466, 467, 4, 'com_jak2filter.category.129', 'Cape Coral', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(219, 208, 468, 469, 4, 'com_jak2filter.category.130', 'Pembroke Pines', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(220, 208, 470, 471, 4, 'com_jak2filter.category.131', 'Hollywood', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(221, 208, 472, 473, 4, 'com_jak2filter.category.132', 'Miramar', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(222, 208, 474, 475, 4, 'com_jak2filter.category.133', 'Gainesville', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(223, 208, 476, 477, 4, 'com_jak2filter.category.134', 'Coral Springs', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(224, 208, 478, 479, 4, 'com_jak2filter.category.135', 'Miami Gardens', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(225, 208, 480, 481, 4, 'com_jak2filter.category.136', 'Clearwater', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(226, 208, 482, 483, 4, 'com_jak2filter.category.137', 'Palm Bay', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(227, 208, 484, 485, 4, 'com_jak2filter.category.138', 'Pompano Beach', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(228, 208, 486, 487, 4, 'com_jak2filter.category.139', 'West Palm Beach', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(229, 208, 488, 489, 4, 'com_jak2filter.category.140', 'Lakeland', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(230, 238, 494, 495, 4, 'com_jak2filter.category.141', 'Atlanta', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(231, 238, 496, 497, 4, 'com_jak2filter.category.142', 'Columbus', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(232, 238, 498, 499, 4, 'com_jak2filter.category.143', 'Augusta', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(233, 238, 500, 501, 4, 'com_jak2filter.category.144', 'Savannah', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(234, 238, 502, 503, 4, 'com_jak2filter.category.145', 'Athens', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(235, 208, 490, 491, 4, 'com_jak2filter.category.146', 'Honolulu[', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(236, 240, 510, 511, 4, 'com_jak2filter.category.147', 'Boise', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(237, 241, 514, 515, 4, 'com_jak2filter.category.148', 'Chicago', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(238, 98, 493, 504, 3, 'com_jak2filter.category.149', 'Georgia', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(239, 98, 505, 508, 3, 'com_jak2filter.category.150', 'Hawai\'i', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(240, 98, 509, 512, 3, 'com_jak2filter.category.151', 'Idaho', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(241, 98, 513, 530, 3, 'com_jak2filter.category.152', 'Illinois', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(242, 239, 506, 507, 4, 'com_jak2filter.category.153', 'Honolulu', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(243, 241, 516, 517, 4, 'com_jak2filter.category.154', 'Aurora', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(244, 241, 518, 519, 4, 'com_jak2filter.category.155', 'Rockford', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(245, 241, 520, 521, 4, 'com_jak2filter.category.156', 'Joliet', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(246, 241, 522, 523, 4, 'com_jak2filter.category.157', 'Naperville', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(247, 241, 524, 525, 4, 'com_jak2filter.category.158', 'Springfield', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(248, 241, 526, 527, 4, 'com_jak2filter.category.159', 'Peoria', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(249, 241, 528, 529, 4, 'com_jak2filter.category.160', 'Elgin', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(250, 98, 531, 540, 3, 'com_jak2filter.category.161', 'Indiana', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(251, 250, 532, 533, 4, 'com_jak2filter.category.162', 'Indianapolis', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(252, 250, 534, 535, 4, 'com_jak2filter.category.163', 'Fort Wayne', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(253, 250, 536, 537, 4, 'com_jak2filter.category.164', 'Evansville', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(254, 250, 538, 539, 4, 'com_jak2filter.category.165', 'South Bend', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(255, 98, 541, 548, 3, 'com_jak2filter.category.166', 'Iowa', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(256, 255, 542, 543, 4, 'com_jak2filter.category.167', 'Des Moines', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(257, 255, 544, 545, 4, 'com_jak2filter.category.168', 'Cedar Rapids', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(258, 255, 546, 547, 4, 'com_jak2filter.category.169', 'Davenport', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(259, 98, 549, 560, 3, 'com_jak2filter.category.170', 'Kansas', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(260, 259, 550, 551, 4, 'com_jak2filter.category.171', 'Wichita', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(261, 259, 552, 553, 4, 'com_jak2filter.category.172', 'Overland Park', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(262, 259, 554, 555, 4, 'com_jak2filter.category.173', 'Kansas City', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(263, 259, 556, 557, 4, 'com_jak2filter.category.174', 'Olathe', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(264, 259, 558, 559, 4, 'com_jak2filter.category.175', 'Topeka', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(265, 98, 561, 566, 3, 'com_jak2filter.category.176', 'Kentucky', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(266, 265, 562, 563, 4, 'com_jak2filter.category.177', 'Louisville', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(267, 265, 564, 565, 4, 'com_jak2filter.category.178', 'Lexington', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(268, 98, 567, 576, 3, 'com_jak2filter.category.179', 'Louisiana', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(269, 268, 568, 569, 4, 'com_jak2filter.category.180', 'New Orleans', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(270, 268, 570, 571, 4, 'com_jak2filter.category.181', 'Baton Rouge', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(271, 268, 572, 573, 4, 'com_jak2filter.category.182', 'Shreveport', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(272, 268, 574, 575, 4, 'com_jak2filter.category.183', 'Lafayette', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(273, 98, 577, 580, 3, 'com_jak2filter.category.184', 'Maryland', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(274, 273, 578, 579, 4, 'com_jak2filter.category.185', 'Baltimore', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(275, 98, 581, 592, 3, 'com_jak2filter.category.186', 'Massachusetts', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(276, 275, 582, 583, 4, 'com_jak2filter.category.187', 'Boston', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(277, 275, 584, 585, 4, 'com_jak2filter.category.188', 'Worcester', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(278, 275, 586, 587, 4, 'com_jak2filter.category.189', 'Springfield', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}');
INSERT INTO `#__assets` (`id`, `parent_id`, `lft`, `rgt`, `level`, `name`, `title`, `rules`) VALUES
(279, 275, 588, 589, 4, 'com_jak2filter.category.190', 'Lowell', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(280, 275, 590, 591, 4, 'com_jak2filter.category.191', 'Cambridge', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(281, 98, 593, 606, 3, 'com_jak2filter.category.192', 'Michigan', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(282, 281, 594, 595, 4, 'com_jak2filter.category.193', 'Detroit', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(283, 281, 596, 597, 4, 'com_jak2filter.category.194', 'Grand Rapids', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(284, 281, 598, 599, 4, 'com_jak2filter.category.195', 'Warren', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(285, 281, 600, 601, 4, 'com_jak2filter.category.196', 'Sterling Heights', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(286, 281, 602, 603, 4, 'com_jak2filter.category.197', 'Ann Arbor', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(287, 281, 604, 605, 4, 'com_jak2filter.category.198', 'Lansing', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(288, 98, 607, 614, 3, 'com_jak2filter.category.199', 'Minnesota', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(289, 288, 608, 609, 4, 'com_jak2filter.category.200', 'Minneapolis', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(290, 288, 610, 611, 4, 'com_jak2filter.category.201', 'Saint Paul', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(291, 288, 612, 613, 4, 'com_jak2filter.category.202', 'Rochester', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(292, 98, 615, 618, 3, 'com_jak2filter.category.203', 'Mississippi', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(293, 292, 616, 617, 4, 'com_jak2filter.category.204', 'Jackson', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(294, 98, 619, 630, 3, 'com_jak2filter.category.205', 'Missouri', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(295, 294, 620, 621, 4, 'com_jak2filter.category.206', 'Kansas City', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(296, 294, 622, 623, 4, 'com_jak2filter.category.207', 'St. Louis', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(297, 294, 624, 625, 4, 'com_jak2filter.category.208', 'Springfield', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(298, 294, 626, 627, 4, 'com_jak2filter.category.209', 'Independence', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(299, 294, 628, 629, 4, 'com_jak2filter.category.210', 'Columbia', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(300, 98, 631, 634, 3, 'com_jak2filter.category.211', 'Montana', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(301, 300, 632, 633, 4, 'com_jak2filter.category.212', 'Billings', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(302, 98, 635, 640, 3, 'com_jak2filter.category.213', 'Nebraska', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(303, 302, 636, 637, 4, 'com_jak2filter.category.214', 'Omaha', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(304, 302, 638, 639, 4, 'com_jak2filter.category.215', 'Lincoln', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(305, 98, 641, 650, 3, 'com_jak2filter.category.216', 'Nevada', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(306, 305, 642, 643, 4, 'com_jak2filter.category.217', 'Las Vegas', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(307, 305, 644, 645, 4, 'com_jak2filter.category.218', 'Henderson', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(308, 305, 646, 647, 4, 'com_jak2filter.category.219', 'Reno', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(309, 305, 648, 649, 4, 'com_jak2filter.category.220', 'North Las Vegas', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(310, 98, 651, 654, 3, 'com_jak2filter.category.221', 'New Hampshire', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(311, 310, 652, 653, 4, 'com_jak2filter.category.222', 'Manchester', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(312, 98, 655, 668, 3, 'com_jak2filter.category.223', 'New Jersey', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(313, 312, 656, 657, 4, 'com_jak2filter.category.224', 'Newark', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(314, 312, 658, 659, 4, 'com_jak2filter.category.225', 'Jersey City', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(315, 312, 660, 661, 4, 'com_jak2filter.category.226', 'Paterson', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(316, 312, 662, 663, 4, 'com_jak2filter.category.227', 'Elizabeth', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(317, 312, 664, 665, 4, 'com_jak2filter.category.228', 'Edison', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(318, 312, 666, 667, 4, 'com_jak2filter.category.229', 'Woodbridge', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(319, 320, 670, 671, 4, 'com_jak2filter.category.230', 'Albuquerque', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(320, 98, 669, 674, 3, 'com_jak2filter.category.231', 'New Mexico', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(321, 320, 672, 673, 4, 'com_jak2filter.category.232', 'Las Cruces', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(322, 98, 675, 686, 3, 'com_jak2filter.category.233', 'New York', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(323, 322, 676, 677, 4, 'com_jak2filter.category.234', 'New York', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(324, 322, 678, 679, 4, 'com_jak2filter.category.235', 'Buffalo', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(325, 322, 680, 681, 4, 'com_jak2filter.category.236', 'Rochester', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(326, 322, 682, 683, 4, 'com_jak2filter.category.237', 'Yonkers', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(327, 322, 684, 685, 4, 'com_jak2filter.category.238', 'Syracuse', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(328, 98, 687, 706, 3, 'com_jak2filter.category.239', 'North Carolina', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(329, 328, 688, 689, 4, 'com_jak2filter.category.240', 'Charlotte', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(330, 328, 690, 691, 4, 'com_jak2filter.category.241', 'Raleigh', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(331, 328, 692, 693, 4, 'com_jak2filter.category.242', 'Greensboro', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(332, 328, 694, 695, 4, 'com_jak2filter.category.243', 'Durham', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(333, 328, 696, 697, 4, 'com_jak2filter.category.244', 'Winston–Salem', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(334, 328, 698, 699, 4, 'com_jak2filter.category.245', 'Fayetteville', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(335, 328, 700, 701, 4, 'com_jak2filter.category.246', 'Cary', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(336, 328, 702, 703, 4, 'com_jak2filter.category.247', 'Wilmington', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(337, 328, 704, 705, 4, 'com_jak2filter.category.248', 'High Point', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(338, 98, 707, 710, 3, 'com_jak2filter.category.249', 'North Dakota', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(339, 338, 708, 709, 4, 'com_jak2filter.category.250', 'Fargo', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(340, 98, 711, 724, 3, 'com_jak2filter.category.251', 'Ohio', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(341, 340, 712, 713, 4, 'com_jak2filter.category.252', 'Columbus', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(342, 340, 714, 715, 4, 'com_jak2filter.category.253', 'Cleveland', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(343, 340, 716, 717, 4, 'com_jak2filter.category.254', 'Cincinnati', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(344, 340, 718, 719, 4, 'com_jak2filter.category.255', 'Toledo', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(345, 340, 720, 721, 4, 'com_jak2filter.category.256', 'Akron', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(346, 340, 722, 723, 4, 'com_jak2filter.category.257', 'Dayton', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(347, 98, 725, 734, 3, 'com_jak2filter.category.258', 'Oklahoma', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(348, 347, 726, 727, 4, 'com_jak2filter.category.259', 'Oklahoma City', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(349, 347, 728, 729, 4, 'com_jak2filter.category.260', 'Tulsa', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(350, 347, 730, 731, 4, 'com_jak2filter.category.261', 'Norman', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(351, 347, 732, 733, 4, 'com_jak2filter.category.262', 'Broken Arrow', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(352, 98, 735, 744, 3, 'com_jak2filter.category.263', 'Oregon', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(353, 352, 736, 737, 4, 'com_jak2filter.category.264', 'Portland', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(354, 352, 738, 739, 4, 'com_jak2filter.category.265', 'Salem', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(355, 352, 740, 741, 4, 'com_jak2filter.category.266', 'Eugene', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(356, 352, 742, 743, 4, 'com_jak2filter.category.267', 'Gresham', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(357, 98, 745, 754, 3, 'com_jak2filter.category.268', 'Pennsylvania', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(358, 357, 746, 747, 4, 'com_jak2filter.category.269', 'Philadelphia', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(359, 357, 748, 749, 4, 'com_jak2filter.category.270', 'Pittsburgh', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(360, 357, 750, 751, 4, 'com_jak2filter.category.271', 'Allentown', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(361, 357, 752, 753, 4, 'com_jak2filter.category.272', 'Erie', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(362, 98, 755, 758, 3, 'com_jak2filter.category.273', 'Rhode Island', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(363, 362, 756, 757, 4, 'com_jak2filter.category.274', 'Providence', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(364, 98, 759, 766, 3, 'com_jak2filter.category.275', 'South Carolina', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(365, 364, 760, 761, 4, 'com_jak2filter.category.276', 'Columbia', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(366, 364, 762, 763, 4, 'com_jak2filter.category.277', 'Charleston', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(367, 364, 764, 765, 4, 'com_jak2filter.category.278', 'North Charleston', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(368, 98, 767, 770, 3, 'com_jak2filter.category.279', 'South Dakota', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(369, 368, 768, 769, 4, 'com_jak2filter.category.280', 'Sioux Falls', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(370, 98, 771, 784, 3, 'com_jak2filter.category.281', 'Tennessee', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(371, 370, 772, 773, 4, 'com_jak2filter.category.282', 'Memphis', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(373, 370, 774, 775, 4, 'com_jak2filter.category.283', 'Nashville', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(374, 370, 776, 777, 4, 'com_jak2filter.category.284', 'Knoxville', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(375, 370, 778, 779, 4, 'com_jak2filter.category.285', 'Chattanooga', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(376, 370, 780, 781, 4, 'com_jak2filter.category.286', 'Clarksville', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(377, 370, 782, 783, 4, 'com_jak2filter.category.287', 'Murfreesboro', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(378, 98, 785, 858, 3, 'com_jak2filter.category.288', 'Texas', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(379, 378, 786, 787, 4, 'com_jak2filter.category.289', 'Houston', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(380, 378, 788, 789, 4, 'com_jak2filter.category.290', 'San Antonio', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(381, 378, 790, 791, 4, 'com_jak2filter.category.291', 'Dallas', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(382, 378, 792, 793, 4, 'com_jak2filter.category.292', 'Austin', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(383, 378, 794, 795, 4, 'com_jak2filter.category.293', 'Fort Worth', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(384, 378, 796, 797, 4, 'com_jak2filter.category.294', 'El Paso', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(385, 378, 798, 799, 4, 'com_jak2filter.category.295', 'Arlington', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(386, 378, 800, 801, 4, 'com_jak2filter.category.296', 'Corpus Christi', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(387, 378, 802, 803, 4, 'com_jak2filter.category.297', 'Plano', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(388, 378, 804, 805, 4, 'com_jak2filter.category.298', 'Laredo', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(389, 378, 806, 807, 4, 'com_jak2filter.category.299', 'Lubbock', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(390, 378, 808, 809, 4, 'com_jak2filter.category.300', 'Garland', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(391, 378, 810, 811, 4, 'com_jak2filter.category.301', 'Irving', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(392, 378, 812, 813, 4, 'com_jak2filter.category.302', 'Amarillo', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(393, 378, 814, 815, 4, 'com_jak2filter.category.303', 'Grand Prairie', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(394, 378, 816, 817, 4, 'com_jak2filter.category.304', 'Brownsville', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(395, 378, 818, 819, 4, 'com_jak2filter.category.305', 'Pasadena', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(396, 378, 820, 821, 4, 'com_jak2filter.category.306', 'McKinney', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(397, 378, 822, 823, 4, 'com_jak2filter.category.307', 'Mesquite', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(398, 378, 824, 825, 4, 'com_jak2filter.category.308', 'Killeen', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(399, 378, 826, 827, 4, 'com_jak2filter.category.309', 'Frisco', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(400, 378, 828, 829, 4, 'com_jak2filter.category.310', 'McAllen', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(401, 378, 830, 831, 4, 'com_jak2filter.category.311', 'Waco', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(402, 378, 832, 833, 4, 'com_jak2filter.category.312', 'Carrollton', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(403, 378, 834, 835, 4, 'com_jak2filter.category.313', 'Midland', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(404, 378, 836, 837, 4, 'com_jak2filter.category.314', 'Denton', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(405, 378, 838, 839, 4, 'com_jak2filter.category.315', 'Abilene', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(406, 378, 840, 841, 4, 'com_jak2filter.category.316', 'Beaumont', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(407, 378, 842, 843, 4, 'com_jak2filter.category.317', 'Odessa', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(408, 378, 844, 845, 4, 'com_jak2filter.category.318', 'Round Rock', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(409, 378, 846, 847, 4, 'com_jak2filter.category.319', 'Wichita Falls', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(410, 378, 848, 849, 4, 'com_jak2filter.category.320', 'Richardson', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(411, 378, 850, 851, 4, 'com_jak2filter.category.321', 'Lewisville', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(412, 378, 852, 853, 4, 'com_jak2filter.category.322', 'Tyler', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(413, 378, 854, 855, 4, 'com_jak2filter.category.323', 'Pearland', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(414, 378, 856, 857, 4, 'com_jak2filter.category.324', 'College Station', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(415, 98, 859, 868, 3, 'com_jak2filter.category.325', 'Utah', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(416, 415, 860, 861, 4, 'com_jak2filter.category.326', 'Salt Lake City', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(417, 415, 862, 863, 4, 'com_jak2filter.category.327', 'West Valley City', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(418, 415, 864, 865, 4, 'com_jak2filter.category.328', 'Provo', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(419, 415, 866, 867, 4, 'com_jak2filter.category.329', 'West Jordan', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(420, 98, 869, 884, 3, 'com_jak2filter.category.330', 'Virginia', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(421, 420, 870, 871, 4, 'com_jak2filter.category.331', 'Virginia Beach', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(422, 420, 872, 873, 4, 'com_jak2filter.category.332', 'Norfolk', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(423, 420, 874, 875, 4, 'com_jak2filter.category.333', 'Chesapeake', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(424, 420, 876, 877, 4, 'com_jak2filter.category.334', 'Richmond', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(425, 420, 878, 879, 4, 'com_jak2filter.category.335', 'Newport News', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(426, 420, 880, 881, 4, 'com_jak2filter.category.336', 'Alexandria', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(427, 420, 882, 883, 4, 'com_jak2filter.category.337', 'Hampton', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(428, 98, 885, 900, 3, 'com_jak2filter.category.338', 'Washington', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(429, 428, 886, 887, 4, 'com_jak2filter.category.339', 'Seattle', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(430, 428, 888, 889, 4, 'com_jak2filter.category.340', 'Spokane', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(431, 428, 890, 891, 4, 'com_jak2filter.category.341', 'Tacoma', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(432, 428, 892, 893, 4, 'com_jak2filter.category.342', 'Vancouver', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(433, 428, 894, 895, 4, 'com_jak2filter.category.343', 'Bellevue', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(434, 428, 896, 897, 4, 'com_jak2filter.category.344', 'Kent', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(435, 428, 898, 899, 4, 'com_jak2filter.category.345', 'Everett', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(436, 98, 901, 908, 3, 'com_jak2filter.category.346', 'Wisconsin', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(437, 436, 902, 903, 4, 'com_jak2filter.category.347', 'Milwaukee', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(438, 436, 904, 905, 4, 'com_jak2filter.category.348', 'Madison', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(439, 436, 906, 907, 4, 'com_jak2filter.category.349', 'Green Bay', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(440, 18, 158, 159, 2, 'com_modules.module.116', '[About-us] Testimonial', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(441, 18, 160, 161, 2, 'com_modules.module.117', 'Featured Video', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(442, 18, 162, 163, 2, 'com_modules.module.118', 'Look The Places Around You ', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(443, 18, 164, 165, 2, 'com_modules.module.119', 'Look The Places', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(446, 18, 166, 167, 2, 'com_modules.module.122', 'Our Team', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(447, 18, 168, 169, 2, 'com_modules.module.123', 'JA Fillter', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(448, 78, 37, 38, 3, 'com_content.article.6', 'Beautiful Ha Long Bay View', '{"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1}}'),
(449, 78, 39, 40, 3, 'com_content.article.7', 'Domestic Flight Booking: Get 20% Cashback ', '{"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1}}'),
(450, 1, 921, 922, 1, '#__ucm_content.6', '#__ucm_content.6', '[]'),
(451, 18, 170, 171, 2, 'com_modules.module.124', 'Articles - Related', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(452, 78, 41, 42, 3, 'com_content.article.8', 'Colorful Fun Fair Night Ride', '{"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1}}'),
(453, 1, 923, 924, 1, '#__ucm_content.7', '#__ucm_content.7', '[]'),
(454, 78, 43, 44, 3, 'com_content.article.9', 'Pune Restaurants: Get 30% OFF', '{"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1}}'),
(455, 1, 925, 926, 1, '#__ucm_content.8', '#__ucm_content.8', '[]'),
(456, 78, 45, 46, 3, 'com_content.article.10', ' Colorful Meal with Noodles', '{"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1}}'),
(457, 1, 927, 928, 1, '#__ucm_content.9', '#__ucm_content.9', '[]'),
(458, 78, 47, 48, 3, 'com_content.article.11', 'Last Minute Booking on Hotels: Get Flat 40% OFF', '{"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1}}'),
(459, 1, 929, 930, 1, '#__ucm_content.10', '#__ucm_content.10', '[]'),
(460, 78, 49, 50, 3, 'com_content.article.12', 'DJ in the mix', '{"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1}}'),
(461, 1, 931, 932, 1, '#__ucm_content.11', '#__ucm_content.11', '[]'),
(462, 78, 51, 52, 3, 'com_content.article.13', 'Domestic Flight Booking: Get 20% Cashback  (7)', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(463, 1, 933, 934, 1, '#__ucm_content.12', '#__ucm_content.12', '[]'),
(464, 18, 172, 173, 2, 'com_modules.module.125', '[Contact] JA Map', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(465, 18, 174, 175, 2, 'com_modules.module.126', '[Contact] JA Map ', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(466, 18, 176, 177, 2, 'com_modules.module.127', 'Login', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(467, 27, 19, 20, 3, 'com_content.article.14', 'Offline Page', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(468, 27, 21, 22, 3, 'com_content.article.15', ' 404 page', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(469, 18, 178, 179, 2, 'com_modules.module.128', 'Menu', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(470, 18, 180, 181, 2, 'com_modules.module.129', 'K2 Archive', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(471, 18, 182, 183, 2, 'com_modules.module.130', 'K2 Search', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(472, 18, 184, 185, 2, 'com_modules.module.131', 'K2 Tags', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(473, 18, 186, 187, 2, 'com_modules.module.132', 'K2 Categories List', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(474, 18, 188, 189, 2, 'com_modules.module.133', 'K2 Menu', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(475, 27, 23, 24, 3, 'com_content.article.16', 'Shortcodes', '{"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1}}'),
(476, 1, 935, 936, 1, 'com_jaextmanager', 'com_jaextmanager', '{}'),
(477, 18, 190, 191, 2, 'com_modules.module.134', 'Footer', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(479, 1, 939, 940, 1, 'com_fields', 'com_fields', '{}'),
(480, 1, 941, 942, 1, 'com_associations', 'com_associations', '{}');

DROP TABLE IF EXISTS `#__associations`;
CREATE TABLE `#__associations` (
  `id` int(11) NOT NULL COMMENT 'A reference to the associated item.',
  `context` varchar(50) NOT NULL COMMENT 'The context of the associated item.',
  `key` char(32) NOT NULL COMMENT 'The key for the association computed from an md5 on associated ids.',
  PRIMARY KEY (`context`,`id`),
  KEY `idx_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__banner_clients`;
CREATE TABLE `#__banner_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `contact` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `extrainfo` mediumtext NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT 0,
  `checked_out` int(10) unsigned NOT NULL DEFAULT 0,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `metakey` mediumtext NOT NULL,
  `own_prefix` tinyint(4) NOT NULL DEFAULT 0,
  `metakey_prefix` varchar(255) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT -1,
  `track_clicks` tinyint(4) NOT NULL DEFAULT -1,
  `track_impressions` tinyint(4) NOT NULL DEFAULT -1,
  PRIMARY KEY (`id`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__banner_tracks`;
CREATE TABLE `#__banner_tracks` (
  `track_date` datetime NOT NULL,
  `track_type` int(10) unsigned NOT NULL,
  `banner_id` int(10) unsigned NOT NULL,
  `count` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`track_date`,`track_type`,`banner_id`),
  KEY `idx_track_date` (`track_date`),
  KEY `idx_track_type` (`track_type`),
  KEY `idx_banner_id` (`banner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__banners`;
CREATE TABLE `#__banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(400) binary NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT 0,
  `impmade` int(11) NOT NULL DEFAULT 0,
  `clicks` int(11) NOT NULL DEFAULT 0,
  `clickurl` varchar(200) NOT NULL DEFAULT '',
  `state` tinyint(3) NOT NULL DEFAULT 0,
  `catid` int(10) unsigned NOT NULL DEFAULT 0,
  `description` mediumtext NOT NULL,
  `custombannercode` varchar(2048) NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `metakey` mediumtext NOT NULL,
  `params` mediumtext NOT NULL,
  `own_prefix` tinyint(1) NOT NULL DEFAULT 0,
  `metakey_prefix` varchar(400) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT -1,
  `track_clicks` tinyint(4) NOT NULL DEFAULT -1,
  `track_impressions` tinyint(4) NOT NULL DEFAULT -1,
  `checked_out` int(10) unsigned NOT NULL DEFAULT 0,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reset` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `language` char(7) NOT NULL DEFAULT '',
  `created_by` int(10) unsigned NOT NULL DEFAULT 0,
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT 0,
  `version` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_banner_catid` (`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_metakey_prefix` (`metakey_prefix`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__categories`;
CREATE TABLE `#__categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'FK to the #__assets table.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT 0,
  `lft` int(11) NOT NULL DEFAULT 0,
  `rgt` int(11) NOT NULL DEFAULT 0,
  `level` int(10) unsigned NOT NULL DEFAULT 0,
  `path` varchar(400) NOT NULL DEFAULT '',
  `extension` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(400) binary NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT 0,
  `checked_out` int(11) unsigned NOT NULL DEFAULT 0,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) unsigned NOT NULL DEFAULT 0,
  `params` text NOT NULL,
  `metadesc` varchar(1024) NOT NULL DEFAULT '' COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) NOT NULL DEFAULT '' COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) NOT NULL DEFAULT '' COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(10) unsigned NOT NULL DEFAULT 0,
  `language` char(7) NOT NULL DEFAULT '',
  `version` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`extension`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_language` (`language`),
  KEY `idx_path` (`path`(100)),
  KEY `idx_alias` (`alias`(100))
) ENGINE=InnoDB AUTO_INCREMENT=350 DEFAULT CHARSET=utf8;

INSERT INTO `#__categories` (`id`, `asset_id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `extension`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `modified_user_id`, `modified_time`, `hits`, `language`, `version`) VALUES
(1, 0, 0, 0, 695, 0, '', 'system', 'ROOT', 'root', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{}', '', '', '{}', 42, '2018-09-13 03:39:00', 0, '0000-00-00 00:00:00', 0, '*', 1),
(2, 27, 1, 1, 2, 1, 'uncategorised', 'com_content', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2018-09-13 03:39:00', 0, '0000-00-00 00:00:00', 0, '*', 1),
(3, 28, 1, 3, 4, 1, 'uncategorised', 'com_banners', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2018-09-13 03:39:00', 0, '0000-00-00 00:00:00', 0, '*', 1),
(4, 29, 1, 5, 6, 1, 'uncategorised', 'com_contact', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2018-09-13 03:39:00', 0, '0000-00-00 00:00:00', 0, '*', 1),
(5, 30, 1, 7, 8, 1, 'uncategorised', 'com_newsfeeds', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2018-09-13 03:39:00', 0, '0000-00-00 00:00:00', 0, '*', 1),
(7, 32, 1, 9, 10, 1, 'uncategorised', 'com_users', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2018-09-13 03:39:00', 0, '0000-00-00 00:00:00', 0, '*', 1);

DROP TABLE IF EXISTS `#__compojoom_customfields`;
CREATE TABLE `#__compojoom_customfields` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `slug` varchar(255) NOT NULL DEFAULT '',
  `component` varchar(255) NOT NULL DEFAULT '',
  `show` enum('all','category') NOT NULL DEFAULT 'all',
  `type` varchar(100) NOT NULL DEFAULT 'text',
  `options` mediumtext DEFAULT NULL,
  `default` varchar(255) DEFAULT '',
  `allow_empty` tinyint(3) NOT NULL DEFAULT 0,
  `params` mediumtext DEFAULT NULL,
  `enabled` tinyint(3) NOT NULL DEFAULT 1,
  `filter` tinyint(3) NOT NULL DEFAULT 0,
  `ordering` bigint(20) unsigned NOT NULL DEFAULT 0,
  `created_by` bigint(20) NOT NULL DEFAULT 0,
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` bigint(20) NOT NULL DEFAULT 0,
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__compojoom_customfields_cats`;
CREATE TABLE `#__compojoom_customfields_cats` (
  `compojoom_customfields_id` int(11) NOT NULL,
  `catid` int(11) NOT NULL,
  PRIMARY KEY (`compojoom_customfields_id`,`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__compojoom_multimedia`;
CREATE TABLE `#__compojoom_multimedia` (
  `compojoom_multimedia_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `type_alias` varchar(255) DEFAULT '',
  `title` varchar(1024) NOT NULL,
  `description` text NOT NULL,
  `mangled_filename` varchar(1024) NOT NULL,
  `mime_type` varchar(255) NOT NULL DEFAULT 'application/octet-stream',
  `origin` varchar(40) DEFAULT 'web',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` bigint(20) NOT NULL DEFAULT 0,
  `enabled` tinyint(4) NOT NULL DEFAULT 1,
  `params` text NOT NULL,
  PRIMARY KEY (`compojoom_multimedia_id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__contact_details`;
CREATE TABLE `#__contact_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `alias` varchar(400) binary NOT NULL,
  `con_position` varchar(255) DEFAULT NULL,
  `address` mediumtext DEFAULT NULL,
  `suburb` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postcode` varchar(100) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `misc` longtext DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `default_con` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `published` tinyint(1) NOT NULL DEFAULT 0,
  `checked_out` int(10) unsigned NOT NULL DEFAULT 0,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT 0,
  `params` mediumtext NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `catid` int(11) NOT NULL DEFAULT 0,
  `access` int(10) unsigned NOT NULL DEFAULT 0,
  `mobile` varchar(255) NOT NULL DEFAULT '',
  `webpage` varchar(255) NOT NULL DEFAULT '',
  `sortname1` varchar(255) NOT NULL DEFAULT '',
  `sortname2` varchar(255) NOT NULL DEFAULT '',
  `sortname3` varchar(255) NOT NULL DEFAULT '',
  `language` varchar(7) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT 0,
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT 0,
  `metakey` mediumtext NOT NULL,
  `metadesc` mediumtext NOT NULL,
  `metadata` mediumtext NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT 'Set if article is featured.',
  `xreference` varchar(50) NOT NULL DEFAULT '' COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int(10) unsigned NOT NULL DEFAULT 1,
  `hits` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__content`;
CREATE TABLE `#__content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'FK to the #__assets table.',
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(400) binary NOT NULL DEFAULT '',
  `introtext` longtext NOT NULL,
  `fulltext` longtext NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT 0,
  `catid` int(10) unsigned NOT NULL DEFAULT 0,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT 0,
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT 0,
  `checked_out` int(10) unsigned NOT NULL DEFAULT 0,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` mediumtext NOT NULL,
  `urls` mediumtext NOT NULL,
  `attribs` varchar(5120) NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT 1,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `metakey` mediumtext NOT NULL,
  `metadesc` mediumtext NOT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT 0,
  `hits` int(10) unsigned NOT NULL DEFAULT 0,
  `metadata` mediumtext NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT 'Set if article is featured.',
  `language` char(7) NOT NULL COMMENT 'The language code for the article.',
  `xreference` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`),
  KEY `idx_alias` (`alias`(191))
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__content_frontpage`;
CREATE TABLE `#__content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT 0,
  `ordering` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__content_rating`;
CREATE TABLE `#__content_rating` (
  `content_id` int(11) NOT NULL DEFAULT 0,
  `rating_sum` int(10) unsigned NOT NULL DEFAULT 0,
  `rating_count` int(10) unsigned NOT NULL DEFAULT 0,
  `lastip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__content_types`;
CREATE TABLE `#__content_types` (
  `type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_title` varchar(255) NOT NULL DEFAULT '',
  `type_alias` varchar(400) NOT NULL DEFAULT '',
  `table` varchar(255) NOT NULL DEFAULT '',
  `rules` mediumtext NOT NULL,
  `field_mappings` mediumtext NOT NULL,
  `router` varchar(255) NOT NULL DEFAULT '',
  `content_history_options` varchar(5120) DEFAULT NULL COMMENT 'JSON string for com_contenthistory options',
  PRIMARY KEY (`type_id`),
  KEY `idx_alias` (`type_alias`(100))
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__contentitem_tag_map`;
CREATE TABLE `#__contentitem_tag_map` (
  `type_alias` varchar(255) NOT NULL DEFAULT '',
  `core_content_id` int(10) unsigned NOT NULL COMMENT 'PK from the core content table',
  `content_item_id` int(11) NOT NULL COMMENT 'PK from the content type table',
  `tag_id` int(10) unsigned NOT NULL COMMENT 'PK from the tag table',
  `tag_date` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Date of most recent save for this tag-item',
  `type_id` mediumint(8) NOT NULL COMMENT 'PK from the content_type table',
  UNIQUE KEY `uc_ItemnameTagid` (`type_id`,`content_item_id`,`tag_id`),
  KEY `idx_tag_type` (`tag_id`,`type_id`),
  KEY `idx_date_id` (`tag_date`,`tag_id`),
  KEY `idx_core_content_id` (`core_content_id`)
) ENGINE=InnoDB COMMENT='Maps items from content tables to tags' DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__core_log_searches`;
CREATE TABLE `#__core_log_searches` (
  `search_term` varchar(128) NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__extensions`;
CREATE TABLE `#__extensions` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `package_id` int(11) NOT NULL DEFAULT 0 COMMENT 'Parent package ID for extensions installed as a package.',
  `name` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `element` varchar(100) NOT NULL,
  `folder` varchar(100) NOT NULL,
  `client_id` tinyint(3) NOT NULL,
  `enabled` tinyint(3) NOT NULL DEFAULT 0,
  `access` int(10) unsigned NOT NULL DEFAULT 1,
  `protected` tinyint(3) NOT NULL DEFAULT 0,
  `manifest_cache` mediumtext NOT NULL,
  `params` mediumtext NOT NULL,
  `custom_data` mediumtext NOT NULL,
  `system_data` mediumtext NOT NULL,
  `checked_out` int(10) unsigned NOT NULL DEFAULT 0,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) DEFAULT 0,
  `state` int(11) DEFAULT 0,
  PRIMARY KEY (`extension_id`),
  KEY `element_clientid` (`element`,`client_id`),
  KEY `element_folder_clientid` (`element`,`folder`,`client_id`),
  KEY `extension` (`type`,`element`,`folder`,`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10073 DEFAULT CHARSET=utf8;

INSERT INTO `#__extensions` (`extension_id`, `package_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(1, 0, 'com_mailto', 'component', 'com_mailto', '', 0, 1, 1, 1, '{"name":"com_mailto","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MAILTO_XML_DESCRIPTION","group":"","filename":"mailto"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(2, 0, 'com_wrapper', 'component', 'com_wrapper', '', 0, 1, 1, 1, '{"name":"com_wrapper","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_WRAPPER_XML_DESCRIPTION","group":"","filename":"wrapper"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(3, 0, 'com_admin', 'component', 'com_admin', '', 1, 1, 1, 1, '{"name":"com_admin","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_ADMIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(4, 0, 'com_banners', 'component', 'com_banners', '', 1, 1, 1, 0, '{"name":"com_banners","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_BANNERS_XML_DESCRIPTION","group":"","filename":"banners"}', '{"purchase_type":"3","track_impressions":"0","track_clicks":"0","metakey_prefix":"","save_history":"1","history_limit":10}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(5, 0, 'com_cache', 'component', 'com_cache', '', 1, 1, 1, 1, '{"name":"com_cache","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CACHE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(6, 0, 'com_categories', 'component', 'com_categories', '', 1, 1, 1, 1, '{"name":"com_categories","type":"component","creationDate":"December 2007","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CATEGORIES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(7, 0, 'com_checkin', 'component', 'com_checkin', '', 1, 1, 1, 1, '{"name":"com_checkin","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CHECKIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(8, 0, 'com_contact', 'component', 'com_contact', '', 1, 1, 1, 0, '{"name":"com_contact","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CONTACT_XML_DESCRIPTION","group":"","filename":"contact"}', '{"show_contact_category":"hide","save_history":"1","history_limit":10,"show_contact_list":"0","presentation_style":"sliders","show_name":"1","show_position":"1","show_email":"0","show_street_address":"1","show_suburb":"1","show_state":"1","show_postcode":"1","show_country":"1","show_telephone":"1","show_mobile":"1","show_fax":"1","show_webpage":"1","show_misc":"1","show_image":"1","image":"","allow_vcard":"0","show_articles":"0","show_profile":"0","show_links":"0","linka_name":"","linkb_name":"","linkc_name":"","linkd_name":"","linke_name":"","contact_icons":"0","icon_address":"","icon_email":"","icon_telephone":"","icon_mobile":"","icon_fax":"","icon_misc":"","show_headings":"1","show_position_headings":"1","show_email_headings":"0","show_telephone_headings":"1","show_mobile_headings":"0","show_fax_headings":"0","allow_vcard_headings":"0","show_suburb_headings":"1","show_state_headings":"1","show_country_headings":"1","show_email_form":"1","show_email_copy":"1","banned_email":"","banned_subject":"","banned_text":"","validate_session":"1","custom_reply":"0","redirect":"","show_category_crumb":"0","metakey":"","metadesc":"","robots":"","author":"","rights":"","xreference":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(9, 0, 'com_cpanel', 'component', 'com_cpanel', '', 1, 1, 1, 1, '{"name":"com_cpanel","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CPANEL_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10, 0, 'com_installer', 'component', 'com_installer', '', 1, 1, 1, 1, '{"name":"com_installer","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_INSTALLER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(11, 0, 'com_languages', 'component', 'com_languages', '', 1, 1, 1, 1, '{"name":"com_languages","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_LANGUAGES_XML_DESCRIPTION","group":""}', '{"administrator":"en-GB","site":"en-GB"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(12, 0, 'com_login', 'component', 'com_login', '', 1, 1, 1, 1, '{"name":"com_login","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_LOGIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(13, 0, 'com_media', 'component', 'com_media', '', 1, 1, 0, 1, '{"name":"com_media","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MEDIA_XML_DESCRIPTION","group":"","filename":"media"}', '{"upload_extensions":"bmp,csv,doc,gif,ico,jpg,jpeg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,GIF,ICO,JPG,JPEG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS","upload_maxsize":"10","file_path":"images","image_path":"images","restrict_uploads":"1","allowed_media_usergroup":"3","check_mime":"1","image_extensions":"bmp,gif,jpg,png","ignore_extensions":"","upload_mime":"image\\/jpeg,image\\/gif,image\\/png,image\\/bmp,application\\/x-shockwave-flash,application\\/msword,application\\/excel,application\\/pdf,application\\/powerpoint,text\\/plain,application\\/x-zip","upload_mime_illegal":"text\\/html"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(14, 0, 'com_menus', 'component', 'com_menus', '', 1, 1, 1, 1, '{"name":"com_menus","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MENUS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(15, 0, 'com_messages', 'component', 'com_messages', '', 1, 1, 1, 1, '{"name":"com_messages","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MESSAGES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(16, 0, 'com_modules', 'component', 'com_modules', '', 1, 1, 1, 1, '{"name":"com_modules","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MODULES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(17, 0, 'com_newsfeeds', 'component', 'com_newsfeeds', '', 1, 1, 1, 0, '{"name":"com_newsfeeds","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_NEWSFEEDS_XML_DESCRIPTION","group":"","filename":"newsfeeds"}', '{"newsfeed_layout":"_:default","save_history":"1","history_limit":5,"show_feed_image":"1","show_feed_description":"1","show_item_description":"1","feed_character_count":"0","feed_display_order":"des","float_first":"right","float_second":"right","show_tags":"1","category_layout":"_:default","show_category_title":"1","show_description":"1","show_description_image":"1","maxLevel":"-1","show_empty_categories":"0","show_subcat_desc":"1","show_cat_items":"1","show_cat_tags":"1","show_base_description":"1","maxLevelcat":"-1","show_empty_categories_cat":"0","show_subcat_desc_cat":"1","show_cat_items_cat":"1","filter_field":"1","show_pagination_limit":"1","show_headings":"1","show_articles":"0","show_link":"1","show_pagination":"1","show_pagination_results":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(18, 0, 'com_plugins', 'component', 'com_plugins', '', 1, 1, 1, 1, '{"name":"com_plugins","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_PLUGINS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(19, 0, 'com_search', 'component', 'com_search', '', 1, 1, 1, 0, '{"name":"com_search","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_SEARCH_XML_DESCRIPTION","group":"","filename":"search"}', '{"enabled":"0","show_date":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(20, 0, 'com_templates', 'component', 'com_templates', '', 1, 1, 1, 1, '{"name":"com_templates","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_TEMPLATES_XML_DESCRIPTION","group":""}', '{"template_positions_display":"1","upload_limit":"2","image_formats":"gif,bmp,jpg,jpeg,png","source_formats":"txt,less,ini,xml,js,php,css","font_formats":"woff,ttf,otf","compressed_formats":"zip"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(22, 0, 'com_content', 'component', 'com_content', '', 1, 1, 0, 1, '{"name":"com_content","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CONTENT_XML_DESCRIPTION","group":"","filename":"content"}', '{"article_layout":"_:default","show_title":"1","link_titles":"1","show_intro":"1","show_category":"1","link_category":"1","show_parent_category":"0","link_parent_category":"0","show_author":"1","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"1","show_item_navigation":"1","show_vote":"0","show_readmore":"1","show_readmore_title":"1","readmore_limit":"100","show_icons":"1","show_print_icon":"1","show_email_icon":"1","show_hits":"1","show_noauth":"0","show_publishing_options":"1","show_article_options":"1","save_history":"1","history_limit":10,"show_urls_images_frontend":"0","show_urls_images_backend":"1","targeta":0,"targetb":0,"targetc":0,"float_intro":"left","float_fulltext":"left","category_layout":"_:blog","show_category_title":"0","show_description":"0","show_description_image":"0","maxLevel":"1","show_empty_categories":"0","show_no_articles":"1","show_subcat_desc":"1","show_cat_num_articles":"0","show_base_description":"1","maxLevelcat":"-1","show_empty_categories_cat":"0","show_subcat_desc_cat":"1","show_cat_num_articles_cat":"1","num_leading_articles":"1","num_intro_articles":"4","num_columns":"2","num_links":"4","multi_column_order":"0","show_subcategory_content":"0","show_pagination_limit":"1","filter_field":"hide","show_headings":"1","list_show_date":"0","date_format":"","list_show_hits":"1","list_show_author":"1","orderby_pri":"order","orderby_sec":"rdate","order_date":"published","show_pagination":"2","show_pagination_results":"1","show_feed_link":"1","feed_summary":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(23, 0, 'com_config', 'component', 'com_config', '', 1, 1, 0, 1, '{"name":"com_config","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CONFIG_XML_DESCRIPTION","group":""}', '{"filters":{"1":{"filter_type":"NH","filter_tags":"","filter_attributes":""},"9":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"6":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"7":{"filter_type":"NONE","filter_tags":"","filter_attributes":""},"2":{"filter_type":"NH","filter_tags":"","filter_attributes":""},"3":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"4":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"5":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"8":{"filter_type":"NONE","filter_tags":"","filter_attributes":""}}}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(24, 0, 'com_redirect', 'component', 'com_redirect', '', 1, 1, 0, 1, '{"name":"com_redirect","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_REDIRECT_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(25, 0, 'com_users', 'component', 'com_users', '', 1, 1, 0, 1, '{"name":"com_users","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_USERS_XML_DESCRIPTION","group":"","filename":"users"}', '{"allowUserRegistration":"1","new_usertype":"2","guest_usergroup":"9","sendpassword":"1","useractivation":"1","mail_to_admin":"0","captcha":"","frontend_userparams":"1","site_language":"0","change_login_name":"0","reset_count":"10","reset_time":"1","minimum_length":"4","minimum_integers":"0","minimum_symbols":"0","minimum_uppercase":"0","save_history":"1","history_limit":5,"mailSubjectPrefix":"","mailBodySuffix":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(27, 0, 'com_finder', 'component', 'com_finder', '', 1, 1, 0, 0, '{"name":"com_finder","type":"component","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_FINDER_XML_DESCRIPTION","group":"","filename":"finder"}', '{"show_description":"1","description_length":255,"allow_empty_query":"0","show_url":"1","show_advanced":"1","expand_advanced":"0","show_date_filters":"0","highlight_terms":"1","opensearch_name":"","opensearch_description":"","batch_size":"50","memory_table_limit":30000,"title_multiplier":"1.7","text_multiplier":"0.7","meta_multiplier":"1.2","path_multiplier":"2.0","misc_multiplier":"0.3","stemmer":"snowball"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(28, 0, 'com_joomlaupdate', 'component', 'com_joomlaupdate', '', 1, 1, 0, 1, '{"name":"com_joomlaupdate","type":"component","creationDate":"February 2012","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.6.2","description":"COM_JOOMLAUPDATE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(29, 0, 'com_tags', 'component', 'com_tags', '', 1, 1, 1, 1, '{"name":"com_tags","type":"component","creationDate":"December 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.1.0","description":"COM_TAGS_XML_DESCRIPTION","group":"","filename":"tags"}', '{"tag_layout":"_:default","save_history":"1","history_limit":5,"show_tag_title":"0","tag_list_show_tag_image":"0","tag_list_show_tag_description":"0","tag_list_image":"","show_tag_num_items":"0","tag_list_orderby":"title","tag_list_orderby_direction":"ASC","show_headings":"0","tag_list_show_date":"0","tag_list_show_item_image":"0","tag_list_show_item_description":"0","tag_list_item_maximum_characters":0,"return_any_or_all":"1","include_children":"0","maximum":200,"tag_list_language_filter":"all","tags_layout":"_:default","all_tags_orderby":"title","all_tags_orderby_direction":"ASC","all_tags_show_tag_image":"0","all_tags_show_tag_descripion":"0","all_tags_tag_maximum_characters":20,"all_tags_show_tag_hits":"0","filter_field":"1","show_pagination_limit":"1","show_pagination":"2","show_pagination_results":"1","tag_field_ajax_mode":"1","show_feed_link":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(30, 0, 'com_contenthistory', 'component', 'com_contenthistory', '', 1, 1, 1, 0, '{"name":"com_contenthistory","type":"component","creationDate":"May 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"COM_CONTENTHISTORY_XML_DESCRIPTION","group":"","filename":"contenthistory"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(31, 0, 'com_ajax', 'component', 'com_ajax', '', 1, 1, 1, 1, '{"name":"com_ajax","type":"component","creationDate":"August 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"COM_AJAX_XML_DESCRIPTION","group":"","filename":"ajax"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(32, 0, 'com_postinstall', 'component', 'com_postinstall', '', 1, 1, 1, 1, '{"name":"com_postinstall","type":"component","creationDate":"September 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"COM_POSTINSTALL_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(33, 0, 'com_fields', 'component', 'com_fields', '', 1, 1, 1, 0, '{"name":"com_fields","type":"component","creationDate":"March 2016","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"COM_FIELDS_XML_DESCRIPTION","group":"","filename":"fields"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(34, 0, 'com_associations', 'component', 'com_associations', '', 1, 1, 1, 0, '{"name":"com_associations","type":"component","creationDate":"Januar 2017","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"COM_ASSOCIATIONS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(102, 0, 'LIB_PHPUTF8', 'library', 'phputf8', '', 0, 1, 1, 1, '{"name":"LIB_PHPUTF8","type":"library","creationDate":"2006","author":"Harry Fuecks","copyright":"Copyright various authors","authorEmail":"hfuecks@gmail.com","authorUrl":"http:\\/\\/sourceforge.net\\/projects\\/phputf8","version":"0.5","description":"LIB_PHPUTF8_XML_DESCRIPTION","group":"","filename":"phputf8"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(103, 0, 'LIB_JOOMLA', 'library', 'joomla', '', 0, 1, 1, 1, '{"name":"LIB_JOOMLA","type":"library","creationDate":"2008","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"https:\\/\\/www.joomla.org","version":"13.1","description":"LIB_JOOMLA_XML_DESCRIPTION","group":"","filename":"joomla"}', '{"mediaversion":"ab3f683ece7f962d7fd5aaa7999e84e7"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(104, 0, 'LIB_IDNA', 'library', 'idna_convert', '', 0, 1, 1, 1, '{"name":"LIB_IDNA","type":"library","creationDate":"2004","author":"phlyLabs","copyright":"2004-2011 phlyLabs Berlin, http:\\/\\/phlylabs.de","authorEmail":"phlymail@phlylabs.de","authorUrl":"http:\\/\\/phlylabs.de","version":"0.8.0","description":"LIB_IDNA_XML_DESCRIPTION","group":"","filename":"idna_convert"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(105, 0, 'FOF', 'library', 'fof', '', 0, 1, 1, 1, '{"name":"FOF","type":"library","creationDate":"2015-04-22 13:15:32","author":"Nicholas K. Dionysopoulos \\/ Akeeba Ltd","copyright":"(C)2011-2015 Nicholas K. Dionysopoulos","authorEmail":"nicholas@akeebabackup.com","authorUrl":"https:\\/\\/www.akeebabackup.com","version":"2.4.3","description":"LIB_FOF_XML_DESCRIPTION","group":"","filename":"fof"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(106, 0, 'LIB_PHPASS', 'library', 'phpass', '', 0, 1, 1, 1, '{"name":"LIB_PHPASS","type":"library","creationDate":"2004-2006","author":"Solar Designer","copyright":"","authorEmail":"solar@openwall.com","authorUrl":"http:\\/\\/www.openwall.com\\/phpass\\/","version":"0.3","description":"LIB_PHPASS_XML_DESCRIPTION","group":"","filename":"phpass"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(200, 0, 'mod_articles_archive', 'module', 'mod_articles_archive', '', 0, 1, 1, 0, '{"name":"mod_articles_archive","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_ARCHIVE_XML_DESCRIPTION","group":"","filename":"mod_articles_archive"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(201, 0, 'mod_articles_latest', 'module', 'mod_articles_latest', '', 0, 1, 1, 0, '{"name":"mod_articles_latest","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LATEST_NEWS_XML_DESCRIPTION","group":"","filename":"mod_articles_latest"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(202, 0, 'mod_articles_popular', 'module', 'mod_articles_popular', '', 0, 1, 1, 0, '{"name":"mod_articles_popular","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_POPULAR_XML_DESCRIPTION","group":"","filename":"mod_articles_popular"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(203, 0, 'mod_banners', 'module', 'mod_banners', '', 0, 1, 1, 0, '{"name":"mod_banners","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_BANNERS_XML_DESCRIPTION","group":"","filename":"mod_banners"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(204, 0, 'mod_breadcrumbs', 'module', 'mod_breadcrumbs', '', 0, 1, 1, 1, '{"name":"mod_breadcrumbs","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_BREADCRUMBS_XML_DESCRIPTION","group":"","filename":"mod_breadcrumbs"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(205, 0, 'mod_custom', 'module', 'mod_custom', '', 0, 1, 1, 1, '{"name":"mod_custom","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_CUSTOM_XML_DESCRIPTION","group":"","filename":"mod_custom"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(206, 0, 'mod_feed', 'module', 'mod_feed', '', 0, 1, 1, 0, '{"name":"mod_feed","type":"module","creationDate":"July 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FEED_XML_DESCRIPTION","group":"","filename":"mod_feed"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(207, 0, 'mod_footer', 'module', 'mod_footer', '', 0, 1, 1, 0, '{"name":"mod_footer","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FOOTER_XML_DESCRIPTION","group":"","filename":"mod_footer"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(208, 0, 'mod_login', 'module', 'mod_login', '', 0, 1, 1, 1, '{"name":"mod_login","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LOGIN_XML_DESCRIPTION","group":"","filename":"mod_login"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(209, 0, 'mod_menu', 'module', 'mod_menu', '', 0, 1, 1, 1, '{"name":"mod_menu","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_MENU_XML_DESCRIPTION","group":"","filename":"mod_menu"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(210, 0, 'mod_articles_news', 'module', 'mod_articles_news', '', 0, 1, 1, 0, '{"name":"mod_articles_news","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_NEWS_XML_DESCRIPTION","group":"","filename":"mod_articles_news"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(211, 0, 'mod_random_image', 'module', 'mod_random_image', '', 0, 1, 1, 0, '{"name":"mod_random_image","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_RANDOM_IMAGE_XML_DESCRIPTION","group":"","filename":"mod_random_image"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(212, 0, 'mod_related_items', 'module', 'mod_related_items', '', 0, 1, 1, 0, '{"name":"mod_related_items","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_RELATED_XML_DESCRIPTION","group":"","filename":"mod_related_items"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(213, 0, 'mod_search', 'module', 'mod_search', '', 0, 1, 1, 0, '{"name":"mod_search","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_SEARCH_XML_DESCRIPTION","group":"","filename":"mod_search"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(214, 0, 'mod_stats', 'module', 'mod_stats', '', 0, 1, 1, 0, '{"name":"mod_stats","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_STATS_XML_DESCRIPTION","group":"","filename":"mod_stats"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(215, 0, 'mod_syndicate', 'module', 'mod_syndicate', '', 0, 1, 1, 1, '{"name":"mod_syndicate","type":"module","creationDate":"May 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_SYNDICATE_XML_DESCRIPTION","group":"","filename":"mod_syndicate"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(216, 0, 'mod_users_latest', 'module', 'mod_users_latest', '', 0, 1, 1, 0, '{"name":"mod_users_latest","type":"module","creationDate":"December 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_USERS_LATEST_XML_DESCRIPTION","group":"","filename":"mod_users_latest"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(218, 0, 'mod_whosonline', 'module', 'mod_whosonline', '', 0, 1, 1, 0, '{"name":"mod_whosonline","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_WHOSONLINE_XML_DESCRIPTION","group":"","filename":"mod_whosonline"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(219, 0, 'mod_wrapper', 'module', 'mod_wrapper', '', 0, 1, 1, 0, '{"name":"mod_wrapper","type":"module","creationDate":"October 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_WRAPPER_XML_DESCRIPTION","group":"","filename":"mod_wrapper"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(220, 0, 'mod_articles_category', 'module', 'mod_articles_category', '', 0, 1, 1, 0, '{"name":"mod_articles_category","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_CATEGORY_XML_DESCRIPTION","group":"","filename":"mod_articles_category"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(221, 0, 'mod_articles_categories', 'module', 'mod_articles_categories', '', 0, 1, 1, 0, '{"name":"mod_articles_categories","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_CATEGORIES_XML_DESCRIPTION","group":"","filename":"mod_articles_categories"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(222, 0, 'mod_languages', 'module', 'mod_languages', '', 0, 1, 1, 1, '{"name":"mod_languages","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.5.0","description":"MOD_LANGUAGES_XML_DESCRIPTION","group":"","filename":"mod_languages"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(223, 0, 'mod_finder', 'module', 'mod_finder', '', 0, 1, 0, 0, '{"name":"mod_finder","type":"module","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FINDER_XML_DESCRIPTION","group":"","filename":"mod_finder"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(300, 0, 'mod_custom', 'module', 'mod_custom', '', 1, 1, 1, 1, '{"name":"mod_custom","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_CUSTOM_XML_DESCRIPTION","group":"","filename":"mod_custom"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(301, 0, 'mod_feed', 'module', 'mod_feed', '', 1, 1, 1, 0, '{"name":"mod_feed","type":"module","creationDate":"July 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FEED_XML_DESCRIPTION","group":"","filename":"mod_feed"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(302, 0, 'mod_latest', 'module', 'mod_latest', '', 1, 1, 1, 0, '{"name":"mod_latest","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LATEST_XML_DESCRIPTION","group":"","filename":"mod_latest"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(303, 0, 'mod_logged', 'module', 'mod_logged', '', 1, 1, 1, 0, '{"name":"mod_logged","type":"module","creationDate":"January 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LOGGED_XML_DESCRIPTION","group":"","filename":"mod_logged"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(304, 0, 'mod_login', 'module', 'mod_login', '', 1, 1, 1, 1, '{"name":"mod_login","type":"module","creationDate":"March 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LOGIN_XML_DESCRIPTION","group":"","filename":"mod_login"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(305, 0, 'mod_menu', 'module', 'mod_menu', '', 1, 1, 1, 0, '{"name":"mod_menu","type":"module","creationDate":"March 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_MENU_XML_DESCRIPTION","group":"","filename":"mod_menu"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(307, 0, 'mod_popular', 'module', 'mod_popular', '', 1, 1, 1, 0, '{"name":"mod_popular","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_POPULAR_XML_DESCRIPTION","group":"","filename":"mod_popular"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(308, 0, 'mod_quickicon', 'module', 'mod_quickicon', '', 1, 1, 1, 1, '{"name":"mod_quickicon","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_QUICKICON_XML_DESCRIPTION","group":"","filename":"mod_quickicon"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(309, 0, 'mod_status', 'module', 'mod_status', '', 1, 1, 1, 0, '{"name":"mod_status","type":"module","creationDate":"Feb 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_STATUS_XML_DESCRIPTION","group":"","filename":"mod_status"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(310, 0, 'mod_submenu', 'module', 'mod_submenu', '', 1, 1, 1, 0, '{"name":"mod_submenu","type":"module","creationDate":"Feb 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_SUBMENU_XML_DESCRIPTION","group":"","filename":"mod_submenu"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(311, 0, 'mod_title', 'module', 'mod_title', '', 1, 1, 1, 0, '{"name":"mod_title","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_TITLE_XML_DESCRIPTION","group":"","filename":"mod_title"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(312, 0, 'mod_toolbar', 'module', 'mod_toolbar', '', 1, 1, 1, 1, '{"name":"mod_toolbar","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_TOOLBAR_XML_DESCRIPTION","group":"","filename":"mod_toolbar"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(313, 0, 'mod_multilangstatus', 'module', 'mod_multilangstatus', '', 1, 1, 1, 0, '{"name":"mod_multilangstatus","type":"module","creationDate":"September 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_MULTILANGSTATUS_XML_DESCRIPTION","group":"","filename":"mod_multilangstatus"}', '{"cache":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(314, 0, 'mod_version', 'module', 'mod_version', '', 1, 1, 1, 0, '{"name":"mod_version","type":"module","creationDate":"January 2012","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_VERSION_XML_DESCRIPTION","group":"","filename":"mod_version"}', '{"format":"short","product":"1","cache":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(315, 0, 'mod_stats_admin', 'module', 'mod_stats_admin', '', 1, 1, 1, 0, '{"name":"mod_stats_admin","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_STATS_XML_DESCRIPTION","group":"","filename":"mod_stats_admin"}', '{"serverinfo":"0","siteinfo":"0","counter":"0","increase":"0","cache":"1","cache_time":"900","cachemode":"static"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(316, 0, 'mod_tags_popular', 'module', 'mod_tags_popular', '', 0, 1, 1, 0, '{"name":"mod_tags_popular","type":"module","creationDate":"January 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.1.0","description":"MOD_TAGS_POPULAR_XML_DESCRIPTION","group":"","filename":"mod_tags_popular"}', '{"maximum":"5","timeframe":"alltime","owncache":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(317, 0, 'mod_tags_similar', 'module', 'mod_tags_similar', '', 0, 1, 1, 0, '{"name":"mod_tags_similar","type":"module","creationDate":"January 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.1.0","description":"MOD_TAGS_SIMILAR_XML_DESCRIPTION","group":"","filename":"mod_tags_similar"}', '{"maximum":"5","matchtype":"any","owncache":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(318, 0, 'mod_sampledata', 'module', 'mod_sampledata', '', 1, 1, 1, 0, '{"name":"mod_sampledata","type":"module","creationDate":"July 2017","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.8.0","description":"MOD_SAMPLEDATA_XML_DESCRIPTION","group":"","filename":"mod_sampledata"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(400, 0, 'plg_authentication_gmail', 'plugin', 'gmail', 'authentication', 0, 0, 1, 0, '{"name":"plg_authentication_gmail","type":"plugin","creationDate":"February 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_GMAIL_XML_DESCRIPTION","group":"","filename":"gmail"}', '{"applysuffix":"0","suffix":"","verifypeer":"1","user_blacklist":""}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(401, 0, 'plg_authentication_joomla', 'plugin', 'joomla', 'authentication', 0, 1, 1, 1, '{"name":"plg_authentication_joomla","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_AUTH_JOOMLA_XML_DESCRIPTION","group":"","filename":"joomla"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(402, 0, 'plg_authentication_ldap', 'plugin', 'ldap', 'authentication', 0, 0, 1, 0, '{"name":"plg_authentication_ldap","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_LDAP_XML_DESCRIPTION","group":"","filename":"ldap"}', '{"host":"","port":"389","use_ldapV3":"0","negotiate_tls":"0","no_referrals":"0","auth_method":"bind","base_dn":"","search_string":"","users_dn":"","username":"admin","password":"bobby7","ldap_fullname":"fullName","ldap_email":"mail","ldap_uid":"uid"}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(403, 0, 'plg_content_contact', 'plugin', 'contact', 'content', 0, 1, 1, 0, '{"name":"plg_content_contact","type":"plugin","creationDate":"January 2014","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.2","description":"PLG_CONTENT_CONTACT_XML_DESCRIPTION","group":"","filename":"contact"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(404, 0, 'plg_content_emailcloak', 'plugin', 'emailcloak', 'content', 0, 1, 1, 0, '{"name":"plg_content_emailcloak","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_EMAILCLOAK_XML_DESCRIPTION","group":"","filename":"emailcloak"}', '{"mode":"1"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(406, 0, 'plg_content_loadmodule', 'plugin', 'loadmodule', 'content', 0, 1, 1, 0, '{"name":"plg_content_loadmodule","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_LOADMODULE_XML_DESCRIPTION","group":"","filename":"loadmodule"}', '{"style":"xhtml"}', '', '', 0, '2011-09-18 15:22:50', 0, 0),
(407, 0, 'plg_content_pagebreak', 'plugin', 'pagebreak', 'content', 0, 1, 1, 0, '{"name":"plg_content_pagebreak","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_PAGEBREAK_XML_DESCRIPTION","group":"","filename":"pagebreak"}', '{"title":"1","multipage_toc":"1","showall":"1"}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(408, 0, 'plg_content_pagenavigation', 'plugin', 'pagenavigation', 'content', 0, 1, 1, 0, '{"name":"plg_content_pagenavigation","type":"plugin","creationDate":"January 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_PAGENAVIGATION_XML_DESCRIPTION","group":"","filename":"pagenavigation"}', '{"position":"1"}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(409, 0, 'plg_content_vote', 'plugin', 'vote', 'content', 0, 1, 1, 0, '{"name":"plg_content_vote","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_VOTE_XML_DESCRIPTION","group":"","filename":"vote"}', '', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(410, 0, 'plg_editors_codemirror', 'plugin', 'codemirror', 'editors', 0, 1, 1, 1, '{"name":"plg_editors_codemirror","type":"plugin","creationDate":"28 March 2011","author":"Marijn Haverbeke","copyright":"Copyright (C) 2014 - 2017 by Marijn Haverbeke <marijnh@gmail.com> and others","authorEmail":"marijnh@gmail.com","authorUrl":"http:\\/\\/codemirror.net\\/","version":"5.38.0","description":"PLG_CODEMIRROR_XML_DESCRIPTION","group":"","filename":"codemirror"}', '{"lineNumbers":"1","lineWrapping":"1","matchTags":"1","matchBrackets":"1","marker-gutter":"1","autoCloseTags":"1","autoCloseBrackets":"1","autoFocus":"1","theme":"default","tabmode":"indent"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(411, 0, 'plg_editors_none', 'plugin', 'none', 'editors', 0, 1, 1, 1, '{"name":"plg_editors_none","type":"plugin","creationDate":"September 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_NONE_XML_DESCRIPTION","group":"","filename":"none"}', '', '', '', 0, '0000-00-00 00:00:00', 2, 0);
INSERT INTO `#__extensions` (`extension_id`, `package_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(412, 0, 'plg_editors_tinymce', 'plugin', 'tinymce', 'editors', 0, 1, 1, 0, '{"name":"plg_editors_tinymce","type":"plugin","creationDate":"2005-2017","author":"Ephox Corporation","copyright":"Ephox Corporation","authorEmail":"N\\/A","authorUrl":"http:\\/\\/www.tinymce.com","version":"4.5.8","description":"PLG_TINY_XML_DESCRIPTION","group":"","filename":"tinymce"}', '{"configuration":{"toolbars":{"2":{"toolbar1":["bold","underline","strikethrough","|","undo","redo","|","bullist","numlist","|","pastetext"]},"1":{"menu":["edit","insert","view","format","table","tools"],"toolbar1":["bold","italic","underline","strikethrough","|","alignleft","aligncenter","alignright","alignjustify","|","formatselect","|","bullist","numlist","|","outdent","indent","|","undo","redo","|","link","unlink","anchor","code","|","hr","table","|","subscript","superscript","|","charmap","pastetext","preview"]},"0":{"menu":["edit","insert","view","format","table","tools"],"toolbar1":["bold","italic","underline","strikethrough","|","alignleft","aligncenter","alignright","alignjustify","|","styleselect","|","formatselect","fontselect","fontsizeselect","|","searchreplace","|","bullist","numlist","|","outdent","indent","|","undo","redo","|","link","unlink","anchor","image","|","code","|","forecolor","backcolor","|","fullscreen","|","table","|","subscript","superscript","|","charmap","emoticons","media","hr","ltr","rtl","|","cut","copy","paste","pastetext","|","visualchars","visualblocks","nonbreaking","blockquote","template","|","print","preview","codesample","insertdatetime","removeformat"]}},"setoptions":{"2":{"access":["1"],"skin":"0","skin_admin":"0","mobile":"0","drag_drop":"1","path":"","entity_encoding":"raw","lang_mode":"1","text_direction":"ltr","content_css":"1","content_css_custom":"","relative_urls":"1","newlines":"0","use_config_textfilters":"0","invalid_elements":"script,applet,iframe","valid_elements":"","extended_elements":"","resizing":"1","resize_horizontal":"1","element_path":"1","wordcount":"1","image_advtab":"1","advlist":"1","autosave":"1","contextmenu":"1","custom_plugin":"","custom_button":""},"1":{"access":["6","2"],"skin":"0","skin_admin":"0","mobile":"0","drag_drop":"1","path":"","entity_encoding":"raw","lang_mode":"1","text_direction":"ltr","content_css":"1","content_css_custom":"","relative_urls":"1","newlines":"0","use_config_textfilters":"0","invalid_elements":"script,applet,iframe","valid_elements":"","extended_elements":"","resizing":"1","resize_horizontal":"1","element_path":"1","wordcount":"1","image_advtab":"1","advlist":"1","autosave":"1","contextmenu":"1","custom_plugin":"","custom_button":""},"0":{"access":["7","4","8"],"skin":"0","skin_admin":"0","mobile":"0","drag_drop":"1","path":"","entity_encoding":"raw","lang_mode":"1","text_direction":"ltr","content_css":"1","content_css_custom":"","relative_urls":"1","newlines":"0","use_config_textfilters":"0","invalid_elements":"script,applet,iframe","valid_elements":"","extended_elements":"","resizing":"1","resize_horizontal":"1","element_path":"1","wordcount":"1","image_advtab":"1","advlist":"1","autosave":"1","contextmenu":"1","custom_plugin":"","custom_button":""}}},"sets_amount":3,"html_height":"550","html_width":"750"}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(413, 0, 'plg_editors-xtd_article', 'plugin', 'article', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_article","type":"plugin","creationDate":"October 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_ARTICLE_XML_DESCRIPTION","group":"","filename":"article"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(414, 0, 'plg_editors-xtd_image', 'plugin', 'image', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_image","type":"plugin","creationDate":"August 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_IMAGE_XML_DESCRIPTION","group":"","filename":"image"}', '', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(415, 0, 'plg_editors-xtd_pagebreak', 'plugin', 'pagebreak', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_pagebreak","type":"plugin","creationDate":"August 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_EDITORSXTD_PAGEBREAK_XML_DESCRIPTION","group":"","filename":"pagebreak"}', '', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(416, 0, 'plg_editors-xtd_readmore', 'plugin', 'readmore', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_readmore","type":"plugin","creationDate":"March 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_READMORE_XML_DESCRIPTION","group":"","filename":"readmore"}', '', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(417, 0, 'plg_search_categories', 'plugin', 'categories', 'search', 0, 1, 1, 0, '{"name":"plg_search_categories","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_CATEGORIES_XML_DESCRIPTION","group":"","filename":"categories"}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(418, 0, 'plg_search_contacts', 'plugin', 'contacts', 'search', 0, 1, 1, 0, '{"name":"plg_search_contacts","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_CONTACTS_XML_DESCRIPTION","group":"","filename":"contacts"}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(419, 0, 'plg_search_content', 'plugin', 'content', 'search', 0, 1, 1, 0, '{"name":"plg_search_content","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_CONTENT_XML_DESCRIPTION","group":"","filename":"content"}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(420, 0, 'plg_search_newsfeeds', 'plugin', 'newsfeeds', 'search', 0, 1, 1, 0, '{"name":"plg_search_newsfeeds","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_NEWSFEEDS_XML_DESCRIPTION","group":"","filename":"newsfeeds"}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(422, 0, 'plg_system_languagefilter', 'plugin', 'languagefilter', 'system', 0, 0, 1, 1, '{"name":"plg_system_languagefilter","type":"plugin","creationDate":"July 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_LANGUAGEFILTER_XML_DESCRIPTION","group":"","filename":"languagefilter"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(423, 0, 'plg_system_p3p', 'plugin', 'p3p', 'system', 0, 0, 1, 0, '{"name":"plg_system_p3p","type":"plugin","creationDate":"September 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_P3P_XML_DESCRIPTION","group":"","filename":"p3p"}', '{"headers":"NOI ADM DEV PSAi COM NAV OUR OTRo STP IND DEM"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(424, 0, 'plg_system_cache', 'plugin', 'cache', 'system', 0, 0, 1, 1, '{"name":"plg_system_cache","type":"plugin","creationDate":"February 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CACHE_XML_DESCRIPTION","group":"","filename":"cache"}', '{"browsercache":"0","cachetime":"15"}', '', '', 0, '0000-00-00 00:00:00', 9, 0),
(425, 0, 'plg_system_debug', 'plugin', 'debug', 'system', 0, 1, 1, 0, '{"name":"plg_system_debug","type":"plugin","creationDate":"December 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_DEBUG_XML_DESCRIPTION","group":"","filename":"debug"}', '{"profile":"1","queries":"1","memory":"1","language_files":"1","language_strings":"1","strip-first":"1","strip-prefix":"","strip-suffix":""}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(426, 0, 'plg_system_log', 'plugin', 'log', 'system', 0, 1, 1, 1, '{"name":"plg_system_log","type":"plugin","creationDate":"April 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_LOG_XML_DESCRIPTION","group":"","filename":"log"}', '', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(427, 0, 'plg_system_redirect', 'plugin', 'redirect', 'system', 0, 0, 1, 1, '{"name":"plg_system_redirect","type":"plugin","creationDate":"April 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_REDIRECT_XML_DESCRIPTION","group":"","filename":"redirect"}', '', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(428, 0, 'plg_system_remember', 'plugin', 'remember', 'system', 0, 1, 1, 1, '{"name":"plg_system_remember","type":"plugin","creationDate":"April 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_REMEMBER_XML_DESCRIPTION","group":"","filename":"remember"}', '', '', '', 0, '0000-00-00 00:00:00', 7, 0),
(429, 0, 'plg_system_sef', 'plugin', 'sef', 'system', 0, 1, 1, 0, '{"name":"plg_system_sef","type":"plugin","creationDate":"December 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEF_XML_DESCRIPTION","group":"","filename":"sef"}', '', '', '', 0, '0000-00-00 00:00:00', 8, 0),
(430, 0, 'plg_system_logout', 'plugin', 'logout', 'system', 0, 1, 1, 1, '{"name":"plg_system_logout","type":"plugin","creationDate":"April 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_LOGOUT_XML_DESCRIPTION","group":"","filename":"logout"}', '', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(431, 0, 'plg_user_contactcreator', 'plugin', 'contactcreator', 'user', 0, 0, 1, 0, '{"name":"plg_user_contactcreator","type":"plugin","creationDate":"August 2009","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTACTCREATOR_XML_DESCRIPTION","group":"","filename":"contactcreator"}', '{"autowebpage":"","category":"34","autopublish":"0"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(432, 0, 'plg_user_joomla', 'plugin', 'joomla', 'user', 0, 1, 1, 0, '{"name":"plg_user_joomla","type":"plugin","creationDate":"December 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_USER_JOOMLA_XML_DESCRIPTION","group":"","filename":"joomla"}', '{"autoregister":"1","mail_to_user":"1","forceLogout":"1"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(433, 0, 'plg_user_profile', 'plugin', 'profile', 'user', 0, 0, 1, 0, '{"name":"plg_user_profile","type":"plugin","creationDate":"January 2008","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_USER_PROFILE_XML_DESCRIPTION","group":"","filename":"profile"}', '{"register-require_address1":"1","register-require_address2":"1","register-require_city":"1","register-require_region":"1","register-require_country":"1","register-require_postal_code":"1","register-require_phone":"1","register-require_website":"1","register-require_favoritebook":"1","register-require_aboutme":"1","register-require_tos":"1","register-require_dob":"1","profile-require_address1":"1","profile-require_address2":"1","profile-require_city":"1","profile-require_region":"1","profile-require_country":"1","profile-require_postal_code":"1","profile-require_phone":"1","profile-require_website":"1","profile-require_favoritebook":"1","profile-require_aboutme":"1","profile-require_tos":"1","profile-require_dob":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(434, 0, 'plg_extension_joomla', 'plugin', 'joomla', 'extension', 0, 1, 1, 1, '{"name":"plg_extension_joomla","type":"plugin","creationDate":"May 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_EXTENSION_JOOMLA_XML_DESCRIPTION","group":"","filename":"joomla"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(435, 0, 'plg_content_joomla', 'plugin', 'joomla', 'content', 0, 1, 1, 0, '{"name":"plg_content_joomla","type":"plugin","creationDate":"November 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_JOOMLA_XML_DESCRIPTION","group":"","filename":"joomla"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(436, 0, 'plg_system_languagecode', 'plugin', 'languagecode', 'system', 0, 0, 1, 0, '{"name":"plg_system_languagecode","type":"plugin","creationDate":"November 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_LANGUAGECODE_XML_DESCRIPTION","group":"","filename":"languagecode"}', '', '', '', 0, '0000-00-00 00:00:00', 10, 0),
(437, 0, 'plg_quickicon_joomlaupdate', 'plugin', 'joomlaupdate', 'quickicon', 0, 1, 1, 1, '{"name":"plg_quickicon_joomlaupdate","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_QUICKICON_JOOMLAUPDATE_XML_DESCRIPTION","group":"","filename":"joomlaupdate"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(438, 0, 'plg_quickicon_extensionupdate', 'plugin', 'extensionupdate', 'quickicon', 0, 1, 1, 1, '{"name":"plg_quickicon_extensionupdate","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_QUICKICON_EXTENSIONUPDATE_XML_DESCRIPTION","group":"","filename":"extensionupdate"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(439, 0, 'plg_captcha_recaptcha', 'plugin', 'recaptcha', 'captcha', 0, 1, 1, 0, '{"name":"plg_captcha_recaptcha","type":"plugin","creationDate":"December 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.4.0","description":"PLG_CAPTCHA_RECAPTCHA_XML_DESCRIPTION","group":"","filename":"recaptcha"}', '{"version":"2.0","public_key":"6LfOvwITAAAAAK24rzNMsrwo6m-nAVVf4Rdqr-FH","private_key":"6LfOvwITAAAAADQj3vVK4uhW1CFVIsHnpRSZ1QnF","theme":"clean","theme2":"light"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(440, 0, 'plg_system_highlight', 'plugin', 'highlight', 'system', 0, 1, 1, 0, '{"name":"plg_system_highlight","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_HIGHLIGHT_XML_DESCRIPTION","group":"","filename":"highlight"}', '', '', '', 0, '0000-00-00 00:00:00', 7, 0),
(441, 0, 'plg_content_finder', 'plugin', 'finder', 'content', 0, 0, 1, 0, '{"name":"plg_content_finder","type":"plugin","creationDate":"December 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_FINDER_XML_DESCRIPTION","group":"","filename":"finder"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(442, 0, 'plg_finder_categories', 'plugin', 'categories', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_categories","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_CATEGORIES_XML_DESCRIPTION","group":"","filename":"categories"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(443, 0, 'plg_finder_contacts', 'plugin', 'contacts', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_contacts","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_CONTACTS_XML_DESCRIPTION","group":"","filename":"contacts"}', '', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(444, 0, 'plg_finder_content', 'plugin', 'content', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_content","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_CONTENT_XML_DESCRIPTION","group":"","filename":"content"}', '', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(445, 0, 'plg_finder_newsfeeds', 'plugin', 'newsfeeds', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_newsfeeds","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_NEWSFEEDS_XML_DESCRIPTION","group":"","filename":"newsfeeds"}', '', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(447, 0, 'plg_finder_tags', 'plugin', 'tags', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_tags","type":"plugin","creationDate":"February 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_TAGS_XML_DESCRIPTION","group":"","filename":"tags"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(448, 0, 'plg_twofactorauth_totp', 'plugin', 'totp', 'twofactorauth', 0, 0, 1, 0, '{"name":"plg_twofactorauth_totp","type":"plugin","creationDate":"August 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"PLG_TWOFACTORAUTH_TOTP_XML_DESCRIPTION","group":"","filename":"totp"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(449, 0, 'plg_authentication_cookie', 'plugin', 'cookie', 'authentication', 0, 1, 1, 0, '{"name":"plg_authentication_cookie","type":"plugin","creationDate":"July 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_AUTH_COOKIE_XML_DESCRIPTION","group":"","filename":"cookie"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(450, 0, 'plg_twofactorauth_yubikey', 'plugin', 'yubikey', 'twofactorauth', 0, 0, 1, 0, '{"name":"plg_twofactorauth_yubikey","type":"plugin","creationDate":"September 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"PLG_TWOFACTORAUTH_YUBIKEY_XML_DESCRIPTION","group":"","filename":"yubikey"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(451, 0, 'plg_search_tags', 'plugin', 'tags', 'search', 0, 1, 1, 0, '{"name":"plg_search_tags","type":"plugin","creationDate":"March 2014","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_TAGS_XML_DESCRIPTION","group":"","filename":"tags"}', '{"search_limit":"50","show_tagged_items":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(452, 0, 'plg_system_updatenotification', 'plugin', 'updatenotification', 'system', 0, 1, 1, 0, '{"name":"plg_system_updatenotification","type":"plugin","creationDate":"May 2015","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.5.0","description":"PLG_SYSTEM_UPDATENOTIFICATION_XML_DESCRIPTION","group":"","filename":"updatenotification"}', '{"lastrun":1536809942}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(453, 0, 'plg_editors-xtd_module', 'plugin', 'module', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_module","type":"plugin","creationDate":"October 2015","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.5.0","description":"PLG_MODULE_XML_DESCRIPTION","group":"","filename":"module"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(454, 0, 'plg_system_stats', 'plugin', 'stats', 'system', 0, 1, 1, 0, '{"name":"plg_system_stats","type":"plugin","creationDate":"November 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.5.0","description":"PLG_SYSTEM_STATS_XML_DESCRIPTION","group":"","filename":"stats"}', '{"mode":1,"lastrun":1536810530,"unique_id":"215de700739ae3685a9350b424d361a5c9fc2151","interval":12}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(455, 0, 'plg_installer_packageinstaller', 'plugin', 'packageinstaller', 'installer', 0, 1, 1, 1, '{"name":"plg_installer_packageinstaller","type":"plugin","creationDate":"May 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.6.0","description":"PLG_INSTALLER_PACKAGEINSTALLER_PLUGIN_XML_DESCRIPTION","group":"","filename":"packageinstaller"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(456, 0, 'PLG_INSTALLER_FOLDERINSTALLER', 'plugin', 'folderinstaller', 'installer', 0, 1, 1, 1, '{"name":"PLG_INSTALLER_FOLDERINSTALLER","type":"plugin","creationDate":"May 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.6.0","description":"PLG_INSTALLER_FOLDERINSTALLER_PLUGIN_XML_DESCRIPTION","group":"","filename":"folderinstaller"}', '', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(457, 0, 'PLG_INSTALLER_URLINSTALLER', 'plugin', 'urlinstaller', 'installer', 0, 1, 1, 1, '{"name":"PLG_INSTALLER_URLINSTALLER","type":"plugin","creationDate":"May 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.6.0","description":"PLG_INSTALLER_URLINSTALLER_PLUGIN_XML_DESCRIPTION","group":"","filename":"urlinstaller"}', '', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(458, 0, 'plg_quickicon_phpversioncheck', 'plugin', 'phpversioncheck', 'quickicon', 0, 1, 1, 1, '{"name":"plg_quickicon_phpversioncheck","type":"plugin","creationDate":"August 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_QUICKICON_PHPVERSIONCHECK_XML_DESCRIPTION","group":"","filename":"phpversioncheck"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(459, 0, 'plg_editors-xtd_menu', 'plugin', 'menu', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_menu","type":"plugin","creationDate":"August 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_EDITORS-XTD_MENU_XML_DESCRIPTION","group":"","filename":"menu"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(460, 0, 'plg_editors-xtd_contact', 'plugin', 'contact', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_contact","type":"plugin","creationDate":"October 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_EDITORS-XTD_CONTACT_XML_DESCRIPTION","group":"","filename":"contact"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(461, 0, 'plg_system_fields', 'plugin', 'fields', 'system', 0, 1, 1, 0, '{"name":"plg_system_fields","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_SYSTEM_FIELDS_XML_DESCRIPTION","group":"","filename":"fields"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(462, 0, 'plg_fields_calendar', 'plugin', 'calendar', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_calendar","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_CALENDAR_XML_DESCRIPTION","group":"","filename":"calendar"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(463, 0, 'plg_fields_checkboxes', 'plugin', 'checkboxes', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_checkboxes","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_CHECKBOXES_XML_DESCRIPTION","group":"","filename":"checkboxes"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(464, 0, 'plg_fields_color', 'plugin', 'color', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_color","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_COLOR_XML_DESCRIPTION","group":"","filename":"color"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(465, 0, 'plg_fields_editor', 'plugin', 'editor', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_editor","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_EDITOR_XML_DESCRIPTION","group":"","filename":"editor"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(466, 0, 'plg_fields_imagelist', 'plugin', 'imagelist', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_imagelist","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_IMAGELIST_XML_DESCRIPTION","group":"","filename":"imagelist"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(467, 0, 'plg_fields_integer', 'plugin', 'integer', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_integer","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_INTEGER_XML_DESCRIPTION","group":"","filename":"integer"}', '{"multiple":"0","first":"1","last":"100","step":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(468, 0, 'plg_fields_list', 'plugin', 'list', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_list","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_LIST_XML_DESCRIPTION","group":"","filename":"list"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(469, 0, 'plg_fields_media', 'plugin', 'media', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_media","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_MEDIA_XML_DESCRIPTION","group":"","filename":"media"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(470, 0, 'plg_fields_radio', 'plugin', 'radio', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_radio","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_RADIO_XML_DESCRIPTION","group":"","filename":"radio"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(471, 0, 'plg_fields_sql', 'plugin', 'sql', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_sql","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_SQL_XML_DESCRIPTION","group":"","filename":"sql"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(472, 0, 'plg_fields_text', 'plugin', 'text', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_text","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_TEXT_XML_DESCRIPTION","group":"","filename":"text"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(473, 0, 'plg_fields_textarea', 'plugin', 'textarea', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_textarea","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_TEXTAREA_XML_DESCRIPTION","group":"","filename":"textarea"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(474, 0, 'plg_fields_url', 'plugin', 'url', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_url","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_URL_XML_DESCRIPTION","group":"","filename":"url"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(475, 0, 'plg_fields_user', 'plugin', 'user', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_user","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_USER_XML_DESCRIPTION","group":"","filename":"user"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(476, 0, 'plg_fields_usergrouplist', 'plugin', 'usergrouplist', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_usergrouplist","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_USERGROUPLIST_XML_DESCRIPTION","group":"","filename":"usergrouplist"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(477, 0, 'plg_content_fields', 'plugin', 'fields', 'content', 0, 1, 1, 0, '{"name":"plg_content_fields","type":"plugin","creationDate":"February 2017","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_CONTENT_FIELDS_XML_DESCRIPTION","group":"","filename":"fields"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(478, 0, 'plg_editors-xtd_fields', 'plugin', 'fields', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_fields","type":"plugin","creationDate":"February 2017","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_EDITORS-XTD_FIELDS_XML_DESCRIPTION","group":"","filename":"fields"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(479, 0, 'plg_sampledata_blog', 'plugin', 'blog', 'sampledata', 0, 0, 1, 0, '{"name":"plg_sampledata_blog","type":"plugin","creationDate":"July 2017","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.8.0","description":"PLG_SAMPLEDATA_BLOG_XML_DESCRIPTION","group":"","filename":"blog"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(480, 0, 'plg_system_sessiongc', 'plugin', 'sessiongc', 'system', 0, 1, 1, 0, '{"name":"plg_system_sessiongc","type":"plugin","creationDate":"February 2018","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.8.6","description":"PLG_SYSTEM_SESSIONGC_XML_DESCRIPTION","group":"","filename":"sessiongc"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(503, 0, 'beez3', 'template', 'beez3', '', 0, 1, 1, 0, '{"name":"beez3","type":"template","creationDate":"25 November 2009","author":"Angie Radtke","copyright":"Copyright (C) 2005 - 2018 Open Source Matters, Inc. All rights reserved.","authorEmail":"a.radtke@derauftritt.de","authorUrl":"http:\\/\\/www.der-auftritt.de","version":"3.1.0","description":"TPL_BEEZ3_XML_DESCRIPTION","group":"","filename":"templateDetails"}', '{"wrapperSmall":"53","wrapperLarge":"72","sitetitle":"","sitedescription":"","navposition":"center","templatecolor":"nature"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(504, 0, 'hathor', 'template', 'hathor', '', 1, 1, 1, 0, '{"name":"hathor","type":"template","creationDate":"May 2010","author":"Andrea Tarr","copyright":"Copyright (C) 2005 - 2018 Open Source Matters, Inc. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"","version":"3.0.0","description":"TPL_HATHOR_XML_DESCRIPTION","group":"","filename":"templateDetails"}', '{"showSiteName":"0","colourChoice":"0","boldText":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(506, 0, 'protostar', 'template', 'protostar', '', 0, 1, 1, 0, '{"name":"protostar","type":"template","creationDate":"4\\/30\\/2012","author":"Kyle Ledbetter","copyright":"Copyright (C) 2005 - 2018 Open Source Matters, Inc. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"","version":"1.0","description":"TPL_PROTOSTAR_XML_DESCRIPTION","group":"","filename":"templateDetails"}', '{"templateColor":"","logoFile":"","googleFont":"1","googleFontName":"Open+Sans","fluidContainer":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(507, 0, 'isis', 'template', 'isis', '', 1, 1, 1, 0, '{"name":"isis","type":"template","creationDate":"3\\/30\\/2012","author":"Kyle Ledbetter","copyright":"Copyright (C) 2005 - 2018 Open Source Matters, Inc. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"","version":"1.0","description":"TPL_ISIS_XML_DESCRIPTION","group":"","filename":"templateDetails"}', '{"templateColor":"","logoFile":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(600, 802, 'English (en-GB)', 'language', 'en-GB', '', 0, 1, 1, 1, '{"name":"English (en-GB)","type":"language","creationDate":"August 2018","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.8.12","description":"en-GB site language","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(601, 802, 'English (en-GB)', 'language', 'en-GB', '', 1, 1, 1, 1, '{"name":"English (en-GB)","type":"language","creationDate":"August 2018","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.8.12","description":"en-GB administrator language","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(700, 0, 'files_joomla', 'file', 'joomla', '', 0, 1, 1, 1, '{"name":"files_joomla","type":"file","creationDate":"August 2018","author":"Joomla! Project","copyright":"(C) 2005 - 2018 Open Source Matters. All rights reserved","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.8.12","description":"FILES_JOOMLA_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(802, 0, 'English (en-GB) Language Pack', 'package', 'pkg_en-GB', '', 0, 1, 1, 1, '{"name":"English (en-GB) Language Pack","type":"package","creationDate":"August 2018","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2018 Open Source Matters, Inc. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.8.12.1","description":"en-GB language pack","group":"","filename":"pkg_en-GB"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10000, 0, 'MOD_JA_ACM', 'module', 'mod_ja_acm', '', 0, 1, 1, 0, '{"name":"MOD_JA_ACM","type":"module","creationDate":"03 July 2015","author":"JoomlArt","copyright":"Copyright \\u00a9 2005 - 2015 JoomlArt.com. All Rights Reserved.","authorEmail":"info@joomlart.com","authorUrl":"www.joomlart.com","version":"2.0.8","description":"\\n\\t\\t\\n\\t\\t<div align=\\"left\\">\\t\\t\\n\\t\\t\\t<div style=\\"background:url(\'http:\\/\\/joomlart.s3.amazonaws.com\\/images\\/userguide\\/ja_templates\\/uber\\/acm-logo.png\') no-repeat top left;padding-left:100px;\\">\\n\\t\\t\\t\\t<h1>JA ACM Module for Joomla 2.5 & 3.4<\\/h1>\\n\\t\\t\\t\\t<div style=\'font-weight: normal\'>\\n\\t\\t\\t\\t\\t<p>JA ACM module (JoomlArt Advanced Custom module) is to help you build content blocks for your Joomla site easily based on pre-made layouts and styles. The content blocks together will build a landing page or a complete site for you. <\\/p>\\n\\t\\t\\t\\t<\\/div>\\n\\t\\t\\t<\\/div>\\n\\t\\t\\t<br \\/>\\n\\t\\t\\t<p>Highlighted features:<\\/p>\\n\\t\\t\\t<div style=\'font-weight: normal\'>\\n\\t\\t\\t\\t<ul>\\n\\t\\t\\t\\t\\t<li style=\\"background:url(\'http:\\/\\/www.joomlart.com\\/templates\\/ja-v4\\/images\\/joomlart\\/icon-checklist.png\') no-repeat left center;padding:10px 0px 10px 20px;\\">12+ block types: At this phase, we round up typical blocks that Uber has to offer. Each block type comes with multiple styles.<\\/li>\\n\\t\\t\\t\\t\\t<li style=\\"background:url(\'http:\\/\\/www.joomlart.com\\/templates\\/ja-v4\\/images\\/joomlart\\/icon-checklist.png\') no-repeat left center;padding:10px 0px 10px 20px;\\">Easy editing & defining your page-specific field sets within each block. Each block has its own LESS file, so you have full control to define your own class and style.<\\/li>\\n\\t\\t\\t\\t\\t<li style=\\"background:url(\'http:\\/\\/www.joomlart.com\\/templates\\/ja-v4\\/images\\/joomlart\\/icon-checklist.png\') no-repeat left center;padding:10px 0px 10px 20px;\\">Content-creator-friendly: completely separate content & design. No longer mixing HTML syntax embedded inside article.<\\/li>\\n\\t\\t\\t\\t\\t<li style=\\"background:url(\'http:\\/\\/www.joomlart.com\\/templates\\/ja-v4\\/images\\/joomlart\\/icon-checklist.png\') no-repeat left center;padding:10px 0px 10px 20px;\\">Allow us to dig deeper into the modular block approach which eases our page management effort.<\\/li>\\n\\t\\t\\t\\t<\\/ul>\\n\\t\\t\\t<\\/div>\\n\\t\\t\\t<br \\/>\\n\\t\\t\\t\\n\\t\\t<\\/div>\\n\\t\\t\\n\\t","group":"","filename":"mod_ja_acm"}', '{"jatools-config":"1","cache":"1","cache_time":"900","cachemode":"itemid"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10001, 0, 'T3 Framework', 'plugin', 't3', 'system', 0, 1, 1, 0, '{"name":"T3 Framework","type":"plugin","creationDate":"Sep 29, 2017","author":"JoomlArt.com","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"info@joomlart.com","authorUrl":"http:\\/\\/www.t3-framework.org","version":"2.7.0","description":"\\n\\t\\n\\t<div align=\\"center\\">\\n\\t\\t<div class=\\"alert alert-success\\" style=\\"background-color:#DFF0D8;border-color:#D6E9C6;color: #468847;padding: 1px 0;\\">\\n\\t\\t\\t\\t<a href=\\"http:\\/\\/t3-framework.org\\/\\"><img src=\\"http:\\/\\/static.joomlart.com\\/images\\/jat3v3-documents\\/message-installation\\/logo.png\\" alt=\\"some_text\\" width=\\"300\\" height=\\"99\\"><\\/a>\\n\\t\\t\\t\\t<h4><a href=\\"http:\\/\\/t3-framework.org\\/\\" title=\\"\\">Home<\\/a> | <a href=\\"http:\\/\\/demo.t3-framework.org\\/\\" title=\\"\\">Demo<\\/a> | <a href=\\"http:\\/\\/t3-framework.org\\/documentation\\" title=\\"\\">Document<\\/a> | <a href=\\"https:\\/\\/github.com\\/t3framework\\/t3\\/blob\\/master\\/CHANGELOG.md\\" title=\\"\\">Changelog<\\/a><\\/h4>\\n\\t\\t<p> <\\/p>\\n\\t\\t<p>Copyright 2004 - 2017 <a href=\'http:\\/\\/www.joomlart.com\\/\' title=\'Visit Joomlart.com!\'>JoomlArt.com<\\/a>.<\\/p>\\n\\t\\t<\\/div>\\n     <style>table.adminform{width: 100%;}<\\/style>\\n\\t <\\/div>\\n\\t\\t\\n\\t","group":"","filename":"t3"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10002, 0, 'ja_directory', 'template', 'ja_directory', '', 0, 1, 1, 0, '{"name":"ja_directory","type":"template","creationDate":"10 Sep 2015","author":"JoomlArt.com","copyright":"Copyright (C), J.O.O.M Solutions Co., Ltd. All Rights Reserved.","authorEmail":"webmaster@joomlart.com","authorUrl":"http:\\/\\/www.t3-framework.org","version":"1.0.1","description":"\\n\\t\\t\\n\\t\\t<div align=\\"center\\">\\n\\t\\t\\t<div class=\\"alert alert-success\\" style=\\"background-color:#DFF0D8;border-color:#D6E9C6;color: #468847;padding: 1px 0;\\">\\n\\t\\t\\t\\t<h3><a href=\\"http:\\/\\/t3-framework.org\\/\\">Responsive Joomla template for Directory - JA Directory<\\/a><\\/h3>\\n\\t\\t\\t\\t<h4><a href=\\"http:\\/\\/ja-directory.demo.joomlart.com\\/\\" title=\\"\\">Demo<\\/a> | <a href=\\"http:\\/\\/www.joomlart.com\\/documentation\\/joomla-templates\\/ja-directory\\" title=\\"\\">Document<\\/a> | <a href=\\"http:\\/\\/pm.joomlart.com\\/browse\\/JADIRECTOR\\" title=\\"\\">Changelog<\\/a><\\/h4>\\n\\t\\t\\t\\t<p>JA Directory is a responsive Joomla 3 template, a wonderful solution for a Directory website. It is built with the new T3 Framework and supports the great K2 component. The search and filter component works in tandem with mapping in JA Directory to bring you our highlight feature.This is thanks to our JA Google Map plugin and JA K2 filter components being seamlessly integrated. The quick filter with directory types helps your users quickly and easily target their searches. Thanks to the excellent T3 framework, the template is powered with manynew web technologies: Bootstrap 3, Font awesome 4, LESS, etc. It supports all Joomla pages with individually customized styles to fit the template design and to help you build you fully functionality Directory Site. <\\/p>\\n\\t\\t\\t\\t<p>The directory Joomla template supports RTL at core.<\\/p>\\n\\t\\t\\t\\t<span style=\\"color:#FF0000\\">Note: T3 blank requires T3 plugin to be installed and enabled.<\\/span><p><\\/p>\\n\\t\\t\\t\\t<p>Copyright 2004 - 2014 <a href=\'http:\\/\\/www.joomlart.com\\/\' title=\'Visit Joomlart.com!\'>JoomlArt.com<\\/a>.<\\/p>\\n\\t\\t\\t<\\/div>\\n\\t\\t\\t<style>table.adminform{width: 100%;}<\\/style>\\n\\t\\t<\\/div>\\n\\t\\t\\n\\t","group":"","filename":"templateDetails"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0);
INSERT INTO `#__extensions` (`extension_id`, `package_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(10010, 0, 'JA Twitter Module', 'module', 'mod_jatwitter', '', 0, 1, 0, 0, '{"name":"JA Twitter Module","type":"module","creationDate":"27 March 2015","author":"Joomlart.com","copyright":"Copyright (C), J.O.O.M Solutions Co., Ltd. All Rights\\n\\t\\tReserved.","authorEmail":"webmaster@joomlart.com","authorUrl":"http:\\/\\/www.joomlart.com","version":"2.6.3","description":"\\n\\t\\n\\t<div align=\\"left\\">\\n\\t\\t<h1><img border=\'0\' alt=\'JA Twitter Module\' src=\'http:\\/\\/asset.joomlart.com\\/images\\/stories\\/extensions\\/drupal\\/jdec_twitter.png?javer=1110040930\' style=\'float: left\'\\/>JA Twitter Module for Joomla! 2.5 & 3.x<\\/h1>\\n\\t\\t<div style=\\"font-weight:normal\\">\\n\\t\\tThis module provides API integration with the Twitter microblogging service to drive more traffic to your site. Tweets from your Twitter account and Friends are displayed neatly.\\n\\t\\t<br\\/><br\\/><br\\/><br\\/>\\n\\t\\t\\n\\t\\t<p style=\\"border:1px solid #F29A3C; padding: 10px 15px; background:#F7E6D4;\\">\\n\\t\\t<strong><span style=\'color: #ff0000;\'>NOTE: update OAuth information to get new version worked!<\\/span><\\/strong><br \\/><br \\/>\\n\\t\\tSince 2013-06-11, Twitter has stopped supporting API v1 and fully moved to API v1.1<br \\/>In API v1.1, Twitter deny non-Authorized request, that means you need to provide the information below to authorize your request.<br \\/>\\n\\t\\t<a target=\\"_blank\\" href=\\"http:\\/\\/www.joomlart.com\\/forums\\/showthread.php?50154-Joomla-1.6-JA-Twitter-Module-Installation-Guide\\">Check how to get OAuth information now<\\/a>\\n\\t\\t<\\/p>\\n\\t\\t\\n\\t\\t<strong><span style=\'color: #ff0000;\'>Usage Ideas:<\\/span><br \\/><\\/strong>\\n\\t\\t<ol>\\n\\t\\t  <li>Easily configure Twitter account, show or hide Friends list, account infomation, and Twitter updates.<\\/li>\\n\\t\\t  <li>Show Twitter account infomation.<\\/li>\\n\\t\\t  <li>Show Twitter friends list.<\\/li>\\n\\t\\t  <li>Display Twitter updates.<\\/li>\\n\\t\\t<\\/ol>\\n\\t\\n\\t\\t<strong><span style=\'color: #ff0000;\'>Upgrade Methods:<\\/span><\\/strong><br\\/>\\n\\t\\t<ol>\\n\\t\\t  <li>You can install new version directly over this version. Uninstallation is not required. <\\/li>\\n\\t\\t  <li>Backup any customized files (i.e. CSS files) before upgrading.<\\/li>\\n\\t\\t<\\/ol>\\n\\t\\n\\t\\t<span style=\'color: #008000;\'><strong>Links:<\\/strong><\\/span><br\\/>\\n\\t\\t<ul>\\n\\t\\t  <li><a target=\\"_blank\\" href=\\"http:\\/\\/www.joomlart.com\\/forums\\/showthread.php?50154-Joomla-1.6-JA-Twitter-Module-Installation-Guide\\">General Userguide<\\/a><\\/li>\\n\\t\\t  <li><a target=\'_blank\' href=\'http:\\/\\/update.joomlart.com\\/#products.list\\/\\/JA%20Twitter%20Module%20for%20Joomla%202.5\\/\'>Updates &amp; Versions<\\/a><\\/li>\\n\\t\\t<\\/ul>\\n\\t\\t<p>Copyright 2004 - 2014 <a href=\'http:\\/\\/www.joomlart.com\\/\' title=\'Visit Joomlart.com!\'>JoomlArt.com<\\/a>.<\\/p>\\n\\t\\t<\\/div>\\n\\t<\\/div>\\n\\t\\n\\t","group":"","filename":"mod_jatwitter"}', '{"consumer_key":"","consumer_secret":"","oauth_access_token":"","oauth_access_token_secret":"","taccount":"JoomlartDemo","use_display_taccount":"0","size_iconaccount":"48","show_tweet":"1","show_limit":"5","show_icon":"1","icon_size":"30","show_username":"1","show_source":"1","showtextheading":"1","headingtext":"My Twitter Updates","use_friends":"0","size_iconfriend":"24","max_friends":"10","showfollowlink":"1","typefollowbutton":"apiconnect","style_of_follow_button":"follow_me-a.png","data-show-count":"false","data-lang":"en","data-width":"","data-align":"left","data-show-screen-name":"false","moduleclass_sfx":"","cache":"1","cache_time":"900"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10011, 0, 'AcyMailing', 'component', 'com_acymailing', '', 1, 1, 0, 0, '{"name":"AcyMailing","type":"component","creationDate":"June 2018","author":"Acyba","copyright":"Copyright (C) 2009-2018 ACYBA SAS - All rights reserved.","authorEmail":"dev@acyba.com","authorUrl":"http:\\/\\/www.acyba.com","version":"5.10.2","description":"Manage your Mailing lists, Newsletters, e-mail marketing campaigns","group":"","filename":"acymailing_j3"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10012, 0, 'AcyMailing : trigger Joomla Content plugins', 'plugin', 'contentplugin', 'acymailing', 0, 0, 1, 0, '{"name":"AcyMailing : trigger Joomla Content plugins","type":"plugin","creationDate":"November 2009","author":"Acyba","copyright":"Copyright (C) 2009-2015 ACYBA SARL - All rights reserved..","authorEmail":"dev@acyba.com","authorUrl":"http:\\/\\/www.acyba.com","version":"3.7.0","description":"This plugin enables you to trigger the content plugin system on AcyMailing. The Joomla Content plugin system has not been developed to be triggered from the backend and so you may have some non compatible plugins, that\'s why this plugin is not enabled by default","group":"","filename":"contentplugin"}', '', '', '', 0, '0000-00-00 00:00:00', 15, 0),
(10013, 0, 'AcyMailing Manage text', 'plugin', 'managetext', 'acymailing', 0, 1, 1, 0, '{"name":"AcyMailing Manage text","type":"plugin","creationDate":"October 2010","author":"Acyba","copyright":"Copyright (C) 2009-2015 ACYBA SARL - All rights reserved..","authorEmail":"dev@acyba.com","authorUrl":"http:\\/\\/www.acyba.com","version":"1.0.0","description":"This plugin enables you to remove some text from your Newsletter or add a signature at the end of all your Newsletters or add\\/remove an e-mail from the queue...","group":"","filename":"managetext"}', '', '', '', 0, '0000-00-00 00:00:00', 10, 0),
(10014, 0, 'AcyMailing Tag : Website links', 'plugin', 'online', 'acymailing', 0, 1, 1, 0, '{"name":"AcyMailing Tag : Website links","type":"plugin","creationDate":"September 2009","author":"Acyba","copyright":"Copyright (C) 2009-2015 ACYBA SARL - All rights reserved..","authorEmail":"dev@acyba.com","authorUrl":"http:\\/\\/www.acyba.com","version":"3.7.0","description":"This plugin enables you to add links in your Newsletter such as \\"read in your browser\\" or \\"forward to a friend\\"","group":"","filename":"online"}', '', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(10015, 0, 'AcyMailing : share on social networks', 'plugin', 'share', 'acymailing', 0, 1, 1, 0, '{"name":"AcyMailing : share on social networks","type":"plugin","creationDate":"August 2010","author":"Acyba","copyright":"Copyright (C) 2009-2015 ACYBA SARL - All rights reserved..","authorEmail":"dev@acyba.com","authorUrl":"http:\\/\\/www.acyba.com","version":"1.0.0","description":"This plugin enables you to add a share icon for social networks","group":"","filename":"share"}', '', '', '', 0, '0000-00-00 00:00:00', 20, 0),
(10016, 0, 'AcyMailing : Statistics Plugin', 'plugin', 'stats', 'acymailing', 0, 1, 1, 0, '{"name":"AcyMailing : Statistics Plugin","type":"plugin","creationDate":"September 2009","author":"Acyba","copyright":"Copyright (C) 2009-2015 ACYBA SARL - All rights reserved..","authorEmail":"dev@acyba.com","authorUrl":"http:\\/\\/www.acyba.com","version":"3.7.0","description":"This plugin is used to handle statistics on any AcyMailing e-mail","group":"","filename":"stats"}', '', '', '', 0, '0000-00-00 00:00:00', 50, 0),
(10017, 0, 'AcyMailing table of contents generator', 'plugin', 'tablecontents', 'acymailing', 0, 1, 1, 0, '{"name":"AcyMailing table of contents generator","type":"plugin","creationDate":"January 2011","author":"Acyba","copyright":"Copyright (C) 2009-2015 ACYBA SARL - All rights reserved..","authorEmail":"dev@acyba.com","authorUrl":"http:\\/\\/www.acyba.com","version":"1.0.0","description":"This plugin enables you to generate table of contents","group":"","filename":"tablecontents"}', '', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(10019, 0, 'AcyMailing Tag : content insertion', 'plugin', 'tagcontent', 'acymailing', 0, 1, 1, 0, '{"name":"AcyMailing Tag : content insertion","type":"plugin","creationDate":"September 2009","author":"Acyba","copyright":"Copyright (C) 2009-2015 ACYBA SARL - All rights reserved..","authorEmail":"dev@acyba.com","authorUrl":"http:\\/\\/www.acyba.com","version":"3.7.0","description":"This AcyMailing plugin enables you to include Joomla Articles in any e-mail sent by AcyMailing","group":"","filename":"tagcontent"}', '', '', '', 0, '0000-00-00 00:00:00', 11, 0),
(10020, 0, 'AcyMailing Tag : Subscriber information', 'plugin', 'tagsubscriber', 'acymailing', 0, 1, 1, 0, '{"name":"AcyMailing Tag : Subscriber information","type":"plugin","creationDate":"mai 2015","author":"Acyba","copyright":"Copyright (C) 2009-2015 ACYBA SARL - All rights reserved..","authorEmail":"dev@acyba.com","authorUrl":"http:\\/\\/www.acyba.com","version":"4.9.3","description":"This plugin enables you to add information of the subscriber in your Newsletter","group":"","filename":"tagsubscriber"}', '', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(10021, 0, 'AcyMailing Tag : Manage the Subscription', 'plugin', 'tagsubscription', 'acymailing', 0, 1, 1, 0, '{"name":"AcyMailing Tag : Manage the Subscription","type":"plugin","creationDate":"mai 2015","author":"Acyba","copyright":"Copyright (C) 2009-2015 ACYBA SARL - All rights reserved..","authorEmail":"dev@acyba.com","authorUrl":"http:\\/\\/www.acyba.com","version":"4.9.3","description":"This plugin enables you to add link to manage the subscription of the user","group":"","filename":"tagsubscription"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(10022, 0, 'AcyMailing Tag : Date / Time', 'plugin', 'tagtime', 'acymailing', 0, 1, 1, 0, '{"name":"AcyMailing Tag : Date \\/ Time","type":"plugin","creationDate":"mai 2015","author":"Acyba","copyright":"Copyright (C) 2009-2015 ACYBA SARL - All rights reserved..","authorEmail":"dev@acyba.com","authorUrl":"http:\\/\\/www.acyba.com","version":"4.9.3","description":"This plugin enables you to add time or date in your Newsletter","group":"","filename":"tagtime"}', '', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(10023, 0, 'AcyMailing Tag : Joomla User Information', 'plugin', 'taguser', 'acymailing', 0, 1, 1, 0, '{"name":"AcyMailing Tag : Joomla User Information","type":"plugin","creationDate":"mai 2015","author":"Acyba","copyright":"Copyright (C) 2009-2015 ACYBA SARL - All rights reserved..","authorEmail":"dev@acyba.com","authorUrl":"http:\\/\\/www.acyba.com","version":"4.9.3","description":"This plugin enables you to add informations of the Joomla user in the Newsletter","group":"","filename":"taguser"}', '', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(10024, 0, 'AcyMailing Template Class Replacer', 'plugin', 'template', 'acymailing', 0, 1, 1, 0, '{"name":"AcyMailing Template Class Replacer","type":"plugin","creationDate":"mai 2015","author":"Acyba","copyright":"Copyright (C) 2009-2015 ACYBA SARL - All rights reserved.","authorEmail":"dev@acyba.com","authorUrl":"http:\\/\\/www.acyba.com","version":"4.9.3","description":"This plugin enables AcyMailing to replace CSS class in each email","group":"","filename":"template"}', '', '', '', 0, '0000-00-00 00:00:00', 52, 0),
(10025, 0, 'AcyMailing Editor', 'plugin', 'acyeditor', 'editors', 0, 1, 1, 0, '{"name":"AcyMailing Editor","type":"plugin","creationDate":"mai 2015","author":"Acyba","copyright":"Copyright (C) 2009-2015 ACYBA SARL - All rights reserved.","authorEmail":"dev@acyba.com","authorUrl":"http:\\/\\/www.acyba.com","version":"4.9.3","description":"This editor will make your life easier when writing Newsletters with AcyMailing","group":"","filename":"acyeditor"}', '', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(10026, 0, 'AcyMailing : (auto)Subscribe during Joomla registration', 'plugin', 'regacymailing', 'system', 0, 1, 1, 0, '{"name":"AcyMailing : (auto)Subscribe during Joomla registration","type":"plugin","creationDate":"mai 2015","author":"Acyba","copyright":"Copyright (C) 2009-2015 ACYBA SARL - All rights reserved.","authorEmail":"dev@acyba.com","authorUrl":"http:\\/\\/www.acyba.com","version":"4.9.3","description":"Automatically subscribe the user to AcyMailing during the Joomla registration process","group":"","filename":"regacymailing"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10027, 0, 'AcyMailing Module', 'module', 'mod_acymailing', '', 0, 1, 1, 0, '{"name":"AcyMailing Module","type":"module","creationDate":"September 2009","author":"Acyba","copyright":"Copyright (C) 2009-2015 ACYBA SARL - All rights reserved..","authorEmail":"dev@acyba.com","authorUrl":"http:\\/\\/www.acyba.com","version":"3.7.0","description":"Subscribe \\/ Unsubscribe Module for AcyMailing","group":"","filename":"mod_acymailing"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10028, 0, 'JA Masshead', 'module', 'mod_jamasshead', '', 0, 1, 1, 0, '{"name":"JA Masshead","type":"module","creationDate":"27 March 2015","author":"JoomlArt.com","copyright":"J.O.O.M Solutions Co., Ltd.","authorEmail":"webmaster@joomlart.com","authorUrl":"www.joomlart.com","version":"2.6.1","description":"\\n\\t\\t\\n\\t\\t<div align=\\"left\\">\\t\\t\\n\\t\\t\\t<h1>JA Masshead Module for Joomla 2.5 & 3.3<\\/h1>\\n\\t\\t\\t<div style=\'font-weight: normal\'>\\n\\t\\t\\t<p>Please refer to the backend settings of the demo template quickstart for usage examples and also refer to <a target=\'_blank\' href=\'http:\\/\\/www.joomlart.com\\/forums\\/showthread.php?64198\'>General Userguide<\\/a> for details.<\\/strong><\\/p>\\n\\t\\t\\t<p><span style=\'color: #ff6600;\'><strong>Features:<\\/strong><\\/span><\\/p>\\n\\t\\t\\tJA Masshead Module displays masshead title like the JoomlArt masshead. Title and description can be specifically configured for any pages.\\n\\t\\t\\t<p><strong><span style=\'color: #ff0000;\'>Usage Instruction:<\\/span><br \\/><\\/strong><\\/p>\\n\\t\\t\\t<strong>The configuration field use 2 formats:<\\/strong> <br \\/>\\n\\t\\t\\t\\t<ul>\\n\\t\\t\\t\\t\\t<li>Format 1: <code>[Masshead option=\\"com_name\\" view=\\"view_name\\" layout=\\"layout_name\\" task=\\"task_name\\" id=\\"id\\" title=\\"Title\\" ]Description here[\\/Masshead]<\\/code><\\/li>\\n      \\t\\t\\t\\t<li>Format 2: <code>[Masshead Itemid=\\"page_id_1,page_id_2,...\\" title=\\"Title\\" ]Description here[\\/Masshead]<\\/code><\\/li>\\n\\t\\t\\t\\t<\\/ul>\\n\\t\\t\\t<br \\/>\\n\\t\\t\\t<strong>If configuration field is empty:<\\/strong>\\t\\n\\t\\t\\t\\t<ul>\\n\\t\\t\\t\\t\\t<li>If this is an article view: use the Article title as Masshead title, Article metadesc as masshead description<\\/li>\\n      \\t\\t\\t\\t<li>If not: use the Page title as Mass title.<\\/li>\\n      \\t\\t\\t\\t<li>If no value for Title & Description, use default value.<\\/li>\\n\\t\\t\\t\\t<\\/ul>\\n\\t\\t\\t<br \\/>\\t\\n\\t\\t\\t<strong>If configuration field is updated:<\\/strong><br \\/> \\n\\t\\t\\t\\t<ol>\\n\\t\\t\\t\\t\\t<li>Use that value<\\/li>\\n\\t\\t\\t\\t\\t<li>Support multiple configs, each config on a line; eg: <br \\/>\\n\\t\\t\\t\\t\\t\\t<code>\\n\\t\\t\\t\\t\\t\\t[Masshead option=\\"com_name1\\" view=\\"view_name1\\" layout=\\"layout_name1\\" task=\\"task_name1\\" id=\\"id1\\" title=\\"Title1\\" ]Description 1 here[\\/Masshead]<br \\/>\\n\\t\\t\\t\\t\\t\\t[Masshead option=\\"com_name2\\" view=\\"view_name1\\" layout=\\"layout_name2\\" task=\\"task_name2\\" id=\\"id2\\" title=\\"Title2\\" ]Description 2 here[\\/Masshead]<br \\/>\\n\\t\\t\\t\\t\\t\\t[Masshead Itemid=\\"page_id1_1,page_id1_2,...\\" title=\\"Title page 1\\" ]Description page 1 here[\\/Masshead]<br \\/>\\n\\t\\t\\t\\t\\t\\t[Masshead Itemid=\\"page_id2_1,page_id2_2,...\\" title=\\"Title page 2\\" ]Description page 2 here[\\/Masshead]\\n\\t\\t\\t\\t\\t\\t<\\/code>\\n\\t\\t\\t\\t\\t<\\/li>\\n\\t\\t\\t\\t\\t<li>If config sets multiple conditions, then the module will prefer to the first condition only and ignore the rest.<\\/li>\\n\\t\\t\\t\\t<\\/ol>\\n\\t\\t\\t<br \\/>\\n\\t\\t\\t<strong>Use extra paramaters:<\\/strong><br \\/> \\t\\t\\t\\t\\n\\t\\t\\t<ol>\\n\\t\\t\\t\\t<li>Extra parameters can put in config as <b>name=\\"value\\"<\\/b> and access through variables <b>$masshead[\'params\'][\'name\']<\\/b> by overwritting module layout in the template<\\/li>\\n\\t\\t\\t\\t<li>Eg: <br ?>\\n\\t\\t\\t\\t\\t<code>[Masshead Itemid=\\"page_id\\" title=\\"Title\\" <span style=\\"color:red\\">background=\\"image url\\"<\\/span>]Description[\\/Masshead]<\\/code>\\n\\t\\t\\t\\t<br \\/>\\n\\t\\t\\t\\tAccess the param background: <br \\/>\\n\\t\\t\\t\\t<code>\\n\\t\\t\\t\\t\\t&lt;div class=&quot;jamasshead&quot; <span style=\\"color:red\\">&lt;?php if(isset($masshead[\'params\'][\'background\'])): ?&gt;<\\/span> style=&quot;background-image: url(<span style=\\"color:red\\">&lt;?php echo $masshead[\'params\'][\'background\'] ?&gt;<\\/span>)&quot; <span style=\\"color:red\\">&lt;?php endif; ?&gt;<\\/span>&gt;\\n\\t\\t\\t\\t<\\/code>\\n\\t\\t\\t\\t<\\/li>\\n\\t\\t\\t<\\/ol>\\n\\t\\t\\t\\n\\t\\t\\t<p><strong><span style=\'color: #ff0000;\'>Upgrade Method:<\\/span><br \\/><\\/strong><\\/p>\\n\\t\\t\\t\\t<ol><li>You can install new version directly over this version. Uninstallation is not required. <\\/li>\\n\\t\\t\\t\\t<li>Backup any customized files before upgrading.<\\/li><\\/ol>\\n\\t\\t\\t<p><span style=\'color: #008000;\'><strong>Links:<\\/strong><\\/span><\\/p>\\n\\t\\t\\t  <ul><li><a target=\'_blank\' href=\'http:\\/\\/update.joomlart.com\\/\'>Updates &amp; Versions<\\/a><\\/li><li><a target=\'_blank\' href=\'http:\\/\\/www.joomlart.com\\/forums\\/showthread.php?64198\'>General Userguide<\\/a><\\/li><\\/ul>\\t\\t\\t\\n\\t\\t\\t<p>Copyright 2004 - 2014 <a href=\'http:\\/\\/www.joomlart.com\\/\' title=\'Visit Joomlart.com!\'>JoomlArt.com<\\/a>.<\\/p>\\n\\t\\t\\t<\\/div>\\n\\t\\t<\\/div>\\n\\t\\t\\n\\t","group":"","filename":"mod_jamasshead"}', '{"default-title":"","default-description":"","config":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10029, 0, 'COM_K2', 'component', 'com_k2', '', 1, 1, 0, 0, '{"name":"COM_K2","type":"component","creationDate":"August 18th, 2017","author":"JoomlaWorks","copyright":"Copyright (c) 2006 - 2017 JoomlaWorks Ltd. All rights reserved.","authorEmail":"please-use-the-contact-form@joomlaworks.net","authorUrl":"www.joomlaworks.net","version":"2.8.0","description":"Thank you for installing K2 by JoomlaWorks, the powerful content extension for Joomla","group":"","filename":"k2"}', '{"enable_css":"1","jQueryHandling":"1.8remote","backendJQueryHandling":"remote","userName":"1","userImage":"1","userDescription":"1","userURL":"1","userEmail":"0","userFeedLink":"1","userFeedIcon":"1","userItemCount":"12","userItemTitle":"1","userItemTitleLinked":"1","userItemDateCreated":"1","userItemImage":"1","userItemIntroText":"1","userItemCategory":"1","userItemTags":"1","userItemCommentsAnchor":"1","userItemReadMore":"1","userItemK2Plugins":"1","tagItemCount":"10","tagItemTitle":"1","tagItemTitleLinked":"1","tagItemDateCreated":"1","tagItemImage":"1","tagItemIntroText":"1","tagItemCategory":"1","tagItemReadMore":"1","tagItemExtraFields":"0","tagOrdering":"","tagFeedLink":"1","tagFeedIcon":"1","genericItemCount":"10","genericItemTitle":"1","genericItemTitleLinked":"1","genericItemDateCreated":"1","genericItemImage":"1","genericItemIntroText":"1","genericItemCategory":"1","genericItemReadMore":"1","genericItemExtraFields":"0","genericFeedLink":"1","genericFeedIcon":"1","feedLimit":"10","feedItemImage":"1","feedImgSize":"S","feedItemIntroText":"1","feedTextWordLimit":"","feedItemFullText":"1","feedItemTags":"0","feedItemVideo":"0","feedItemGallery":"0","feedItemAttachments":"0","feedBogusEmail":"","introTextCleanup":"0","introTextCleanupExcludeTags":"","introTextCleanupTagAttr":"","fullTextCleanup":"0","fullTextCleanupExcludeTags":"","fullTextCleanupTagAttr":"","xssFiltering":"0","linkPopupWidth":"900","linkPopupHeight":"600","imagesQuality":"200","itemImageXS":"200","itemImageS":"600","itemImageM":"700","itemImageL":"800","itemImageXL":"900","itemImageGeneric":"800","catImageWidth":"100","catImageDefault":"1","userImageWidth":"100","userImageDefault":"1","commenterImgWidth":"48","onlineImageEditor":"splashup","imageTimestamp":"0","imageMemoryLimit":"","socialButtonCode":"","twitterUsername":"","facebookImage":"Medium","comments":"1","commentsOrdering":"DESC","commentsLimit":"10","commentsFormPosition":"below","commentsPublishing":"1","commentsReporting":"2","commentsReportRecipient":"","inlineCommentsModeration":"0","gravatar":"0","antispam":"recaptcha","recaptchaForRegistered":"1","akismetForRegistered":"1","commentsFormNotes":"1","commentsFormNotesText":"","frontendEditing":"1","showImageTab":"1","showImageGalleryTab":"1","showVideoTab":"1","showExtraFieldsTab":"1","showAttachmentsTab":"1","showK2Plugins":"1","sideBarDisplayFrontend":"0","mergeEditors":"1","sideBarDisplay":"1","attachmentsFolder":"","hideImportButton":"0","googleSearch":"0","googleSearchContainer":"k2GoogleSearchContainer","K2UserProfile":"1","K2UserGroup":"2","redirect":"101","adminSearch":"simple","cookieDomain":"","taggingSystem":"1","lockTags":"0","showTagFilter":"0","k2TagNorm":"1","k2TagNormCase":"lower","k2TagNormAdditionalReplacements":"","recaptcha_public_key":"6LcCkOoSAAAAAO42pEiUqK_HzJbwR-OxfKcAVd2G","recaptcha_private_key":"6LcCkOoSAAAAAAvriVi8FqhKmeb21J-cLcGmkfkF","recaptcha_theme":"clean","recaptchaOnRegistration":"1","akismetApiKey":"","stopForumSpam":"0","stopForumSpamApiKey":"","showItemsCounterAdmin":"1","showChildCatItems":"1","disableCompactOrdering":"0","metaDescLimit":"150","enforceSEFReplacements":"0","SEFReplacements":"À|A, Á|A, Â|A, Ã|A, Ä|A, Å|A, à|a, á|a, â|a, ã|a, ä|a, å|a, Ā|A, ā|a, Ă|A, ă|a, Ą|A, ą|a, Ç|C, ç|c, Ć|C, ć|c, Ĉ|C, ĉ|c, Ċ|C, ċ|c, Č|C, č|c, Ð|D, ð|d, Ď|D, ď|d, Đ|D, đ|d, È|E, É|E, Ê|E, Ë|E, è|e, é|e, ê|e, ë|e, Ē|E, ē|e, Ĕ|E, ĕ|e, Ė|E, ė|e, Ę|E, ę|e, Ě|E, ě|e, Ĝ|G, ĝ|g, Ğ|G, ğ|g, Ġ|G, ġ|g, Ģ|G, ģ|g, Ĥ|H, ĥ|h, Ħ|H, ħ|h, Ì|I, Í|I, Î|I, Ï|I, ì|i, í|i, î|i, ï|i, Ĩ|I, ĩ|i, Ī|I, ī|i, Ĭ|I, ĭ|i, Į|I, į|i, İ|I, ı|i, Ĵ|J, ĵ|j, Ķ|K, ķ|k, ĸ|k, Ĺ|L, ĺ|l, Ļ|L, ļ|l, Ľ|L, ľ|l, Ŀ|L, ŀ|l, Ł|L, ł|l, Ñ|N, ñ|n, Ń|N, ń|n, Ņ|N, ņ|n, Ň|N, ň|n, ŉ|n, Ŋ|N, ŋ|n, Ò|O, Ó|O, Ô|O, Õ|O, Ö|O, Ø|O, ò|o, ó|o, ô|o, õ|o, ö|o, ø|o, Ō|O, ō|o, Ŏ|O, ŏ|o, Ő|O, ő|o, Ŕ|R, ŕ|r, Ŗ|R, ŗ|r, Ř|R, ř|r, Ś|S, ś|s, Ŝ|S, ŝ|s, Ş|S, ş|s, Š|S, š|s, ſ|s, Ţ|T, ţ|t, Ť|T, ť|t, Ŧ|T, ŧ|t, Ù|U, Ú|U, Û|U, Ü|U, ù|u, ú|u, û|u, ü|u, Ũ|U, ũ|u, Ū|U, ū|u, Ŭ|U, ŭ|u, Ů|U, ů|u, Ű|U, ű|u, Ų|U, ų|u, Ŵ|W, ŵ|w, Ý|Y, ý|y, ÿ|y, Ŷ|Y, ŷ|y, Ÿ|Y, Ź|Z, ź|z, Ż|Z, ż|z, Ž|Z, ž|z, α|a, β|b, γ|g, δ|d, ε|e, ζ|z, η|h, θ|th, ι|i, κ|k, λ|l, μ|m, ν|n, ξ|x, ο|o, π|p, ρ|r, σ|s, τ|t, υ|y, φ|f, χ|ch, ψ|ps, ω|w, Α|A, Β|B, Γ|G, Δ|D, Ε|E, Ζ|Z, Η|H, Θ|Th, Ι|I, Κ|K, Λ|L, Μ|M, Ξ|X, Ο|O, Π|P, Ρ|R, Σ|S, Τ|T, Υ|Y, Φ|F, Χ|Ch, Ψ|Ps, Ω|W, ά|a, έ|e, ή|h, ί|i, ό|o, ύ|y, ώ|w, Ά|A, Έ|E, Ή|H, Ί|I, Ό|O, Ύ|Y, Ώ|W, ϊ|i, ΐ|i, ϋ|y, ς|s, А|A, Ӑ|A, Ӓ|A, Ә|E, Ӛ|E, Ӕ|E, Б|B, В|V, Г|G, Ґ|G, Ѓ|G, Ғ|G, Ӷ|G, y|Y, Д|D, Е|E, Ѐ|E, Ё|YO, Ӗ|E, Ҽ|E, Ҿ|E, Є|YE, Ж|ZH, Ӂ|DZH, Җ|ZH, Ӝ|DZH, З|Z, Ҙ|Z, Ӟ|DZ, Ӡ|DZ, Ѕ|DZ, И|I, Ѝ|I, Ӥ|I, Ӣ|I, І|I, Ї|JI, Ӏ|I, Й|Y, Ҋ|Y, Ј|J, К|K, Қ|Q, Ҟ|Q, Ҡ|K, Ӄ|Q, Ҝ|K, Л|L, Ӆ|L, Љ|L, М|M, Ӎ|M, Н|N, Ӊ|N, Ң|N, Ӈ|N, Ҥ|N, Њ|N, О|O, Ӧ|O, Ө|O, Ӫ|O, Ҩ|O, П|P, Ҧ|PF, Р|P, Ҏ|P, С|S, Ҫ|S, Т|T, Ҭ|TH, Ћ|T, Ќ|K, У|U, Ў|U, Ӳ|U, Ӱ|U, Ӯ|U, Ү|U, Ұ|U, Ф|F, Х|H, Ҳ|H, Һ|H, Ц|TS, Ҵ|TS, Ч|CH, Ӵ|CH, Ҷ|CH, Ӌ|CH, Ҹ|CH, Џ|DZ, Ш|SH, Щ|SHT, Ъ|A, Ы|Y, Ӹ|Y, Ь|Y, Ҍ|Y, Э|E, Ӭ|E, Ю|YU, Я|YA, а|a, ӑ|a, ӓ|a, ә|e, ӛ|e, ӕ|e, б|b, в|v, г|g, ґ|g, ѓ|g, ғ|g, ӷ|g, y|y, д|d, е|e, ѐ|e, ё|yo, ӗ|e, ҽ|e, ҿ|e, є|ye, ж|zh, ӂ|dzh, җ|zh, ӝ|dzh, з|z, ҙ|z, ӟ|dz, ӡ|dz, ѕ|dz, и|i, ѝ|i, ӥ|i, ӣ|i, і|i, ї|ji, Ӏ|i, й|y, ҋ|y, ј|j, к|k, қ|q, ҟ|q, ҡ|k, ӄ|q, ҝ|k, л|l, ӆ|l, љ|l, м|m, ӎ|m, н|n, ӊ|n, ң|n, ӈ|n, ҥ|n, њ|n, о|o, ӧ|o, ө|o, ӫ|o, ҩ|o, п|p, ҧ|pf, р|p, ҏ|p, с|s, ҫ|s, т|t, ҭ|th, ћ|t, ќ|k, у|u, ў|u, ӳ|u, ӱ|u, ӯ|u, ү|u, ұ|u, ф|f, х|h, ҳ|h, һ|h, ц|ts, ҵ|ts, ч|ch, ӵ|ch, ҷ|ch, ӌ|ch, ҹ|ch, џ|dz, ш|sh, щ|sht, ъ|a, ы|y, ӹ|y, ь|y, ҍ|y, э|e, ӭ|e, ю|yu, я|ya","k2Sef":"0","k2SefLabelCat":"content","k2SefLabelTag":"tag","k2SefLabelUser":"author","k2SefLabelSearch":"search","k2SefLabelDate":"date","k2SefLabelItem":"0","k2SefLabelItemCustomPrefix":"","k2SefInsertItemId":"1","k2SefItemIdTitleAliasSep":"dash","k2SefUseItemTitleAlias":"1","k2SefInsertCatId":"1","k2SefCatIdTitleAliasSep":"dash","k2SefUseCatTitleAlias":"1","sh404SefLabelCat":"","sh404SefLabelUser":"blog","sh404SefLabelItem":"2","sh404SefTitleAlias":"alias","sh404SefModK2ContentFeedAlias":"feed","sh404SefInsertItemId":"0","sh404SefInsertUniqueItemId":"0","cbIntegration":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10030, 0, 'plg_finder_k2', 'plugin', 'k2', 'finder', 0, 0, 1, 0, '{"name":"plg_finder_k2","type":"plugin","creationDate":"August 18th, 2017","author":"JoomlaWorks","copyright":"Copyright (c) 2006 - 2017 JoomlaWorks Ltd. All rights reserved.","authorEmail":"please-use-the-contact-form@joomlaworks.net","authorUrl":"www.joomlaworks.net","version":"2.8.0","description":"PLG_FINDER_K2_DESCRIPTION","group":"","filename":"k2"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10031, 0, 'Search - K2', 'plugin', 'k2', 'search', 0, 1, 1, 0, '{"name":"Search - K2","type":"plugin","creationDate":"August 18th, 2017","author":"JoomlaWorks","copyright":"Copyright (c) 2006 - 2017 JoomlaWorks Ltd. All rights reserved.","authorEmail":"please-use-the-contact-form@joomlaworks.net","authorUrl":"www.joomlaworks.net","version":"2.8.0","description":"K2_THIS_PLUGIN_EXTENDS_THE_DEFAULT_JOOMLA_SEARCH_FUNCTIONALITY_TO_K2_CONTENT","group":"","filename":"k2"}', '{"search_limit":"50","search_tags":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10032, 0, 'System - K2', 'plugin', 'k2', 'system', 0, 1, 1, 0, '{"name":"System - K2","type":"plugin","creationDate":"August 18th, 2017","author":"JoomlaWorks","copyright":"Copyright (c) 2006 - 2017 JoomlaWorks Ltd. All rights reserved.","authorEmail":"please-use-the-contact-form@joomlaworks.net","authorUrl":"www.joomlaworks.net","version":"2.8.0","description":"K2_THE_K2_SYSTEM_PLUGIN_IS_USED_TO_ASSIST_THE_PROPER_FUNCTIONALITY_OF_THE_K2_COMPONENT_SITE_WIDE_MAKE_SURE_ITS_ALWAYS_PUBLISHED_WHEN_THE_K2_COMPONENT_IS_INSTALLED","group":"","filename":"k2"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10033, 0, 'User - K2', 'plugin', 'k2', 'user', 0, 1, 1, 0, '{"name":"User - K2","type":"plugin","creationDate":"August 18th, 2017","author":"JoomlaWorks","copyright":"Copyright (c) 2006 - 2017 JoomlaWorks Ltd. All rights reserved.","authorEmail":"please-use-the-contact-form@joomlaworks.net","authorUrl":"www.joomlaworks.net","version":"2.8.0","description":"K2_A_USER_SYNCHRONIZATION_PLUGIN_FOR_K2","group":"","filename":"k2"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10036, 0, 'K2 Comments', 'module', 'mod_k2_comments', '', 0, 1, 0, 0, '{"name":"K2 Comments","type":"module","creationDate":"August 18th, 2017","author":"JoomlaWorks","copyright":"Copyright (c) 2006 - 2017 JoomlaWorks Ltd. All rights reserved.","authorEmail":"please-use-the-contact-form@joomlaworks.net","authorUrl":"www.joomlaworks.net","version":"2.8.0","description":"MOD_K2_COMMENTS_DESCRIPTION","group":"","filename":"mod_k2_comments.j25"}', '{"moduleclass_sfx":"","module_usage":"","":"K2_TOP_COMMENTERS","catfilter":"0","category_id":"","comments_limit":"5","comments_word_limit":"10","commenterName":"1","commentAvatar":"1","commentAvatarWidthSelect":"custom","commentAvatarWidth":"50","commentDate":"1","commentDateFormat":"absolute","commentLink":"1","itemTitle":"1","itemCategory":"1","feed":"1","commenters_limit":"5","commenterNameOrUsername":"1","commenterAvatar":"1","commenterAvatarWidthSelect":"custom","commenterAvatarWidth":"50","commenterLink":"1","commenterCommentsCounter":"1","commenterLatestComment":"1","cache":"1","cache_time":"900"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10037, 0, 'K2 Content', 'module', 'mod_k2_content', '', 0, 1, 0, 0, '{"name":"K2 Content","type":"module","creationDate":"August 18th, 2017","author":"JoomlaWorks","copyright":"Copyright (c) 2006 - 2017 JoomlaWorks Ltd. All rights reserved.","authorEmail":"please-use-the-contact-form@joomlaworks.net","authorUrl":"www.joomlaworks.net","version":"2.8.0","description":"K2_MOD_K2_CONTENT_DESCRIPTION","group":"","filename":"mod_k2_content.j25"}', '{"moduleclass_sfx":"","getTemplate":"Default","source":"filter","":"K2_OTHER_OPTIONS","catfilter":"0","category_id":"","getChildren":"0","itemCount":"5","itemsOrdering":"","FeaturedItems":"1","popularityRange":"","videosOnly":"0","item":"","items":"","itemTitle":"1","itemAuthor":"1","itemAuthorAvatar":"1","itemAuthorAvatarWidthSelect":"custom","itemAuthorAvatarWidth":"50","userDescription":"1","itemIntroText":"1","itemIntroTextWordLimit":"","itemImage":"1","itemImgSize":"Small","itemVideo":"1","itemVideoCaption":"1","itemVideoCredits":"1","itemAttachments":"1","itemTags":"1","itemCategory":"1","itemDateCreated":"1","itemHits":"1","itemReadMore":"1","itemExtraFields":"0","itemCommentsCounter":"1","feed":"1","itemPreText":"","itemCustomLink":"0","itemCustomLinkTitle":"","itemCustomLinkURL":"http:\\/\\/","itemCustomLinkMenuItem":"","K2Plugins":"1","JPlugins":"1","cache":"1","cache_time":"900"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10038, 0, 'K2 Tools', 'module', 'mod_k2_tools', '', 0, 1, 0, 0, '{"name":"K2 Tools","type":"module","creationDate":"August 18th, 2017","author":"JoomlaWorks","copyright":"Copyright (c) 2006 - 2017 JoomlaWorks Ltd. All rights reserved.","authorEmail":"please-use-the-contact-form@joomlaworks.net","authorUrl":"www.joomlaworks.net","version":"2.8.0","description":"K2_TOOLS","group":"","filename":"mod_k2_tools.j25"}', '{"moduleclass_sfx":"","module_usage":"0","":"K2_CUSTOM_CODE_SETTINGS","archiveItemsCounter":"1","archiveCategory":"","authors_module_category":"","authorItemsCounter":"1","authorAvatar":"1","authorAvatarWidthSelect":"custom","authorAvatarWidth":"50","authorLatestItem":"1","calendarCategory":"","home":"","seperator":"","root_id":"","end_level":"","categoriesListOrdering":"","categoriesListItemsCounter":"1","root_id2":"","catfilter":"0","category_id":"","getChildren":"0","liveSearch":"","width":"20","text":"","button":"","imagebutton":"","button_text":"","min_size":"75","max_size":"300","cloud_limit":"30","cloud_category":"0","cloud_category_recursive":"0","customCode":"","parsePhp":"0","K2Plugins":"0","JPlugins":"0","cache":"1","cache_time":"900"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10039, 0, 'K2 Users', 'module', 'mod_k2_users', '', 0, 1, 0, 0, '{"name":"K2 Users","type":"module","creationDate":"August 18th, 2017","author":"JoomlaWorks","copyright":"Copyright (c) 2006 - 2017 JoomlaWorks Ltd. All rights reserved.","authorEmail":"please-use-the-contact-form@joomlaworks.net","authorUrl":"www.joomlaworks.net","version":"2.8.0","description":"K2_MOD_K2_USERS_DESCRTIPTION","group":"","filename":"mod_k2_users.j25"}', '{"moduleclass_sfx":"","getTemplate":"Default","source":"0","":"K2_DISPLAY_OPTIONS","filter":"1","K2UserGroup":"","ordering":"1","limit":"4","userIDs":"","userName":"1","userAvatar":"1","userAvatarWidthSelect":"custom","userAvatarWidth":"50","userDescription":"1","userDescriptionWordLimit":"","userURL":"1","userEmail":"0","userFeed":"1","userItemCount":"1","cache":"1","cache_time":"900"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10040, 0, 'K2 User', 'module', 'mod_k2_user', '', 0, 1, 0, 0, '{"name":"K2 User","type":"module","creationDate":"August 18th, 2017","author":"JoomlaWorks","copyright":"Copyright (c) 2006 - 2017 JoomlaWorks Ltd. All rights reserved.","authorEmail":"please-use-the-contact-form@joomlaworks.net","authorUrl":"www.joomlaworks.net","version":"2.8.0","description":"K2_MOD_K2_USER_DESCRIPTION","group":"","filename":"mod_k2_user.j25"}', '{"moduleclass_sfx":"","pretext":"","":"K2_LOGIN_LOGOUT_REDIRECTION","name":"1","userAvatar":"1","userAvatarWidthSelect":"custom","userAvatarWidth":"50","menu":"","login":"","logout":"","usesecure":"0","cache":"0","cache_time":"900"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10041, 0, 'K2 Quick Icons (admin)', 'module', 'mod_k2_quickicons', '', 1, 1, 2, 0, '{"name":"K2 Quick Icons (admin)","type":"module","creationDate":"August 18th, 2017","author":"JoomlaWorks","copyright":"Copyright (c) 2006 - 2017 JoomlaWorks Ltd. All rights reserved.","authorEmail":"please-use-the-contact-form@joomlaworks.net","authorUrl":"www.joomlaworks.net","version":"2.8.0","description":"K2_QUICKICONS_FOR_USE_IN_THE_JOOMLA_CONTROL_PANEL_DASHBOARD_PAGE","group":"","filename":"mod_k2_quickicons.j25"}', '{"modCSSStyling":"1","modLogo":"1","cache":"0","cache_time":"900"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10042, 0, 'K2 Stats (admin)', 'module', 'mod_k2_stats', '', 1, 1, 2, 0, '{"name":"K2 Stats (admin)","type":"module","creationDate":"August 18th, 2017","author":"JoomlaWorks","copyright":"Copyright (c) 2006 - 2017 JoomlaWorks Ltd. All rights reserved.","authorEmail":"please-use-the-contact-form@joomlaworks.net","authorUrl":"www.joomlaworks.net","version":"2.8.0","description":"K2_STATS_FOR_USE_IN_THE_K2_DASHBOARD_PAGE","group":"","filename":"mod_k2_stats.j25"}', '{"latestItems":"1","popularItems":"1","mostCommentedItems":"1","latestComments":"1","statistics":"1","cache":"0","cache_time":"900"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10051, 0, 'System - JA Google Map', 'plugin', 'jagooglemap', 'system', 0, 1, 1, 0, '{"name":"System - JA Google Map","type":"plugin","creationDate":"Sep 2015","author":"JoomlArt.com","copyright":"J.O.O.M Solutions Co., Ltd.","authorEmail":"webmaster@joomlart.com","authorUrl":"www.joomlart.com","version":"2.6.2","description":"\\n\\t\\t\\n\\t\\t<div style=\'font-weight:normal; text-align: left;\'>\\n\\t\\t\\t<span style=\\"color: #008000;\\">\\n\\t\\t\\t\\t<strong>Google Maps Plugin for Joomla 2.5 and Joomla 3.4<\\/strong>\\n\\t\\t\\t<\\/span>\\n\\t\\t\\t<br \\/>\\n\\t\\t\\t<p><img src=\\"http:\\/\\/joomlart.s3.amazonaws.com\\/images\\/mis\\/coming_up_teaser\\/ja_map_logo.jpg\\" \\/><\\/p>\\n\\t\\t\\t<p>\\n\\t\\t\\t\\t<span style=\\"color: #ff6600;\\">\\n\\t\\t\\t\\t\\t<strong>Features:<\\/strong>\\n\\t\\t\\t\\t<\\/span>\\n\\t\\t\\t<\\/p>\\n\\t\\t\\t<ol>\\n\\t\\t\\t\\t<li>Easy to use. Change configuration values, check the checkboxes to include the values in the code, copy the code and paste into your article.<\\/li>\\n\\t\\t\\t\\t<li>Tooltips added to all config options, with description and help text. Hover your mouse over the configuration options and read the tips.<\\/li>\\n\\t\\t\\t<\\/ol>\\n\\t\\t\\t<p>\\n\\t\\t\\t\\t<strong>\\n\\t\\t\\t\\t\\t<span style=\\"color: #ff6600;\\">Requirements:<\\/span>\\n\\t\\t\\t\\t<\\/strong>\\n\\t\\t\\t<\\/p>\\n\\t\\t\\t<ol>\\n\\t\\t\\t\\t<li> Google Map API Key is required to validate requests from your site to Google Maps, sign up for a Google Map API Key <a target=\\"_blank\\" href=\\"http:\\/\\/code.google.com\\/apis\\/maps\\/signup.html\\">HERE<\\/a> .<\\/li>\\n\\t\\t\\t\\t<li>If you plan to use Latitude &amp; Longitude for your target location. Get co-ordinates from <a target=\\"_blank\\" href=\\"http:\\/\\/www.satsig.net\\/maps\\/lat-long-finder.htm\\">HERE<\\/a>. Pick the co-ordinates as shown in the screenshot below.<\\/li>\\n\\t\\t\\t<\\/ol>\\n\\t\\t\\t<img src=\\"http:\\/\\/joomlart.s3.amazonaws.com\\/images\\/mis\\/Latitude_Longitude_picker.png\\" \\/>\\n\\t\\t\\t<p style=\\"clear:both;\\"><br \\/>\\n\\t\\t\\t\\t<span style=\\"color: #008000;\\">\\n\\t\\t\\t\\t\\t<strong>Watch the Video<\\/strong>\\n\\t\\t\\t\\t<\\/span>\\n\\t\\t\\t<\\/p>\\n\\t\\t\\t<p>\\n\\t\\t\\t\\t<object data=\\"http:\\/\\/www.youtube.com\\/v\\/4YHh4JGpTig&amp;hl=en&amp;fs=1&amp;rel=0\\" type=\\"application\\/x-shockwave-flash\\" height=\\"385\\" width=\\"480\\"><param name=\\"allowfullscreen\\" value=\\"true\\" \\/><param name=\\"allowscriptaccess\\" value=\\"always\\" \\/><param name=\\"src\\" value=\\"http:\\/\\/www.youtube.com\\/v\\/4YHh4JGpTig&amp;hl=en&amp;fs=1&amp;rel=0\\" \\/><\\/object>\\n\\t\\t\\t<\\/p>\\n\\t\\t\\t<p>Right click on the video and Click \\"Open in Youtube\\" to view full screen.<\\/p>\\n\\t\\t\\t<p>\\n\\t\\t\\t\\t<strong>\\n\\t\\t\\t\\t\\t<span style=\\"color: #ff0000;\\">Important Instruction:<\\/span>\\n\\t\\t\\t\\t\\t<br \\/>\\n\\t\\t\\t\\t<\\/strong>\\n\\t\\t\\t<\\/p>\\n\\t\\t\\t<ol>\\n\\t\\t\\t\\t<li>Use the Code generator to generate codes. However do not save the plugin settings when done. Always Hit the Close Button.<\\/li>\\n\\t\\t\\t\\t<li><span style=\\"color: #ff0000;\\">DO NOT<\\/span> save settings each time you generate the map, the default configured maps will be affected. This is true incase your earlier maps CODE do not have the override values in them. Hit the Cancel button to preserve your default settings.<\\/li>\\n\\t\\t\\t\\t<li>If your map is not seen in the article, then SwitchOver to HTML Source Edit view, while inserting the code into the desired location<\\/li>\\n\\t\\t\\t<\\/ol>\\n\\t\\t\\t<p>\\n\\t\\t\\t\\t<span style=\\"color: #008000;\\">\\n\\t\\t\\t\\t\\t<strong>Links:<\\/strong>\\n\\t\\t\\t\\t<\\/span>\\n\\t\\t\\t<\\/p>\\n\\t\\t\\t<p>\\n\\t\\t\\t\\t<a target=\\"_blank\\" href=\\"http:\\/\\/www.joomlart.com\\/forums\\/forumdisplay.php?f=172\\">JA Google Map Forum<\\/a><p> <a target=\\"_blank\\" href=\\"http:\\/\\/pm.joomlart.com\\/browse\\/JAECPLGGMAPJIVI\\">Found a Bug? \\/ Have a Wishlist? Report here<\\/a><\\/p><p>Copyright 2012 <a href=\\"http:\\/\\/www.joomlart.com\\/\\" title=\\"Visit Joomlart.com!\\">JoomlArt.com<\\/a>.\\n\\t\\t\\t<\\/p>\\n\\t\\t<\\/div>\\n\\t\\t\\n\\t","group":"","filename":"jagooglemap"}', '{"api_key":"AIzaSyCNIJV_hl5sVimQSQlc7PsP9-Kz0KGGQ1Y","disable_map":"0","mode":"normal","locations":{"location":[""],"latitude":[""],"longitude":[""],"info":[""]},"zoom":"13","maptype":"normal","map_width":"2000","map_height":"455","maptype_control_display":"1","mapstyles_control_display":"0","map_styles":"","maptype_control_style":"drop_down","maptype_control_position":"TR","toolbar_control_display":"1","toolbar_control_style":"default","toolbar_control_position":"TL","disable_scrollwheelzoom":"0","display_scale":"0","display_overview":"0","clustering":"0","center":"all","code_container":"{jamap }"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10053, 0, 'com_jaextmanager', 'component', 'com_jaextmanager', '', 1, 1, 0, 0, '{"name":"com_jaextmanager","type":"component","creationDate":"Feb 2017","author":"JoomlArt","copyright":"Copyright (C), J.O.O.M Solutions Co., Ltd. All Rights Reserved.","authorEmail":"webmaster@joomlart.com","authorUrl":"http:\\/\\/www.joomlart.com","version":"2.6.3","description":"JA Extension Manager Component","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10066, 0, 'AcyMailing JCE integration', 'plugin', 'jceacymailing', 'system', 0, 1, 1, 0, '{"version":"5.9.0","author":"Acyba","creationDate":"December 2017"}', '{}', '', '', 0, '0000-00-00 00:00:00', 23, 0);

DROP TABLE IF EXISTS `#__fields`;
CREATE TABLE `#__fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT 0,
  `context` varchar(255) NOT NULL DEFAULT '',
  `group_id` int(10) unsigned NOT NULL DEFAULT 0,
  `title` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `default_value` text NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'text',
  `note` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT 0,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `checked_out` int(11) NOT NULL DEFAULT 0,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT 0,
  `params` text NOT NULL,
  `fieldparams` text NOT NULL,
  `language` char(7) NOT NULL DEFAULT '',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT 0,
  `access` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_created_user_id` (`created_user_id`),
  KEY `idx_access` (`access`),
  KEY `idx_context` (`context`(191)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__fields_categories`;
CREATE TABLE `#__fields_categories` (
  `field_id` int(11) NOT NULL DEFAULT 0,
  `category_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`field_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__fields_groups`;
CREATE TABLE `#__fields_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT 0,
  `context` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT 0,
  `checked_out` int(11) NOT NULL DEFAULT 0,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT 0,
  `params` text NOT NULL,
  `language` char(7) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT 0,
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT 0,
  `access` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_created_by` (`created_by`),
  KEY `idx_access` (`access`),
  KEY `idx_context` (`context`(191)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__fields_values`;
CREATE TABLE `#__fields_values` (
  `field_id` int(10) unsigned NOT NULL,
  `item_id` varchar(255) NOT NULL COMMENT 'Allow references to items which have strings as ids, eg. none db systems.',
  `value` text NOT NULL,
  KEY `idx_field_id` (`field_id`),
  KEY `idx_item_id` (`item_id`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__finder_filters`;
CREATE TABLE `#__finder_filters` (
  `filter_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT 1,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL,
  `created_by_alias` varchar(255) NOT NULL,
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT 0,
  `checked_out` int(10) unsigned NOT NULL DEFAULT 0,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `map_count` int(10) unsigned NOT NULL DEFAULT 0,
  `data` mediumtext NOT NULL,
  `params` longtext DEFAULT NULL,
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__finder_links`;
CREATE TABLE `#__finder_links` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `route` varchar(255) NOT NULL,
  `title` varchar(400) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `indexdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `md5sum` varchar(32) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT 1,
  `state` int(5) DEFAULT 1,
  `access` int(5) DEFAULT 0,
  `language` varchar(8) NOT NULL,
  `publish_start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `list_price` double unsigned NOT NULL DEFAULT 0,
  `sale_price` double unsigned NOT NULL DEFAULT 0,
  `type_id` int(11) NOT NULL,
  `object` mediumblob NOT NULL,
  PRIMARY KEY (`link_id`),
  KEY `idx_type` (`type_id`),
  KEY `idx_md5` (`md5sum`),
  KEY `idx_url` (`url`(75)),
  KEY `idx_published_list` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`list_price`),
  KEY `idx_published_sale` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`sale_price`),
  KEY `idx_title` (`title`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__finder_links_terms0`;
CREATE TABLE `#__finder_links_terms0` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__finder_links_terms1`;
CREATE TABLE `#__finder_links_terms1` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__finder_links_terms2`;
CREATE TABLE `#__finder_links_terms2` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__finder_links_terms3`;
CREATE TABLE `#__finder_links_terms3` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__finder_links_terms4`;
CREATE TABLE `#__finder_links_terms4` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__finder_links_terms5`;
CREATE TABLE `#__finder_links_terms5` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__finder_links_terms6`;
CREATE TABLE `#__finder_links_terms6` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__finder_links_terms7`;
CREATE TABLE `#__finder_links_terms7` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__finder_links_terms8`;
CREATE TABLE `#__finder_links_terms8` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__finder_links_terms9`;
CREATE TABLE `#__finder_links_terms9` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__finder_links_termsa`;
CREATE TABLE `#__finder_links_termsa` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__finder_links_termsb`;
CREATE TABLE `#__finder_links_termsb` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__finder_links_termsc`;
CREATE TABLE `#__finder_links_termsc` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__finder_links_termsd`;
CREATE TABLE `#__finder_links_termsd` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__finder_links_termse`;
CREATE TABLE `#__finder_links_termse` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__finder_links_termsf`;
CREATE TABLE `#__finder_links_termsf` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__finder_taxonomy`;
CREATE TABLE `#__finder_taxonomy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT 0,
  `title` varchar(255) NOT NULL,
  `state` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `access` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `ordering` tinyint(1) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `state` (`state`),
  KEY `ordering` (`ordering`),
  KEY `access` (`access`),
  KEY `idx_parent_published` (`parent_id`,`state`,`access`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__finder_taxonomy_map`;
CREATE TABLE `#__finder_taxonomy_map` (
  `link_id` int(10) unsigned NOT NULL,
  `node_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`node_id`),
  KEY `link_id` (`link_id`),
  KEY `node_id` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__finder_terms`;
CREATE TABLE `#__finder_terms` (
  `term_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `weight` float unsigned NOT NULL DEFAULT 0,
  `soundex` varchar(75) NOT NULL,
  `links` int(10) NOT NULL DEFAULT 0,
  `language` char(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `idx_term` (`term`),
  KEY `idx_term_phrase` (`term`,`phrase`),
  KEY `idx_stem_phrase` (`stem`,`phrase`),
  KEY `idx_soundex_phrase` (`soundex`,`phrase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__finder_terms_common`;
CREATE TABLE `#__finder_terms_common` (
  `term` varchar(75) NOT NULL,
  `language` varchar(3) NOT NULL,
  KEY `idx_word_lang` (`term`,`language`),
  KEY `idx_lang` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__finder_tokens`;
CREATE TABLE `#__finder_tokens` (
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `weight` float unsigned NOT NULL DEFAULT 1,
  `context` tinyint(1) unsigned NOT NULL DEFAULT 2,
  `language` char(3) NOT NULL DEFAULT '',
  KEY `idx_word` (`term`),
  KEY `idx_context` (`context`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__finder_tokens_aggregate`;
CREATE TABLE `#__finder_tokens_aggregate` (
  `term_id` int(10) unsigned NOT NULL,
  `map_suffix` char(1) NOT NULL,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `term_weight` float unsigned NOT NULL,
  `context` tinyint(1) unsigned NOT NULL DEFAULT 2,
  `context_weight` float unsigned NOT NULL,
  `total_weight` float unsigned NOT NULL,
  `language` char(3) NOT NULL DEFAULT '',
  KEY `token` (`term`),
  KEY `keyword_id` (`term_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__finder_types`;
CREATE TABLE `#__finder_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `mime` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__hotspots_kmls`;
CREATE TABLE `#__hotspots_kmls` (
  `hotspots_kml_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `catid` int(11) NOT NULL COMMENT 'FK to #__categories',
  `description` text NOT NULL,
  `original_filename` varchar(1024) NOT NULL,
  `mangled_filename` varchar(1024) NOT NULL,
  `mime_type` varchar(255) NOT NULL DEFAULT 'application/octet-stream',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` bigint(20) NOT NULL DEFAULT 0,
  `state` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`hotspots_kml_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__hotspots_mappings`;
CREATE TABLE `#__hotspots_mappings` (
  `marker_id` int(11) NOT NULL,
  `foreign_id` int(11) NOT NULL,
  `component` varchar(255) DEFAULT '',
  PRIMARY KEY (`marker_id`,`foreign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__hotspots_marker`;
CREATE TABLE `#__hotspots_marker` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(11) NOT NULL COMMENT 'FK to #__assets',
  `catid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `plz` varchar(10) NOT NULL,
  `town` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `gmlat` float(10,6) NOT NULL,
  `gmlng` float(10,6) NOT NULL,
  `description` mediumtext NOT NULL,
  `description_small` mediumtext NOT NULL,
  `created_by_alias` varchar(255) NOT NULL,
  `created_by_ip` int(11) unsigned NOT NULL,
  `created_by` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `vote` float NOT NULL DEFAULT 0,
  `votenum` int(11) NOT NULL,
  `state` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL,
  `customfields` text NOT NULL,
  `params` text NOT NULL,
  `language` char(7) NOT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT 1,
  `import_table` varchar(255) NOT NULL COMMENT 'If we import data from 3rd party components we store the table_id here',
  `import_id` int(11) NOT NULL COMMENT 'Original id of the stored object',
  PRIMARY KEY (`id`),
  KEY `gmlat` (`gmlat`),
  KEY `gmlng` (`gmlng`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__jaem_log`;
CREATE TABLE `#__jaem_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ext_id` varchar(50) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `check_date` datetime DEFAULT NULL,
  `check_info` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ext_id` (`ext_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__jaem_services`;
CREATE TABLE `#__jaem_services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ws_name` varchar(255) NOT NULL,
  `ws_mode` varchar(50) NOT NULL DEFAULT 'local',
  `ws_uri` varchar(255) NOT NULL,
  `ws_user` varchar(100) NOT NULL,
  `ws_pass` varchar(100) NOT NULL,
  `ws_default` tinyint(1) NOT NULL DEFAULT 0,
  `ws_core` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `#__jaem_services` (`id`, `ws_name`, `ws_mode`, `ws_uri`, `ws_user`, `ws_pass`, `ws_default`, `ws_core`) VALUES
(1, 'Local Service', 'local', '', '', '', 1, 1),
(2, 'JoomlArt Updates', 'remote', 'http://update.joomlart.com/service/', '', '', 0, 1);

DROP TABLE IF EXISTS `#__jak2filter`;
CREATE TABLE `#__jak2filter` (
  `name` varchar(100) NOT NULL,
  `value` text NOT NULL,
  `updatetime` datetime NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__jak2filter_taxonomy`;
CREATE TABLE `#__jak2filter_taxonomy` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) binary NOT NULL,
  `title` varchar(255) binary NOT NULL,
  `asset_id` int(11) NOT NULL,
  `option_id` int(5) NOT NULL DEFAULT 0,
  `num_items` int(8) NOT NULL,
  `labels` varchar(255) binary DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `asset_idx` (`asset_id`,`option_id`,`type`,`labels`)
) ENGINE=MyISAM AUTO_INCREMENT=437 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__jak2filter_taxonomy_map`;
CREATE TABLE `#__jak2filter_taxonomy_map` (
  `node_id` int(10) NOT NULL COMMENT 'taxonomy id',
  `item_id` int(11) NOT NULL COMMENT 'K2 item id',
  `language` char(7) NOT NULL DEFAULT '*',
  UNIQUE KEY `taxonomy_map_id` (`node_id`,`item_id`),
  KEY `itemid` (`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__k2_attachments`;
CREATE TABLE `#__k2_attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemID` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `titleAttribute` text NOT NULL,
  `hits` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `itemID` (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__k2_categories`;
CREATE TABLE `#__k2_categories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `parent` int(11) DEFAULT 0,
  `extraFieldsGroup` int(11) NOT NULL,
  `published` smallint(6) NOT NULL DEFAULT 0,
  `access` int(11) NOT NULL DEFAULT 0,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `image` varchar(255) NOT NULL,
  `params` text NOT NULL,
  `trash` smallint(6) NOT NULL DEFAULT 0,
  `plugins` text NOT NULL,
  `language` char(7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category` (`published`,`access`,`trash`),
  KEY `parent` (`parent`),
  KEY `ordering` (`ordering`),
  KEY `published` (`published`),
  KEY `access` (`access`),
  KEY `trash` (`trash`),
  KEY `language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__k2_comments`;
CREATE TABLE `#__k2_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `userName` varchar(255) NOT NULL,
  `commentDate` datetime NOT NULL,
  `commentText` text NOT NULL,
  `commentEmail` varchar(255) NOT NULL,
  `commentURL` varchar(255) NOT NULL,
  `published` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `itemID` (`itemID`),
  KEY `userID` (`userID`),
  KEY `published` (`published`),
  KEY `latestComments` (`published`,`commentDate`),
  KEY `countComments` (`itemID`,`published`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__k2_extra_fields`;
CREATE TABLE `#__k2_extra_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(255) NOT NULL,
  `group` int(11) NOT NULL,
  `published` tinyint(4) NOT NULL,
  `ordering` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group` (`group`),
  KEY `published` (`published`),
  KEY `ordering` (`ordering`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__k2_extra_fields_groups`;
CREATE TABLE `#__k2_extra_fields_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__k2_items`;
CREATE TABLE `#__k2_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `catid` int(11) NOT NULL,
  `published` smallint(6) NOT NULL DEFAULT 0,
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `video` text DEFAULT NULL,
  `gallery` varchar(255) DEFAULT NULL,
  `extra_fields` text DEFAULT NULL,
  `extra_fields_search` text NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_by_alias` varchar(255) NOT NULL,
  `checked_out` int(10) unsigned NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `modified_by` int(11) NOT NULL DEFAULT 0,
  `publish_up` datetime NOT NULL,
  `publish_down` datetime NOT NULL,
  `trash` smallint(6) NOT NULL DEFAULT 0,
  `access` int(11) NOT NULL DEFAULT 0,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `featured` smallint(6) NOT NULL DEFAULT 0,
  `featured_ordering` int(11) NOT NULL DEFAULT 0,
  `image_caption` text NOT NULL,
  `image_credits` varchar(255) NOT NULL,
  `video_caption` text NOT NULL,
  `video_credits` varchar(255) NOT NULL,
  `hits` int(10) unsigned NOT NULL,
  `params` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `metakey` text NOT NULL,
  `plugins` text NOT NULL,
  `language` char(7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `item` (`published`,`publish_up`,`publish_down`,`trash`,`access`),
  KEY `catid` (`catid`),
  KEY `created_by` (`created_by`),
  KEY `ordering` (`ordering`),
  KEY `featured` (`featured`),
  KEY `featured_ordering` (`featured_ordering`),
  KEY `hits` (`hits`),
  KEY `created` (`created`),
  KEY `language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__k2_log`;
CREATE TABLE `#__k2_log` (
  `status` int(11) NOT NULL,
  `response` text NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__k2_rating`;
CREATE TABLE `#__k2_rating` (
  `itemID` int(11) NOT NULL DEFAULT 0,
  `rating_sum` int(11) unsigned NOT NULL DEFAULT 0,
  `rating_count` int(11) unsigned NOT NULL DEFAULT 0,
  `lastip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__k2_tags`;
CREATE TABLE `#__k2_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `published` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `published` (`published`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__k2_tags_xref`;
CREATE TABLE `#__k2_tags_xref` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tagID` int(11) NOT NULL,
  `itemID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tagID` (`tagID`),
  KEY `itemID` (`itemID`)
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__k2_user_groups`;
CREATE TABLE `#__k2_user_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `permissions` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__k2_users`;
CREATE TABLE `#__k2_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `gender` enum('m','f') NOT NULL DEFAULT 'm',
  `description` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `group` int(11) NOT NULL DEFAULT 0,
  `plugins` text NOT NULL,
  `ip` varchar(15) NOT NULL,
  `hostname` varchar(255) NOT NULL,
  `notes` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userID` (`userID`),
  KEY `group` (`group`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__languages`;
CREATE TABLE `#__languages` (
  `lang_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT 0,
  `lang_code` char(7) binary NOT NULL,
  `title` varchar(50) NOT NULL,
  `title_native` varchar(50) NOT NULL,
  `sef` varchar(50) NOT NULL,
  `image` varchar(50) NOT NULL,
  `description` varchar(512) NOT NULL,
  `metakey` mediumtext NOT NULL,
  `metadesc` mediumtext NOT NULL,
  `sitename` varchar(1024) NOT NULL DEFAULT '',
  `published` int(11) NOT NULL DEFAULT 0,
  `access` int(10) unsigned NOT NULL DEFAULT 0,
  `ordering` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`lang_id`),
  UNIQUE KEY `idx_sef` (`sef`),
  UNIQUE KEY `idx_langcode` (`lang_code`),
  KEY `idx_access` (`access`),
  KEY `idx_ordering` (`ordering`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `#__languages` (`lang_id`, `asset_id`, `lang_code`, `title`, `title_native`, `sef`, `image`, `description`, `metakey`, `metadesc`, `sitename`, `published`, `access`, `ordering`) VALUES
(1, 0, 'en-GB', 'English (UK)', 'English (UK)', 'en', 'en', '', '', '', '', 1, 1, 1);

DROP TABLE IF EXISTS `#__menu`;
CREATE TABLE `#__menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) NOT NULL COMMENT 'The type of menu this item belongs to. FK to #__menu_types.menutype',
  `title` varchar(255) NOT NULL COMMENT 'The display title of the menu item.',
  `alias` varchar(400) binary NOT NULL COMMENT 'The SEF alias of the menu item.',
  `note` varchar(255) NOT NULL DEFAULT '',
  `path` varchar(1024) NOT NULL COMMENT 'The computed path of the menu item based on the alias field.',
  `link` varchar(1024) NOT NULL COMMENT 'The actually link the menu item refers to.',
  `type` varchar(16) NOT NULL COMMENT 'The type of link: Component, URL, Alias, Separator',
  `published` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'The published state of the menu link.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT 1 COMMENT 'The parent menu item in the menu tree.',
  `level` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'The relative level in the tree.',
  `component_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'FK to #__extensions.id',
  `checked_out` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'FK to #__users.id',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'The time the menu item was checked out.',
  `browserNav` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'The click behaviour of the link.',
  `access` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'The access level required to view the menu item.',
  `img` varchar(255) NOT NULL COMMENT 'The image of the menu item.',
  `template_style_id` int(10) unsigned NOT NULL DEFAULT 0,
  `params` mediumtext NOT NULL COMMENT 'JSON encoded data for the menu item.',
  `lft` int(11) NOT NULL DEFAULT 0 COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT 0 COMMENT 'Nested set rgt.',
  `home` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT 'Indicates if this menu item is the home or default page.',
  `language` char(7) NOT NULL DEFAULT '',
  `client_id` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_client_id_parent_id_alias_language` (`client_id`,`parent_id`,`alias`(100),`language`),
  KEY `idx_componentid` (`component_id`,`menutype`,`published`,`access`),
  KEY `idx_menutype` (`menutype`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_language` (`language`),
  KEY `idx_alias` (`alias`(100)),
  KEY `idx_path` (`path`(100))
) ENGINE=InnoDB AUTO_INCREMENT=255 DEFAULT CHARSET=utf8;

INSERT INTO `#__menu` (`id`, `menutype`, `title`, `alias`, `note`, `path`, `link`, `type`, `published`, `parent_id`, `level`, `component_id`, `checked_out`, `checked_out_time`, `browserNav`, `access`, `img`, `template_style_id`, `params`, `lft`, `rgt`, `home`, `language`, `client_id`) VALUES
(2, 'main', 'com_banners', 'Banners', '', 'Banners', 'index.php?option=com_banners', 'component', 1, 1, 1, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 1, 10, 0, '*', 1),
(17, 'main', 'com_search', 'Basic Search', '', 'Basic Search', 'index.php?option=com_search', 'component', 1, 1, 1, 19, 0, '0000-00-00 00:00:00', 0, 0, 'class:search', 0, '', 69, 70, 0, '*', 1),
(7, 'main', 'com_contact', 'Contacts', '', 'Contacts', 'index.php?option=com_contact', 'component', 1, 1, 1, 8, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 51, 56, 0, '*', 1),
(19, 'main', 'com_joomlaupdate', 'Joomla! Update', '', 'Joomla! Update', 'index.php?option=com_joomlaupdate', 'component', 1, 1, 1, 28, 0, '0000-00-00 00:00:00', 0, 0, 'class:joomlaupdate', 0, '', 73, 74, 0, '*', 1),
(10, 'main', 'com_messages', 'Messaging', '', 'Messaging', 'index.php?option=com_messages', 'component', 1, 1, 1, 15, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages', 0, '', 57, 60, 0, '*', 1),
(13, 'main', 'com_newsfeeds', 'News Feeds', '', 'News Feeds', 'index.php?option=com_newsfeeds', 'component', 1, 1, 1, 17, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 61, 66, 0, '*', 1),
(21, 'main', 'com_postinstall', 'Post-installation messages', '', 'Post-installation messages', 'index.php?option=com_postinstall', 'component', 1, 1, 1, 32, 0, '0000-00-00 00:00:00', 0, 1, 'class:postinstall', 0, '', 77, 78, 0, '*', 1),
(16, 'main', 'com_redirect', 'Redirect', '', 'Redirect', 'index.php?option=com_redirect', 'component', 1, 1, 1, 24, 0, '0000-00-00 00:00:00', 0, 0, 'class:redirect', 0, '', 67, 68, 0, '*', 1),
(18, 'main', 'com_finder', 'Smart Search', '', 'Smart Search', 'index.php?option=com_finder', 'component', 1, 1, 1, 27, 0, '0000-00-00 00:00:00', 0, 0, 'class:finder', 0, '', 71, 72, 0, '*', 1),
(20, 'main', 'com_tags', 'Tags', '', 'Tags', 'index.php?option=com_tags', 'component', 1, 1, 1, 29, 0, '0000-00-00 00:00:00', 0, 1, 'class:tags', 0, '', 75, 76, 0, '', 1),
(247, 'main', 'AcyMailing', 'acymailing', '', 'acymailing', 'index.php?option=com_acymailing', 'component', 1, 1, 1, 10011, 0, '0000-00-00 00:00:00', 0, 1, '../media/com_acymailing/images/icons/icon-16-acymailing.png', 0, '{}', 175, 190, 0, '', 1),
(238, 'main', 'COM_JAEXTMANAGER', 'com-jaextmanager', '', 'com-jaextmanager', 'index.php?option=com_jaextmanager', 'component', 1, 1, 1, 10053, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_jaextmanager/assets/images/jauc.png', 0, '{}', 173, 174, 0, '', 1),
(219, 'main', 'COM_K2', 'com-k2', '', 'com-k2', 'index.php?option=com_k2', 'component', 1, 1, 1, 10029, 0, '0000-00-00 00:00:00', 0, 1, '../media/k2/assets/images/backend/k2_logo_16x16.png', 0, '{}', 151, 172, 0, '', 1),
(218, 'main', 'com_associations', 'multilingual-associations', '', 'multilingual-associations', 'index.php?option=com_associations', 'component', 1, 1, 1, 34, 0, '0000-00-00 00:00:00', 0, 1, 'class:associations', 0, '{}', 149, 150, 0, '*', 1),
(3, 'main', 'com_banners', 'Banners', '', 'Banners/Banners', 'index.php?option=com_banners', 'component', 1, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 2, 3, 0, '*', 1),
(4, 'main', 'com_banners_categories', 'Categories', '', 'Banners/Categories', 'index.php?option=com_categories&extension=com_banners', 'component', 1, 2, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-cat', 0, '', 4, 5, 0, '*', 1),
(5, 'main', 'com_banners_clients', 'Clients', '', 'Banners/Clients', 'index.php?option=com_banners&view=clients', 'component', 1, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-clients', 0, '', 6, 7, 0, '*', 1),
(6, 'main', 'com_banners_tracks', 'Tracks', '', 'Banners/Tracks', 'index.php?option=com_banners&view=tracks', 'component', 1, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-tracks', 0, '', 8, 9, 0, '*', 1),
(9, 'main', 'com_contact_categories', 'Categories', '', 'Contacts/Categories', 'index.php?option=com_categories&extension=com_contact', 'component', 1, 7, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact-cat', 0, '', 54, 55, 0, '*', 1),
(8, 'main', 'com_contact_contacts', 'Contacts', '', 'Contacts/Contacts', 'index.php?option=com_contact', 'component', 1, 7, 2, 8, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 52, 53, 0, '*', 1),
(11, 'main', 'com_messages_add', 'New Private Message', '', 'Messaging/New Private Message', 'index.php?option=com_messages&task=message.add', 'component', 1, 10, 2, 15, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages-add', 0, '', 58, 59, 0, '*', 1),
(15, 'main', 'com_newsfeeds_categories', 'Categories', '', 'News Feeds/Categories', 'index.php?option=com_categories&extension=com_newsfeeds', 'component', 1, 13, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds-cat', 0, '', 64, 65, 0, '*', 1),
(14, 'main', 'com_newsfeeds_feeds', 'Feeds', '', 'News Feeds/Feeds', 'index.php?option=com_newsfeeds', 'component', 1, 13, 2, 17, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 62, 63, 0, '*', 1),
(221, 'main', 'K2_CATEGORIES', 'k2-categories', '', 'com-k2/k2-categories', 'index.php?option=com_k2&view=categories', 'component', 1, 219, 2, 10029, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 154, 155, 0, '', 1),
(223, 'main', 'K2_COMMENTS', 'k2-comments', '', 'com-k2/k2-comments', 'index.php?option=com_k2&view=comments', 'component', 1, 219, 2, 10029, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 158, 159, 0, '', 1),
(227, 'main', 'K2_EXTRA_FIELD_GROUPS', 'k2-extra-field-groups', '', 'com-k2/k2-extra-field-groups', 'index.php?option=com_k2&view=extrafieldsgroups', 'component', 1, 219, 2, 10029, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 166, 167, 0, '', 1),
(226, 'main', 'K2_EXTRA_FIELDS', 'k2-extra-fields', '', 'com-k2/k2-extra-fields', 'index.php?option=com_k2&view=extrafields', 'component', 1, 219, 2, 10029, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 164, 165, 0, '', 1),
(229, 'main', 'K2_INFORMATION', 'k2-information', '', 'com-k2/k2-information', 'index.php?option=com_k2&view=info', 'component', 1, 219, 2, 10029, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 170, 171, 0, '', 1),
(220, 'main', 'K2_ITEMS', 'k2-items', '', 'com-k2/k2-items', 'index.php?option=com_k2&view=items', 'component', 1, 219, 2, 10029, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 152, 153, 0, '', 1),
(228, 'main', 'K2_MEDIA_MANAGER', 'k2-media-manager', '', 'com-k2/k2-media-manager', 'index.php?option=com_k2&view=media', 'component', 1, 219, 2, 10029, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 168, 169, 0, '', 1),
(222, 'main', 'K2_TAGS', 'k2-tags', '', 'com-k2/k2-tags', 'index.php?option=com_k2&view=tags', 'component', 1, 219, 2, 10029, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 156, 157, 0, '', 1),
(225, 'main', 'K2_USER_GROUPS', 'k2-user-groups', '', 'com-k2/k2-user-groups', 'index.php?option=com_k2&view=usergroups', 'component', 1, 219, 2, 10029, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 162, 163, 0, '', 1),
(224, 'main', 'K2_USERS', 'k2-users', '', 'com-k2/k2-users', 'index.php?option=com_k2&view=users', 'component', 1, 219, 2, 10029, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 160, 161, 0, '', 1),
(254, 'main', 'Configuration', 'configuration', '', 'acymailing/configuration', 'index.php?option=com_acymailing&ctrl=cpanel', 'component', 1, 247, 2, 10011, 0, '0000-00-00 00:00:00', 0, 1, '../media/com_acymailing/images/icons/icon-16-acyconfig.png', 0, '{}', 188, 189, 0, '', 1),
(249, 'main', 'Lists', 'lists', '', 'acymailing/lists', 'index.php?option=com_acymailing&ctrl=list', 'component', 1, 247, 2, 10011, 0, '0000-00-00 00:00:00', 0, 1, '../media/com_acymailing/images/icons/icon-16-acylist.png', 0, '{}', 178, 179, 0, '', 1),
(250, 'main', 'Newsletters', 'newsletters', '', 'acymailing/newsletters', 'index.php?option=com_acymailing&ctrl=newsletter', 'component', 1, 247, 2, 10011, 0, '0000-00-00 00:00:00', 0, 1, '../media/com_acymailing/images/icons/icon-16-newsletter.png', 0, '{}', 180, 181, 0, '', 1),
(252, 'main', 'Queue', 'queue', '', 'acymailing/queue', 'index.php?option=com_acymailing&ctrl=queue', 'component', 1, 247, 2, 10011, 0, '0000-00-00 00:00:00', 0, 1, '../media/com_acymailing/images/icons/icon-16-process.png', 0, '{}', 184, 185, 0, '', 1),
(253, 'main', 'Statistics', 'statistics', '', 'acymailing/statistics', 'index.php?option=com_acymailing&ctrl=stats', 'component', 1, 247, 2, 10011, 0, '0000-00-00 00:00:00', 0, 1, '../media/com_acymailing/images/icons/icon-16-stats.png', 0, '{}', 186, 187, 0, '', 1),
(251, 'main', 'Templates', 'templates', '', 'acymailing/templates', 'index.php?option=com_acymailing&ctrl=template', 'component', 1, 247, 2, 10011, 0, '0000-00-00 00:00:00', 0, 1, '../media/com_acymailing/images/icons/icon-16-acytemplate.png', 0, '{}', 182, 183, 0, '', 1),
(248, 'main', 'Users', 'users', '', 'acymailing/users', 'index.php?option=com_acymailing&ctrl=subscriber', 'component', 1, 247, 2, 10011, 0, '0000-00-00 00:00:00', 0, 1, '../media/com_acymailing/images/icons/icon-16-users.png', 0, '{}', 176, 177, 0, '', 1);
INSERT IGNORE INTO `#__menu` (`id`, `menutype`, `title`, `alias`, `note`, `path`, `link`, `type`, `published`, `parent_id`, `level`, `component_id`, `checked_out`, `checked_out_time`, `browserNav`, `access`, `img`, `template_style_id`, `params`, `lft`, `rgt`, `home`, `language`, `client_id`) VALUES
(1, '', 'Menu_Item_Root', 'root', '', '', '', '', 1, 0, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, '', 0, '', 0, 283, 0, '*', 0),
(101, 'mainmenu', 'Home', 'home', '', 'home', 'index.php?option=com_content&view=featured', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"num_leading_articles":"1","num_intro_articles":"3","num_columns":"3","num_links":"0","orderby_pri":"","orderby_sec":"front","order_date":"","multi_column_order":"1","show_pagination":"2","show_pagination_results":"1","show_noauth":"","article-allow_ratings":"","article-allow_comments":"","show_feed_link":"1","feed_summary":"","show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_readmore":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","show_page_heading":1,"page_title":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 39, 40, 1, '*', 0);

DROP TABLE IF EXISTS `#__menu_types`;
CREATE TABLE `#__menu_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT 0,
  `menutype` varchar(24) NOT NULL,
  `title` varchar(48) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  `client_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_menutype` (`menutype`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `#__menu_types` (`id`, `asset_id`, `menutype`, `title`, `description`, `client_id`) VALUES
(1, 0, 'mainmenu', 'Main Menu', 'The main menu for the site', 0),
(2, 0, 'top-menu', 'Top Menu', '', 0),
(3, 0, 'k2', 'K2', '', 0);

DROP TABLE IF EXISTS `#__messages`;
CREATE TABLE `#__messages` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id_from` int(10) unsigned NOT NULL DEFAULT 0,
  `user_id_to` int(10) unsigned NOT NULL DEFAULT 0,
  `folder_id` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` tinyint(1) NOT NULL DEFAULT 0,
  `priority` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` mediumtext NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__messages_cfg`;
CREATE TABLE `#__messages_cfg` (
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `cfg_name` varchar(100) NOT NULL DEFAULT '',
  `cfg_value` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__modules`;
CREATE TABLE `#__modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'FK to the #__assets table.',
  `title` varchar(100) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `position` varchar(50) NOT NULL DEFAULT '',
  `checked_out` int(10) unsigned NOT NULL DEFAULT 0,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT 0,
  `module` varchar(50) DEFAULT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT 0,
  `showtitle` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `params` mediumtext NOT NULL,
  `client_id` tinyint(4) NOT NULL DEFAULT 0,
  `language` char(7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8;

INSERT INTO `#__modules` (`id`, `asset_id`, `title`, `note`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `published`, `module`, `access`, `showtitle`, `params`, `client_id`, `language`) VALUES
(1, 39, 'Sub Nav', '', '', 1, 'subnav', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 1, '{"menutype":"top-menu","base":"","startLevel":"1","endLevel":"1","showAllChildren":"0","tag_id":"","class_sfx":" nav-pills","window_open":"","layout":"ja_directory:carousel","moduleclass_sfx":"_menu","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","module-intro":"","full-width":"1"}', 0, '*'),
(2, 40, 'Login', '', '', 1, 'login', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_login', 1, 1, '', 1, '*'),
(3, 41, 'Popular Articles', '', '', 3, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_popular', 3, 1, '{"count":"5","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0","automatic_title":"1"}', 1, '*'),
(4, 42, 'Recently Added Articles', '', '', 4, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_latest', 3, 1, '{"count":"5","ordering":"c_dsc","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0","automatic_title":"1"}', 1, '*'),
(8, 43, 'Toolbar', '', '', 1, 'toolbar', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_toolbar', 3, 1, '', 1, '*'),
(9, 44, 'Quick Icons', '', '', 1, 'icon', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_quickicon', 3, 1, '', 1, '*'),
(10, 45, 'Logged-in Users', '', '', 2, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_logged', 3, 1, '{"count":"5","name":"1","layout":"_:default","moduleclass_sfx":"","cache":"0","automatic_title":"1"}', 1, '*'),
(12, 46, 'Admin Menu', '', '', 1, 'menu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 3, 1, '{"layout":"","moduleclass_sfx":"","shownew":"1","showhelp":"1","cache":"0"}', 1, '*'),
(13, 47, 'Admin Submenu', '', '', 1, 'submenu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_submenu', 3, 1, '', 1, '*'),
(14, 48, 'User Status', '', '', 2, 'status', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_status', 3, 1, '', 1, '*'),
(15, 49, 'Title', '', '', 1, 'title', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_title', 3, 1, '', 1, '*'),
(16, 50, 'Login Form', '', '', 7, 'position-7', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_login', 1, 1, '{"greeting":"1","name":"0"}', 0, '*'),
(17, 51, 'Breadcrumbs', '', '', 1, 'position-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_breadcrumbs', 1, 1, '{"moduleclass_sfx":"","showHome":"1","homeText":"","showComponent":"1","separator":"","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(79, 52, 'Multilanguage status', '', '', 1, 'status', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_multilangstatus', 3, 1, '{"layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(86, 53, 'Joomla Version', '', '', 1, 'footer', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_version', 3, 1, '{"format":"short","product":"1","layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(87, 55, 'Download the directory app', '', '', 1, 'section-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_ja_acm', 1, 1, '{"jatools-config":"{\\":type\\":\\"ja_directory:cta\\",\\"cta\\":{\\"jatools-layout-cta\\":\\"style-1\\",\\"cta[block-intro]\\":[\\"((p))Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat vel illum dolore eu feugiat nulla facilisis at vero placerat facer possim assum.((\\/p))\\\\n((p))Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat vel illum dolore eu.((\\/p))\\"],\\"cta[block-extra-class]\\":[\\" section-primary no-padding\\"],\\"cta[img]\\":[\\"images\\/joomlart\\/bg-1.jpg\\"],\\"cta[data]\\":{\\"cta[data][button]\\":[\\"Download The app\\"],\\"cta[data][link]\\":[\\"#\\"],\\"cta[data][button_class]\\":[\\"btn-default btn-icon-left\\"],\\"cta[data][btn-icon]\\":[\\"fa fa-download\\"],\\"rows\\":1,\\"cols\\":5,\\"type\\":\\"list\\"}}}","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","module-intro":"","full-width":"1"}', 0, '*'),
(88, 56, 'Pricing', '', '', 2, 'section-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_ja_acm', 1, 0, '{"jatools-config":"{\\":type\\":\\"ja_directory:pricing\\",\\"pricing\\":{\\"jatools-layout-pricing\\":\\"style-1\\",\\"pricing[block-bg]\\":[\\"\\"],\\"pricing[data]\\":{\\"pricing[data][pricing-col-name]\\":[\\"Platinum Package \\",\\"Gold Package \\",\\"Silver Package \\"],\\"pricing[data][pricing-col-price]\\":[\\"((sup))$((\\/sup))20((sub))\\/month((\\/sub))\\",\\"((sup))$((\\/sup))40((sub))\\/month((\\/sub))\\",\\"((sup))$((\\/sup))10((sub))\\/month((\\/sub))\\"],\\"pricing[data][pricing-col-featured]\\":[\\"0\\",\\"1\\",\\"0\\"],\\"pricing[data][pricing-col-button]\\":[\\"Sign Up\\",\\"Sign Up\\",\\"Sign Up\\"],\\"pricing[data][pricing-col-buttonlink]\\":[\\"index.php?option=com_users&view=registration&Itemid=551\\",\\"index.php?option=com_users&view=registration&Itemid=551\\",\\"index.php?option=com_users&view=registration&Itemid=551\\"],\\"data\\":[[\\"Unlimited bandwidth\\",\\"b1\\",\\"b1\\",\\"b1\\"],[\\"Unlimited products\\",\\"b1\\",\\"b1\\",\\"b1\\"],[\\"1 GB File storage\\",\\"b1\\",\\"b1\\",\\"b0\\"],[\\"2.0% Transaction fee\\",\\"b1\\",\\"b1\\",\\"b1\\"],[\\"Professional reports\\",\\"b0\\",\\"b1\\",\\"b1\\"]],\\"rows\\":5,\\"cols\\":3,\\"type\\":\\"table\\"}}}","moduleclass_sfx":"  section-grey","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"Ja_directory-T3section","module-intro":"","full-width":"1"}', 0, '*'),
(89, 57, 'Clients', '', '', 3, 'section-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_ja_acm', 1, 0, '{"jatools-config":"{\\":type\\":\\"ja_directory:clients\\",\\"clients\\":{\\"jatools-layout-clients\\":\\"style-1\\",\\"clients[acm-style]\\":[\\"style-light\\"],\\"clients[full-width]\\":[\\"0\\"],\\"clients[img-gray]\\":[\\"0\\"],\\"clients[img-opacity]\\":[\\"100\\"],\\"clients[client-item]\\":{\\"clients[client-item][client-logo]\\":[\\"images\\/joomlart\\/clients\\/client-1.png\\",\\"images\\/joomlart\\/clients\\/client-2.png\\",\\"images\\/joomlart\\/clients\\/client-3.png\\",\\"images\\/joomlart\\/clients\\/client-4.png\\",\\"images\\/joomlart\\/clients\\/client-5.png\\",\\"images\\/joomlart\\/clients\\/client-3.png\\",\\"images\\/joomlart\\/clients\\/client-1.png\\",\\"images\\/joomlart\\/clients\\/client-2.png\\"],\\"clients[client-item][client-name]\\":[\\"Oracle\\",\\"Microsoft\\",\\"Composite\\",\\"HubSpot\\",\\"Google\\",\\"Composite\\",\\"Oracle\\",\\"Microsoft\\"],\\"clients[client-item][client-link]\\":[\\"#\\",\\"#\\",\\"#\\",\\"#\\",\\"#\\",\\"#\\",\\"#\\",\\"\\"],\\"rows\\":8,\\"cols\\":4,\\"type\\":\\"list\\"}}}","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"Ja_directory-T3section","module-intro":"","full-width":"1"}', 0, '*'),
(90, 58, 'JA Twitter Module', '', '', 4, 'section-2', 42, '2015-06-10 09:46:50', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_jatwitter', 1, 0, '{"consumer_key":"e4Ut8yKKsS5n9SSPiIh0vmSBG","consumer_secret":"qjk7arSnRyXFBI6UILd1THOyDc5HkBj846gQMu9TvtqXL0hQrV","oauth_access_token":"23945995-WVs2xAH9UFP3msfWSFgqkwmzzcGyB9V2y0sHLqpfv","oauth_access_token_secret":"g7xF95WbE8eJwmN0IMKHBbPWOpZSS1K2TYK0dxWMgZ7m2","taccount":"Joomlart","use_display_taccount":"0","size_iconaccount":"48","show_tweet":"1","show_limit":1,"show_icon":"0","icon_size":30,"show_username":"0","show_source":"0","showtextheading":"0","headingtext":"My Twitter Updates","use_friends":"0","size_iconfriend":"24","max_friends":"10","showfollowlink":"1","typefollowbutton":"simple","style_of_follow_button":"none","data-show-count":"false","data-lang":"en","data-width":"","data-align":"left","data-show-screen-name":"false","moduleclass_sfx":"","cache":"1","cache_time":900,"module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","module-intro":"","full-width":"0"}', 0, '*'),
(91, 60, 'Get Latest Updates ', '', '', 1, 'footer-1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_acymailing', 1, 1, '{"effect":"normal","lists":"None","hiddenlists":"All","displaymode":"inline","listschecked":"All","checkmode":"0","dropdown":"0","overlay":"0","link":"1","listposition":"before","customfields":"email","nametext":"","emailtext":"","fieldsize":"100%","displayfields":"0","introtext":"","finaltext":"","showsubscribe":"1","subscribetext":"Go","subscribetextreg":"","showunsubscribe":"0","unsubscribetext":"","redirectmode":"0","redirectlink":"","redirectlinkunsub":"","showterms":"0","showtermspopup":"1","termscontent":"0","mootoolsintro":"","mootoolsbutton":"","boxwidth":"400","boxheight":"400","moduleclass_sfx":"","textalign":"none","loggedin":"1","cache":"0","includejs":"header","itemid":"","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","module-intro":"","full-width":"1"}', 0, '*'),
(92, 61, 'Quick Contact', '', '<div class="ja-quick-contact">\r\n<ul>\r\n<li><i class="fa fa-envelope-o"></i> info@jadirectory.com</li> \r\n<li><i class="fa fa-phone"></i> +1-202-555-0105</li>\r\n</ul>\r\n</div>', 1, 'footer-3', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","module-intro":"","full-width":"1"}', 0, '*'),
(93, 62, 'Connect With Us', '', '', 1, 'footer-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_ja_acm', 1, 1, '{"jatools-config":"{\\":type\\":\\"ja_directory:follow\\",\\"follow\\":{\\"jatools-layout-follow\\":\\"style-1\\",\\"follow[facebook]\\":[\\"joomlart\\"],\\"follow[google-plus]\\":[\\"joomlart\\"],\\"follow[twitter]\\":[\\"joomlart\\"],\\"follow[pinterest]\\":[\\"joomlart\\"],\\"follow[linkedin]\\":[\\"joom-solutions\\"]}}","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","module-intro":"","full-width":"1"}', 0, '*'),
(94, 63, 'Masthead', '', '', 1, 'masthead', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_jamasshead', 1, 1, '{"default-title":"Directory","default-description":"Responsive Joomla Template For Directory","config":"[Masshead Itemid=\\"127\\" title=\\"About Us\\" background=\\"images\\/joomlart\\/bg-masthead.jpg\\"]Home :: About Us[\\/Masshead]\\r\\n\\r\\n[Masshead Itemid=\\"129\\" title=\\"Users\\" background=\\"images\\/joomlart\\/bg-masthead.jpg\\"]Home :: Users[\\/Masshead]\\r\\n\\r\\n[Masshead Itemid=\\"148\\" title=\\"News\\" background=\\"images\\/joomlart\\/bg-masthead.jpg\\"]Home :: News [\\/Masshead]\\r\\n\\r\\n[Masshead Itemid=\\"147,110,111,112,113,114,115,116\\" title=\\"All in One Map\\" background=\\"images\\/joomlart\\/bg-masthead.jpg\\"]Home :: All in One Map [\\/Masshead]\\r\\n[Masshead Itemid=\\"173\\" title=\\"All in One Map\\" background=\\"images\\/joomlart\\/bg-masthead.jpg\\"]Tag :: Hospitals [\\/Masshead]\\r\\n [Masshead Itemid=\\"175\\" title=\\"All in One Map\\" background=\\"images\\/joomlart\\/bg-masthead.jpg\\"]Tag :: Kindergarten [\\/Masshead]\\r\\n[Masshead Itemid=\\"176\\" title=\\"All in One Map\\" background=\\"images\\/joomlart\\/bg-masthead.jpg\\"]Tag :: Restaurant [\\/Masshead]\\r\\n[Masshead Itemid=\\"177\\" title=\\"All in One Map\\" background=\\"images\\/joomlart\\/bg-masthead.jpg\\"]Tag :: Playgrounds [\\/Masshead]\\r\\n[Masshead Itemid=\\"178\\" title=\\"All in One Map\\" background=\\"images\\/joomlart\\/bg-masthead.jpg\\"]Tag :: Medical [\\/Masshead]\\r\\n[Masshead Itemid=\\"179\\" title=\\"All in One Map\\" background=\\"images\\/joomlart\\/bg-masthead.jpg\\"]Tag :: Shopping [\\/Masshead]\\r\\n[Masshead Itemid=\\"180\\" title=\\"All in One Map\\" background=\\"images\\/joomlart\\/bg-masthead.jpg\\"]Tag :: School [\\/Masshead]\\r\\n[Masshead Itemid=\\"181\\" title=\\"All in One Map\\" background=\\"images\\/joomlart\\/bg-masthead.jpg\\"]Tag :: Directory [\\/Masshead]\\r\\n[Masshead Itemid=\\"182\\" title=\\"All in One Map\\" background=\\"images\\/joomlart\\/bg-masthead.jpg\\"]Tag :: Park [\\/Masshead]\\r\\n[Masshead Itemid=\\"183\\" title=\\"All in One Map\\" background=\\"images\\/joomlart\\/bg-masthead.jpg\\"]Tag :: Club [\\/Masshead]\\r\\n[Masshead Itemid=\\"184\\" title=\\"All in One Map\\" background=\\"images\\/joomlart\\/bg-masthead.jpg\\"]Tag :: Food [\\/Masshead]\\r\\n[Masshead Itemid=\\"185\\" title=\\"All in One Map\\" background=\\"images\\/joomlart\\/bg-masthead.jpg\\"]Tag :: Brand [\\/Masshead]\\r\\n[Masshead Itemid=\\"169\\" title=\\"All in One Map\\" background=\\"images\\/joomlart\\/bg-masthead.jpg\\"]User :: Supper User [\\/Masshead]\\r\\n[Masshead Itemid=\\"130\\" title=\\"Login\\" background=\\"images\\/joomlart\\/bg-masthead.jpg\\"]Home :: Login [\\/Masshead]\\r\\n\\r\\n[Masshead Itemid=\\"171\\" title=\\"Logout\\" background=\\"images\\/joomlart\\/bg-masthead.jpg\\"]Home :: Logout [\\/Masshead]\\r\\n\\r\\n[Masshead Itemid=\\"131\\" title=\\"Register\\" background=\\"images\\/joomlart\\/bg-masthead.jpg\\"]Home :: Register [\\/Masshead]\\r\\n\\r\\n[Masshead Itemid=\\"109\\" title=\\"Contact\\" background=\\"images\\/joomlart\\/bg-masthead-ct.jpg\\"]Home :: Contact [\\/Masshead]\\r\\n\\r\\n[Masshead option=\\"com_k2\\" title=\\"Directory Details\\" background=\\"images\\/joomlart\\/bg-masthead.jpg\\"]All in One Map :: Details [\\/Masshead]\\r\\n\\r\\n[Masshead Itemid=\\"161\\" title=\\"Search\\" background=\\"images\\/joomlart\\/bg-masthead.jpg\\"]Home :: J! Pages :: Search [\\/Masshead]\\r\\n\\r\\n[Masshead Itemid=\\"162\\" title=\\"Advanced Search\\" background=\\"images\\/joomlart\\/bg-masthead.jpg\\"]Home :: J! Pages :: Advanced Search [\\/Masshead]\\r\\n\\r\\n[Masshead Itemid=\\"164\\" title=\\"Offline Page\\" background=\\"images\\/joomlart\\/bg-masthead.jpg\\"]Home :: J! Pages :: Offline Page [\\/Masshead]\\r\\n\\r\\n[Masshead Itemid=\\"165\\" title=\\"404 Page\\" background=\\"images\\/joomlart\\/bg-masthead.jpg\\"]Home :: J! Pages :: 404 Page [\\/Masshead]\\r\\n\\r\\n[Masshead Itemid=\\"163\\" title=\\"Tagged Items\\" background=\\"images\\/joomlart\\/bg-masthead.jpg\\"]Home :: J! Pages :: Tagged Items [\\/Masshead]\\r\\n\\r\\n[Masshead Itemid=\\"168\\" title=\\"K2\\" background=\\"images\\/joomlart\\/bg-masthead.jpg\\"]Home :: K2 [\\/Masshead]","layout":"_:default","moduleclass_sfx":"","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","module-intro":"","full-width":"1"}', 0, '*'),
(95, 65, 'Top Comments', '', '', 1, 'position-3', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_k2_comments', 1, 1, '{"moduleclass_sfx":"","module_usage":"0","catfilter":"0","comments_limit":"2","comments_word_limit":"10","commenterName":"0","commentAvatar":"1","commentAvatarWidthSelect":"custom","commentAvatarWidth":"50","commentDate":"0","commentDateFormat":"absolute","commentLink":"0","itemTitle":"1","itemCategory":"0","feed":"0","commenters_limit":"2","commenterNameOrUsername":"1","commenterAvatar":"0","commenterAvatarWidthSelect":"custom","commenterAvatarWidth":"50","commenterLink":"1","commenterCommentsCounter":"1","commenterLatestComment":"1","cache":"1","cache_time":"900","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","module-intro":"","full-width":"1"}', 0, '*'),
(96, 66, 'Popular Listing ', '', '', 1, 'position-1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_k2_content', 1, 1, '{"moduleclass_sfx":"","getTemplate":"Listing","source":"filter","catfilter":"0","getChildren":"0","itemCount":"3","itemsOrdering":"best","FeaturedItems":"1","popularityRange":"","videosOnly":"0","item":"0","itemTitle":"1","itemAuthor":"0","itemAuthorAvatar":"0","itemAuthorAvatarWidthSelect":"custom","itemAuthorAvatarWidth":"50","userDescription":"0","itemIntroText":"0","itemIntroTextWordLimit":"","itemImage":"1","itemImgSize":"Small","itemVideo":"0","itemVideoCaption":"0","itemVideoCredits":"0","itemAttachments":"0","itemTags":"0","itemCategory":"0","itemDateCreated":"1","itemHits":"1","itemReadMore":"0","itemExtraFields":"0","itemCommentsCounter":"1","feed":"0","itemPreText":"","itemCustomLink":"0","itemCustomLinkTitle":"","itemCustomLinkURL":"http:\\/\\/","itemCustomLinkMenuItem":"101","K2Plugins":"1","JPlugins":"1","cache":"1","cache_time":"900","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","module-intro":"","full-width":"1"}', 0, '*'),
(97, 67, 'Browse Listings By Categories', '', '', 2, 'section-1', 42, '2017-10-20 03:45:40', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_k2_tools', 1, 1, '{"moduleclass_sfx":"","module_usage":"8","archiveItemsCounter":"1","archiveCategory":"8","authors_module_category":"0","authorItemsCounter":"0","authorAvatar":"1","authorAvatarWidthSelect":"custom","authorAvatarWidth":"50","authorLatestItem":"1","calendarCategory":"0","home":"","seperator":"","root_id":"8","end_level":"2","categoriesListOrdering":"","categoriesListItemsCounter":"0","root_id2":"0","catfilter":"0","getChildren":"0","liveSearch":"0","text":"","button":"0","imagebutton":"0","button_text":"","searchItemId":"","min_size":"75","max_size":"300","cloud_limit":"30","cloud_category":["0"],"cloud_category_recursive":"0","customCode":"<?php require (JModuleHelper::getLayoutPath(\'mod_k2_tools\', \'customcategories\'));","parsePhp":"1","K2Plugins":"1","JPlugins":"0","cache":"1","cache_time":"900","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"Ja_directory-T3section","module-intro":"Some content will be apear here","full-width":"false"}', 0, '*'),
(98, 68, 'K2 Users', '', '', 1, 'sidebar-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_k2_users', 1, 1, '{"moduleclass_sfx":"","getTemplate":"Default","source":"filter","filter":"1","ordering":"alpha","limit":"4","userName":"1","userAvatar":"1","userAvatarWidthSelect":"custom","userAvatarWidth":"50","userDescription":"1","userDescriptionWordLimit":"","userURL":"1","userEmail":"0","userFeed":"1","userItemCount":"1","cache":"1","cache_time":"900","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","module-intro":"","full-width":"1"}', 0, '*'),
(99, 69, 'K2 User', '', '', 1, 'sidebar-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_k2_user', 1, 1, '{"moduleclass_sfx":"","pretext":"","posttext":"","userGreetingText":"","name":"1","userAvatar":"1","userAvatarWidthSelect":"custom","userAvatarWidth":"50","menu":"","login":"101","logout":"101","usesecure":"0","cache":"0","cache_time":"900","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","module-intro":"","full-width":"1"}', 0, '*'),
(100, 70, 'K2 Quick Icons (admin)', '', '', 0, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_k2_quickicons', 1, 1, '', 1, '*'),
(101, 71, 'K2 Stats (admin)', '', '', 0, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_k2_stats', 1, 1, '', 1, '*'),
(103, 74, 'Welcome to Directory', '', '', 5, 'section-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_ja_acm', 1, 1, '{"jatools-config":"{\\":type\\":\\"ja_directory:cta\\",\\"cta\\":{\\"jatools-layout-cta\\":\\"style-2\\",\\"cta[block-intro]\\":[\\"Efficiently unleash cross-media information without cross-media value. Quickly maximize timely deliverables for real-time schemas. Dramatically maintain clicks-and-mortar solutions without functional solutions. \\\\n((br\\/))((br\\/))\\\\nProfessionally cultivate one-to-one customer service with robust ideas. Dynamically innovate resource-leveling customer service for state of the art customer service. \\"],\\"cta[block-extra-class]\\":[\\" text-left\\"],\\"cta[img]\\":[\\"images\\/joomlart\\/about-us.jpg\\"],\\"cta[data]\\":{\\"cta[data][button]\\":[\\"Meet our team\\"],\\"cta[data][link]\\":[\\"#\\"],\\"cta[data][button_class]\\":[\\"btn-inverse btn-icon-left\\"],\\"cta[data][btn-icon]\\":[\\"fa fa-angle-right\\"],\\"rows\\":1,\\"cols\\":5,\\"type\\":\\"list\\"}}}","moduleclass_sfx":" container","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","module-intro":""}', 0, '*'),
(104, 75, '[About-us] Features', '', '', 6, 'section-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_ja_acm', 1, 0, '{"jatools-config":"{\\":type\\":\\"ja_directory:features-intro\\",\\"features-intro\\":{\\"jatools-layout-features-intro\\":\\"style-1\\",\\"features-intro[features-style]\\":[\\"style-light\\"],\\"features-intro[full-width]\\":[\\"0\\"],\\"features-intro[columns]\\":[\\"3\\"],\\"features-intro[align]\\":[\\"text-center\\"],\\"features-intro[data]\\":{\\"features-intro[data][font-icon]\\":[\\"\\",\\"\\",\\"\\"],\\"features-intro[data][img-icon]\\":[\\"images\\/joomlart\\/icon-features\\/icon-1.png\\",\\"images\\/joomlart\\/icon-features\\/icon-2.png\\",\\"images\\/joomlart\\/icon-features\\/icon-3.png\\"],\\"features-intro[data][title]\\":[\\"Our Mission\\",\\"Our Vision\\",\\"Awards\\"],\\"features-intro[data][description]\\":[\\"Fusce blandit eget augue at efficitur. Cras at neque lobortis, eleifend nibh vitae, laoreet eros. Sed faucibus fringilla orci.\\",\\"Nam fermentum, leo ac ornare sodales, purus elit pretium diam, at convallis quam nisl vel ex. Ut in porttitor mauris.\\",\\"Pellentesque vel enim ex. Aenean sodales mi eget nisi facilisis convallis. Sed ac consectetur elit. Aliquam erat volutpat.\\"],\\"rows\\":3,\\"cols\\":5,\\"type\\":\\"list\\"}}}","moduleclass_sfx":"  section-grey","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"Ja_directory-T3section","module-intro":"","full-width":"1"}', 0, '*'),
(105, 76, '[About-us] Stastics', '', '', 9, 'section-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_ja_acm', 1, 0, '{"jatools-config":"{\\":type\\":\\"ja_directory:statistics\\",\\"statistics\\":{\\"jatools-layout-statistics\\":\\"style-1\\",\\"statistics[acm-style]\\":[\\"style-light\\"],\\"statistics[full-width]\\":[\\"0\\"],\\"statistics[data-style-2]\\":{\\"statistics[data-style-2][font-icon]\\":[\\"\\",\\"\\",\\"\\",\\"\\"],\\"statistics[data-style-2][img-icon]\\":[\\"images\\/joomlart\\/icon-features\\/icon-4.png\\",\\"images\\/joomlart\\/icon-features\\/icon-5.png\\",\\"images\\/joomlart\\/icon-features\\/icon-6.png\\",\\"images\\/joomlart\\/icon-features\\/icon-7.png\\"],\\"statistics[data-style-2][stats-count]\\":[\\"280\\",\\"200\\",\\"996688\\",\\"546\\"],\\"statistics[data-style-2][stats-name]\\":[\\"Client Work\\",\\"Projects Completed\\",\\"Lines Of Code Written\\",\\"Ideas Created\\"],\\"statistics[data-style-2][stats-color]\\":[\\"\\",\\"\\",\\"\\",\\"\\"],\\"rows\\":4,\\"cols\\":6,\\"type\\":\\"list\\"}}}","moduleclass_sfx":"  section-grey sm-padding","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"Ja_directory-T3section","module-intro":"","full-width":"1"}', 0, '*'),
(107, 80, 'Our Team', '', '', 8, 'section-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_ja_acm', 1, 1, '{"jatools-config":"{\\":type\\":\\"ja_directory:teams\\",\\"teams\\":{\\"jatools-layout-teams\\":\\"style-1\\",\\"team_about[block-extra-class]\\":[\\"\\"],\\"team_about[block-bg]\\":[\\"\\"],\\"team_about[number_col]\\":[\\"6\\"],\\"team_about[full-width]\\":[\\"0\\"],\\"team_about[member-image]\\":[\\"images\\/joomlart\\/our-team\\/mem-1.jpg\\",\\"images\\/joomlart\\/our-team\\/mem-2.jpg\\",\\"images\\/joomlart\\/our-team\\/mem-3.jpg\\",\\"images\\/joomlart\\/our-team\\/mem-4.jpg\\",\\"images\\/joomlart\\/our-team\\/mem-5.jpg\\",\\"images\\/joomlart\\/our-team\\/mem-7.jpg\\",\\"images\\/joomlart\\/our-team\\/mem-8.jpg\\",\\"images\\/joomlart\\/our-team\\/mem-6.jpg\\"],\\"team_about[member-name]\\":[\\"Dewey Hall\\",\\"Lorenzo Pope\\",\\"Perry Larson\\",\\"Darren Klein\\",\\"Caleb Phillips\\",\\"Pedro Frank\\",\\"Darren Klein\\",\\" Julian Byrd\\"],\\"team_about[member-position]\\":[\\"Interaction Designer\\",\\"Interaction Designer\\",\\"CEO\\",\\"Experience Designer\\",\\"Chief Creative Officer\\",\\"Director of Events\\",\\"Leader\\",\\"Design Director\\"],\\"team_about[member-desc]\\":[\\"In ut cursus tellus. Nulla velit mi, pellentesque sit amet maximus id, accumsan et eros. Pellentesque at scelerisque quam. Morbi in eros efficitur, vehicula velit ac, fringilla est\\",\\"In ut cursus tellus. Nulla velit mi, pellentesque sit amet maximus id, accumsan et eros. Pellentesque at scelerisque quam. Morbi in eros efficitur, vehicula velit ac, fringilla est\\",\\"In ut cursus tellus. Nulla velit mi, pellentesque sit amet maximus id, accumsan et eros. Pellentesque at scelerisque quam. Morbi in eros efficitur, vehicula velit ac, fringilla est\\",\\"In ut cursus tellus. Nulla velit mi, pellentesque sit amet maximus id, accumsan et eros. Pellentesque at scelerisque quam. Morbi in eros efficitur, vehicula velit ac, fringilla est\\",\\"In ut cursus tellus. Nulla velit mi, pellentesque sit amet maximus id, accumsan et eros. Pellentesque at scelerisque quam. Morbi in eros efficitur, vehicula velit ac, fringilla est\\",\\"In ut cursus tellus. Nulla velit mi, pellentesque sit amet maximus id, accumsan et eros. Pellentesque at scelerisque quam. Morbi in eros efficitur, vehicula velit ac, fringilla est\\",\\"In ut cursus tellus. Nulla velit mi, pellentesque sit amet maximus id, accumsan et eros. Pellentesque at scelerisque quam. Morbi in eros efficitur, vehicula velit ac, fringilla est\\",\\"In ut cursus tellus. Nulla velit mi, pellentesque sit amet maximus id, accumsan et eros. Pellentesque at scelerisque quam. Morbi in eros efficitur, vehicula velit ac, fringilla est\\"]}}","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(108, 81, 'Slideshow', '', '', 1, 'slideshow', 42, '2015-06-08 09:52:31', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_ja_acm', 1, 1, '{"jatools-config":"{\\":type\\":\\"ja_directory:slideshow\\",\\"slideshow\\":{\\"jatools-layout-slideshow\\":\\"style-owl\\",\\"slideshow[data]\\":{\\"slideshow[data][title]\\":[\\"Welcome to the Directory\\",\\"Sed diam no nibh \\",\\"Lorem ipsum dolor\\",\\"Ut laoreet dolore\\"],\\"slideshow[data][description]\\":[\\"Lorem ipsum dolor sit amet, consectetu adipiscing elit, sed diam no nibh euismod tincidunt ut laoreet dolore\\",\\"Consectetu adipiscing elit, sed diam no nibh euismod tincidunt ut laoreet dolore\\",\\"Sed diam no nibh euismod tincidunt ut laoreet dolore\\",\\"Lorem ipsum dolor sit amet, consectetu adipiscing elit\\"],\\"slideshow[data][image]\\":[\\"images\\/joomlart\\/slideshow\\/slide-1.jpg\\",\\"images\\/joomlart\\/slideshow\\/slide-2.jpg\\",\\"images\\/joomlart\\/slideshow\\/slide-3.jpg\\",\\"images\\/joomlart\\/slideshow\\/slide-4.jpg\\"],\\"slideshow[data][button]\\":[\\"\\",\\"\\",\\"\\",\\"\\"],\\"slideshow[data][button-link]\\":[\\"\\",\\"\\",\\"\\",\\"\\"],\\"rows\\":4,\\"cols\\":6,\\"type\\":\\"list\\"}}}","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","module-intro":"","full-width":"1"}', 0, '*'),
(109, 83, 'Search', '', '', 1, 'sidebar-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_search', 1, 0, '{"label":"","width":"20","text":"","button":"0","button_pos":"left","imagebutton":"0","button_text":"","opensearch":"1","opensearch_title":"","set_itemid":"0","layout":"_:default","moduleclass_sfx":" module-search","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(110, 84, 'Recent News', '', '', 3, 'sidebar-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_articles_latest', 1, 1, '{"catid":[""],"count":"5","show_featured":"","ordering":"c_dsc","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(111, 85, 'Categories', '', '', 9, 'sidebar-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_articles_category', 1, 1, '{"mode":"normal","show_on_article_page":"1","count":"0","show_front":"show","category_filtering_type":"1","catid":[""],"show_child_category_articles":"0","levels":"1","author_filtering_type":"1","created_by":[""],"author_alias_filtering_type":"1","created_by_alias":[""],"excluded_articles":"","date_filtering":"off","date_field":"a.created","start_date_range":"","end_date_range":"","relative_date":"30","article_ordering":"a.title","article_ordering_direction":"ASC","article_grouping":"none","article_grouping_direction":"ksort","month_year_format":"F Y","link_titles":"1","show_date":"0","show_date_field":"created","show_date_format":"Y-m-d H:i:s","show_category":"0","show_hits":"0","show_author":"0","show_introtext":"0","introtext_limit":"100","show_readmore":"0","show_readmore_title":"1","readmore_limit":"15","layout":"_:default","moduleclass_sfx":"","owncache":"1","cache_time":"900","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(112, 86, 'Categories', '', '', 4, 'sidebar-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_articles_categories', 1, 1, '{"parent":"8","show_description":"0","numitems":"0","show_children":"0","count":"0","maxlevel":"0","layout":"_:default","item_heading":"4","moduleclass_sfx":"","owncache":"1","cache_time":"900","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(113, 87, 'Tags', '', '', 5, 'sidebar-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_tags_popular', 1, 1, '{"maximum":"5","timeframe":"alltime","order_value":"count","order_direction":"1","display_count":0,"no_results_text":"0","minsize":1,"maxsize":2,"layout":"_:default","moduleclass_sfx":"","owncache":"1","cache_time":"900","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(114, 88, 'News Archived', '', '', 6, 'sidebar-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_articles_archive', 1, 1, '{"count":"10","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(116, 440, '[About-us] Testimonial', '', '', 10, 'section-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_ja_acm', 1, 0, '{"jatools-config":"{\\":type\\":\\"ja_directory:testimonials\\",\\"testimonials\\":{\\"jatools-layout-testimonials\\":\\"style-1\\",\\"testimonials[text-color]\\":[\\"#595c5d\\"],\\"testimonials[author-info-color]\\":[\\"#595c5d\\"],\\"testimonials[full-width]\\":[\\"0\\"],\\"testimonials[enable-controls]\\":[\\"1\\"],\\"testimonials[data-special]\\":{\\"testimonials[data-special][testimonial-text]\\":[\\"You make the tough decision to consult the different approach, but help us move forward with bold steps. Huge thanks for your team. \\",\\"Very relaxing and thorough. Friendly staff will bring you awesome relaxation feeling the the moment you enter…Great prices as well.\\"],\\"testimonials[data-special][author-name]\\":[\\" Marsh W.\\",\\" Marsh W.\\"],\\"testimonials[data-special][author-img]\\":[\\"images\\/joomlart\\/our-team\\/mem-5.jpg\\",\\"images\\/joomlart\\/our-team\\/mem-6.jpg\\"],\\"rows\\":2,\\"cols\\":4,\\"type\\":\\"list\\"}}}","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"Ja_directory-T3section","module-intro":"","full-width":"1"}', 0, '*'),
(117, 441, 'Featured Video', '', '<div class="videoWrapper">\r\n    <!-- Copy & Pasted from YouTube -->\r\n    <iframe width="560" height="315" src="https://www.youtube.com/embed/Spel7vfkpNc?rel=0&amp;controls=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>\r\n</div>', 1, 'position-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","module-intro":"","full-width":"1"}', 0, '*'),
(118, 442, 'Look The Places Around You ', '', '', 4, 'section-1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_ja_acm', 1, 1, '{"jatools-config":"{\\":type\\":\\"ja_directory:k2content\\",\\"k2content\\":{\\"jatools-layout-k2content\\":\\"list\\",\\"gallery-list[section_title]\\":[\\"\\"],\\"gallery-list[show_section_title]\\":[\\"0\\"],\\"gallery-list[list_categories][]\\":[],\\"gallery-list[show_front]\\":[\\"show\\"],\\"gallery-list[highlight_columns]\\":[\\"3\\"],\\"gallery-list[highlight_limit]\\":[\\"\\"],\\"gallery-list[article_ordering]\\":[\\"publish_up\\"],\\"gallery-list[article_ordering_direction]\\":[\\"DESC\\"]}}","moduleclass_sfx":" section-grey","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"Ja_directory-T3section","module-intro":"Some content will be apear here"}', 0, '*'),
(119, 443, 'Look The Places', '', '', 3, 'section-1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_k2_content', 1, 1, '{"moduleclass_sfx":" section-grey","getTemplate":"Grid","source":"filter","catfilter":"0","getChildren":"1","itemCount":"90","itemsOrdering":"order","FeaturedItems":"1","popularityRange":"","videosOnly":"0","itemTitle":"1","itemAuthor":"0","itemAuthorAvatar":"0","itemAuthorAvatarWidthSelect":"custom","itemAuthorAvatarWidth":"50","userDescription":"0","itemIntroText":"0","itemIntroTextWordLimit":"","itemImage":"1","itemImgSize":"Large","itemVideo":"0","itemVideoCaption":"0","itemVideoCredits":"0","itemAttachments":"0","itemTags":"0","itemCategory":"0","itemDateCreated":"0","itemHits":"0","itemReadMore":"0","itemExtraFields":"1","itemCommentsCounter":"0","feed":"0","itemPreText":"","itemCustomLink":"0","itemCustomLinkTitle":"","itemCustomLinkURL":"http:\\/\\/","itemCustomLinkMenuItem":"101","K2Plugins":"1","JPlugins":"1","cache":"1","cache_time":"900","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"Ja_directory-T3section","module-intro":"Some content will be apear here","full-width":"true","number_item":"8"}', 0, '*'),
(122, 446, 'Our Team', '', '', 7, 'section-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_ja_acm', 1, 1, '{"jatools-config":"{\\":type\\":\\"ja_directory:teams\\",\\"teams\\":{\\"jatools-layout-teams\\":\\"style-1\\",\\"team_about[number_col]\\":[\\"4\\"],\\"team_about[full-width]\\":[\\"0\\"],\\"team_about[member-image]\\":[\\"images\\/joomlart\\/our-team\\/mem-1.jpg\\",\\"images\\/joomlart\\/our-team\\/mem-2.jpg\\",\\"images\\/joomlart\\/our-team\\/mem-3.jpg\\",\\"images\\/joomlart\\/our-team\\/mem-4.jpg\\"],\\"team_about[member-desc]\\":[\\"\\",\\"\\",\\"\\",\\"\\"],\\"team_about[member-name]\\":[\\"Dewey ((strong))Hall((\\/strong))\\",\\"Lorenzo ((strong))Pope((\\/strong))\\",\\"Perry ((strong))Larson((\\/strong))\\",\\"Darren ((strong))Klein((\\/strong))\\"],\\"team_about[member-position]\\":[\\"Interaction Designer\\",\\"Interaction Designer\\",\\"CEO\\",\\"Experience Designer\\"],\\"team_about[member-link-icon1]\\":[\\"fa fa-facebook\\",\\"fa fa-facebook\\",\\"fa fa-linkedin\\",\\"fa fa-facebook\\"],\\"team_about[member-link1]\\":[\\"http:\\/\\/www.facebook.com\\",\\"http:\\/\\/www.facebook.com\\",\\"http:\\/\\/www.linked-in.com\\",\\"http:\\/\\/www.facebook.com\\"],\\"team_about[member-link-icon2]\\":[\\"fa fa-twitter\\",\\"fa fa-twitter\\",\\"fa fa-twitter\\",\\"fa fa-linkedin\\"],\\"team_about[member-link2]\\":[\\"http:\\/\\/www.twitter.com\\",\\"http:\\/\\/www.twitter.com\\",\\"http:\\/\\/www.twitter.com\\",\\"http:\\/\\/www.linked-in.com\\"],\\"team_about[member-link-icon3]\\":[\\"fa fa-linkedin\\",\\"fa fa-google-plus\\",\\"fa fa-google-plus\\",\\"fa fa-pinterest\\"],\\"team_about[member-link3]\\":[\\"http:\\/\\/www.linked-in.com\\",\\"http:\\/\\/www.google.com\\",\\"http:\\/\\/www.google.com\\",\\"http:\\/\\/www.pinterest.com\\"]}}","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"Ja_directory-T3section","module-intro":"We could not reach this far without such a hero team. Dedicated, collaborative and professional workaholic people.","full-width":"1"}', 0, '*'),
(124, 451, 'Articles - Related', '', '', 8, 'sidebar-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_related_items', 1, 1, '{"showDate":"0","maximum":"5","layout":"_:default","moduleclass_sfx":"","owncache":"1","cache_time":"900","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","module-intro":"","full-width":"1"}', 0, '*'),
(125, 464, '[Contact] JA Map', '', '<p>{jamap}</p>', 1, 'section-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 0, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","module-intro":" ja-map","full-width":"1"}', 0, '*'),
(126, 465, '[Contact] JA Map ', '', '{jamap}', 1, 'section-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 0, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":" ja-map","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","module-intro":"","full-width":"1"}', 0, '*'),
(127, 466, 'Login', '', '', 2, 'sidebar-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_login', 1, 1, '{"pretext":"","posttext":"","login":"","logout":"","greeting":"1","name":"0","usesecure":"0","usetext":"0","layout":"_:default","moduleclass_sfx":"","cache":"0","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","module-intro":"","full-width":"1"}', 0, '*'),
(128, 469, 'Menu', '', '', 1, 'off-canvas', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 1, '{"menutype":"mainmenu","base":"","startLevel":"1","endLevel":"0","showAllChildren":"1","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","module-intro":"","full-width":"1"}', 0, '*'),
(129, 470, 'K2 Archive', '', '', 1, 'sidebar-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_k2_tools', 1, 1, '{"moduleclass_sfx":"","module_usage":"0","archiveItemsCounter":"1","archiveCategory":"0","authors_module_category":"0","authorItemsCounter":"1","authorAvatar":"1","authorAvatarWidthSelect":"custom","authorAvatarWidth":"50","authorLatestItem":"1","calendarCategory":"8","home":"","seperator":"","root_id":"0","end_level":"","categoriesListOrdering":"","categoriesListItemsCounter":"1","root_id2":"0","catfilter":"0","getChildren":"0","liveSearch":"","width":"20","text":"","button":"","imagebutton":"","button_text":"","min_size":"75","max_size":"300","cloud_limit":"30","cloud_category":["0"],"cloud_category_recursive":"0","customCode":"","parsePhp":"0","K2Plugins":"0","JPlugins":"0","cache":"1","cache_time":"900","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","module-intro":"","full-width":"1"}', 0, '*'),
(130, 471, 'K2 Search', '', '', 1, 'sidebar-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_k2_tools', 1, 1, '{"moduleclass_sfx":"","module_usage":"6","archiveItemsCounter":"1","archiveCategory":"0","authors_module_category":"0","authorItemsCounter":"1","authorAvatar":"1","authorAvatarWidthSelect":"custom","authorAvatarWidth":"50","authorLatestItem":"1","calendarCategory":"0","home":"","seperator":"","root_id":"0","end_level":"","categoriesListOrdering":"","categoriesListItemsCounter":"1","root_id2":"0","catfilter":"0","getChildren":"0","liveSearch":"","width":"20","text":"","button":"","imagebutton":"","button_text":"","min_size":"75","max_size":"300","cloud_limit":"30","cloud_category":["0"],"cloud_category_recursive":"0","customCode":"","parsePhp":"0","K2Plugins":"0","JPlugins":"0","cache":"1","cache_time":"900","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","module-intro":"","full-width":"1"}', 0, '*'),
(131, 472, 'K2 Tags', '', '', 1, 'sidebar-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_k2_tools', 1, 1, '{"moduleclass_sfx":"","module_usage":"7","archiveItemsCounter":"1","archiveCategory":"0","authors_module_category":"0","authorItemsCounter":"1","authorAvatar":"1","authorAvatarWidthSelect":"custom","authorAvatarWidth":"50","authorLatestItem":"1","calendarCategory":"0","home":"","seperator":"","root_id":"0","end_level":"","categoriesListOrdering":"","categoriesListItemsCounter":"1","root_id2":"0","catfilter":"0","getChildren":"0","liveSearch":"","width":"20","text":"","button":"","imagebutton":"","button_text":"","min_size":"75","max_size":"300","cloud_limit":"30","cloud_category":["0"],"cloud_category_recursive":"0","customCode":"","parsePhp":"0","K2Plugins":"0","JPlugins":"0","cache":"1","cache_time":"900","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","module-intro":"","full-width":"1"}', 0, '*'),
(132, 473, 'K2 Categories List', '', '', 1, 'sidebar-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_k2_tools', 1, 1, '{"moduleclass_sfx":"","module_usage":"4","archiveItemsCounter":"1","archiveCategory":"0","authors_module_category":"0","authorItemsCounter":"1","authorAvatar":"1","authorAvatarWidthSelect":"custom","authorAvatarWidth":"50","authorLatestItem":"1","calendarCategory":"0","home":"","seperator":"","root_id":"0","end_level":"","categoriesListOrdering":"","categoriesListItemsCounter":"1","root_id2":"0","catfilter":"0","getChildren":"0","liveSearch":"","width":"20","text":"","button":"","imagebutton":"","button_text":"","min_size":"75","max_size":"300","cloud_limit":"30","cloud_category":["0"],"cloud_category_recursive":"0","customCode":"","parsePhp":"0","K2Plugins":"0","JPlugins":"0","cache":"1","cache_time":"900","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","module-intro":"","full-width":"1"}', 0, '*'),
(133, 474, 'K2 Menu', '', '', 0, 'footer-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_menu', 1, 1, '{"menutype":"k2","base":"","startLevel":"1","endLevel":"0","showAllChildren":"1","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","module-intro":"","full-width":"1"}', 0, '*'),
(134, 477, 'Footer', '', '', 0, 'footer', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_footer', 1, 1, '{"layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","module-intro":"","full-width":"1"}', 0, '*');

DROP TABLE IF EXISTS `#__modules_menu`;
CREATE TABLE `#__modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT 0,
  `menuid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`moduleid`,`menuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `#__modules_menu` (`moduleid`, `menuid`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(12, 0),
(13, 0),
(14, 0),
(15, 0),
(16, 0),
(17, 0),
(79, 0),
(86, 0),
(87, 101),
(88, 101),
(89, 101),
(90, 101),
(91, 0),
(92, 0),
(93, 0),
(94, -101),
(95, 101),
(96, 101),
(97, 101),
(98, 166),
(98, 167),
(98, 168),
(98, 169),
(99, 166),
(99, 167),
(99, 168),
(99, 169),
(100, 0),
(101, 0),
(103, 127),
(104, 127),
(105, 127),
(106, 101),
(106, 110),
(106, 111),
(106, 112),
(106, 113),
(106, 114),
(106, 115),
(106, 116),
(106, 147),
(107, 127),
(108, 101),
(109, 148),
(110, 148),
(111, 148),
(112, 148),
(113, 148),
(114, 148),
(116, 127),
(117, 101),
(118, 101),
(119, 101),
(122, 127),
(123, 110),
(123, 111),
(123, 112),
(123, 113),
(123, 114),
(123, 115),
(123, 116),
(123, 147),
(124, 148),
(125, 127),
(126, 109),
(127, 148),
(128, 0),
(129, 166),
(129, 167),
(129, 168),
(129, 169),
(130, 166),
(130, 167),
(130, 168),
(130, 169),
(131, 166),
(131, 167),
(131, 168),
(131, 169),
(132, 166),
(132, 167),
(132, 168),
(132, 169),
(133, 0),
(134, 0);

DROP TABLE IF EXISTS `#__newsfeeds`;
CREATE TABLE `#__newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT 0,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `alias` varchar(400) binary NOT NULL DEFAULT '',
  `link` varchar(2048) NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT 0,
  `numarticles` int(10) unsigned NOT NULL DEFAULT 1,
  `cache_time` int(10) unsigned NOT NULL DEFAULT 3600,
  `checked_out` int(10) unsigned NOT NULL DEFAULT 0,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT 0,
  `rtl` tinyint(4) NOT NULL DEFAULT 0,
  `access` int(10) unsigned NOT NULL DEFAULT 0,
  `language` char(7) NOT NULL DEFAULT '',
  `params` mediumtext NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT 0,
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT 0,
  `metakey` mediumtext NOT NULL,
  `metadesc` mediumtext NOT NULL,
  `metadata` mediumtext NOT NULL,
  `xreference` varchar(50) NOT NULL DEFAULT '',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `description` mediumtext NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT 1,
  `hits` int(10) unsigned NOT NULL DEFAULT 0,
  `images` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__overrider`;
CREATE TABLE `#__overrider` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `constant` varchar(255) NOT NULL,
  `string` mediumtext NOT NULL,
  `file` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__postinstall_messages`;
CREATE TABLE `#__postinstall_messages` (
  `postinstall_message_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `extension_id` bigint(20) NOT NULL DEFAULT 700 COMMENT 'FK to #__extensions',
  `title_key` varchar(255) NOT NULL DEFAULT '' COMMENT 'Lang key for the title',
  `description_key` varchar(255) NOT NULL DEFAULT '' COMMENT 'Lang key for description',
  `action_key` varchar(255) NOT NULL DEFAULT '',
  `language_extension` varchar(255) NOT NULL DEFAULT 'com_postinstall' COMMENT 'Extension holding lang keys',
  `language_client_id` tinyint(3) NOT NULL DEFAULT 1,
  `type` varchar(10) NOT NULL DEFAULT 'link' COMMENT 'Message type - message, link, action',
  `action_file` varchar(255) DEFAULT '' COMMENT 'RAD URI to the PHP file containing action method',
  `action` varchar(255) DEFAULT '' COMMENT 'Action method name or URL',
  `condition_file` varchar(255) DEFAULT NULL COMMENT 'RAD URI to file holding display condition method',
  `condition_method` varchar(255) DEFAULT NULL COMMENT 'Display condition method, must return boolean',
  `version_introduced` varchar(50) NOT NULL DEFAULT '3.2.0' COMMENT 'Version when this message was introduced',
  `enabled` tinyint(3) NOT NULL DEFAULT 1,
  PRIMARY KEY (`postinstall_message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__redirect_links`;
CREATE TABLE `#__redirect_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `old_url` varchar(2048) NOT NULL,
  `new_url` varchar(2048) DEFAULT NULL,
  `referer` varchar(2048) NOT NULL,
  `comment` varchar(255) NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT 0,
  `published` tinyint(4) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `header` smallint(3) NOT NULL DEFAULT 301,
  PRIMARY KEY (`id`),
  KEY `idx_link_modifed` (`modified_date`),
  KEY `idx_old_url` (`old_url`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__schemas`;
CREATE TABLE `#__schemas` (
  `extension_id` int(11) NOT NULL,
  `version_id` varchar(20) NOT NULL,
  PRIMARY KEY (`extension_id`,`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__session`;
CREATE TABLE `#__session` (
  `session_id` varchar(191) NOT NULL DEFAULT '',
  `client_id` tinyint(3) unsigned DEFAULT NULL,
  `guest` tinyint(4) unsigned DEFAULT 1,
  `time` varchar(14) DEFAULT '',
  `data` longtext DEFAULT NULL,
  `userid` int(11) DEFAULT 0,
  `username` varchar(150) DEFAULT '',
  PRIMARY KEY (`session_id`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__tags`;
CREATE TABLE `#__tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT 0,
  `lft` int(11) NOT NULL DEFAULT 0,
  `rgt` int(11) NOT NULL DEFAULT 0,
  `level` int(10) unsigned NOT NULL DEFAULT 0,
  `path` varchar(400) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `alias` varchar(400) binary NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT 0,
  `checked_out` int(11) unsigned NOT NULL DEFAULT 0,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) unsigned NOT NULL DEFAULT 0,
  `params` mediumtext NOT NULL,
  `metadesc` varchar(1024) NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` mediumtext NOT NULL,
  `urls` mediumtext NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT 0,
  `language` char(7) NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT 1,
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `tag_idx` (`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_language` (`language`),
  KEY `idx_path` (`path`(100)),
  KEY `idx_alias` (`alias`(100))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__template_styles`;
CREATE TABLE `#__template_styles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template` varchar(50) NOT NULL DEFAULT '',
  `client_id` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `home` char(7) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `params` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_template` (`template`),
  KEY `idx_home` (`home`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

INSERT INTO `#__template_styles` (`id`, `template`, `client_id`, `home`, `title`, `params`) VALUES
(4, 'beez3', 0, '0', 'Beez3 - Default', '{"wrapperSmall":"53","wrapperLarge":"72","logo":"images\\/joomla_black.gif","sitetitle":"Joomla!","sitedescription":"Open Source Content Management","navposition":"left","templatecolor":"personal","html5":"0"}'),
(5, 'hathor', 1, '0', 'Hathor - Default', '{"showSiteName":"0","colourChoice":"","boldText":"0"}'),
(7, 'protostar', 0, '0', 'protostar - Default', '{"templateColor":"","logoFile":"","googleFont":"1","googleFontName":"Open+Sans","fluidContainer":"0"}'),
(8, 'isis', 1, '1', 'isis - Default', '{"templateColor":"","logoFile":""}'),
(9, 'ja_directory', 0, '1', 'ja_directory - Default', '{"t3_template":"1","devmode":"0","themermode":"1","legacy_css":"1","responsive":"1","non_responsive_width":"970px","build_rtl":"1","t3-assets":"t3-assets","t3-rmvlogo":"1","minify":"1","minify_js":"1","minify_js_tool":"jsmin","minify_exclude":null,"link_titles":null,"theme":"","logotype":"text","sitename":"Directory","slogan":"","logoimage":"","enable_logoimage_sm":"0","logoimage_sm":"","mainlayout":"default","sublayout":"","mm_type":"mainmenu","navigation_trigger":"hover","navigation_type":"megamenu","navigation_animation":null,"navigation_animation_duration":"400","mm_config":"{\\"mainmenu\\":{\\"item-126\\":{\\"sub\\":{\\"rows\\":[[{\\"item\\":127,\\"width\\":12}]]},\\"alignsub\\":\\"right\\"},\\"item-129\\":{\\"sub\\":{\\"rows\\":[[{\\"item\\":130,\\"width\\":12}]]},\\"alignsub\\":\\"right\\"}}}","navigation_collapse_enable":"0","addon_offcanvas_enable":"1","addon_offcanvas_effect":"off-canvas-effect-4","snippet_open_head":null,"snippet_close_head":null,"snippet_open_body":null,"snippet_close_body":null,"snippet_debug":"0"}'),
(10, 'ja_directory', 0, '0', 'ja_directory - Feature', '{"t3_template":"1","devmode":"0","themermode":"1","legacy_css":"1","responsive":"1","non_responsive_width":"970px","build_rtl":"1","t3-assets":"t3-assets","t3-rmvlogo":"1","minify":"1","minify_js":"1","minify_js_tool":"jsmin","minify_exclude":"","link_titles":"","theme":"","logotype":"text","sitename":"Directory","slogan":"","logoimage":"","enable_logoimage_sm":"0","logoimage_sm":"","mainlayout":"features","sublayout":"","skip_component_content":["101"],"mm_type":"mainmenu","navigation_trigger":"hover","navigation_type":"megamenu","navigation_animation":"","navigation_animation_duration":"400","mm_config":"{\\"mainmenu\\":{\\"item-126\\":{\\"sub\\":{\\"rows\\":[[{\\"item\\":127,\\"width\\":12}]]},\\"alignsub\\":\\"right\\"},\\"item-129\\":{\\"sub\\":{\\"rows\\":[[{\\"item\\":130,\\"width\\":12}]]},\\"alignsub\\":\\"right\\"}}}","navigation_collapse_enable":"0","addon_offcanvas_enable":"1","addon_offcanvas_effect":"off-canvas-effect-4","snippet_open_head":"","snippet_close_head":"","snippet_open_body":"","snippet_close_body":"","snippet_debug":"0"}');

DROP TABLE IF EXISTS `#__ucm_base`;
CREATE TABLE `#__ucm_base` (
  `ucm_id` int(10) unsigned NOT NULL,
  `ucm_item_id` int(10) NOT NULL,
  `ucm_type_id` int(11) NOT NULL,
  `ucm_language_id` int(11) NOT NULL,
  PRIMARY KEY (`ucm_id`),
  KEY `idx_ucm_item_id` (`ucm_item_id`),
  KEY `idx_ucm_type_id` (`ucm_type_id`),
  KEY `idx_ucm_language_id` (`ucm_language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__ucm_content`;
CREATE TABLE `#__ucm_content` (
  `core_content_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `core_type_alias` varchar(400) NOT NULL DEFAULT '' COMMENT 'FK to the content types table',
  `core_title` varchar(400) NOT NULL DEFAULT '',
  `core_alias` varchar(400) binary NOT NULL DEFAULT '',
  `core_body` mediumtext NOT NULL,
  `core_state` tinyint(1) NOT NULL DEFAULT 0,
  `core_checked_out_time` varchar(255) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_checked_out_user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `core_access` int(10) unsigned NOT NULL DEFAULT 0,
  `core_params` text NOT NULL,
  `core_featured` tinyint(4) unsigned NOT NULL DEFAULT 0,
  `core_metadata` varchar(2048) NOT NULL DEFAULT '' COMMENT 'JSON encoded metadata properties.',
  `core_created_user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `core_created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `core_created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_modified_user_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Most recent user that modified',
  `core_modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_language` char(7) NOT NULL DEFAULT '',
  `core_publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_content_item_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'ID from the individual type table',
  `asset_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'FK to the #__assets table.',
  `core_images` text NOT NULL,
  `core_urls` text NOT NULL,
  `core_hits` int(10) unsigned NOT NULL DEFAULT 0,
  `core_version` int(10) unsigned NOT NULL DEFAULT 1,
  `core_ordering` int(11) NOT NULL DEFAULT 0,
  `core_metakey` text NOT NULL,
  `core_metadesc` text NOT NULL,
  `core_catid` int(10) unsigned NOT NULL DEFAULT 0,
  `core_xreference` varchar(50) NOT NULL DEFAULT '' COMMENT 'A reference to enable linkages to external data sets.',
  `core_type_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`core_content_id`),
  KEY `tag_idx` (`core_state`,`core_access`),
  KEY `idx_access` (`core_access`),
  KEY `idx_language` (`core_language`),
  KEY `idx_modified_time` (`core_modified_time`),
  KEY `idx_created_time` (`core_created_time`),
  KEY `idx_core_modified_user_id` (`core_modified_user_id`),
  KEY `idx_core_checked_out_user_id` (`core_checked_out_user_id`),
  KEY `idx_core_created_user_id` (`core_created_user_id`),
  KEY `idx_core_type_id` (`core_type_id`),
  KEY `idx_alias` (`core_alias`(100)),
  KEY `idx_title` (`core_title`(100)),
  KEY `idx_content_type` (`core_type_alias`(100))
) ENGINE=InnoDB AUTO_INCREMENT=13 COMMENT='Contains core content data in name spaced fields' DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__ucm_history`;
CREATE TABLE `#__ucm_history` (
  `version_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ucm_item_id` int(10) unsigned NOT NULL,
  `ucm_type_id` int(10) unsigned NOT NULL,
  `version_note` varchar(255) NOT NULL DEFAULT '' COMMENT 'Optional version name',
  `save_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor_user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `character_count` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Number of characters in this version.',
  `sha1_hash` varchar(50) NOT NULL DEFAULT '' COMMENT 'SHA1 hash of the version_data column.',
  `version_data` longtext NOT NULL COMMENT 'json-encoded string of version data',
  `keep_forever` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=auto delete; 1=keep',
  PRIMARY KEY (`version_id`),
  KEY `idx_ucm_item_id` (`ucm_type_id`,`ucm_item_id`),
  KEY `idx_save_date` (`save_date`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__update_sites`;
CREATE TABLE `#__update_sites` (
  `update_site_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `location` mediumtext NOT NULL,
  `enabled` int(11) DEFAULT 0,
  `last_check_timestamp` bigint(20) DEFAULT 0,
  `extra_query` varchar(1000) DEFAULT '',
  PRIMARY KEY (`update_site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 COMMENT='Update Sites' DEFAULT CHARSET=utf8;

INSERT INTO `#__update_sites` (`update_site_id`, `name`, `type`, `location`, `enabled`, `last_check_timestamp`, `extra_query`) VALUES
(1, 'Joomla! Core', 'collection', 'https://update.joomla.org/core/list.xml', 1, 0, ''),
(17, 'Joomla! Update Component Update Site', 'extension', 'https://update.joomla.org/core/extensions/com_joomlaupdate.xml', 1, 1536810529, ''),
(19, 'Accredited Joomla! Translations', 'collection', 'https://update.joomla.org/language/translationlist_3.xml', 1, 1536810494, ''),
(31, '', 'extension', 'http://update.joomlart.com/service/tracking/j16/mod_ja_acm.xml', 1, 1536810496, ''),
(32, 'JA K2 Filter', 'extension', 'http://update.joomlart.com/service/tracking/j16/mod_jak2filter.xml', 1, 1536810497, ''),
(33, '', 'extension', 'http://update.joomlart.com/service/tracking/j16/mod_jatwitter.xml', 1, 1536810498, ''),
(34, '', 'extension', 'http://update.joomlart.com/service/tracking/j16/plg_system_jagooglemap.xml', 1, 1536810499, ''),
(35, '', 'extension', 'http://update.joomlart.com/service/tracking/j16/plg_system_t3.xml', 1, 1536810500, ''),
(36, 'JA K2 Filter', 'extension', 'http://update.joomlart.com/service/tracking/j16/plg_k2_jak2filter.xml', 1, 1536810501, ''),
(37, '', 'extension', 'http://update.joomlart.com/service/tracking/j31/ja_directory.xml', 1, 1536810503, ''),
(38, 'JA Extension Manager', 'extension', 'http://update.joomlart.com/service/tracking/j16/com_com_jaextmanager.xml', 1, 1536810504, ''),
(39, 'K2 Updates', 'extension', 'http://getk2.org/app/update.xml', 1, 1536810505, ''),
(40, 'JA K2 Filter', 'extension', 'http://update.joomlart.com/service/tracking/j16/com_jak2filter.xml', 1, 1536810506, ''),
(41, 'AcyMailing', 'extension', 'http://www.acyba.com/component/updateme/updatexml/component-acymailing/level-Starter/file-extension.xml', 1, 1536810508, '');

DROP TABLE IF EXISTS `#__update_sites_extensions`;
CREATE TABLE `#__update_sites_extensions` (
  `update_site_id` int(11) NOT NULL DEFAULT 0,
  `extension_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`update_site_id`,`extension_id`)
) ENGINE=InnoDB COMMENT='Links extensions to update sites' DEFAULT CHARSET=utf8;

INSERT INTO `#__update_sites_extensions` (`update_site_id`, `extension_id`) VALUES
(1, 700),
(2, 700),
(3, 600),
(17, 28),
(19, 802),
(31, 10000),
(32, 10060),
(33, 10010),
(34, 10051),
(35, 10001),
(36, 10059),
(37, 10002),
(38, 10053),
(39, 10029),
(40, 10056),
(41, 10011);
INSERT IGNORE INTO `#__update_sites_extensions` VALUES
(1, 700),
(2, 700),
(3, 600);

DROP TABLE IF EXISTS `#__updates`;
CREATE TABLE `#__updates` (
  `update_id` int(11) NOT NULL AUTO_INCREMENT,
  `update_site_id` int(11) DEFAULT 0,
  `extension_id` int(11) DEFAULT 0,
  `name` varchar(100) DEFAULT '',
  `description` mediumtext NOT NULL,
  `element` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `folder` varchar(20) DEFAULT '',
  `client_id` tinyint(3) DEFAULT 0,
  `version` varchar(32) DEFAULT '',
  `data` mediumtext NOT NULL,
  `detailsurl` mediumtext NOT NULL,
  `infourl` mediumtext NOT NULL,
  `extra_query` varchar(1000) DEFAULT '',
  PRIMARY KEY (`update_id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 COMMENT='Available Updates' DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__user_keys`;
CREATE TABLE `#__user_keys` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(150) NOT NULL,
  `token` varchar(255) NOT NULL,
  `series` varchar(191) NOT NULL,
  `invalid` tinyint(4) NOT NULL,
  `time` varchar(200) NOT NULL,
  `uastring` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `series` (`series`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__user_notes`;
CREATE TABLE `#__user_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `catid` int(10) unsigned NOT NULL DEFAULT 0,
  `subject` varchar(100) NOT NULL DEFAULT '',
  `body` mediumtext NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT 0,
  `checked_out` int(10) unsigned NOT NULL DEFAULT 0,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL,
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_category_id` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__user_profiles`;
CREATE TABLE `#__user_profiles` (
  `user_id` int(11) NOT NULL,
  `profile_key` varchar(100) NOT NULL,
  `profile_value` mediumtext NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT 0,
  UNIQUE KEY `idx_user_id_profile_key` (`user_id`,`profile_key`)
) ENGINE=InnoDB COMMENT='Simple user profile storage table' DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__user_usergroup_map`;
CREATE TABLE `#__user_usergroup_map` (
  `user_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Foreign Key to #__users.id',
  `group_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Foreign Key to #__usergroups.id',
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__usergroups`;
CREATE TABLE `#__usergroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Adjacency List Reference Id',
  `lft` int(11) NOT NULL DEFAULT 0 COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT 0 COMMENT 'Nested set rgt.',
  `title` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_usergroup_parent_title_lookup` (`parent_id`,`title`),
  KEY `idx_usergroup_title_lookup` (`title`),
  KEY `idx_usergroup_adjacency_lookup` (`parent_id`),
  KEY `idx_usergroup_nested_set_lookup` (`lft`,`rgt`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

INSERT INTO `#__usergroups` (`id`, `parent_id`, `lft`, `rgt`, `title`) VALUES
(1, 0, 1, 18, 'Public'),
(2, 1, 8, 15, 'Registered'),
(3, 2, 9, 14, 'Author'),
(4, 3, 10, 13, 'Editor'),
(5, 4, 11, 12, 'Publisher'),
(6, 1, 4, 7, 'Manager'),
(7, 6, 5, 6, 'Administrator'),
(8, 1, 16, 17, 'Super Users'),
(9, 1, 2, 3, 'Guest');

DROP TABLE IF EXISTS `#__users`;
CREATE TABLE `#__users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(400) NOT NULL DEFAULT '',
  `username` varchar(150) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT 0,
  `sendEmail` tinyint(4) DEFAULT 0,
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) NOT NULL DEFAULT '',
  `params` mediumtext NOT NULL,
  `lastResetTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date of last password reset',
  `resetCount` int(11) NOT NULL DEFAULT 0 COMMENT 'Count of password resets since lastResetTime',
  `otpKey` varchar(1000) NOT NULL DEFAULT '' COMMENT 'Two factor authentication encrypted keys',
  `otep` varchar(1000) NOT NULL DEFAULT '' COMMENT 'One time emergency passwords',
  `requireReset` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Require user to reset password on next login',
  PRIMARY KEY (`id`),
  KEY `idx_block` (`block`),
  KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `idx_name` (`name`(100))
) ENGINE=InnoDB AUTO_INCREMENT=890 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__utf8_conversion`;
CREATE TABLE `#__utf8_conversion` (
  `converted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__viewlevels`;
CREATE TABLE `#__viewlevels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `title` varchar(100) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT 0,
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_assetgroup_title_lookup` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

INSERT INTO `#__viewlevels` (`id`, `title`, `ordering`, `rules`) VALUES
(1, 'Public', 0, '[1]'),
(2, 'Registered', 2, '[6,2,8]'),
(3, 'Special', 3, '[6,3,8]'),
(5, 'Guest', 1, '[9]'),
(6, 'Super Users', 4, '[8]');

UPDATE `#__extensions` SET `enabled` = 0 WHERE `extension_id` IN (10018,10063); 
