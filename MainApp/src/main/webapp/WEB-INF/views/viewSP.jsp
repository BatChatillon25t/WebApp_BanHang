<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>

</head>

<%--<form method="get" action="/home/viewSP">--%>
<%--    <button type="submit" class="view" name="view" value="submit">Hien thi</button>--%>
<%--</form>--%>
<%--<c:if test="${view == 'submit'}">--%>
<body>
<%--<form:form></form:form>--%>
<form action="/san-pham/add" method="post">
    <p>Ma San Pham</p>
    <input type="text" name="maSP"><br>
    <p>Ten San Pham</p>
    <input type="text" name="tenSP"><br>
    <p>Trang Thai</p>
    <input type="text" name="trangThai"><br>
    <p>Ma San Pham</p>
    <select name="idDanhMuc">
        <c:forEach items="${listdm}" var="dm">
            <option value="${dm.id}">
                    ${dm.tenDanhMuc}
            </option>
        </c:forEach>
    </select>
    <button type="submit">ADD</button>

</form>
<table border="2">
    <thead>
    <tr>
        <td>STT</td>
        <td>id</td>
        <td>Ma San Pham</td>
        <td>Ten San Pham</td>
        <td>Trang Thai</td>
        <td>Ngay Tao</td>
        <td>Ngay Sua</td>
        <td>Ten Danh Muc</td>
        <td>Ma Danh Muc</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.content}" var="sp" varStatus="i">
        <tr>
            <td>${i.index + 1}</td>
            <td>${sp.id}</td>
            <td>${sp.maSP}</td>
            <td>${sp.tenSP}</td>
            <td>${sp.trangThai}</td>
            <td>${sp.ngayTao}</td>
            <td>${sp.ngaySua}</td>
            <td>${sp.idDanhMuc.tenDanhMuc}</td>
            <td>${sp.idDanhMuc.maDanhMuc}</td>
            <td>
                </button> <a href="/san-pham/delete?id=${sp.id}">
                <button>Delete</button>
            </a>
                <a href="/san-pham/detail?id=${sp.id}">
                    <button>Update</button>
                </a>
            </td>
        </tr>

    </c:forEach>
    <div>
        <a href="/san-pham/view?pageNo=0"> |&lt; </a>
        <a href="/san-pham/view?pageNo=${page.number - 1}" <c:if test="${page.number == 0}">class="disabled"</c:if>> &lt;&lt; </a>
        <a href="/san-pham/view?pageNo=${page.number + 1}"
           <c:if test="${page.number + 1 >= page.totalPages}">class="disabled"</c:if>> &gt;&gt; </a>
        <a href="/san-pham/view?pageNo=${page.totalPages - 1}"> &gt;| </a>
    </div>
    </tbody>
</table>
<%--</c:if>--%>
</body>
</html>