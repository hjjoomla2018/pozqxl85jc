<?php
/**
 * ------------------------------------------------------------------------
 * JA K2 Extrafields
 * ------------------------------------------------------------------------
 * Copyright (C) 2004-2018 J.O.O.M Solutions Co., Ltd. All Rights Reserved.
 * @license - GNU/GPL, http://www.gnu.org/licenses/gpl.html
 * Author: J.O.O.M Solutions Co., Ltd
 * Websites: http://www.joomlart.com - http://www.joomlancers.com
 * ------------------------------------------------------------------------
 */

// no direct access
defined('_JEXEC') or die ('Restricted access');

/**
 * Example K2 Plugin to render YouTube URLs entered in backend K2 forms to video players in the frontend.
 */

// Load the K2 Plugin API
JLoader::register('K2Plugin', JPATH_ADMINISTRATOR.'/components/com_k2/lib/k2plugin.php');

// Initiate class to hold plugin events
class plgK2Jak2extrafields extends K2Plugin {

	// Some params
	var $pluginName = 'jak2extrafields';
	var $pluginNameHumanReadable = 'K2 Plugin - JA K2 Extra Fields';

	function __construct( & $subject, $params) {
		parent::__construct($subject, $params);
	}

	function onRenderAdminForm(&$item, $type, $tab = '')
	{
		$app = JFactory::getApplication();
		if($app->input->get('view') == 'category') {
			jimport('joomla.filesystem.folder');
			jimport('joomla.filesystem.file');
			$files = array();
			$templates = JFolder::folders(JPATH_ROOT.'/templates/', '.', false, true);
			foreach($templates as $template) {
				if(file_exists($template.'/etc/form/com_k2.category.xml')) {
					$language = JFactory::getLanguage();
					$language->load(basename($template));
					$files[] = $template.'/etc/form/com_k2.category.xml';
				}
			}

			if(count($files)) {
				jimport('joomla.form.form');
				$form = JForm::getInstance('categoryFormExtra', $files[0]);
				for($i=1; $i<count($files); $i++) {
					$form->loadFile($files[$i]);
				}
				$values = array('params' => json_decode($item->params));
				$form->bind($values);

				$plugin = new JObject();
				$plugin->set('name', 'JA Extra Fields');

				$plugin->set('fields', $form->renderFieldset('custom-field'));
				return $plugin;
			}
		}
	}
}