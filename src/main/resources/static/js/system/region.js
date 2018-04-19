define(function () {
  return function () {
    var dg = $("#region_dg");
    var searchFrom = $("#region_search_from");
    var form;

    // 
    dg.datagrid({
      url: '/system/region/list',
      emptyMsg: "no user",
      idField: "id",
      fit: true,
      rownumbers: true,
      fitColumns: true,
      border: false,
      pagination: true,
      singleSelect: true,
      ignore: ['roles'],
      pageSize: 30,
      columns: [[{
        field: 'realName',
        title: 'name',
        width: 30,
        editor: {
          type: 'validatebox',
          options: {
            required: true
          }
        },
        formatter: function (val) {
          return filterXSS(val);
        }
      }, {
        field: 'gender',
        title: 'gender',
        align: 'center',
        width: 20,
        editor: {
          type: 'combobox',
          options: {
            data: [{
              text: 'male',
              value: "BOY"
            }, {
              text: 'female',
              value: "GIRL"
            }],
            editable: false,
            required: true,
            panelHeight: 'auto'
          }
        },
        formatter: function (val) {
          return {
            "BOY": "male",
            "GIRL": "female"
          }[val];
        }
      }, {
        field: 'userName',
        title: 'username',
        width: 30,
        editor: {
          type: 'validatebox',
          options: {
            required: true,
            validType: 'userName'
          }
        },
        formatter: function (val) {
          return filterXSS(val);
        }
      }, {
        field: 'telephone',
        title: '电话',
        width: 50,
        editor: {
          type: 'validatebox',
          options: {
            required: true
          }
        }
      }, {
        field: 'email',
        title: 'email',
        width: 50,
        editor: {
          type: 'validatebox',
          options: {
            required: true,
            validType: 'email'
          }
        }
      }, {
        field: 'hiredate',
        title: '入职日期',
        width: 50,
        editor: {
          type: 'datebox',
          options: {
            editable: false
          }
        }
      }, {
        field: 'status',
        title: 'status',
        width: 20,
        align: 'center',
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
      }, {
        field: 'roles',
        title: 'role',
        width: 80,
        formatter: function (val, row, index) {
          var roleList = [];
          $.each(val, function () {
            roleList.push(this.roleName);
          });
          return roleList.join(',');
        }
      },
        {
          field: 'test',
          title: 'do',
          width: 50,
          align: 'center',
          formatter: function (value, row, index) {
            return authToolBar({
              "region-edit": '<a data-id="' + row.id + '" class="ctr ctr-edit">edit</a>',
              "region-delete": '<a data-id="' + row.id + '" class="ctr ctr-delete">delete</a>'
            }).join("");
          }
        }
      ]],
      toolbar: authToolBar({
        "region-create": {
          iconCls: 'fa fa-plus-square',
          text: "create",
          handler: function () {
            createForm()
          }
        },
        "region-reset-password": {
          iconCls: 'fa fa-repeat',
          text: "reset password",
          handler: function () {
            var row = dg.datagrid('getSelected');
            if (row) {
              $.messager.confirm('system alert', 'Are you sure to reset the password of 【' + row.realName + "】 password as:：0000", function (r) {
                if (r) {
                  $.get("/system/region/password/reset", {id: row.id}, function (rsp) {
                    $.messager.alert("system alert", "reset password successfully.");
                  })
                }
              })
            }
          }
        }
      })
    });


    /**
     * button events
     */
    dg.datagrid("getPanel").on('click', "a.ctr-edit", function () {// edit event
      createForm.call(this, this.dataset.id)
    }).on('click', "a.ctr-delete", function () {// delete event
      var id = this.dataset.id;
      $.messager.confirm("delete alert", "are you sure to delete this user?", function (r) {
        if (r) {
          $.get("/system/region/delete", {id: id}, function () {
            // 新
            dg.datagrid("reload");
          });
        }
      });
    });

    /**
     *search 
     */
    searchFrom.on('click', 'a.searcher', function () {//检索
      dg.datagrid('load', searchFrom.formToJson());
    }).on('click', 'a.reset', function () {//重置
      searchFrom.form('reset');
      dg.datagrid('load', {});
    });


    /**
     * create form.
     *
     * @returns
     */
    function createForm(id) {
      var dialog = $("<div/>", {class: 'noflow'}).dialog({
        title: (id ? "edit" : "create") + "user",
        iconCls: 'fa ' + (id ? "fa-edit" : "fa-plus-square"),
        height: id ? 380 : 420,
        width: 420,
        href: '/system/region/form',
        queryParams: {
          id: id
        },
        modal: true,
        onClose: function () {
          $(this).dialog("destroy");
        },
        onLoad: function () {
          //
          form = $("#region-form");

          //this field is special and has verification, so it needs instantiated
          $("#region_userName").textbox({
            label: 'username：',
            required: true,
            validType: ['userName', 'length[6, 10]', "remote['/system/region/check','userName']"]
          })
        },
        buttons: [{
          iconCls: 'fa fa-save',
          text: 'save',
          handler: function () {
            if (form.form('validate')) {
              $.post("/system/region/save", form.serialize(), function (res) {
                dg.datagrid('reload');
                dialog.dialog('close');
              })
            }
          }
        }]
      });
    }
  }
});