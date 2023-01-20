import {createPool} from 'mysql2/promise';

// cambiar parametros con la IP del deploying de la app
// en estos casos se usan modulos para variable de entorno .env
// pero para local no ocupo :)
export const pool = createPool({
   host: 'localhost',
   user: 'root',
   password: '123456',
   port: '3306',
   database: 'inxeniuxdb'
});