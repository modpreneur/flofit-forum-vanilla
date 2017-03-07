<?php if (!defined('APPLICATION')) exit();
$SearchTerm = GetValue('SearchTerm', $this);
?>
<h1 class="H">Search Results</h1>
<ul class="DataList SearchResults"><li class="iop"></li>
<?php
if (is_array($this->SearchResults) && count($this->SearchResults) > 0) {
	foreach ($this->SearchResults as $Key => $Row) {
		$Row = (object)$Row;
		$this->EventArguments['Row'] = $Row;
?>
	<li class="Item searchix">
		
		
	         <div class="Item-Footer ifmag">
			 <div class="uiusx">
            <?php
               echo UserPhoto($Row, array('Size' => 'Small')).' '.UserAnchor($Row); 
            ?>
			<div class="colrme">
			<i class="ff-time fhf"></i>
            <?php
                  echo Anchor(Gdn_Format::Date($Row->DateInserted, 'html'), $Row->Url); 
                 
                  if (isset($Row->CategoryID)) {
                     $Category = CategoryModel::Categories($Row->CategoryID);
                     if ($Category) {
                        $Url = CategoryUrl($Category);
                        echo ' in '.Anchor($Category['Name'], $Url, 'Category');
                     }
                  }
            ?>
			</div>
           </div>

		 
		</div>	
		
		
		<?php $this->FireEvent('BeforeItemContent'); ?>
		<div class="ItemContent">
			<?php echo Anchor(Gdn_Format::Text($Row->Title), $Row->Url, 'Title'); ?>
			<div class="Message Excerpt"><?php
            if ($SearchTerm)
               echo MarkString($SearchTerm, $Row->Summary);
            else
               echo $Row->Summary;
			?></div>
  <div style="clear:both;"></div>
	</li>
	
<?php
	}
}
?>
</ul>