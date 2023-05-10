<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Estadísticas Navarra | Poblacion</title>
  <link rel="stylesheet" href="css/styleIndex.css">
</head>

<body>
  <!----------------- Barra de navegacion -------------------->
  <div class="div-nav">
    <a href="index.html" class="enlace">
      <img class="logo" src="img/logoNavarrablanco.png" alt="logo">
    </a>
    <!-- CheckBox del menu hamburguesa -->
    <input type="checkbox" id="checkbox">
    <label for="checkbox" class="checkboton">
      <!-- MenuHamburguesa logo -->
      <img class="menu-hmb" src="img/Menú-hamburguesa-herramienta-practica-o-icono-inutil.png" alt="iconoMenu">
    </label>
    <div class="div-nav-text">
      <!-- Links de "Inicio", "Contacto", etc -->
      <ul>
        <li><a href="index.html">Inicio</a></li>
        <li><a href="#aboutUs">Contacto</a></li>
        <!-- Iniciar sesion y registrarse -->
        <li><a id="login" href="#">Iniciar Sesion</a></li>
        <li><a id="login" href="#">Registrarse</a></li>
      </ul>
    </div>
  </div>

  <!---------------------- Segunda seccion ------------------------->

  <div class="box-mini-div2">
    <div class="mini-div2">
      <h1>Estadísticas Navarra</h1>
      <br />
      <p>"Descubre los datos demográficos de Navarra en nuestra página dedicada a la población de esta región. Encuentra estadísticas precisas sobre el crecimiento, distribución por edades, densidad y características demográficas de la población navarra. Mantente informado y conoce en detalle la evolución demográfica de esta comunidad autónoma."!
      </p>
      <a href="#farmacia">
        <div class="link-mas2">
          <p>Ir a Graficos</p>
        </div>
      </a>
    </div>
  </div>

  <!---------------------- Tercera seccion ------------------------->
  <!--esperanzaDeVida-->
  <div class="content-div">
    <div class="contenedor">
      <a href="esperanzaVida.html" target="_blank">
        <img src="img/esperanzaVida.svg" alt="esperanzaDeVida" class="imageLink">
      </a>
      <div class="middle">
        <a href="esperanzaVida.html" target="_blank">
          <div class="textoLink">Esperanza de Vida</div>
        </a>
      </div>
    </div>
    <!--farmacias-->
    <div class="contenedor">
      <a href="farmacias.html" target="_blank">
        <img src="img/entidades_locales_transparencia.svg" alt="farmacias" class="imageLink" id="farmacia">
      </a>
      <div class="middle">
        <a href="farmacias.html" target="_blank">
          <div class="textoLink" >Farmacias</div>
        </a>
      </div>
    </div>
    <!--Poblacion-->
    <div class="contenedor">
      <a href="poblacionNavarraPorAnos.html" target="_blank">
        <img src="img/2021-11-26-125020.118770DemografiaTRANSPARENCIA.svg" alt="Poblacion" class="imageLink">
      </a>
      <div class="middle">
        <a href="poblacionNavarraPorAnos.html" target="_blank">
          <div class="textoLink">Poblacion por Años</div>
        </a>
      </div>
    </div>
  </div>
  <!---------------------- Tercera seccion ------------------------->
  <!--poblacionPorMunicipios-->
  <div class="content-div2">
    <div class="contenedor">
      <a href="poblacionPorMunicipios.html" target="_blank">
        <img src="img/poblacionMunicipios.svg" alt="poblacionPorMunicipios" class="imageLink">
      </a>
      <div class="middle">
        <a href="poblacionPorMunicipios.html" target="_blank">
          <div class="textoLink">Poblacion por Municipio</div>
        </a>
      </div>
    </div>
    <!--tasaMortalidad-->
    <div class="contenedor">
      <a href="tasaMortalidad.html" target="_blank">
        <img src="img/tasaMortalidad.svg" alt="farmacias" class="imageLink" id="tasaMortalidad">
      </a>
      <div class="middle">
        <a href="tasaMortalidad.html" target="_blank">
          <div class="textoLink" id="tasaMortalidad">Tasa de Mortalidad</div>
        </a>
      </div>
    </div>
  </div>
  </div>




  <!---------------------- About Us ------------------------->
  <div class="contenedor-aboutUs">
    <div class="texto-aboutUs">
      <h1>Gobierno de Navarra</h1>
      <img id="aboutUs" src="img/Escudo_del_gobierno_de_Navarra.svg.png" alt="logoNavarra">
      <p>
        Número de teléfono:
        <br />
        +34 948 012 012
      </p>
      <p>
        Correo Electronico:
        <br />
        navarra@navarra.es
      </p>
    </div>
    <div class=texto-terminos>
      <p>
        <a href="https://www.navarra.es/home_es/Navarra/" target="_blank">Navarra</a>
        |
        <a href="https://www.navarra.es/es/proteccion-de-datos">Proteccion de datos</a>
        |
        <a href="https://www.navarra.es/es/aviso-legal" target="_blank">Aviso Legal</a>
        |
        <a href="https://www.navarra.es/es/tramites">Tramites</a>
      </p>

    </div>
  </div>
</body>

</html>
