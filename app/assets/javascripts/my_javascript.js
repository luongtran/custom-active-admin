//= require jquery.jstree

$(document).ready(function () {

    var trees = $(".treeViewDiv");
    for (var i = 0; i < trees.length; i++) {
        var current_node_pid = $(trees[i]).attr('pid');
        treeIt(i);
    }
    function treeIt(i) {
        var current_node_pid = $(trees[i]).attr('pid');
        $($(".treeViewDiv")[i]).jstree({
            "json_data": {
                "ajax": {
                    "url": function (node) {
<<<<<<< HEAD
                    	return "/roots/" + current_node_pid;
=======
                        if (node == -1) {
                            console.log('get root node: ' + node);
                            return "/roots/" + current_node_pid;
                        } else { // Node have parent
                            var parent_pid = $(node).attr('pid');
                            console.log('get children of' + parent_pid);
                            return "/childrens-of/" + parent_pid;
                        }
>>>>>>> 94b96aa521c40d5bbdbbb939331f00ca03b4c3a3
                    },
                    "type": "GET",
                    "success": function (nodes) {
                        var data = [];
                        for (var i = 0; i < nodes.length; i++) {
                            var op = nodes[i];
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
            "plugins": [ "themes", "json_data", "ui" ]   //add "dnd" to Drag & Drop
        }).bind("select_node.jstree", function (e, data) {
                var pid = $(data.rslt.obj[0]).attr('pid');
                $.ajax({
                    url: "/packet-infor/" + pid,
                    type: 'GET',
                    success: function () {
                        console.log('get packet infor success');
                    }
                })
            }).bind("open_node.jstree", function (e, data){
            	console.log(data);
            	var pid = $(data.rslt.obj[0]).attr('pid');
            	console.log(pid);
            	$.ajax({
            		url: "/childrens-of/" + pid,
            		type: "GET",
            		success: function(nodes) {
            			console.log(nodes.length);
                        var data = [];
                        for (var i = 0; i < nodes.length; i++) {
                            var op = nodes[i];
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
            	});
            });
    };
    $("#sortable").sortable({
        update: function (event, ui) {
            var order = [];
            for (i = 0; i < $(".treeViewDiv").length; i++) {
                order[i] = $($(".treeViewDiv")[i]).attr('pid');
            }
            console.log(order);
            var datasend = new FormData();
            datasend.append('new_order', order)
            $.ajax({
                url: '/reorder',
                data: datasend,
                contentType: false,
                processData: false,
                type: 'POST',
                success: function (respond) {
                }
            })
        }
    });
});