import java.sql.Connection;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class JDBCTemplate {

    private static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
    private static final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
    private static final String USERNAME = "Test";
    private static final String PASSWORD = "Test";

    private static JDBCTemplate instance;
    private DataSource dataSource;

    private JDBCTemplate() {
        initDataSource();
    }

    public static JDBCTemplate getInstance() {
        if (instance == null) {
            instance = new JDBCTemplate();
        }
        return instance;
    }

    private void initDataSource() {
        try {
            Context initContext = new InitialContext();
            Context envContext = (Context) initContext.lookup("java:/comp/env");
            dataSource = (DataSource) envContext.lookup("jdbc/oracle");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName(DRIVER);

            conn = dataSource.getConnection();
            conn.setAutoCommit(false);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
}
