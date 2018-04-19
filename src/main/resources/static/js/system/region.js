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
            columns:
                [
                    [
                        {field: 'name', title: 'name', width: 30},
                        {field: 'description', title: 'description', width: 20},
                        {field: 'whaddress', title: 'whaddress', width: 30},
                        {field: 'whdesc', title: '电话', width: 50},
                        {field: 'whname', title: 'email', width: 50},
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
                    ]
                ],
            toolbar: authToolBar({
                "region-create": {
                    iconCls: 'fa fa-plus-square',
                    text: "create",
                    handler: function () {
                        createForm()
                    }
                },
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