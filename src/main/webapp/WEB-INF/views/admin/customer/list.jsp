<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="customerURL" value=""/>
<c:url var="customerApiURL" value="" />
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
                <li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Trang Chủ</a>
                </li>
                <li class="active">Danh Sách Khách Hàng</li>
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

            <div class="page-header">
                <h1>
                    Danh Sách Tòa Nhà <small> <i
                        class="ace-icon fa fa-angle-double-right"></i> Danh sách khách hàng
                </small>
                </h1>
            </div>
            <!-- /.page-header -->

            <div class="row">

                <form:form action="" method="get"
                           id="formSearchCustomer">
                    <div class="widget-box">
                        <div class="widget-header">
                            <h4 class="widget-title">Tìm kiếm</h4>
                            <div class="widget-toolbar">
                                <a href="#" data-action="collapse"> <i
                                        class="ace-icon fa fa-chevron-up"></i>
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
                                                <input type="text" name="fullName" id="fullName" value="${model.fullName}"
                                                       class="form-control"/>
                                                    <%--                                                <form:input path="name" class="form-control"></form:input>--%>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6">
                                            <div>
                                                <label for="phone">Di Động </label> <input
                                                    type="tel" id="phone" value="${model.phone}"
                                                    name="phone"
                                                    class="form-control" >
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12">
                                        <div class="col-xs-12 col-sm-6">
                                            <div>
                                                <label for="email">Email </label> <input
                                                    type="email" id="email" value="${model.email}"
                                                    name="email"
                                                    class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-4">
                                            <div class="form-group ">
                                                <label for="staffId">Chọn nhân viên phụ trách </label>
                                                <select id="staffId" name="staffId"  class="form-control">
                                                    <option value="" selected>Choose...</option>
                                                    <c:forEach var="item" items="${staffs}">
                                                        <option value="${item.id}" ${item.id == model.staffId ? 'selected' : '' } >
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
                                    <!-- gán parameter bằng Input  -->
                                        <%--                                    <input type="hidden" value="" id="page" name="page"/>--%>
                                        <%--                                        <input type="hidden" value="" id="limit" name="limit"/>--%>

                                </div>
                            </div>
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- /.page-content -->
                    <input type="hidden" name="page" id="page" value="${model.page}" >
                    <input type="hidden" name="limit" id="limit" value="${model.limit}" >
                    <input type="hidden" name="totalPage" id="totalPage" value="${model.totalPage}" >
                </form:form>
            </div>
            <div class="row">

                <div class="col-xs-12">
                    <div class="pull-right">
                        <a title="Thêm tòa nhà" class="btn btn-white btn-info btn-bold"
                           data-toggle="tooltip"
                           href=""> <i
                                class="fa fa-plus-circle"></i>
                        </a>
                        <button class="btn btn-white btn-info btn-bold"
                                data-toggle="tooltip"
                                title="Xóa tòa nhà" id="btnDeleteCustomer">
                            <i class=" fa fa-trash"></i>
                        </button>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="row">
                    <div class="col-xs-12">
                        <table id="customerList"
                               class="table table-striped table-bordered table-hover">
                            <thead>
                            <tr>
                                <th></th>
                                <th>Tên khách hàng</th>
                                <th>Di Động</th>
                                <th>Email</th>
                                <th>Tình Trạng</th>
                                <th>Thao tác</th>
                            </tr>
                            </thead>
                            <tbody>

                            </tbody>

                        </table>
                        <nav aria-label="Page navigation" style="margin-left: 340px;">
                            <ul class="pagination" id="pagination"></ul>
                        </nav>


                    </div>
                </div>

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
<div class="modal fade" id="statusCustomer" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
            <input type="hidden" id="cusId" value=""/>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                <button type="button" onclick="saveStatusCustomer()" class="btn btn-primary">Lưu Thay Đổi</button>
            </div>
        </div>
    </div>
</div>