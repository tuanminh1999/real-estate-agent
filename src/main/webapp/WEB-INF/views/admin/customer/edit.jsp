<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
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
            <div class="ace-settings-container" id="ace-settings-container">
                <div class="ace-settings-box clearfix" id="ace-settings-box">
                    <div class="pull-left width-50">
                        <div class="ace-settings-item">
                            <div class="pull-left">
                                <select id="skin-colorpicker" class="hide">
                                    <option data-skin="no-skin" value="#438EB9">#438EB9</option>
                                    <option data-skin="skin-1" value="#222A2D">#222A2D</option>
                                    <option data-skin="skin-2" value="#C6487E">#C6487E</option>
                                    <option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
                                </select>
                            </div>
                            <span>&nbsp; Choose Skin</span>
                        </div>

                        <div class="ace-settings-item">
                            <input type="checkbox" class="ace ace-checkbox-2"
                                   id="ace-settings-navbar"/> <label class="lbl"
                                                                     for="ace-settings-navbar"> Fixed Navbar</label>
                        </div>

                        <div class="ace-settings-item">
                            <input type="checkbox" class="ace ace-checkbox-2"
                                   id="ace-settings-sidebar"/> <label class="lbl"
                                                                      for="ace-settings-sidebar"> Fixed Sidebar</label>
                        </div>

                        <div class="ace-settings-item">
                            <input type="checkbox" class="ace ace-checkbox-2"
                                   id="ace-settings-breadcrumbs"/> <label class="lbl"
                                                                          for="ace-settings-breadcrumbs"> Fixed
                            Breadcrumbs</label>
                        </div>

                        <div class="ace-settings-item">
                            <input type="checkbox" class="ace ace-checkbox-2"
                                   id="ace-settings-rtl"/> <label class="lbl"
                                                                  for="ace-settings-rtl"> Right To Left (rtl)</label>
                        </div>

                        <div class="ace-settings-item">
                            <input type="checkbox" class="ace ace-checkbox-2"
                                   id="ace-settings-add-container"/> <label class="lbl"
                                                                            for="ace-settings-add-container"> Inside <b>.container</b>
                        </label>
                        </div>
                    </div>
                    <!-- /.pull-left -->

                    <div class="pull-left width-50">
                        <div class="ace-settings-item">
                            <input type="checkbox" class="ace ace-checkbox-2"
                                   id="ace-settings-hover"/> <label class="lbl"
                                                                    for="ace-settings-hover"> Submenu on Hover</label>
                        </div>

                        <div class="ace-settings-item">
                            <input type="checkbox" class="ace ace-checkbox-2"
                                   id="ace-settings-compact"/> <label class="lbl"
                                                                      for="ace-settings-compact"> Compact
                            Sidebar</label>
                        </div>

                        <div class="ace-settings-item">
                            <input type="checkbox" class="ace ace-checkbox-2"
                                   id="ace-settings-highlight"/> <label class="lbl"
                                                                        for="ace-settings-highlight"> Alt. Active
                            Item</label>
                        </div>
                    </div>
                    <!-- /.pull-left -->
                </div>
                <!-- /.ace-settings-box -->
            </div>
            <!-- /.ace-settings-container -->

            <div class="row">
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
                                <button class="btn" type="reset">
                                    <a href="/admin/customer-list">
                                        <i class="ace-icon fa fa-undo bigger-110"></i> Thoát
                                    </a>
                                </button>
                            </c:if>
                            <c:if test="${customer.id == null}">
                                <button class="btn btn-info" type="submit" id="btnAddCustomer">
                                    <i class="ace-icon fa fa-check bigger-110"></i> Thêm
                                </button>
                                <button class="btn" type="reset">
                                    <i class="ace-icon fa fa-undo bigger-110"></i> Reset
                                </button>
                            </c:if>
                        </div>
                    </div>
                </form>
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
            editBuilding(data);
        } else {
            addBuilding(data);
        }


    });

    function addBuilding(data) {
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

    function editBuilding(data) {
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