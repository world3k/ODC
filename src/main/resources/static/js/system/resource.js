define(function () {
  return function () {
    var dg = $("#resource_dg");
    var form;//form object.

    dg.treegrid({
      fit: true,
      idField: 'id',
      treeField: 'resName',
      fitColumns: true,
      border: false,
      columns: [[
        {
          field: 'resName',
          title: 'resource name',
          width: 80
        },
        {
          field: 'resKey',
          title: 'resource identification',
          width: 50
        },
        {
          field: 'resType',
          title: 'resource type',
          width: 40
        },
        {
          field: 'menuUrl',
          title: 'menu URL',
          width: 50
        },
        {
          field: 'funUrls',
          title: 'function URLS',
          width: 50
        },
        {
          field: 'weight',
          title: 'weight',
          align: 'center',
          width: 30
        },
        {
          field: 'status',
          title: 'status',
          width: 30,
          align: 'center',
          formatter: function (val, row) {
            return val ? "enable" : "disable";
          }
        },
        {
          field: 'id',
          title: 'do',
          width: 50,
          align: 'center',
          formatter: function (value, row, index) {
            return authToolBar({
              "resource-edit": '<a data-id="' + value + '" class="ctr ctr-edit">edit</a>',
              "resource-delete": '<a data-id="' + value + '" class="ctr ctr-delete">delete</a>'
            }).join("");
          }
        }]],
      toolbar: authToolBar({
        "resource-create": {
          iconCls: 'fa fa-plus-square',
          text: "create resource",
          handler: function () {
            createForm();
          }
        }
      }),
      url: '/system/resource/list'
    });


    dg.datagrid("getPanel").on('click', "a.ctr-edit", function () {// edit button event
      createForm.call(this, this.dataset.id)
    }).on('click', "a.ctr-delete", function () {// delete event
      var id = this.dataset.id;
      $.messager.confirm("delete alert", "Are you sure to delete this resource?", function (r) {
        if (r) {
          $.get("/system/resource/delete", {id: id}, function () {
            // refresh after delete
            dg.treegrid("reload");
          });
        }
      });
    });

    /**
     * loading form.
     *
     * @returns
     */
    function createForm(id) {
      var dialog = $("<div/>", {class: 'noflow'}).dialog({
        title: (id ? "edit" : "create") + "resource",
        iconCls: 'fa ' + (id ? "fa-edit" : "fa-plus-square"),
        height: 480,
        width: 420,
        href: '/system/resource/form',
        queryParams: {
          id: id
        },
        modal: true,
        onClose: function () {
          $(this).dialog("destroy");
        },
        onLoad: function () {
          //
          form = $("#resource-form");

        },
        buttons: [{
          iconCls: 'fa fa-save',
          text: 'Save',
          handler: function () {

            if (form.form('validate')) {
              $.post("/system/resource/save", form.serialize(), function (res) {
                dg.treegrid('reload');
                dialog.dialog('close');
              })
            }
          }
        }]
      });
    }
  }
});