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
                <li class="active">DS bài viết</li>
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

                                <a href="#" data-action="close">
                                    <i class="ace-icon fa fa-times"></i>
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
                                                    <option value="">--Chọn quận--</option>
                                                    <option value="quan_1">Quận 1</option>
                                                    <option value="quan_2">Quận 2</option>
                                                    <option value="quan_3">Quận 3</option>
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
                                                    <option value="">--Chọn nhân viên phụ trách--</option>
                                                    <option value="id">nguyen van a</option>
                                                    <option value="id">nguyen van a</option>
                                                    <option value="id">nguyen van a</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group ">
                                        <div class="col-sm-8">
                                            <label><input type="checkbox"  value="TANG_TRET" id="buildingTypes" name="buildingTypes"><b> Tầng trệt </b></label>
                                            <label><input type="checkbox" value="NGUYEN_CAN" id="buildingTypes" name="buildingTypes"><b> Nguyên căn </b></label>
                                            <label><input type="checkbox" value="NOI_THAT" id="buildingTypes" name="buildingTypes"><b> Nội thất </b></label>
                                        </div>
                                    </div>
                                    <!-- PAGE CONTENT ENDS -->
                                    <div class="form-group">
                                        <div class="pull-left col-sm-4 ">
                                            <button class="btn btn-info btn-white btn-bold">
                                                <i class="fa fa-search" area-hidden="true"></i>
                                                Tìm kiếm
                                            </button>
                                        </div>
                                    </div><!-- /.col -->
                                </div><!-- /.row -->
                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- /.row -->
            </br>
            </br>
            <div class="row">
                <div class="col-xs-12">
                    <div class="pull-right">
                        <button class="btn btn-info btn-white btn-bold" data-toggle="tooltip" title="Thêm tòa nhà">
                            <i class="fa fa-plus-circle" area-hidden="true"></i>
                        </button>
                        <button class="btn btn-warning btn-white btn-bold" data-toggle="tooltip" title="Xóa tòa nhà">
                            <i class="fa fa-trash" aria-hidden="true"></i>
                        </button>
                    </div>
                </div><!-- /.col -->
            </div><!-- /.row -->

            <div class = "row">
                <div class="col-xs-12">
                    <table id="simple-table" class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <!--th class="center">
                                <label class="pos-rel">
                                    <input type="checkbox" class="ace" />
                                    <span class="lbl"></span>
                                </label>
                            </th-->
                            <th>Tên sản phẩm</th>
                            <th>Địa chỉ</th>
                            <th>Tên quản lý</th>
                            <th>Số điện thoại</th>
                            <th>Diện tích sàn</th>
                            <th>Giá thuê</th>
                            <th>Phí dịch vụ</th>
                            <th>Thao tác</th>
                        </tr>
                        </thead>

                        <tbody>
                        <tr>
                            <td>sadasd</td>
                            <td>ádasda</td>
                            <td>ádadsa</td>
                            <td>adsadsa</td>
                            <td>sdasd</td>
                            <td>áda</td>
                            <td>adasd</td>
                            <td>
                                <button class="btn btn-xs btn-success" data-toggle="tooltip" title="Xem chi tiết">
                                    <i class="fa fa-eye" aria-hidden="true"></i>
                                </button>

                                <button class="btn btn-xs btn-info" data-toggle="tooltip" title="Sửa thông tin tòa nhà">
                                    <i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
                                </button>

                                <button class="btn btn-xs btn-warning" data-toggle="tooltip" title="Giao tòa nhà" onclick="assignmentBuilding()">
                                    <i class="fa fa-user" aria-hidden="true"></i>
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td>sadasd</td>
                            <td>ádasda</td>
                            <td>ádadsa</td>
                            <td>adsadsa</td>
                            <td>sdasd</td>
                            <td>áda</td>
                            <td>adasd</td>
                            <td>
                                <button class="btn btn-xs btn-success" data-toggle="tooltip" title="Xem chi tiết">
                                    <i class="fa fa-eye" aria-hidden="true"></i>
                                </button>

                                <button class="btn btn-xs btn-info" data-toggle="tooltip" title="Sửa thông tin tòa nhà">
                                    <i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
                                </button>

                                <button class="btn btn-xs btn-warning" data-toggle="tooltip" title="Giao tòa nhà" onclick="assignmentBuilding()">
                                    <i class="fa fa-user" aria-hidden="true"></i>
                                </button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div><!-- /.page-content -->
    </div>
</div><!-- /.main-content -->
