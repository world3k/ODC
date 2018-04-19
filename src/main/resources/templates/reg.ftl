<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Online Distribution Center</title>
  <link rel="stylesheet" href="/easyui/themes/gray/easyui.css">
  <link rel="stylesheet" href="/easyui/themes/icon.css">
  <link rel="stylesheet" href="/css/login.css">
  <link rel="stylesheet" href="/font-awesome/css/font-awesome.min.css">

    <style>
        .textbox{
            background: none;
        }
        #_easyui_textbox_input1{
            background: none;
        }
        .textbox-text .validatebox-text .validatebox-readonly {
            background: none;
        }


    </style>

   <script src="/easyui/jquery.min.js" charset="utf-8"></script>
  <script src="/easyui/jquery.easyui.min.js" charset="utf-8"></script>
  <script src="/easyui/jquery.edatagrid.js" charset="utf-8"></script>

</head>
<body>
<div class="logo_box">
  <h1>Register</h1>
  <form action="/reg" method="post" autocomplete="off">
    <div class="input_outer">
      <i class="fa fa-address-card-o u_user"></i>
      <input required="required" name="realName" class="text" placeholder="Input name" type="text">
    </div>
    <div class="input_outer">
      <i class="fa fa-user-o u_user"></i>
      <input required="required" name="userName" class="text" placeholder="Input username" type="text">
    </div>
    <div class="input_outer">
      <i class="fa fa-eye u_user"></i>
      <input required="required" placeholder="Input password" name="password" class="text" type="password">
    </div>
    <div style="text-align: center;margin: 10px;"><img onclick="this.src=this.src+'?r='+Date.now()" src="/verify/code"></div>
    <div class="input_outer">
      <i class="fa fa-key u_user"></i>
      <input maxlength="4" required="required" placeholder="please input verification code" name="code" class="text" type="text">
    </div>

    <div class="field" >
    <select id="cc" class="easyui-combobox" style="width:100%" name="regions" data-options="label:'region：',valueField:'id',panelMaxHeight:200,panelHeight:'auto',textField:'name',url:'/regions',editable:false">  </select>
    </div>
    

    
    <div class="mb2" style="margin-top: 50px;">
      <button class="act-but submit" style="color: #FFFFFF;">Submit</button>
    </div>
  <#if error??>
    <div style="text-align:center;padding: 10px;">${error}</div>
  </#if>

  </form>
</div>


</body>
</html>