<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>

<body>
<form action="/san-pham/update?id=${listsp.id}" method="post">
    <p>Ma San Pham</p>
    <input type="text" name="maSP" value="${listsp.maSP}"><br>
    <p>Ten San Pham</p>
    <input type="text" name="tenSP" value="${listsp.tenSP}"><br>
    <p>Trang Thai</p>
    <input type="text" name="trangThai" value="${listsp.trangThai}"><br>
    <p>Ma San Pham</p>
    <select name="danhMuc">
        <c:forEach items="${listdm}" var="dm">
            <option value="${dm.id}" <c:if test="${listsp.idDanhMuc.id == dm.id}">selected</c:if>>
                    ${dm.tenDanhMuc}
            </option>
        </c:forEach>
    </select>
    <button type="submit">UPDATE</button>
</form>
</body>
</html>