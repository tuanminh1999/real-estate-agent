<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp"%>
<c:url var="buildingApiUrl" value="/api/buildings"/>
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
                <li class="active">Chỉnh sửa toà nhà</li>
            </ul><!-- /.breadcrumb -->
        </div>

        <div class="page-content">
            <div class="row">
                <div class="col-xs-12">
                    <form class="form-horizontal" role="form" id="formEdit">

                        <div class="form-group">
                            <label class="col-sm-3 no-padding-right">Tên tòa nhà</label>
                            <div class="col-sm-9">
                                <input type="text" id="name" class="form-control" name="name"
                                        value="${building.name}"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 no-padding-right">Quận hiện có</label>
                            <div class="col-sm-9">
                                <select id="form-field-select-1">
                                    <option value="">-- Chọn quận -- </option>
                                    <c:forEach var="item" items="${districtsEnums}">
                                        <option value="${item.key}" ${item.key == building.district ? 'selected' : '' }> ${item.value}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 no-padding-right">Số tầng hầm</label>
                            <div class="col-sm-9">
                                <input type="number" id="numberOfBasement" class="form-control" name="numberOfBasement"
                                       value="${building.numberOfBasement}"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 no-padding-right">Diện tích sàn</label>
                            <div class="col-sm-9">
                                <input type="number" id="floorArea" class="form-control" name="floorArea"
                                       value="${building.floorArea}"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 no-padding-right">Giá thuê</label>
                            <div class="col-sm-9">
                                <input type="number" id="rentPrice" class="form-control" name="rentPrice"
                                       value="${building.rentPrice}"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 no-padding-right">Phường</label>
                            <div class="col-sm-9">
                                <input type="text" id="ward" class="form-control" name="ward"
                                       value="${building.ward}"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 no-padding-right">Đường</label>
                            <div class="col-sm-9">
                                <input type="text" id="street" class="form-control" name="street"
                                        value="${building.street}"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 no-padding-right">Diện tích thuê</label>
                            <div class="col-sm-9">
                                <input type="number" id="areaRent" class="form-control" name="areaRent"
                                       value="${building.areaRent}"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 no-padding-right">Tên quản lý</label>
                            <div class="col-sm-9">
                                <input type="text" id="managerName" class="form-control" name="managerName"
                                       value="${building.managerName}"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 no-padding-right">Điện thoại quản lý</label>
                            <div class="col-sm-9">
                                <input type="number" id="managerPhone" class="form-control" name="managerPhone"
                                       value="${building.managerPhone}"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 no-padding-right">Kết cấu toà nhà</label>
                            <div class="col-sm-9">
                                <input type="text" id="structure" class="form-control" name="structure"
                                        value="${building.structure}"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 no-padding-right">Hướng</label>
                            <div class="col-sm-9">
                                <input type="text" id="direction" class="form-control" name="direction"
                                        value="${building.direction}"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 no-padding-right">Hạng</label>
                            <div class="col-sm-9">
                                <input type="text" id="level" class="form-control" name="level"
                                        value="${building.level}"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 no-padding-right">Mô tả giá thuê</label>
                            <div class="col-sm-9">
                                <input type="text" id="rentPriceDescription" class="form-control"
                                       name="rentPriceDescription" value="${building.rentPriceDescription}"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 no-padding-right">Phí dịch vụ</label>
                            <div class="col-sm-9">
                                <input type="number" id="serviceFee" class="form-control" name="serviceFee"
                                        value="${building.serviceFee}"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 no-padding-right">Phí xe hơi</label>
                            <div class="col-sm-9">
                                <input type="number" id="carFee" class="form-control" name="carFee"
                                        value="${building.carFee}"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 no-padding-right">Phí xe máy</label>
                            <div class="col-sm-9">
                                <input type="number" id="motoFee" class="form-control" name="motoFee"
                                        value="${building.motoFee}"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 no-padding-right">Phí ngoài giờ</label>
                            <div class="col-sm-9">
                                <input type="number" id="overTimeFee" class="form-control" name="overTimeFee"
                                        value="${building.overTimeFee}"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 no-padding-right">Tiền nước</label>
                            <div class="col-sm-9">
                                <input type="number" id="waterFee" class="form-control" name="waterFee"
                                       value="${building.waterFee}"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 no-padding-right">Tiền điện</label>
                            <div class="col-sm-9">
                                <input type="number" id="electricityFee" class="form-control" name="electricityFee"
                                        value="${building.electricityFee}"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 no-padding-right">Đặt cọc</label>
                            <div class="col-sm-9">
                                <input type="text" id="deposit" class="form-control" name="deposit"
                                        value="${building.deposit}"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 no-padding-right">Thanh toán</label>
                            <div class="col-sm-9">
                                <input type="text" id="payment" class="form-control" name="payment"
                                        value="${building.payment}"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 no-padding-right">Thời gian thuê</label>
                            <div class="col-sm-9">
                                <input type="text" id="rentTime" class="form-control" name="rentTime"
                                        value="${building.rentTime}"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 no-padding-right">Thời gian trang tí</label>
                            <div class="col-sm-9">
                                <input type="text" id="decorationTime" class="form-control" name="decorationTime"
                                        value="${building.decorationTime}"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 no-padding-right">Phí môi giới</label>
                            <div class="col-sm-9">
                                <input type="number" id="brokerAgeFee" class="form-control" name="brokerAgeFee"
                                        value="${building.brokerAgeFee}"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 no-padding-right">Ghi chú</label>
                            <div class="col-sm-9">
                                <input type="number" id="note" class="form-control" name="note"
                                       value="${building.note}"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 no-padding-right">Link</label>
                            <div class="col-sm-9">
                                <input type="number" id="linkOfBuilding" class="form-control" name="linkOfBuilding"
                                       value="${building.linkOfBuilding}"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 no-padding-right">Map</label>
                            <div class="col-sm-9">
                                <input type="number" id="map" class="form-control" name="map"
                                       value="${building.map}"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 no-padding-right">Image</label>
                            <div class="col-sm-9">
                                <input type="file" id="image" name="image"
                                       class="form-control" value=""/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 no-padding-right">Loại tòa nhà</label>
                            <div class="col-sm-9">
                                <c:forEach var="rents" items="${rentTypesEnums}">
                                    <label class="checkbox-inline" for="rentTypes">${rents.value}</label>
                                    <input type="checkbox" name="rentTypes" id="rentTypes"
                                           value="${rents.key}" ${fn:contains(building.type,rents.key) ? 'checked' : '' }>
                                </c:forEach>
                            </div>
                        </div>
                        <input type="hidden" value="${building.id}" name="id">

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" ></label>
                            <div class="col-sm-9">
                                <c:if test="${building.id != null}">
                                    <button type="button" class="btn btn-primary" id="btnAddBuilding">Cập Nhật</button>
                                    <a href="<c:url value="/admin/building-list" />">
                                        <button type="button" class="btn btn-warning">Thoát</button>
                                    </a>
                                </c:if>
                                <c:if test="${building.id == null}">
                                    <button type="button" class="btn btn-primary" id="btnAddBuilding">Thêm</button>
                                    <a href="<c:url value="/admin/building-list" />">
                                        <button type="button" class="btn btn-warning">Thoát</button>
                                    </a>
                                </c:if>
                            </div>
                        </div>
                    </form>
                </div>
            </div><!-- /.row -->

        </div><!-- /.page-content -->
    </div>
</div><!-- /.main-content -->

<script>
    var data = {};

    $("#btnAddBuilding").click(function (event) {
        event.preventDefault();
        var rentTypes = [];
        var formData = $("#formEdit").serializeArray();
        $.each(formData, function (i, v) {
            if (v.name == 'rentTypes') {
                rentTypes.push(v.value)
            } else {
                data["" + v.name + ""] = v.value;
            }

        });
        data['rentTypes'] = rentTypes;
        if (data['id'] != '' || data['id'] > 0) {
            editBuilding(data);
        } else {
            addBuilding(data);
        }
    });

    function addBuilding(data) {
        $.ajax({
            url: '${buildingApiUrl}',
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
            url: '${buildingApiUrl}',
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
