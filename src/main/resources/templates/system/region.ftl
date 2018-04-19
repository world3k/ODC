<div class="easyui-layout" fit="true">
  <div data-options="region:'north',border:false" style="height: 80px;padding: 10px;overflow: hidden;" title="User Management">
    <form id="region_search_from" class="searcher-form">
      <input name="userName" class="easyui-textbox field" label="username：" labelWidth="45">
      <input name="realName" class="easyui-textbox field" label="name：" labelWidth="45">
      <input name="telephone" class="easyui-textbox field" label="phone：" labelWidth="45">
      <a class="easyui-linkbutton searcher" data-options="iconCls:'fa fa-search'">search</a>
      <a class="easyui-linkbutton reset" data-options="iconCls:'fa fa-repeat'">reset</a>
    </form>
  </div>
  <div data-options="region:'center',border:false" style="border-top: 1px solid #D3D3D3">
    <table id="region_dg"></table>
  </div>
</div>