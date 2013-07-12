<!-- JS Relys on EditableFormField as a class - and the 3 ids in this order - do not change -->
<li class="$ClassName EditableFormField" id="$Name.ATT EditableItem_$Pos $Name">
	<div class="fieldInfo">
		<% if canEdit %>
			<img class="fieldHandler" src="$ModulePath(framework)/images/drag.gif" alt="<% _t('DRAG', 'Drag to rearrange order of fields') %>" />
		<% else %>
			<img class="fieldHandler" src="$ModulePath(framework)/images/drag_readonly.gif" alt="<% _t('LOCKED', 'These fields cannot be modified') %>" />
		<% end_if %>
	
		<img class="icon" src="$Icon" alt="$ClassName" title="$singular_name" />
	
		$TitleField
	</div>
	
	<div class="fieldActions">
		<% if showExtraOptions %>
			<a class="moreOptions" href="#" title="<% _t('SHOWOPTIONS', 'Show Options') %>"><% _t('SHOWOPTIONS','Show Options') %></a>
		<% end_if %>
		
		<% if canDelete %>
			<a class="delete" href="#" title="<% _t('DELETE', 'Delete') %>"><% _t('DELETE', 'Delete') %></a>
		<% end_if %> 	
	</div>
	
	<% if showExtraOptions %>
		<div class="extraOptions hidden" id="$Name.ATT-extraOptions">
			<% if HasAddableOptions %>
				<fieldset class="fieldOptionsGroup">
					<legend><% _t('OPTIONS', 'Options') %></legend>
					<ul class="editableOptions" id="$FieldName.ATT-list">

						<% if canEdit %>
							<% with Options %>
								$EditSegment
							<% end_with %>
							<% if HasAddableOptions %>
								<li class="{$ClassName}Option">
									<a href="#" rel="$ID" class="addableOption" title="<% _t('ADD', 'Add option to field') %>">
										Add Option
									</a>
								</li>
							<% end_if %>
						<% else %>
							<% with Options %>
								$ReadonlyOption
							<% end_with %>
						<% end_if %>
					</ul>
				</fieldset>
			<% end_if %>
			
			<% if FieldConfiguration %>
				<fieldset class="fieldOptionsGroup">
					<legend><% _t('FIELDCONFIGURATION', 'Field Configuration') %></legend>
					<% with FieldConfiguration %>
						$FieldHolder
					<% end_with %>
				</fieldset>
			<% end_if %>
			
			<% if FieldValidationOptions %>
				<fieldset class="fieldOptionsGroup">
					<legend><% _t('VALIDATION', 'Validation') %></legend>
					<% with FieldValidationOptions %>
						$FieldHolder
					<% end_with %>
				</fieldset>
			<% end_if %>
		
			<fieldset class="customRules fieldOptionsGroup">
				<legend><% _t('CUSTOMRULES', 'Custom Rules') %></legend>
				<ul id="{$FieldName}-customRules">
					<li>
						<a href="#" class="addCondition" title="<% _t('ADD', 'Add') %>"><% _t('ADDRULE', 'Add Rule') %></a>
					</li>
					<li class="addCustomRule">					
						<select name="{$FieldName}[CustomSettings][ShowOnLoad]">
							<option value="Show" <% if ShowOnLoad %>selected="selected"<% end_if %>><% _t('SHOW', 'Show') %></option>
							<option value="Hide" <% if ShowOnLoad %><% else %>selected="selected"<% end_if %>><% _t('HIDE', 'Hide') %></option>
						</select>

						<label class="left"><% _t('FIELDONDEFAULT', 'Field On Default') %></label>
					</li>
					<li class="hidden">
						<select class="displayOption customRuleField" name="{$FieldName}[CustomRules][Display]">
							<option value="Show"><% _t('SHOWTHISFIELD', 'Show This Field') %></option>
							<option value="Hide"><% _t('HIDETHISFIELD', 'Hide This Field') %></option>
						</select>

						<label><% _t('WHEN', 'When') %></label>
						<select class="fieldOption customRuleField" name="{$FieldName}[CustomRules][ConditionField]">
							<option></option>
							<% with Parent %>
								<% if Fields %>
									<% loop Fields %>
										<option value="$Name"><% if Title %>$Title<% else %>$Name<% end_if %></option>
									<% end_loop %>
								<% end_if %>
							<% end_with %>
						</select>

						<label><% _t('IS', 'Is') %></label>
						<select class="conditionOption customRuleField" name="{$FieldName}[CustomRules][ConditionOption]">
							<option value=""></option>
							<option value="IsBlank"><% _t('BLANK', 'Blank') %></option>
							<option value="IsNotBlank"><% _t('NOTBLANK', 'Not Blank') %></option>
							<option value="HasValue"><% _t('VALUE', 'Value') %></option>
							<option value="ValueNot"><% _t('NOTVALUE', 'Not Value') %></option>
							<option value="ValueLessThan"><% _t('LESSTHAN', 'Value Less Than') %></option>
							<option value="ValueLessThanEqual"><% _t('LESSTHANEQUAL', 'Value Less Than Or Equal') %></option>
							<option value="ValueGreaterThan"><% _t('GREATERTHAN', 'Value Greater Than') %></option>
							<option value="ValueGreaterThanEqual"><% _t('GREATERTHANEQUAL', 'Value Greater Than Or Equal') %></option>
						</select>

						<input type="text" class="ruleValue hidden customRuleField" name="{$FieldName}[CustomRules][Value]" />

						<a href="#" class="deleteCondition" title="<% _t('DELETE', 'Delete') %>"><img src="cms/images/delete.gif" alt="<% _t('DELETE', 'Delete') %>" /></a>
					</li>
					<% if CustomRules %>
						<% loop CustomRules %>
							<li>
<select class="displayOption customRuleField" name="{$FieldName}[CustomRules][$Pos][Display]">
	<option value="Show" <% if Display = Show %>selected="selected"<% end_if %>><% _t('SHOWTHISFIELD', 'Show This Field') %></option>
	<option value="Hide" <% if Display = Hide %>selected="selected"<% end_if %>><% _t('HIDETHISFIELD', 'Hide This Field') %></option>
</select>
	
<label><% _t('WHEN', 'When') %></label>
<select class="fieldOption customRuleField" name="{$FieldName}[CustomRules][$Pos][ConditionField]">
	<option value="" selected="selected"></option>
	<% loop Fields %>
		<option value="$Name" <% if isSelected %>selected="selected"<% end_if %>>$Title</option>
	<% end_loop %>
</select>

<label><% _t('IS', 'Is') %></label>
<select class="conditionOption customRuleField" name="{$FieldName}[CustomRules][$Pos][ConditionOption]">
	<option value="IsBlank" <% if ConditionOption = IsBlank %>selected="selected"<% end_if %>><% _t('BLANK', 'Blank') %></option>
	<option value="IsNotBlank" <% if ConditionOption = IsNotBlank %>selected="selected"<% end_if %>><% _t('NOTBLANK', 'Not Blank') %></option>
	<option value="HasValue" <% if ConditionOption = HasValue %>selected="selected"<% end_if %>><% _t('VALUE', 'Value') %></option>
	<option value="ValueNot" <% if ConditionOption = ValueNot %>selected="selected"<% end_if %>><% _t('NOTVALUE', 'Not Value') %></option>
	<option value="ValueLessThan" <% if ConditionOption = ValueLessThan %>selected="selected"<% end_if %>><% _t('LESSTHAN', 'Value Less Than') %></option>
	<option value="ValueLessThanEqual" <% if ConditionOption = ValueLessThanEqual %>selected="selected"<% end_if %>><% _t('LESSTHANEQUAL', 'Value Less Than Or Equal') %></option>
	<option value="ValueGreaterThan" <% if ConditionOption = ValueGreaterThan %>selected="selected"<% end_if %>><% _t('GREATERTHAN', 'Value Greater Than') %></option>
	<option value="ValueGreaterThanEqual" <% if ConditionOption = ValueGreaterThanEqual %>selected="selected"<% end_if %>><% _t('GREATERTHANEQUAL', 'Value Greater Than Or Equal') %></option>
</select>

<input type="text" class="ruleValue <% if ConditionOption %><% if ConditionOption = IsBlank %>hidden<% else_if ConditionOption = IsNotBlank %>hidden<% end_if %><% else %>hidden<% end_if %> customRuleField" name="{$FieldName}[CustomRules][$Pos][Value]" value="$Value" />

<a href="#" class="deleteCondition" title="<% _t('DELETE', 'Delete') %>"><img src="cms/images/delete.gif" alt="<% _t('DELETE', 'Delete') %>" /></a>
							</li>
						<% end_loop %>
					<% end_if %>
				</ul>
			</fieldset>
		</div>
	<% end_if %>
	
	<!-- Hidden option Fields -->
	<input type="hidden" class="typeHidden" name="{$FieldName}[Type]" value="$ClassName" /> 
	<input type="hidden" class="sortHidden" name="{$FieldName}[Sort]" value="$Sort" />
</li>
