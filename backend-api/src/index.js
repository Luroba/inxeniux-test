import express from 'express';
import usuariosRoutes from './routes/usuarios.routes.js';

// Este es el index principal de la api backend que se conecta a la base de datos MYSQL
//    y que alimenta a la aplicacion de flutter

// MANUAL INSTALACION
// clonar repositorio de github, contiene carpetas de BackEnd (node.js) y FrontEnd (flutter)
//       la carpeta backend tiene un dockerfile para el deployment, seguir leyendo comentarios...

// AL INSTALAR:
//       Cuando clones el backend, veras el codigo fuente debidamente comentado
//       En carpeta backend-api/db encontras el comando para la creacion de la Base de datos
//            y tabla usados en el proyecto



// Use express como framework principal con el patron de diseño MVC
// Esta en un repositorio Git pensando en la escalabilidad del proyecto y 
//    el control de versiones para un staff más grande

// Docker es un contenedor que encapsula las versiones de framewors/lenguajes que necesita la aplicacion
// DockerFile presente pensando en el deployment 
// Imagenes usadas: 
//       NodeJs
//Las dependencias necesarias ya esyas indicadas en package-log.json

const app = express();

// con esto obtenemos las queries de la DB en formato JSON {"name": "value"}
app.use(express.json());

app.use('/api', usuariosRoutes);

app.listen(3000)
