<form class="app-form" id="category-form">
	<input type="hidden" name="id">
	<div class="field">
      <select id="category-form-parent" value="${parentId!''}" name="parent_id" url="/system/category/parent/tree" label="fater resoruce：" style="width:100%"></select>
    </div>
	<div class="field">
        <input class="easyui-textbox" name="name" style="width:100%" data-options="label:'category name：',required:true">
    </div>
	<div class="field">
        <input class="easyui-textbox" name="weight" style="width:100%" data-options="label:'category weight：',required:true">
    </div>
   <div class="field">
        <input class="easyui-textbox" name="description" style="width:100%" data-options="label:'category description：',required:true">
    </div>

    <div class="field">
       <label class="textbox-label textbox-label-before">status：</label>
       <input class="easyui-switchbutton" name="status" data-options="onText:'enable',offText:'disable',checked:true" value="true">
    </div>
</form>

<script>
  $("#category-form-parent").combotree(<#if category??>{
		onLoadSuccess:function(){
          $("#category-form").form("load",${category})
		}
	}</#if>)
</script>
