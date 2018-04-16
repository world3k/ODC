<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Online Distribution Center</title>
  <link rel="stylesheet" href="/css/login.css">
  <link rel="stylesheet" href="/font-awesome/css/font-awesome.min.css">
</head>
<body>
<div class="logo_box">
  <h1>Online Distribution Center</h1>
  <form action="login" method="post" autocomplete="off">
    <div class="input_outer">
      <i class="fa fa-user-o u_user"></i>
      <input required="required" name="userName" class="text" placeholder="User Name" type="text">
    </div>
    <div class="input_outer">
      <i class="fa fa-eye u_user"></i>
      <input required="required" placeholder="Password" name="password" class="text" type="password">
    </div>
    <div class="mb2">
      <button class="act-but submit" style="color: #FFFFFF">Login</button>
      <div class="actions"><a href="/reg">Register</a></div>
    </div>
  <#if error??>
    <div style="text-align:center;padding: 10px;">${error}</div>
  </#if>

  </form>
</div>
</body>
</html>