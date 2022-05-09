<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="customersUrl" value="/admin/customer-list"/>
<c:url var="customerApiUrl" value="/api/customers"/>
<c:url var="transactionApiUrl" value=""/>
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try {
                    ace.settings.check('breadcrumbs', 'fixed')
                } catch (e) {
                }
            </script>

            <ul class="breadcrumb">
                <li><i class="ace-icon fa fa-home home-icon"></i> <a href="/admin/home">Trang Chủ</a>
                </li>
                <c:if test="${customer.id != null}">
                    <li class="active">Chỉnh sửa khách hàng</li>
                </c:if>
                <c:if test="${customer.id == null}">
                    <li class="active">Thêm mới khách hàng</li>
                </c:if>
            </ul>
            <!-- /.breadcrumb -->
        </div>

        <div class="page-content">
            <div class="row">
                <div class="col-xs-12">
                <form class="form-horizontal" role="form" id="formEdit">
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="fullName">Tên
                            đầy đủ </label>
                        <div class="col-sm-9">
                            <input type="text" id="fullName" name="fullName" class="form-control"
                                   value="${customer.fullName}"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right"
                               for="phone"> Số điện thoại </label>
                        <div class="col-sm-9">
                            <input type="tel" id="phone"
                                   name="phone" class="form-control"
                                   value="${customer.phone}"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right"
                               for="email"> Email </label>
                        <div class="col-sm-9">
                            <input type="email" id="email" name="email"
                                   class="form-control" value="${customer.email}"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right"
                               for="demand">Nhu Cầu</label>

                        <div class="col-sm-9">
                            <input type="text" id="demand" name="demand"
                                   class="form-control" value="${customer.demand}"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="note">
                            Ghi Chú </label>
                        <div class="col-sm-9">
                            <textarea name="note" id="note" class="form-control">${customer.note}</textarea>
                        </div>
                    </div>
                    <input type="hidden" value="${customer.id}" name="id" id="id">

                    <div class="clearfix form-actions">
                        <div class="col-md-offset-3 col-md-9">
                            <c:if test="${customer.id != null}">
                                <button class="btn btn-info" type="submit" id="btnAddCustomer">
                                    <i class="ace-icon fa fa-check bigger-110"></i> Cập Nhật
                                </button>
                                <a href="${customersUrl}" class="btn" type="reset">
                                    <i class="ace-icon fa fa-undo bigger-110"></i> Thoát
                                </a>
                            </c:if>
                            <c:if test="${customer.id == null}">
                                <button class="btn btn-info" type="submit" id="btnAddCustomer">
                                    <i class="ace-icon fa fa-check bigger-110"></i> Thêm
                                </button>
                                    <a href="${customersUrl}" class="btn" type="reset">
                                        <i class="ace-icon fa fa-undo bigger-110"></i> Thoát
                                    </a>
                            </c:if>
                        </div>
                    </div>
                </form>
                </div>
            </div>
            <c:if test="${customer.id != null}">
                <div class="row">
                    <div class="col-xs-12">
                        <h3 class="header smaller lighter blue">Quá Trình CSKH</h3>

                        <div class="clearfix">
                            <div class="pull-right tableTools-container"></div>
                        </div>
                        <div class="table-header">
                            Danh sách CSKH
                        </div>

                        <div>
                            <table id="table_code1" class="table table-striped table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th class="center col-xs-2 ">
                                    </th>
                                    <th class="center col-xs-2 ">Ngày tạo</th>
                                    <th class="center col-xs-6 ">Ghi Chú</th>
                                    <th class="center col-xs-2 ">Nhân Viên</th>
                                </tr>
                                </thead>

                                <tbody>
                                <c:forEach var="item" items="${code1}">
                                    <tr>
                                        <td class="center">
                                            <label class="pos-rel">
                                                <input type="checkbox" class="ace" value="${item.id}"/>
                                                <span class="lbl"></span>
                                            </label>
                                        </td>
                                        <td>${item.createdDate}</td>
                                        <td>
                                            <input onchange="editCSKH(${item.id})" id="note_${item.id}" class="col-lg-12"
                                                   type="text" value="${item.note}"/>
                                        </td>
                                        <td class="center">${item.createdBy}</td>
                                    </tr>
                                </c:forEach>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td>
                                        <input class="col-lg-12" type="text" onchange="addCSKH()" name="note_code1"
                                               id="note_code1"/>
                                    </td>
                                    <td class="center">
                                        <button id="delete_note1" class="btn btn-white btn-info btn-bold"
                                                data-toggle="tooltip"
                                                title="Xóa ghi chú">
                                            <i class=" fa fa-trash"></i>
                                        </button>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- /.page-content -->
                <div class="row">
                    <div class="col-xs-12">
                        <h3 class="header smaller lighter blue">Quá Trình Dẫn Đi Xem</h3>

                        <div class="clearfix">
                            <div class="pull-right tableTools-container"></div>
                        </div>
                        <div class="table-header">
                            Danh Sách Dẫn Đi Xem
                        </div>
                        <div>
                            <table id="table_code2" class="table table-striped table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th class="center col-xs-2 ">
                                    </th>
                                    <th class="center col-xs-2 ">Ngày tạo</th>
                                    <th class="center col-xs-6 ">Ghi Chú</th>
                                    <th class="center col-xs-2 ">Nhân viên</th>
                                </tr>
                                </thead>

                                <tbody>

                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td><input class="col-lg-12" type="text" onchange="" name="note_code2"
                                               id="note_code2"/></td>
                                    <td class="center">
                                        <button id="delete_note2" class="btn btn-white btn-info btn-bold"
                                                data-toggle="tooltip"
                                                title="Xóa ghi chú">
                                            <i class=" fa fa-trash"></i>
                                        </button>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </c:if>
        </div>
    </div>
</div>
<!-- START modal giao toa nha cho nhan vien quan ly -->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Thêm Ghi Chú</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right"
                           for="note"> Ghi Chú </label>
                    <div class="col-sm-9">
                        <input type="text" id="note_1" name="note"
                               class="form-control" value="" style="margin: -9px"/>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" id="addTransaction" class="btn btn-default" data-dismiss="modal">Thêm</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
            </div>
        </div>

    </div>
</div>
<script>
    var data = {};

    $("#btnAddCustomer").click(function (event) {
        event.preventDefault();
        var formData = $("#formEdit").serializeArray();
        $.each(formData, function (i, v) {
            data["" + v.name + ""] = v.value;
        });
        if (data['id'] != '' || data['id'] > 0) {
            editCustomer(data);
        } else {
            addCustomer(data);
        }

    });

    function addCustomer(data) {
        $.ajax({
            url: '${customerApiUrl}',
            type: 'POST',
            dataType: 'json',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (res) {
                swal("Thành công", "Sản phẩm đã được lưa", "success");
            },
            error: function (res) {
                swal("Chưa Thực Hiện Xóa", "Dữ liệu chưa được lưu", "error");
            }
        });
    }

    function editCustomer(data) {
        $.ajax({
            url: '${customerApiUrl}',
            type: 'PUT',
            dataType: 'json',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (res) {
                swal("Thành công", "Sản phẩm đã được cập nhật", "success");
            },
            error: function (res) {
                swal("Chưa Thực Hiện Xóa", "Dữ liệu chưa được cập nhật", "error");
            }
        });
    }
</script>