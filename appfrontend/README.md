# Test Desarrollador Jr

Guía de instalación de proyecto CRUD por Luis Enrique Romero Barbosa

##  CRUD

Ejecutar el siguiente comando en ambas carpetas **backend-api** y **frontend-vue** para instalar node_modules
```
$ npm install
```

### Configurar **backend-api** y BD

En la terminal, iniciar sesion en MySQL y ejecutar el código SQL dentro del archivo: (más detalles dentro del archivo)
```
db/database.sql
```

Verificar **host, user, password** en el directorio:
```
src/db.js
```

**Ejecutar API en servidor 3000**
```
$ node src/index.js
```

### Configurar **frontend-vue**

Ejecutar comando para inicializar proyecto Vue
```
$ npm run dev
```

## SCRIPTS

Ejecutar scripts con comando node:
```
$ node <nombre del script>
```
