define(function () {
  return function () {
    var dg = $("#role_dg");
    var resourceTree = $("#role-resource-tree");
    var resourcePanel = $("#role-resource-panel");
    var currentRoelId;

    // 
    dg.edatagrid({
      url: '/system/role/list',
      saveUrl: '/system/role/save',
      updateUrl: '/system/role/update',
      destroyUrl: '/system/role/delete',
      emptyMsg: "no role",
      idField: "id",
      fit: true,
      rownumbers: true,
      ignore: ['resource'],
      fitColumns: true,
      border: false,
      columns: [[{
        field: 'roleName',
        title: 'role',
        width: 50,
        editor: {
          type: 'validatebox',
          options: {
            required: true
          }
        }
      }, {
        field: 'description',
        title: 'description',
        width: 100,
        editor: {
          type: 'textbox',
          options: {
            multiline: true,
            height: 50
          }
        }
      }, {
        field: 'status',
        title: 'status',
        width: 50,
        editor: {
          type: 'checkbox',
          options: {
            on: true,
            off: false
          }
        },
        formatter: function (val, row) {
          return val ? "enable" : "disable";
        }
      }]],
      toolbar: authToolBar({
        "role-create": {
          iconCls: 'fa fa-plus-square',
          text: "create",
          handler: function () {
            dg.edatagrid('addRow');
          }
        },
        "role-save": {
          iconCls: 'fa fa-save',
          text: "save",
          handler: function () {
            dg.edatagrid('saveRow');
          }
        },
        "role-delete": {
          iconCls: 'fa fa-trash',
          text: "delete",
          handler: function () {
            dg.edatagrid('destroyRow');
          }
        }
      }, {
        iconCls: 'fa fa-mail-reply',
        text: "cancel",
        handler: function () {
          dg.edatagrid('cancelRow');
        }
      }, {
        iconCls: 'fa fa-refresh',
        text: "refresh",
        handler: function () {
          dg.edatagrid('reload');
        }
      }),
      onError: function (index, data) {
        // 
        console.error(data);
      },
      onSelect: function (index, row) {
        if (row.roleName) {
          resourcePanel.panel("setTitle", "为[" + row.roleName + "]分配资源")
          currentRoelId = row.id;

          //clear previous selected nodes.
          var checked = resourceTree.tree('getChecked');
          $.each(checked, function () {
            resourceTree.tree('uncheck', this.target);
          });

          // choose the selected one
          $.each(row.resource, function () {
            var node = resourceTree.tree('find', this.id);

            // check the leaves
            resourceTree.tree('check', node.target);
          });
        }
      }
    });

    //instantiate permission tree.
    resourceTree.tree({
      url: "/system/role/resource/tree",
      checkbox: true,
      cascadeCheck: false
    });

    $("#role-resource-save").on("click", function () {
      if (currentRoelId) {
        // get related resource nodes.
        var nodes = resourceTree.tree('getChecked', ['checked', 'indeterminate']);
        // get node ID list
        var resourceId = [];
        $.each(nodes, function () {
          resourceId.push(this.id);
        });
        var prams = "roleId=" + currentRoelId + "&resourceId=" + resourceId.join("&resourceId=")
        // send request to save relation
        $.post("/system/role/resource/save", prams, function (rsp) {
          if (rsp.success) {
            dg.datagrid("reload");
            $.messager.alert("system alert", "save successfully!");
          }
        });
      } else {
        $.messager.alert("system alert", "please choose a role");
      }
    });
  }
});