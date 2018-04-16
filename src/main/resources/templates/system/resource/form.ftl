<form class="app-form" id="resource-form">
	<input type="hidden" name="id">
	<div class="field">
      <select id="resource-form-parent" value="${parentId!''}" name="parent" url="/system/resource/parent/tree" label="fater resoruce：" style="width:100%"></select>
    </div>
	<div class="field">
        <input class="easyui-textbox" name="resName" style="width:100%" data-options="label:'resouce name：',required:true">
    </div>
    
    <div class="field">
        <input class="easyui-textbox" name="resKey" style="width:100%" data-options="label:'resource identification：',required:true">
    </div>
    <div class="field">
        <select class="easyui-combobox" name="resType" panelHeight="auto" editable="false" label="resource type：" style="width:100%">
	        <option value="MENU">menu</option>
	        <option value="FUNCTION">function</option>
	        <option value="BLOCK">block</option>
        </select>
    </div>
    <div class="field">
        <input class="easyui-textbox" name="menuUrl" style="width:100%" data-options="label:'menu URL：'">
    </div>
    <div class="field">
        <input class="easyui-textbox" name="funUrls" style="width:100%;height:60px" data-options="label:'function URLS：',multiline:true">
    </div>
    <div class="field">
        <input class="easyui-numberbox" name="weight" style="width:100%" data-options="label:'weight：'">
    </div>
    <div class="field">
       <label class="textbox-label textbox-label-before">status：</label> 
       <input class="easyui-switchbutton" name="status" data-options="onText:'enable',offText:'disable',checked:true" value="true">
    </div>
</form>

<script>
  $("#resource-form-parent").combotree(<#if resource??>{
		onLoadSuccess:function(){
          $("#resource-form").form("load",${resource})
		}
	}</#if>)
</script>
