<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<main class="row">
    <aside class="bg-light col-9" style="padding-left: 20px">
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>ID</th>
                <th>Ho ten</th>
                <th>Dia chi</th>
                <th>SDT</th>
                <th>Trang thai</th>
                <th>Ngay tao</th>
                <th>Ngay sua</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${dm}" var="d">
                <tr>
                    <td>${d.id}</td>
                    <td>${d.hoTen}</td>
                    <td>${d.diaChi}</td>
                    <td>${d.sdt}</td>
                    <td>${d.trangThai}</td>
                    <td>${d.ngayTao}</td>
                    <td>${d.ngaySua}</td>
                    <td>
                        <a href="/delete?id=${d.id}">
                            <button class="btn btn-danger">Xoa</button></a>
                        <span><a href="/detail?id=${d.id}"><button class="btn btn-warning">Sua</button></a></span>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </aside>
    <aside class="bg-light col-3" style="padding-right: 20px">
        <form action="/kh/add"  method="post">
            <label>Ho ten</label>
            <input type="text" name="hoTen"  class="form-control" value="${up.hoTen}">
            <label>Dia chi</label>
            <input type="text" name="diaChi"  class="form-control" value="${up.diaChi}">
            <label>SDT</label>
            <input type="text" name="sdt"  class="form-control" value="${up.sdt}">
            <label>Trang thai</label>
            <br>
            <input type="radio" name="trangThai" value="Active" checked>Active
            <br>
            <input type="radio" name="trangThai" value="Inactive">Inactive
            <br>

            <br>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </aside>
</main>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>