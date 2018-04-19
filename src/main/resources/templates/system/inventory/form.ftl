<form class="app-form" id="inventory-form">
  <input type="hidden" name="id">
  <div class="field">
    <input class="easyui-textbox" name="amountinstock" style="width:100%" data-options="label:'amountinstock：',required:true">
  </div>
  <div class="field">
    <input class="easyui-textbox" name="avatar" style="width:100%" data-options="label:'avatar：',required:true">
  </div>
    <div class="field">
    <input class="easyui-textbox" name="inv_status" style="width:100%" data-options="label:'inv_status：',required:true">
  </div>
    <div class="field">
    <input class="easyui-textbox" name="max_quantity" style="width:100%" data-options="label:'max_quantity：',required:true">
  </div>
    <div class="field">
    <input class="easyui-textbox" name="price" style="width:100%" data-options="label:'price：',required:true">
  </div>

    <div class="field">
    <input class="easyui-textbox" name="refill_date" style="width:100%" data-options="label:'refill_date：',required:true">
  </div>  
    <div class="field">
    <input class="easyui-textbox" name="refill_point" style="width:100%" data-options="label:'refill_point：',required:true">
  </div>

  <div class="field">
    <label class="textbox-label textbox-label-before">status：</label>
    <input class="easyui-switchbutton" name="status" data-options="onText:'enable',offText:'disable',checked:true" value="true">
  </div>
  <div class="field">
  Default new user's password: 0000
  </div>
</form>
<script>
	<#if inventory??>
    $(function () {
      //
      setTimeout(function () {
        var inventory = ${inventory};
        if (inventory.roles) {
          var roles = [];
          $.each(inventory.roles, function () {
            roles.push(this.id);
          });
          inventory.roles = roles.join(",");
        }
        $("#inventory-form").form("load", inventory);
      }, 200);
    });
	</#if>
</script>