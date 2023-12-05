<?php
/* Smarty version 4.3.1, created on 2023-12-04 03:35:09
  from 'app:frontendcomponentsskipLinks.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.3.1',
  'unifunc' => 'content_656d3adda82d43_89765737',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '3ad7d50ac87f435856b9a83a8dfb4338e9b2a8b2' => 
    array (
      0 => 'app:frontendcomponentsskipLinks.tpl',
      1 => 1688091709,
      2 => 'app',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_656d3adda82d43_89765737 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_checkPlugins(array(0=>array('file'=>'C:\\xampp\\htdocs\\omp-3.3\\lib\\pkp\\lib\\vendor\\smarty\\smarty\\libs\\plugins\\modifier.count.php','function'=>'smarty_modifier_count',),));
?>
<div class="cmp_skip_to_content" aria-label="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"navigation.skip.description"),$_smarty_tpl ) );?>
">
	<a href="#pkp_content_main"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"navigation.skip.main"),$_smarty_tpl ) );?>
</a>
	<a href="#siteNav"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"navigation.skip.nav"),$_smarty_tpl ) );?>
</a>
	<?php if (!$_smarty_tpl->tpl_vars['requestedPage']->value || $_smarty_tpl->tpl_vars['requestedPage']->value === 'index') {?>
		<?php if (!empty($_smarty_tpl->tpl_vars['spotlights']->value)) {?>
			<a href="#homepageSpotlights"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"navigation.skip.spotlights"),$_smarty_tpl ) );?>
</a>
		<?php }?>
		<?php if ($_smarty_tpl->tpl_vars['numAnnouncementsHomepage']->value && smarty_modifier_count($_smarty_tpl->tpl_vars['announcements']->value)) {?>
			<a href="#homepageAnnouncements"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"navigation.skip.announcements"),$_smarty_tpl ) );?>
</a>
		<?php }?>
	<?php }?>
	<a href="#pkp_content_footer"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"navigation.skip.footer"),$_smarty_tpl ) );?>
</a>
</div>
<?php }
}
