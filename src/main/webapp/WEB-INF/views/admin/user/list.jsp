<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="userApiUrl" value="/api/users"/>
<c:url var="usersUrl" value="/admin/user-list"/>
<body>
<div class="main-content">
    <form action="${formUrl}" id="listForm" method="GET">
        <div class="main-content-inner">
            <div class="breadcrumbs" id="breadcrumbs">
                <script type="text/javascript">
                    try {
                        ace.settings.check('breadcrumbs', 'fixed')
                    } catch (e) {
                    }
                </script>

                <ul class="breadcrumb">
                    <li>
                        <i class="ace-icon fa fa-home home-icon"></i>
                        <a href="/admin/home">
                            Trang chủ
                        </a>
                    </li>
                    <li class="active">
                        Danh sách người dùng
                    </li>
                </ul>
                <!-- /.breadcrumb -->
            </div>
            <div class="page-content">
                <div class="row">
                    <div class="col-xs-12">
                        <c:if test="${messageResponse!=null}">
                            <div class="alert alert-block alert-${alert}">
                                <button type="button" class="close" data-dismiss="alert">
                                    <i class="ace-icon fa fa-times"></i>
                                </button>
                                    ${messageResponse}
                            </div>
                        </c:if>
                        <!-- PAGE CONTENT BEGINS -->
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="widget-box table-filter">
                                    <div class="widget-header">
                                        <h4 class="widget-title">
                                            Tìm kiếm
                                        </h4>
                                        <div class="widget-toolbar">
                                            <a href="#" data-action="collapse">
                                                <i class="ace-icon fa fa-chevron-up"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="widget-body">
                                        <div class="widget-main">
                                            <div class="form-horizontal">
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label">
                                                        Giá trị cần tìm
                                                    </label>
                                                    <div class="col-sm-8">
                                                        <div class="fg-line">
                                                            <input class="form-control" value=""/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label"></label>
                                                    <div class="col-sm-8">
                                                        <button id="btnSearch" type="button"
                                                                class="btn btn-sm btn-success">
                                                            Tìm kiếm
                                                            <i class="ace-icon fa fa-arrow-right icon-on-right bigger-110"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="table-btn-controls">
                                    <div class="pull-right tableTools-container">
                                        <div class="dt-buttons btn-overlap btn-group">
                                            <a flag="info"
                                               class="dt-button buttons-colvis btn btn-white btn-primary btn-bold"
                                               data-toggle="tooltip" title="Thêm người dùng"
                                               href='<c:url value="/admin/user-add"/>'>
                                                    <span>
                                                        <i class="fa fa-plus-circle bigger-110 purple"></i>
                                                    </span>
                                            </a>
                                            <button id="btnDeleteUser" type="button"
                                                    class="dt-button buttons-html5 btn btn-white btn-primary btn-bold"
                                                    data-toggle="tooltip" title="Xóa xoá người dùng">
                                                        <span>
                                                            <i class="fa fa-trash-o bigger-110 pink"></i>
                                                        </span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="table-responsive">
                                    <table id="userList" class="table table-fcv-ace table-striped table-bordered table-hover dataTable no-footer">
                                        <thead>
                                        <tr>
                                            <th><input type='checkbox' id='checkAll' class='check-box-element'></th>
                                            <th>Tên</th>
                                            <th>Họ tên</th>
                                            <th>Thao tác</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${users}" var="item">
                                        <tr>
                                            <td><input type="checkbox" name="checkList" value="${item.id}"
                                                       id="checkbox_${item.id}" class="check-box-element"/></td>
                                            <td>${item.userName}</td>
                                            <td>${item.fullName}</td>
                                            <td>
                                                <c:if test="${item.roleCode != 'ADMIN'}">
                                                    <a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
                                                       title="Cập nhật người dùng"
                                                       href='<c:url value="/admin/user-edit-${item.id}"/>'>
                                                        <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                                    </a>
                                                </c:if>
                                                <c:if test="${item.roleCode == 'ADMIN'}">
                                                    <p>Không đươc thao tác</p>
                                                </c:if>
                                            </td>
                                        </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<script>
    //delete user
    document.getElementById('btnDeleteUser').onclick = function() {
        swal({
            title : "Bạn có chắc chắn?",
            text : "Bạn sẽ xóa sản phẩm này khỏi dữ liệu!",
            type : "warning",
            showCancelButton : true,
            confirmButtonColor : '#DD6B55',
            confirmButtonText : 'Vâng, Hãy Xóa!',
            cancelButtonText : "Không, Đừng Xóa!",
            closeOnConfirm : false,
            closeOnCancel : false
        }, function(isConfirm) {
            if (isConfirm) {
                // var data = {};
                var ids = $('#userList').find(
                    'tbody input[type=checkbox]:checked').map(function() {
                    return $(this).val();
                }).get();
                // data['ids'] = ids;
                deleteUsers(ids);
            } else {
                swal("Chưa Thực Hiện Xóa", "Dữ liệu vẫn an toàn", "error");
            }
        });
    };

    function deleteUsers(data) {
        $.ajax({
            type: "DELETE",
            url: "${userApiUrl}",
            data: JSON.stringify(data),
            contentType: "application/json",
            success: function (response) {
                window.location.href = "${usersUrl}";
            },
            error: function (response) {
                window.location.href = "${usersUrl}";
            }
        });
    }
</script>