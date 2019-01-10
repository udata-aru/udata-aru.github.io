---
title: 
keywords: 
sidebar: indicador_sidebar
toc: false
permalink: index.html
Summary:
---

<head>
 <script>
     /**
     * Array con las imagenes que se iran mostrando en la web
     */
	
     var imagenes=new Array(
        'images/fondo-44.jpg',
        'images/fondo-22.jpg',
        'images/fondo-33.jpg',
        'images/fondo-11.jpg',
		'images/fondo-55.jpg'
        );
      var conteo=0
     /**
     * Funcion para cambiar la imagen
     */
     function rotarImagenes()
     {	  
		  document.getElementById("imagen").src=imagenes[conteo];
		  if(conteo<imagenes.length-1)
           {conteo ++}
		   else
		   {conteo=0}
           
     }
 
     /**
     * Función que se ejecuta una vez cargada la página
     */
     onload=function()
     {
        // Cargamos una imagen aleatoria
        rotarImagenes();
 
        // Indicamos que cada  segundos cambie la imagen
        setInterval(rotarImagenes,3000);
     }
    </script>
	</head>


<body style="background-color:#dfe3ee;">

<h1 style="color:#bf0000;" align="center"> Plataforma de Seguimiento</h1>
<h1 style="color:#bf0000;" align="center"> Línea Base de Indicadores UNICEF</h1>

 <center> 
<img src="" id="imagen" align="center">
 </center> 
</body>

