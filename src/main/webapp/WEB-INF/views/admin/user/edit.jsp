<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="formUrl" value=""/>
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
                    <form:form id="formEdit" class="form-horizontal">
                    <div id="profile">
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right">Vai trò</label>
                            <div class="col-sm-9">
<%--                                <form:select path="roleCode" id="roleCode">--%>
<%--                                    <form:option value="" label="--- Chọn vai trò ---"/>--%>
<%--                                    <form:options items="${model.roleDTOs}"/>--%>
<%--                                </form:select>--%>
                            </div>
                        </div>
                        <div class="space-4"></div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right">
                                    <%--<spring:message code="label.username"/>--%> Tên đăng nhập
                            </label>
                            <div class="col-sm-9">
<%--                                <c:if test="${not empty model.id}">--%>
<%--                                    <form:input path="userName" id="userName" cssClass="form-control" disabled="true"/>--%>
<%--                                </c:if>--%>
<%--                                <c:if test="${empty model.id}">--%>
<%--                                    <form:input path="userName" id="userName" cssClass="form-control"/>--%>
<%--                                </c:if>--%>
                            </div>
                        </div>
                        <div class="space-4"></div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right">
                                    <%--<spring:message code="label.fullname"/>--%>
                                Tên đầy đủ
                            </label>
                            <div class="col-sm-9">
<%--                                <form:input path="fullName" id="fullName" cssClass="form-control"/>--%>
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
<%--                        <form:hidden path="id" id="userId"/>--%>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
