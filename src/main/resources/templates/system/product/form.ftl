<form class="app-form" id="product-form">
  <input type="hidden" name="id">

  <div class="field">
    <input class="easyui-textbox" name="prod_name" style="width:100%" data-options="label:'prod_name：',required:true">
  </div>
  <div class="field">
    <input class="easyui-textbox" name="color" style="width:100%" data-options="label:'color：',required:true">
  </div>
  <div class="field">
    <input class="easyui-textbox" name="description" style="width:100%" data-options="label:'description：',required:true">
  </div>
  <div class="field">
    <input class="easyui-textbox" name="weight" style="width:100%" data-options="label:'weight：',required:true">
  </div>
  <div class="field">
    <input class="easyui-textbox" name="avatar" style="width:100%" data-options="label:'avatar：',required:true">
  </div>
  <div class="field">
    <input class="easyui-textbox" name="quantity" style="width:100%" data-options="label:'quantity：',required:true">
  </div>
    <div class="field">
        <label class="textbox-label textbox-label-before">status：</label>
        <input class="easyui-switchbutton" name="status" data-options="onText:'enable',offText:'disable',checked:true" value="true">
    </div>

</form>
<script>
	<#if product??>
    $(function () {
      //
      setTimeout(function () {
        var product = ${product};
        if (product.roles) {
          var roles = [];
          $.each(product.roles, function () {
            roles.push(this.id);
          });
          product.roles = roles.join(",");
        }
        $("#product-form").form("load", product);
      }, 200);
    });
	</#if>
</script>