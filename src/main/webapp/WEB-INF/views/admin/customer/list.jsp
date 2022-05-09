<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="customersURL" value="/admin/customer-list" />
<c:url var="customerApiURL" value="/api/customers" />
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try {
                    ace.settings.check('breadcrumbs', 'fixed')
                } catch (e) {}
            </script>

            <ul class="breadcrumb">
                <li><i class="ace-icon fa fa-home home-icon"></i> <a href="/admin/home">Trang Chủ</a>
                </li>
                <li class="active">Danh Sách Khách Hàng</li>
            </ul>
            <!-- /.breadcrumb -->
        </div>


        <div class="page-content">
            <div class="row">
                <div class="col-xs-12">
                    <form action="" method="get" id="formSearchCustomer">
                        <div class="widget-box">
                            <div class="widget-header">
                                <h4 class="widget-title">Tìm kiếm</h4>
                                <div class="widget-toolbar">
                                    <a href="#" data-action="collapse"> <i class="ace-icon fa fa-chevron-up"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="widget-body">
                                <div class="widget-main">
                                    <div class="row">

                                        <div class="col-xs-12">
                                            <!-- PAGE CONTENT BEGINS -->
                                            <div class="col-sm-6">
                                                <div>
                                                    <label for="fullName">Tên khách hàng</label>
                                                    <input type="text" name="fullName" id="fullName"
                                                        value="${model.fullName}" class="form-control" />
                                                    <%--                                                <form:input path="name" class="form-control"></form:input>--%>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6">
                                                <div>
                                                    <label for="phone">Di Động </label> <input type="tel" id="phone"
                                                        value="${model.phone}" name="phone" class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12">
                                            <div class="col-xs-12 col-sm-6">
                                                <div>
                                                    <label for="email">Email </label> <input type="email" id="email"
                                                        value="${model.email}" name="email" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-4">
                                                <div class="form-group ">
                                                    <label for="staffId">Chọn nhân viên phụ trách </label>
                                                    <select id="staffId" name="staffId" class="form-control">
                                                        <option value="" selected>Choose...</option>
                                                        <c:forEach var="item" items="${staffs}">
                                                            <option value="${item.id}" ${item.id==model.staffId
                                                                ? 'selected' : '' }>
                                                                ${item.fullName}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-xs-12">
                                            <div class="col-xs-12 col-sm-4">
                                                <button
                                                    style="border: 0; margin-left: -12px; margin-top: 12px; padding: 8px 18px"
                                                    class="btn btn-info" type="submit" id="btnSearchBuilding">
                                                    Tìm kiếm
                                                </button>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <!-- /.row -->
                        </div>

                    </form>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <div class="pull-right">
                        <a title="Thêm khách hàng" class="btn btn-white btn-info btn-bold" data-toggle="tooltip"
                            href="/admin/customer-add"> <i class="fa fa-plus-circle"></i>
                        </a>
                        <button class="btn btn-white btn-info btn-bold" data-toggle="tooltip" title="Xóa khách hàng"
                            id="btnDeleteCustomer">
                            <i class=" fa fa-trash"></i>
                        </button>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <table id="customerList" class="table table-striped table-bordered table-hover">
                        <thead>
                            <tr>
                                <th><input type='checkbox' id='checkAll' class='check-box-element'></th>
                                <th>Tên khách hàng</th>
                                <th>Di Động</th>
                                <th>Email</th>
                                <th>Tình Trạng</th>
                                <th>Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${customers}" var="item">
                                <tr>
                                    <td><input type="checkbox" id="checkbox_${item.id}" value="${item.id}"></td>
                                    <td>${item.fullName}</td>
                                    <td>${item.phone}</td>
                                    <td>${item.email}</td>
                                    <td id="status_${item.id}">${item.status}</td>
                                    <td>
                                        <button class="btn btn-xs btn-info" data-toggle="tooltip" title="Giao khách hàng"
                                            onclick="assignmentCustomer(${item.id})">
                                            <i class="fa fa-eye" aria-hidden="true" id="button"></i>
                                        </button>
                                        <a href="<c:url value="/admin/customer-edit-${item.id}"/>"
                                            class="btn btn-xs btn-info" data-toggle="tooltip" title="Giao dịch và cập nhật">
                                            <i class="fa fa-pencil" aria-hidden="true"></i>
                                        </a>
                                        <button class="btn btn-xs btn-info" data-toggle="tooltip" title="Trạng Thái"
                                            onclick="statusCustomer(${item.id})">
                                            <i class="fa fa-calendar-o" aria-hidden="true"></i>
                                        </button>
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

<!-- START modal giao toa nha cho nhan vien quan ly -->
<div class="modal fade" id="assignmentCustomerModal" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Danh Sách Nhân Viên</h4>
            </div>
            <div class="modal-body">
                <table class="table table-bordered" id="staffList">
                    <thead>
                        <tr>
                            <th>Chọn nhân viên</th>
                            <th>Tên nhân viên</th>
                        </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
                <input type="hidden" id="customerId" name="customerId" value="">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="btnAssignCustomer">Giao
                    tòa nhà
                </button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
            </div>
        </div>
    </div>
</div>

<!-- modal for status customer -->
<div class="modal fade" id="statusCustomer" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Trạng Thái</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span style=" position: absolute; right: 15px;top: 10px;" aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
            </div>
            <input type="hidden" id="cusId" value="" />
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                <button type="button" onclick="saveStatusCustomer()" class="btn btn-primary">Lưu Thay Đổi</button>
            </div>
        </div>
    </div>
</div>

<script>
    function assignmentCustomer(customerId) {
        openModalAsssignmentCustomer();
        $('#customerId').val(customerId); // truyen id vao #customerId
        showStaffAssignment(customerId);
    }

    function statusCustomer(customerId) {
        openModalStatus();
        showStatus(customerId);
    }

    // show modal
    function openModalAsssignmentCustomer() {
        $('#assignmentCustomerModal').modal();
    }

    function openModalStatus() {
        $('#statusCustomer').modal();
    }

    function saveStatusCustomer() {
        var data = {};
        var id = $('#cusId').val();
        var status = $('#status').val();
        data['id'] = id;
        data['status'] = status;
        $.ajax({
            type: "PUT",
            url: "${customerApiURL}/updateStatus",
            data: JSON.stringify(data),
            contentType: "application/json",
            traditional: true,
            success: function (response) {
                swal("Thành công", "Trạng thái đã được lưu", "success");
                $('#status_'+response.id+'').html(''+response.status+'');
            },
            error: function (response) {
                console.log(response);
                swal("Thành công", "Trạng thái chưa được lưu", "success");
            }
        });
    }

    function showStatus(customerId) {
        $.ajax({
            type: "GET",
            url: "${customerApiURL}/status?id=" + customerId,
            dataType: "json",
            success: function (response) {
                $('#cusId').val(customerId);
                var html = '';
                html += ' <select id="status" name=""  class="form-control"> ';
                $.each(response, function (index, item) {
                    html += '<option value="' + item.status + '" ' + item.selected + '>' + item
                        .status + '</option>';

                });
                html += '</select>';
                $('#statusCustomer .modal-body').html(html);

            },
            error: function (response) {
                console.log(response);
            }
        });
    }

    function showStaffAssignment(id) {
        $.ajax({
            type: "GET",
            url: "${customerApiURL}/" + id + "/staffs",
            dataType: "json",
            success: function (response) {
                var html = '';
                $.each(response, function (index, staffOutput) {
                    html += '<tr>';
                    html += '<td><input type="checkbox" value="' + staffOutput.id + '" id="checkbox_' + staffOutput.userName + '" ' + staffOutput.checked + '></td>';
                    html += '<td>' + staffOutput.userName + '</td>';
                    html += '</tr>';
                });
                $('#staffList tbody').html(html);
            },
            error: function (response) {
                console.log(response);
            }
        });
    }

    //delete customer
    document.getElementById('btnDeleteCustomer').onclick = function() {
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
                var ids = $('#customerList').find(
                    'tbody input[type=checkbox]:checked').map(function() {
                    return $(this).val();
                }).get();
                // data['ids'] = ids;
                deleteCustomers(ids);
            } else {
                swal("Chưa Thực Hiện Xóa", "Dữ liệu vẫn an toàn", "error");
            }
        });
    };

    function deleteCustomers(data) {
        $.ajax({
            type: "DELETE",
            url: "${customerApiURL}",
            data: JSON.stringify(data),
            contentType: "application/json",
            success: function (response) {
                window.location.href = "${customersURL}";
            },
            error: function (response) {
                window.location.href = "${customersURL}";

            }
        });
    }

    $('#btnAssignCustomer').click(function () {
        var data = {};
        var staffs = $('#staffList').find('tbody input[type=checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
        var customerId = $('#customerId').val();
        data['staffs'] = staffs;
        data['customerId'] = customerId;
        assignStaff(data);

    });

    function assignStaff(data) {
        $.ajax({
            type: "POST",
            url: "${customerApiURL}/assignCustomer",
            data: JSON.stringify(data),
            contentType: "application/json",
            traditional: true,
            success: function (response) {
                if (response == "success") {
                    swal("Thành công", "Sản phẩm đã được lưa", "success");
                }
            },
            error: function (response) {
                console.log(response);
            }
        });
    }
</script>