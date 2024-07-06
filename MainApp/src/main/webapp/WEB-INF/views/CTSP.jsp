<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Document</title>
</head>
<body>
<form action="/ctsp/add" method="post">
    <p>Ten San Pham</p>
    <select name="id_sanPham">
        <c:forEach items="${listsp}" var="sp">
            <option value="${sp.id}">
                    ${sp.tenSP}
            </option>
        </c:forEach>
    </select>
    <p>Ten Mau</p>
    <select name="id_mauSac">
        <c:forEach items="${listmau}" var="mau">
            <option value="${mau.id}">
                    ${mau.tenMau}
            </option>
        </c:forEach>
    </select>
    <p>Ten Size</p>
    <select name="id_size">
        <c:forEach items="${listsize}" var="s">
            <option value="${s.id}">
                    ${s.tenSize}
            </option>
        </c:forEach>
    </select>
    <p>Gia Ban</p>
    <input type="text" name="giaBan"><br>
    <p>So Luong</p>
    <input type="text" name="soLuong"><br>
    <p>Trang Thai</p>
    <input type="text" name="trangThai"><br>
    <button type="submit" class="btn btn-info" onclick="return confirm('Co Muon Them Khong')">ADD</button>
</form>
<table border="2" class="table">
    <thead>
    <tr>
        <td>STT</td>
        <td>id</td>
        <td>Ten San Pham</td>
        <td>Mau Sac</td>
        <td>Size</td>
        <td>Gia Ban</td>
        <td>So Luong</td>
        <td>Trang Thai</td>
        <td>Ngay Tao</td>
        <td>Ngay Sua</td>

    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.content}" var="ctsp" varStatus="i">
        <tr>
            <td>${i.index + 1}</td>
            <td>${ctsp.id}</td>
            <td>${ctsp.id_sanPham.tenSP}</td>
            <td>${ctsp.id_mauSac.tenMau}</td>
            <td>${ctsp.id_size.tenSize}</td>
            <td>${ctsp.giaBan}</td>
            <td>${ctsp.soLuongTon}</td>
            <td>${ctsp.trangThai}</td>
            <td>${ctsp.ngayTao}</td>
            <td>${ctsp.ngaySua}</td>

            <td>
                </button> <a href="/ctsp/delete?id=${ctsp.id}">
                <button class="btn btn-danger">Delete</button>
            </a>
                <a href="/ctsp/detail?id=${ctsp.id}">
                    <button class="btn btn-warning">Update</button>
                </a>
            </td>
        </tr>

    </c:forEach>

    </tbody>
</table>
<div>
    <nav aria-label="Page navigation example" name="pageNo">
        <ul class="pagination">
            <li class="page-item">
                <c:if test="${currentPage > 0}">
                    <a class="page-link" href="/ctsp/view?pageNo=${currentPage - 1}">Previous</a>
                </c:if>
            </li>
            <c:forEach var="i" begin="1" end="${page.totalPages}">
                <li class="page-item ${i == currentPage + 1 ? 'active' : ''}">
                    <a class="page-link" href="/ctsp/view?pageNo=${i - 1}">${i}</a>
                </li>
            </c:forEach>
            <li class="page-item">
                <c:if test="${currentPage < page.totalPages - 1}">
                    <a class="page-link" href="/ctsp/view?pageNo=${currentPage + 1}">Next</a>
                </c:if>
            </li>
        </ul>
    </nav>
</div>
</body>
</html>