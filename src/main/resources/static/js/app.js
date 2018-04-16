/**
 * System common js stores common function codes 。
 */
$(function () {

  //global ajax settings
  $.ajaxSetup({
    statusCode: {
      401: function () {
        $.messager.alert("Permission Alert", "You do not have permission to access thi resource!");
      },
      402: function () {
        $.messager.alert("Login Alert", "Session timeout,please login again!", 'info', function () {
          location.replace("/login");
        });
      }
    }
  });

  var center = $("body").layout("panel", "center");

  center.panel('options').onLoad = function () {
    require([center.panel('options').href.substring(1)], function (model) {
      model && model(center);
    });
  };

  // binding menu events
  $(".crm-menu").on('click', 'li', function () {
    if (!$(this).hasClass('selected')) {
      // get objects ofcenter panel

      // refresh center area.
      center.panel("refresh", this.dataset.url);
      // Selected status 
      $(this).siblings('.selected').toggleClass().end().addClass('selected');
    }
  });

  //Review and editing user info.
  $("#public_change_info").on('click', function () {
    var form;
    var dialog = $("<div/>", {class: 'noflow'}).dialog({
      title: "My info",
      iconCls: 'fa fa-user',
      height: 320,
      width: 420,
      href: '/change/info',
      modal: true,
      onClose: function () {
        $(this).dialog("destroy");
      },
      onLoad: function () {
        //Excute when the window form loads successfully.
        form = $("#public_change_info_form", this);
      },
      buttons: [{
        iconCls: 'fa fa-save',
        text: 'save',
        handler: function () {
          if (form.form('validate')) {
            $.post("/change/info", form.serialize(), function (res) {
              if (res.success) {
                dialog.dialog('close');
                location.replace('/');
              } else {
                $.messager.alert("System Alert", res.message);
              }
            })
          }
        }
      }]
    });

    /**
     * Uploading ICON
     */
    dialog.on('click', '#avatar-file', function () {
      //clear file infor selected previously
      this.value = "";
    }).on('change', '#avatar-file', function () {
      //uploading icon，h5
      var formData = new FormData();
      formData.append('file', this.files.item(0));
      formData.append('type', "AVATAR");
      $.ajax("/attachment/upload", {
        type: 'post',
        data: formData,
        cache: false,
        contentType: false,
        processData: false,
        complete: function (res) {
          var result = res.responseJSON;
          if (result.success) {
            $(".avatar-set", dialog).attr('src', result.data.filePath);
            $("#member-avatar", dialog).val(result.data.filePath);
          } else {
            $.messager.alert("System alert", result.message);
          }
        }
      })
    });
  });

  //Change password
  $("#public_change_password").on('click', function () {
    var form;
    var dialog = $("<div/>", {class: 'noflow'}).dialog({
      title: "Change password",
      iconCls: 'fa fa-lock',
      height: 220,
      width: 420,
      href: '/change/password',
      modal: true,
      onClose: function () {
        $(this).dialog("destroy");
      },
      onLoad: function () {
        //
        form = $("#public_change_password_form", this);
      },
      buttons: [{
        iconCls: 'fa fa-repeat',
        text: 'Confirm Edit',
        handler: function () {
          if (form.form('validate')) {
            $.post("/change/password", form.serialize(), function (res) {
              if (res.success) {
                dialog.dialog('close');
                location.replace('/logout');
              } else {
                $.messager.alert("System Alert", res.message);
              }
            })
          }
        }
      }]
    });
  });

  
  
  /**
   * expand jq component, ge a form with json format data
   * @param ignoreNull 
   * @returns {*}
   */
  (function ($) {
    $.fn.formToJson = function (ignoreNull) {
      //Delete nulls by default
      if (typeof ignoreNull === 'undefined') {
        ignoreNull = true
      }

      if (this.length <= 1) {
        return buildJson(this[0]);
      } else {
        //the situation of multiple forms 
        var forms = {};
        this.forEach(function (form, index) {
          var fName = $(form).attr('name');
          var key = fName ? fName : 'form' + index;
          forms[key] = buildJson(form);
        });
        return forms;
      }

      function buildJson(form) {
        var formData = new FormData(form);
        var json = {};
        formData.forEach(function (val, key) {
          if (!val && ignoreNull) {
            return
          }
          if (json[key]) {
            if (!$.isArray(json[key])) {
              json[key] = [json[key]]
            }
            json[key].push(val);
          } else {
            json[key] = val;
          }
        });
        return json;
      }
    };
  })(jQuery);
});