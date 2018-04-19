define(function () {
    return function () {
        var dg = $("#product_dg");
        var searchFrom = $("#product_search_from");
        var form;

        //
        dg.datagrid({
            url: '/system/product/list',
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
                        {field: 'prod_name', title: 'name', width: 30},
                        {field: 'color', title: 'color', width: 20},
                        {field: 'avatar', title: 'avatar', width: 20},
                        {field: 'quantity', title: 'quantity', width: 20},
                        {field: 'weight', title: 'weight', width: 30},
                        {field: 'description', title: 'description', width: 50},
                        {field: 'status', title: 'status', width: 50},
                        {
                            field: 'id',
                            title: 'do',
                            width: 50,
                            align: 'center',
                            formatter: function (value, row, index) {
                                return authToolBar({
                                    "product-edit": '<a data-id="' + row.id + '" class="ctr ctr-edit">edit</a>',
                                    "product-delete": '<a data-id="' + row.id + '" class="ctr ctr-delete">delete</a>'
                                }).join("");
                            }
                        }
                    ]
                ],
            toolbar: authToolBar({
                "product-create": {
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
                    $.get("/system/product/delete", {id: id}, function () {
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
                href: '/system/product/form',
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
                            $.post("/system/product/save", form.serialize(), function (res) {
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