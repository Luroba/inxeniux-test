import { pool } from "../db.js";

// Controlador con los metodos necesarios que se direccionan con usuarios.routes.js

export const getUsuarios = async(req, res) => {
   try {
      const [rows] = await  pool.query('SELECT * FROM usuarios')
      res.json({rows})
   } catch (error) {
      return res.status(500).json({
         message: 'Something went wrong'
      })
   }
}

export const getUsuario = async(req, res) => {
   try {
      console.log(req.params.id)
      const [row] = await pool.query('SELECT * FROM usuarios WHERE id = ?', [req.params.id])
      if (row.length <= 0) return res.status(404).json({
         message: 'Usuario no encontrado'
      })
      res.json(row[0])
      
   } catch (error) {
      message: 'Something went wrong'
   }
}

export const createUsuarios = async (req, res) => {
   try {
      const { nombre, 
         apellidos, 
         edad, 
         fechaNacimiento,
         estadoCivil,
         pais, 
         estado, 
         municipio,
         localidad,
         idioma,
         pasatiempos,
         telefono,
         cp   
      } = req.body;
      const [rows] = await pool.query('INSERT INTO usuarios ( nombre, apellidos, edad, fechaNacimiento, estadoCivil, pais, estado, municipio, localidad, idioma, pasatiempos, telefono, cp) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
      [nombre, apellidos, edad, fechaNacimiento, estadoCivil, pais, estado, municipio, localidad, idioma, pasatiempos, telefono, cp])
      console.log(req.body);
      res.send({
         id: rows.insertId,
         nombre,
         apellidos
      })
      
   } catch (error) {
      message: 'Something went wrong'
   }
};


export const deleteUsuarios = async (req, res) => {
   try {
      const [result] = await pool.query('DELETE FROM usuarios WHERE id = ?', [req.params.id])
   
      if (result.affectedRows <= 0) return res.status(404).json({
         message: 'Usuario no encontrado'
      })
   
      res.sendStatus(204)
   } catch (error) {
      message: 'Something went wrong'
   }
}


export const updateUsuarios = async (req, res) => {
   try {
      const {id} = req.params
      const { nombre, 
         apellidos, 
         edad, 
         fechaNacimiento,
         estadoCivil,
         pais, 
         estado, 
         municipio,
         localidad,
         idioma,
         pasatiempos,
         telefono,
         cp   
      } = req.body
   
      const [result] = await pool.query('UPDATE usuarios SET nombre = IFNULL(?, nombre), apellidos = IFNULL(?, apellidos), edad = IFNULL(?, edad), fechaNacimiento = IFNULL(?, fechaNacimiento), estadoCivil = IFNULL(?, estadoCivil), pais = IFNULL(?, pais), estado = IFNULL(?, estado), municipio = IFNULL(?, municipio), localidad = IFNULL(?, localidad), idioma = IFNULL(?, idioma), pasatiempos = IFNULL(?, pasatiempos), telefono = IFNULL(?, telefono), cp = IFNULL(?, cp) WHERE id = ?',
      [nombre, apellidos, edad, fechaNacimiento, estadoCivil, pais, estado, municipio, localidad, idioma, pasatiempos, telefono, cp, id])
   
      if (result.affectedRows === 0) return res.status(404).json({
         message: 'Usuario no encontrado'
      })
   
      const [row] = await pool.query('SELECT * FROM usuarios WHERE id = ?', [id])
   
      res.json(row[0])
   } catch (error) {
      message: 'Something went wrong'
   }
}