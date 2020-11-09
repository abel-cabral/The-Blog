package Model.dao;

import Model.dao.impl.UsuarioDaoJDBC;
import db.DB;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DaoFactory {
    public static UsuarioDao createUsuarioDao() {
        try {
            return new UsuarioDaoJDBC(DB.getConnection());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DaoFactory.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
