import { pool } from "../db/db.js";
/*Funcion que devuelve el total actualizado, llamar cada vez que se 
agregue un producto al detalle de venta para actualizar este total al pedido*/
//NOTA
// todavia trabajando este caso no usable
export const TotalDetalle = async (req, res) => {
  try {
    const [result] = await pool.query(
      "select sum(total) from PEDIDO where fecha= date(now)"
    );
    res.json(result);
  } catch (error) {
    return res.status(500).json({ message: error.message });
  }
};
/* funcion que devuelve el id del producto ingresando el nombre ya establecido 
para obtener su id y colocar el dato al detalle de la venta*/
export const obtenerIdProducto = async (req, res) => {
    try {
      const [result] = await pool.query("select id from PRODUCTO where nombre=?", [
        req.params.nombre,
      ]);
      if (result.length === 0) {
        return res
          .estatus(400)
          .json({ message: "No hay ningun producto resgistrado con ese nombre" });
      }
      res.json(result[0]);
    } catch (error) {
      return res.status(500).json({ message: error.message });
    }
  };
  /* funcion que devuelve el numero del pedido mas reciente para poner el id en 
   el detalle de venta*/
  export const obtenerIdPedido = async (req, res) => {
    try {
      const [result] = await pool.query("select MAX(id) from PEDIDO where fecha=CURDATE()");
      if (result.length === 0) {
        return res
          .estatus(400)
          .json({ message: "No hay ningun pedido resgistrado hoy" });
      }
      res.json(result[0]);
    } catch (error) {
      return res.status(500).json({ message: error.message });
    }
  };