<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Principal - Coronga Farma</title>
    <!-- CSS only -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="Resources/CSS/Principal.css">

</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="nav_principal">
        <!--Desktop-->
        <div class="collapse navbar-collapse justify-content-around" id="navbarSupportedContent">
            <a class="navbar-brand" href="" id="navImg">
                <img src="img/Logo.png" alt="Logo Coronga Farma">
            </a>
            <form class="form-inline my-2 my-lg-0" id="search">
                <input class="form-control mr-sm-2" type="search" placeholder="O que está procurando..."
                    aria-label="Search">
                <button class="btn btn-primary my-2 my-sm-0" type="submit">
                    <img src="img/search.svg" alt="Pesquisar">
                </button>
            </form>
            <div id="log"></div>
            <ul class="nav navbar-nav navbar-right" id="navbar_itens">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <img data-feather="user" alt="Login" stroke="white">
                        <span style="color: white;">Jonathas</span>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="">Logout</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="" id="nav_carrinho">
                        <img data-feather="shopping-cart" alt="Carrinho" fill="white" stroke="white">
                        <div id="qtd_animated">
                            0
                        </div>
                    </a>
                </li>
            </ul>
        </div>
    </nav>
    <div class="container">
        <main>
            <div class="row row-cols-1 row-cols-md-3">
                <div class="col mb-4">
                    <div class="card">
                        <img src="img/Repelente.png" class="card-img-top" alt="Repelente">
                        <div class="card-body">
                            <h5 class="card-title">Repelente OFF!</h5>
                            <p class="card-text">R$ 15,00</p>
                            <button class="btn btn-primary">Detalhes</button>
                        </div>
                    </div>
                </div>
                <div class="col mb-4">
                    <div class="card">
                        <img src="img/CremeFacial.png" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Creme Facial AVÈNE</h5>
                            <p class="card-text">R$ 55,50</p>
                            <button class="btn btn-primary">Detalhes</button>
                        </div>
                    </div>
                </div>
                <div class="col mb-4">
                    <div class="card">
                        <img src="img/pastilha.png" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Pastilhas VALDA</h5>
                            <p class="card-text">R$ 25,00</p>
                            <button class="btn btn-primary">Detalhes</button>
                        </div>
                    </div>
                </div>
                <div class="col mb-4">
                    <div class="card">
                        <img src="img/EnxaguanteBucal.png" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Enxaguante Bucal Listerine</h5>
                            <p class="card-text">R$ 49,90</p>
                            <button class="btn btn-primary">Detalhes</button>
                        </div>
                    </div>
                </div>
                <div class="col mb-4">
                    <div class="card">
                        <img src="img/Protetor Solar.png" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Protetor Solar Facial Nivea FPS30</h5>
                            <p class="card-text">R$ 25,83</p>
                            <button class="btn btn-primary">Detalhes</button>
                        </div>
                    </div>
                </div>
                <div class="col mb-4">
                    <div class="card">
                        <img src="img/Xarope.png" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Xarope Expectorante Melagrião</h5>
                            <p class="card-text">R$ 21,59</p>
                            <button class="btn btn-primary">Detalhes</button>
                        </div>
                    </div>
                </div>
                <div class="col mb-4">
                    <div class="card">
                        <img src="img/Comprimido.png" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Imecap Hair</h5>
                            <p class="card-text">R$ 60,00</p>
                            <button class="btn btn-primary">Detalhes</button>
                        </div>
                    </div>
                </div>
                <div class="col mb-4">
                    <div class="card">
                        <img src="img/Colirio.png" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Colírio Moura Brasil</h5>
                            <p class="card-text">R$ 14,99</p>
                            <button class="btn btn-primary">Detalhes</button>
                        </div>
                    </div>
                </div>
                <div class="col mb-4">
                    <div class="card">
                        <img src="img/Vitamina.png" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Centrum Mulher</h5>
                            <p class="card-text">R$ 233,40</p>
                            <button class="btn btn-primary">Detalhes</button>
                        </div>
                    </div>
                </div>
                <div class="col mb-4">
                    <div class="card">
                        <img src="img/Creme Dental.png" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Creme Dental Colgate Total 12</h5>
                            <p class="card-text">R$ 8,78</p>
                            <button class="btn btn-primary">Detalhes</button>
                        </div>
                    </div>
                </div>
                <div class="col mb-4">
                    <div class="card">
                        <img src="img/Absorvente.svg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Absorvente Intimus com Abas</h5>
                            <p class="card-text">R$ 13,97</p>
                            <button class="btn btn-primary">Detalhes</button>
                        </div>
                    </div>
                </div>
                <div class="col mb-4">
                    <div class="card">
                        <img src="img/Curativo.svg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Curativos Transparentes Band-Aid</h5>
                            <p class="card-text">R$ 6,79</p>
                            <button class="btn btn-primary">Detalhes</button>
                        </div>
                    </div>
                </div>
            </div>
            <nav id="paginacao">
                <ul class="pagination justify-content-center">
                    <li class="page-item">
                        <a class="page-link" href="" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li class="page-item active"><a class="page-link" href="">1</a></li>
                    <li class="page-item"><a class="page-link" href="Principal2.html">2</a></li>
                    <li class="page-item"><a class="page-link" href="Principal3.html">3</a></li>
                    <li class="page-item">
                        <a class="page-link" href="Principal2.html" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </main>
    </div>
    <footer>
        <div class="d-flex justify-content-between" id="foot">
            <div class="text" style="color: white; text-align: center;">Copyright © Coronga Farma</div>
            <div>
                <a href="" style="color: white;">Privacy Policy</a>
                ·
                <a href="" style="color: white;">Terms &amp; Conditions</a>
            </div>
        </div>
    </footer>

    <!-- JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
        integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
        crossorigin="anonymous"></script>
    <script src="https://unpkg.com/feather-icons"></script>
    <script src="https://cdn.jsdelivr.net/npm/feather-icons/dist/feather.min.js"></script>
    <script>
        feather.replace();
    </script>
</body>

</html>