import { pool } from "../../db/db.js";

export const getMaquinarias = async (req, res) => {
  try {
    const [result] = await pool.query("select * from MAQUINA ");
    res.json(result);
  } catch (error) {
    return res.status(500).json({ message: error.message });
  }
};
export const getMaquinaria = async (req, res) => {
  try {
    const [result] = await pool.query("select * from MAQUINA where id=?", [
      req.params.id,
    ]);
    if (result.length === 0) {
      return res
        .estatus(400)
        .json({ message: "No hay ninguna maquina resgistrada" });
    }
    res.json(result[0]);
  } catch (error) {
    return res.status(500).json({ message: error.message });
  }
};
export const createMaquinaria = async (req, res) => {
  try {
    const { nombre, capacidad, estado } = req.body;
    const [result] = await pool.query(
      "insert into MAQUINA( nombre, capacidad,estado ) values(?,?,?)",
      [nombre, apellido, ci, telefono, direccion, fechaNacimiento]
    );
    res.json({
      id: result.insertId,
      nombre,
      capacidad,
      estado,
    });
  } catch (error) {
    return res.status(500).json({ message: error.message });
  }
};
export const updateMaquinaria = async (req, res) => {
  try {
    const [result] = await pool.query("update MAQUINA set ? where id=?", [
      req.body,
      req.params.id,
    ]);
    res.json(result);
  } catch (error) {
    return res.status(500).json({ message: error.message });
  }
};
export const deleteMaquinaria = async (req, res) => {
  try {
    const [result] = await pool.query("delete  from MAQUINA where id=?", [
      req.params.id,
    ]);
    if (result.affectedRows === 0) {
      return res
        .status(404)
        .json({ message: "No se encuentra ninguna maquina" });
    }
    return res.sendStatus(204);
  } catch (error) {
    return res.status(500).json({ message: error.message });
  }
};
