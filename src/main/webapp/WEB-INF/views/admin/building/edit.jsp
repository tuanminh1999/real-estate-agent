<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
                <li class="active">Chỉnh sửa bài viết</li>
            </ul><!-- /.breadcrumb -->
        </div>

        <div class="page-content">
            <div class="row">
                <div class="col-xs-12">
                    <form class="form-horizontal" role="form" id="formEdit">
                        <div class="form-group">
                            <label class="col-sm-3 no-padding-right" for="name">Tên tòa nhà</label>
                            <div class="col-sm-9">
                                <input type="text" id="name" class="form-control" name="name" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 no-padding-right" for="name">Người quản lý tòa nhà</label>
                            <div class="col-sm-9">
                                <input type="text" id="name" name="name" class="form-control"
                                       value=""/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 no-padding-right" for="name">Quận hiện có</label>
                            <div class="col-sm-9">
                                <select id="form-field-select-1">
                                    <option value="">--Chọn quận--</option>
                                    <option value="quan_1">Quận 1</option>
                                    <option value="quan_2">Quận 2</option>
                                    <option value="quan_3">Quận 3</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 no-padding-right" for="name">Phường</label>
                            <div class="col-sm-9">
                                <input type="text" id="name" class="form-control" name="name" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 no-padding-right" for="name">Đường</label>
                            <div class="col-sm-9">
                                <input type="text" id="name" class="form-control" name="name" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 no-padding-right" for="name">Kết cấu</label>
                            <div class="col-sm-9">
                                <input type="text" id="name" class="form-control" name="name" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3  no-padding-right" for="numberOfBasement">Số tầng hầm</label>
                            <div class="col-sm-9">
                                <input type="number" id="numberOfBasement" class="form-control" name="numberOfBasement" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3  no-padding-right" for="numberOfBasement">Diện tích sàn</label>
                            <div class="col-sm-9">
                                <input type="number" id="numberOfBasement" class="form-control" name="numberOfBasement" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3  no-padding-right" for="name">Hướng</label>
                            <div class="col-sm-9">
                                <input type="text" id="name" class="form-control" name="name" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3  no-padding-right" for="name">Hạng</label>
                            <div class="col-sm-9">
                                <input type="text" id="name" class="form-control" name="name" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3  no-padding-right" for="numberOfBasement">Diện tích thuê</label>
                            <div class="col-sm-9">
                                <input type="number" id="numberOfBasement" class="form-control" name="numberOfBasement" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3  no-padding-right" for="name">Mô tả diện tích</label>
                            <div class="col-sm-9">
                                <textarea class="form-control" id="form-field-8"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3  no-padding-right" for="numberOfBasement">Giá thuê</label>
                            <div class="col-sm-9">
                                <input type="number" id="numberOfBasement" class="form-control" name="numberOfBasement" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3  no-padding-right" for="name">Mô tả giá</label>
                            <div class="col-sm-9">
                                <input type="text" id="name" class="form-control" name="name" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3  no-padding-right" for="numberOfBasement">Phí dịch vụ</label>
                            <div class="col-sm-9">
                                <input type="number" id="numberOfBasement" class="form-control" name="numberOfBasement" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3  no-padding-right" for="name">Phí ô tô</label>
                            <div class="col-sm-9">
                                <input type="number" id="numberOfBasement" class="form-control" name="numberOfBasement" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3  no-padding-right" for="name">Phí mô tô</label>
                            <div class="col-sm-9">
                                <input type="number" id="numberOfBasement" class="form-control" name="numberOfBasement" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3  no-padding-right" for="name">Phí ngoài giờ</label>
                            <div class="col-sm-9">
                                <input type="number" id="numberOfBasement" class="form-control" name="numberOfBasement" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3  no-padding-right" for="name">Tiền điện</label>
                            <div class="col-sm-9">
                                <input type="number" id="numberOfBasement" class="form-control" name="numberOfBasement" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3  no-padding-right" for="name">Đặt cọc</label>
                            <div class="col-sm-9">
                                <input type="text" id="name" class="form-control" name="name" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3  no-padding-right" for="name">Thanh toán</label>
                            <div class="col-sm-9">
                                <input type="text" id="name" class="form-control" name="name" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3  no-padding-right" for="name">Thời hạn thuê</label>
                            <div class="col-sm-9">
                                <input type="text" id="name" class="form-control" name="name" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3  no-padding-right" for="name">Thời gian trang tí</label>
                            <div class="col-sm-9">
                                <input type="text" id="name" class="form-control" name="name" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3  no-padding-right" for="name">Tên quản lý</label>
                            <div class="col-sm-9">
                                <input type="text" id="name" class="form-control" name="name" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3  no-padding-right" for="name">SĐT quản lý</label>
                            <div class="col-sm-9">
                                <input type="number" id="numberOfBasement" class="form-control" name="numberOfBasement" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3  no-padding-right" for="name">Phí môi giới</label>
                            <div class="col-sm-9">
                                <input type="number" id="numberOfBasement" class="form-control" name="numberOfBasement" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3  no-padding-right" for="buildingTypes">Loại tòa nhà</label>
                            <div class="checkbox col-sm-9">
                                <label><input type="checkbox" value="TANG_TRET" id="buildingTypes" name="buildingTypes">Tầng trệt</label></br>
                                <label><input type="checkbox" value="NGUYEN_CAN" id="buildingTypes" name="buildingTypes">Nguyên căn</label></br>
                                <label><input type="checkbox" value="NOI_THAT" id="buildingTypes" name="buildingTypes">Nội thất</label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" ></label>
                            <div class="col-sm-9">
                                <button type="button" class="btn btn-primary" id="btnAddBuilding">Thêm tòa nhà</button>
                                <button type="button" class="btn btn-warning">Hủy</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div><!-- /.row -->

        </div><!-- /.page-content -->
    </div>
</div><!-- /.main-content -->
