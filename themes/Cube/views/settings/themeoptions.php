<?php if (!defined('APPLICATION')) exit(); ?>
<h1><?php echo $this->Data('Title'); ?></h1>
<script type="text/javascript" src="../../themes/Cube/jquery/jc/jscolor.js"></script>

<style>
#Form_Text_BlueColor,#Form_Text_PinkColor,#Form_Text_VioletColor{border:1px solid #DEDEDE;padding:10px;border-radius:4px;width:50%;margin:5px 0px 15px 0px;}
</style>


<?php if ($this->Data('ThemeInfo.Options.Description')) {
   echo '<div class="Info">',
      $this->Data('ThemeInfo.Options.Description'),
      '</div>';
}
?>

<?php
echo $this->Form->Open();
echo $this->Form->Errors();
?>

<?php if (is_array($this->Data('ThemeInfo.Options.Styles'))): ?>
<h3><?php echo T('Styles'); ?></h3>
<table class="SelectionGrid ThemeStyles">
   <tbody>
<?php
$Alt = FALSE;
$Cols = 3;
$Col = 0;
$Classes = array('FirstCol', 'MiddleCol', 'LastCol');

foreach ($this->Data('ThemeInfo.Options.Styles') as $Key => $Options) {
   $Basename = GetValue('Basename', $Options, '%s');

   if ($Col == 0)
      echo '<tr>';

   $Active = '';
   if ($this->Data('ThemeOptions.Styles.Key') == $Key || (!$this->Data('ThemeOptions.Styles.Key') && $Basename == '%s'))
      $Active = ' Active';

   $KeyID = str_replace(' ', '_', $Key);
   echo "<td id=\"{$KeyID}_td\" class=\"{$Classes[$Col]}$Active\">";
   echo '<h4>',T($Key),'</h4>';

   // Look for a screenshot for for the style.
   $Screenshot = SafeGlob(PATH_THEMES.DS.$this->Data('ThemeFolder').DS.'design'.DS.ChangeBasename('screenshot.*', $Basename), array('gif','jpg','png'));
   if (is_array($Screenshot) && count($Screenshot) > 0) {
      $Screenshot = basename($Screenshot[0]);
      echo Img('/themes/'.$this->Data('ThemeFolder').'/design/'.$Screenshot, array('alt' => T($Key), 'width' => '160'));
   }

   $Disabled = $Active ? ' Disabled' : '';
   echo '<div class="Buttons">',
      Anchor(T('Select'), '?style='.urlencode($Key), 'SmallButton SelectThemeStyle'.$Disabled, array('Key' => $Key)),
      '</div>';

   if (isset($Options['Description'])) {
      echo '<div class="Info2">',
         $Options['Description'],
         '</div>';
   }

   echo '</td>';

   $Col = ($Col + 1) % 3;
   if ($Col == 0)
      echo '</tr>';
}
   if ($Col > 0)
      echo '<td colspan="'.(3 - $Col).'">&#160;</td></tr>';

?>
   </tbody>
</table>

<?php endif; ?>

<?php if (is_array($this->Data('ThemeInfo.Options.Text'))): ?>


<ul>
<?php foreach ($this->Data('ThemeInfo.Options.Text') as $Code => $Options) {

   echo '<li>',
   $this->Form->Label('@'.$Code, 'Text_'.$Code);

   if (isset($Options['Description']))
      echo '<div class="Info2">', $Options['Description'], '</div>';

   switch (strtolower(GetValue('Type', $Options, 'textarea'))) {
      case 'textbox':
         echo $this->Form->TextBox($this->Form->EscapeString('Text_'.$Code));
         break;
      case 'textarea':
      default:
         echo $this->Form->TextBox($this->Form->EscapeString('Text_'.$Code), array('Class' => 'Color'));
         break;
   }


   echo
      '</li>';
}
?>
</ul>

<?php
$Faviconi = fff000;
$Faviconiu = $this->Data('BlueColor');
?>












<?php
echo $this->Form->Button('Save');
endif;
?>

<?php
echo '<br />'.$this->Form->Close();
