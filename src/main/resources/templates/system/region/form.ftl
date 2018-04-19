<form class="app-form" id="region-form">
    <input type="hidden" name="id">

    <div class="field">
        <input class="easyui-textbox" name="name" style="width:100%" data-options="label:'regionName：',required:true">
    </div>
    <div class="field">
        <input class="easyui-textbox" name="whname" style="width:100%" data-options="label:'whName：',required:true">
    </div>
    <div class="field">
        <input class="easyui-textbox" name="whaddress" style="width:100%" data-options="label:'whAddress：',required:true">
    </div>
    <div class="field">
        <input class="easyui-textbox" name="whdesc" style="width:100%" data-options="label:'whDesc：',required:true">
    </div>

    <div class="field">
        <input class="easyui-textbox" name="description" style="width:100%" data-options="label:'Description：',required:true">
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