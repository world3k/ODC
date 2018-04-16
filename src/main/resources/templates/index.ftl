<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Online Distribution Center</title>
  <link rel="stylesheet" href="/easyui/themes/gray/easyui.css">
  <link rel="stylesheet" href="/easyui/themes/icon.css">
  <link rel="stylesheet" href="/font-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="/css/app.css">
  <script src="/easyui/jquery.min.js" charset="utf-8"></script>
  <script src="/easyui/jquery.easyui.min.js" charset="utf-8"></script>
  <script src="/easyui/jquery.edatagrid.js" charset="utf-8"></script>
  <script src="/easyui/fixed.js" charset="utf-8"></script>
  <script src="/js/lib/xss.js" charset="utf-8"></script>

  <script src="/resource" charset="utf-8"></script>


  <script src="/js/lib/vue.js" charset="utf-8"></script>

  <script>
    var MEMBER = {
      id:${s_member.id},
      realName: '${s_member.realName}',
      userName: '${s_member.userName}'
    };
  </script>
  <script src="/js/require.js" charset="utf-8" data-main="js/app" defer async="true"></script>
</head>
<body class="easyui-layout">
<div data-options="region:'north'" style="height: 70px;overflow: hidden;padding: 0 10px;">
  <div class="user-info">
    <span class="item" id="public_change_info"><i class="fa fa-user"></i> ${s_member.realName}</span>
    <span class="item" id="public_change_password"><i class="fa fa-user"></i> Change password</span>
    <a class="item" href="/logout"><i class="fa fa-sign-out"></i> Logout</a>
  </div>
  <h1>Online Distribution Center</h1>
</div>
<div title="Menu" data-options="region:'west',iconCls:'fa fa-list'" style="width: 200px">
    <div class="easyui-accordion" id="accordion" data-options="fit:true,border:false,onSelect:function (title,index) {

          var obj = $('#accordion').accordion('getPanel',index);
          var ul=  obj.context.firstElementChild;
           $(ul).children().each(function() {
              $(this).removeClass();
           });
    }">  <#list menus as menu>
	  <#if !menu.parent??>
        <div title="${menu.resName}" data-options="iconCls:'fa fa-cogs'">
          <ul class="crm-menu">
			  <#list menus as child>
				  <#if child.parent?? && child.parent.id == menu.id>
                    <li data-url="${child.menuUrl}">${child.resName}</li>
				  </#if>
			  </#list>
          </ul>
        </div>
	  </#if>
  </#list>
  </div>
</div>

<div data-options="region:'center',href:'/desktop'">

</body>
</html>