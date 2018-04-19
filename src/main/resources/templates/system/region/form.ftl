<form class="app-form" id="region-form">
  <input type="hidden" name="id">
<#if region??>
  <input type="hidden" name="userName">
</#if>
  <div class="field">
    <input class="easyui-textbox" name="realName" style="width:80%" data-options="label:'name：',required:true">
    <select class="easyui-combobox" editable="false" data-options="panelHeight:'auto'" name="gender" style="width:18%">
      <option value="BOY">male</option>
      <option value="GIRL">female</option>
    </select>
  </div>
<#if !region??>
  <div class="field">
    <input id="region_userName" name="userName" style="width:100%">
  </div>
</#if>
  <div class="field">
    <input class="easyui-textbox" name="telephone" style="width:100%" data-options="label:'phone：',required:true">
  </div>
  <div class="field">
    <input class="easyui-textbox" name="email" style="width:100%" data-options="label:'email：',required:true,validType:'email'">
  </div>
  <div class="field">
    <input id="cc" class="easyui-combobox" style="width:100%" name="roles" data-options="label:'user role：',valueField:'id',panelMaxHeight:200,panelHeight:'auto',textField:'roleName',url:'/system/region/roles',editable:false,multiple:true">
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
	<#if region??>
    $(function () {
      //
      setTimeout(function () {
        var region = ${region};
        if (region.roles) {
          var roles = [];
          $.each(region.roles, function () {
            roles.push(this.id);
          });
          region.roles = roles.join(",");
        }
        $("#region-form").form("load", region);
      }, 200);
    });
	</#if>
</script>