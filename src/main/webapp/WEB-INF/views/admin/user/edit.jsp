<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="userApiUrl" value="/api/users"/>
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
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="#">Trang chủ</a>
                </li>
                <li class="active">Chỉnh sửa người dùng</li>
            </ul><!-- /.breadcrumb -->
        </div>
        <div class="page-content">
            <div class="row">
                <div class="col-xs-12">
                    <c:if test="${not empty messageResponse}">
                        <div class="alert alert-block alert-${alert}">
                            <button type="button" class="close" data-dismiss="alert">
                                <i class="ace-icon fa fa-times"></i>
                            </button>
                                ${messageResponse}
                        </div>
                    </c:if>
                    <form id="formEdit" class="form-horizontal">
                    <div id="profile">
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right">Vai trò</label>
                            <div class="col-sm-9">
                                <select id="role" name="roleCode">
                                    <option value="">--- Chọn vai trò ---</option>
                                    <c:forEach items="${roles}" var="item">
                                        <option value="${item.key}"> ${item.value}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="space-4"></div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right">
                                Tên đăng nhập
                            </label>
                            <div class="col-sm-9">
                                <c:if test="${not empty model.id}">
                                    <input type="text" class="form-control" value="${model.userName}" disabled/>
                                </c:if>
                                <c:if test="${empty model.id}">
                                    <input type="text" class="form-control" name="userName"/>
                                </c:if>
                            </div>
                        </div>
                        <div class="space-4"></div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right">
                                Tên đầy đủ
                            </label>
                            <div class="col-sm-9">
                                 <input type="text" class="form-control" value="${fullName}" name="fullName"/>
                            </div>
                        </div>
                        <div class="space-4"></div>
                        <!--Btn-->
                        <div class="col-sm-12">
                            <label class="col-sm-3 control-label no-padding-right message-info"></label>
                            <c:if test="${not empty model.id}">
                                <input type="button" class="btn btn-white btn-warning btn-bold"
                                       value="Cập nhật người dùng" id="btnAddOrUpdateUsers"/>
                                <input type="button" class="btn btn-white btn-warning btn-bold"
                                       value="Reset mật khẩu" id="btnResetPassword"/>
                                <img src="/img/loading.gif" style="display: none; height: 100px" id="loading_image">
                            </c:if>
                            <c:if test="${empty model.id}">
                                <input type="button" class="btn btn-white btn-warning btn-bold"
                                       value="Thêm mới người dùng" id="btnAddOrUpdateUsers"/>
                                <img src="/img/loading.gif" style="display: none; height: 100px" id="loading_image">
                            </c:if>
                        </div>
                        <!--Btn-->
                        <input type="hidden" name="id" value="${id}"/>

                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    var data = {};

    $("#btnAddOrUpdateUsers").click(function (event) {
        event.preventDefault();
        var formData = $("#formEdit").serializeArray();
        $.each(formData, function (i, v) {
            data["" + v.name + ""] = v.value;
        });

        if (data['id'] != '' || data['id'] > 0) {
            updateUser(data);
        } else {
            addUser(data);
        }
    });

    function addUser(data) {
        $.ajax({
            url: '${userApiUrl}',
            type: 'POST',
            dataType: 'json',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (res) {
                swal("Thành công", "Dữ liệu đã được lưu", "success");
            },
            error: function (res) {
                swal("Thất bại", "Dữ liệu chưa được lưu", "error");
            }
        });
    }

    function updateUser(data) {
        $.ajax({
            url: '${userApiUrl}',
            type: 'PUT',
            dataType: 'json',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (res) {
                swal("Thành công", "Dữ liệu đã được cập nhật", "success");
            },
            error: function (res) {
                swal("Thất bại", "Dữ liệu chưa được cập nhật", "error");
            }
        });
    }

</script>
