//= require jquery.jstree


$(document).ready(function () {
    $("#treeViewDiv").jstree({
        "json_data": {
            "ajax": {
                "url": function (node) {
                    if (node == -1) {
                        return "/roots";
                    } else {
                        return "/childrens-of/" + node.attr("pid");
                    }
                },
                "type": "GET",
                "success": function (ops) {
                    var data = [];
                    for (var i = 0; i < ops.length; i++) {
                        var op = ops[i];
                        var node = {
                            "data": op.name,
                            "attr": {"pid": op.id},
                            "metadata": op,
                            "state": "closed"
                        }
                        data.push(node);
                    }
                    return data;
                }
            },
        },
        "themes": {
            "theme": "classic",
            "dots": true,
            "icons": false
        },
        "plugins": [ "themes", "json_data", "ui", "dnd", "sort" ]
    }).bind("select_node.jstree", function (e, data) {
            var pid = $(data.rslt.obj[0]).attr('pid');
            $.ajax({
                url: "/packet-infor/"+ pid,
                type: 'GET',
                success: function () {
                    console.log('success');
                }
            })
        })
});