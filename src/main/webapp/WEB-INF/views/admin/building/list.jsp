<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="buildingApiUrl" value="/api/buildings"/>
<c:url var="buildingsUrl" value="/admin/building-list"/>

<div class="main-content">
    <div class="main-content-inner">

        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
            </script>

            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="#">Trang chủ</a>
                </li>
                <li class="active">Danh sách toà nhà</li>
            </ul><!-- /.breadcrumb -->
        </div>

        <div class="page-content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="widget-box">
                        <div class="widget-header">
                            <h4 class="widget-title">Tìm kiếm</h4>

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
                                        <!-- PAGE CONTENT BEGINS -->
                                        <div class= "col-sm-6">
                                            <div>
                                                <label for="name"><b>Tên tòa nhà</b></label>
                                                <input type="text" id="name" class="form-control" />
                                            </div>
                                        </div>

                                        <div class= "col-sm-6">
                                            <div>
                                                <label for="buildingArea"><b>Diện tích sàn</b></label>
                                                <input type="number" id="buildingArea" class="form-control" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class= "col-sm-4">
                                            <div>
                                                <label for="buildingArea"><b>Quận hiện có</b></label>
                                                </br>
                                                <select class="col-sm-6" id="form-field-select-1">
                                                    <option value="">-- Chọn quận hiện có --</option>
                                                    <c:forEach items="${districtsEnums}" var="item">
                                                        <option value="${item.key}">
                                                                ${item.value}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class= "col-sm-4">
                                            <div>
                                                <label for="buildingArea"><b>Phường</b></label>
                                                <input type="text" id="buildingArea" class="form-control" />
                                            </div>
                                        </div>
                                        <div class= "col-sm-4">
                                            <div>
                                                <label for="buildingArea"><b>Đường</b></label>
                                                <input type="text" id="buildingArea" class="form-control" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class= "col-sm-4">
                                            <div>
                                                <label for="buildingArea"><b>Số tầng hầm</b></label>
                                                <input type="number" id="buildingArea" class="form-control" />
                                            </div>
                                        </div>
                                        <div class= "col-sm-4">
                                            <div>
                                                <label for="buildingArea"><b>Hướng</b></label>
                                                <input type="text" id="buildingArea" class="form-control" />
                                            </div>
                                        </div>
                                        <div class= "col-sm-4">
                                            <div>
                                                <label for="buildingArea"><b>Hạng</b></label>
                                                <input type="text" id="buildingArea" class="form-control" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class= "col-sm-3">
                                            <div>
                                                <label for="areaRentFrom"><b>Diện tích từ</b></label>
                                                <input type="number" id="areaRentFrom" class="form-control" name="areaRentFrom" />
                                            </div>
                                        </div>
                                        <div class= "col-sm-3">
                                            <div>
                                                <label for="areaRentTo"><b>Diện tích đến</b></label>
                                                <input type="number" id="areaRentTo" class="form-control" name="areaRentTo" />
                                            </div>
                                        </div>
                                        <div class= "col-sm-3">
                                            <div>
                                                <label for="costRentFrom"><b>Giá thuê từ</b></label>
                                                <input type="number" id="costRentFrom" class="form-control" name="costRentFrom" />
                                            </div>
                                        </div>
                                        <div class= "col-sm-3">
                                            <div>
                                                <label for="costRentTo"><b>Giá thuê đến</b></label>
                                                <input type="number" id="costRentTo" class="form-control" name="costRentTo"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class= "col-sm-4">
                                            <div>
                                                <label for="buildingArea"><b>Tên quản lý</b></label>
                                                <input type="text" id="buildingArea" class="form-control" />
                                            </div>
                                        </div>
                                        <div class= "col-sm-4">
                                            <div>
                                                <label for="buildingArea"><b>Điện thoại quản lý</b></label>
                                                <input type="number" id="buildingArea" class="form-control" />
                                            </div>
                                        </div>
                                        <div class= "col-sm-4">
                                            <div>
                                                <label for="buildingArea"><b>Chọn nhân viên phụ trách</b></label>
                                                </br>
                                                <select class="col-sm-8" id="form-field-select-1">
                                                    <option value="">-- Chọn nhân viên phụ trách --</option>
                                                    <option value="id">nguyen van a</option>
                                                    <option value="id">nguyen van a</option>
                                                    <option value="id">nguyen van a</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group ">
                                        <c:forEach var="item" items="${rentTypesEnums}">
                                            <div class="col-xs-12 col-sm-2">
                                                <label class="checkbox-inline">
                                                    <input type="checkbox"  value="${item.key}" id="rentTypes" name="rentTypes"> <b> ${item.value} </b>
                                                </label>
                                            </div>
                                        </c:forEach>
                                    </div>
                                    <!-- PAGE CONTENT ENDS -->
                                    <div class="form-group">
                                        <div class="col-xs-12 center">
                                            <button class="btn btn-info btn-white btn-bold" type="submit" id="btnSearchBuilding">
                                                <i class="fa fa-search" area-hidden="true"></i>
                                                Tìm kiếm
                                            </button>
                                            <button class="btn btn-info btn-white btn-bold" type="reset" id="reset">
                                                <i class="fa fa-refresh" area-hidden="true"></i>
                                                Làm mới
                                            </button>
                                        </div>
                                    </div><!-- /.col -->
                                </div><!-- /.row -->
                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- /.row -->
<%--            </br>--%>
<%--            </br>--%>
            <div class="row">
                <div class="col-xs-12">
                    <div class="pull-right">
                        <a title="Thêm tòa nhà" class="btn btn-info btn-white btn-bold" data-toggle="tooltip" href="/admin/building-add">
                            <i class="fa fa-plus-circle" area-hidden="true"></i>
                        </a>
                        <button class="btn btn-warning btn-white btn-bold" data-toggle="tooltip" title="Xóa tòa nhà"
                                id="btnDeleteBuilding">
                            <i class="fa fa-trash" aria-hidden="true"></i>
                        </button>
                    </div>
                </div><!-- /.col -->
            </div><!-- /.row -->

            <div class = "row">
                <div class="col-xs-12">
                    <table id="buildingList" class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th></th>
                            <th>Tên sản phẩm</th>
                            <th>Địa chỉ</th>
                            <th>Tên quản lý</th>
                            <th>Số điện thoại quản lý</th>
                            <th>Diện tích sàn</th>
                            <th>Giá thuê</th>
                            <th>Diện tích thuê</th>
                            <th>Phí dịch vụ</th>
                            <th>Thao tác</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach items="${buildings}" var="item">
                        <tr>
                            <td><input type="checkbox" id="checkbox_${item.id}"
                                       value="${item.id}"></td>
                            <td>${item.name}</td>
                            <td>${item.address}</td>
                            <td>${item.managerName}</td>
                            <td>${item.managerPhone}</td>
                            <td>${item.floorArea}</td>
                            <td>${item.rentPrice}</td>
                            <td>${item.rentArea}</td>
                            <td>${item.serviceFee}</td>
                            <td>
                                <a class="btn btn-xs btn-info" href="<c:url value='/admin/building-edit-${item.id}'/>" data-toggle="tooltip" title="Sửa thông tin tòa nhà">
                                    <i class="fa fa-edit"></i>
                                </a>
                                <button class="btn btn-xs btn-warning" data-toggle="tooltip" title="Giao tòa nhà" >
                                    <i class="fa fa-user" aria-hidden="true"></i>
                                </button>
                            </td>
                        </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div><!-- /.page-content -->
    </div>
</div><!-- /.main-content -->
<script>

    //delete building
    document.getElementById('btnDeleteBuilding').onclick = function() {
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
                var ids = $('#buildingList').find(
                    'tbody input[type=checkbox]:checked').map(function() {
                    return $(this).val();
                }).get();
                // data['ids'] = ids;
                deleteBuildings(ids);
            } else {
                swal("Chưa Thực Hiện Xóa", "Dữ liệu vẫn an toàn", "error");
            }
        });
    };

    function deleteBuildings(data) {
        $.ajax({
            type: "DELETE",
            url: "${buildingApiUrl}",
            data: JSON.stringify(data),
            contentType: "application/json",
            success: function (response) {
                window.location.href = "${buildingsUrl}";
            },
            error: function (response) {
                window.location.href = "${buildingsUrl}";

            }
        });
    }
</script>
