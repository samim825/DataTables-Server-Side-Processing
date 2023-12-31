<%@page import="java.util.ArrayList"%>
<%@ page import="com.example.crud.model.Student" %>
<%@ page import="org.springframework.data.domain.Page" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Home page</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <!--  DataTables file-->
    <link rel='stylesheet' href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <style>

        .font-color{
            color: white;
        }
        .nav-link:hover {
            color: black;
            background-color:whitesmoke;
            margin: 0;
            display: block;
        }
        .link:hover{
            color: tomato;
            text-decoration: none;
            margin: 0;
        }


    </style>

</head>
<body >
<header>
    <nav class="navbar navbar-expand-sm bg-dark fixed-top">
        <!-- Links -->
        <ul class="navbar-nav" >
            <li class="nav-item">
                <a class="nav-link font-color" href="/" style="padding-left:20px;"><i class="fas fa-home"></i> Home</a>
            </li>
        </ul>
    </nav>
    <br>
</header>
<div class="container">
    <br><br>
    <a  class="btn btn-md btn-primary float-right" href="/upsertStudent">Add new</a><br><br>

    <table class="table table-hover table-striped table-bordered" id="myTable">

    </table>
    <br>
</div>

<script>
    $(document).ready( function () {
      var myTable =   $('#myTable').DataTable({
            "processing" : true,
            "serverSide" : true,
            "ajax" : {
                "url" : "/api/students",
            },
            "columns" : [
                {   "title" : "ID",
                    "data" : "id"
                },
                {   "title" : "Name",
                    "data" : "name"
                },
                {   "title" : "E-mail",
                    "data" : "email"
                },
                {   "title" : "Dept",
                    "data" : "dept"
                },
                {
                    "title" : "Action",
                    "data" : null,
                    "orderable" : false,
                    "render" : function (data) {
                        return '<a href="/upsertStudent?id='+data.id+'">Edit</a> <a href="/delete/id/'+data.id+'">Delete</a>';
                    }
                }
            ]

        });
    } );
</script>
</body>
</html>
