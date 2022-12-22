//DB�� �젒�냽�븷 �겢�옒�뒪

package member.Info;

import java.sql.*;
import java.util.*;

public class DButill {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public DButill( ) {
	/* MySQL �뿰寃곗젙蹂� (源�蹂대챸 DB踰꾩쟾 5.5�씠�긽 湲곗�) */
	try {
		String jdbc_driver = "com.mysql.jdbc.Driver";
		String jdbc_url = "jdbc:mysql://localhost:3306/jspdb?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
		String jdbc_id = "root";
		String jdbc_password = "1234";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbc_url,jdbc_id,jdbc_password);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	void connect() {
		String jdbc_url = "jdbc:mysql://localhost:3306/jspdb?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";

		try {
			Class.forName("com.mysql.jdbc.Driver");

			conn = DriverManager.getConnection(jdbc_url,"root","1234");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	void disconnect() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}


	// �떊洹� 異붽� 硫붿꽌�뱶
	public boolean insertDB(DBBean member) {
		connect();

		String sql ="insert into member(mem_name,mem_email,mem_birth,mem_tel,mem_comdept,mem_memo,mem_id,mem_password) values(?,?,?,?,?,?,?,?)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,member.getMem_name());
			pstmt.setString(2,member.getMem_email());
			pstmt.setString(3,member.getMem_birth());
			pstmt.setString(4,member.getMem_tel());
			pstmt.setString(5,member.getMem_comdept());
			pstmt.setString(6,member.getMem_memo());
			pstmt.setString(7,member.getMem_id());
			pstmt.setString(8,member.getMem_password());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			disconnect();
		}
		return true;
	}

	// �쟾泥� 紐⑸줉�쓣 媛��졇�삤�뒗 硫붿꽌�뱶
	public ArrayList<DBBean> getDBList() {
		connect();
		ArrayList<DBBean> datas = new ArrayList<DBBean>();

		String sql = "select * from member order by mem_number desc";
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				DBBean member = new DBBean();

				member.setMem_number(rs.getInt("mem_number"));
				member.setMem_name(rs.getString("mem_name"));
				member.setMem_email(rs.getString("mem_email"));
				member.setMem_comdept(rs.getString("mem_comdept"));
				member.setMem_birth(rs.getString("mem_birth"));
				member.setMem_tel(rs.getString("mem_tel"));
				member.setMem_memo(rs.getString("mem_memo"));
				member.setMem_id(rs.getString("mem_id"));
				member.setMem_password(rs.getString("mem_password"));
				member.setMem_address(rs.getString("mem_address"));
				datas.add(member);
			}
			rs.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return datas;
	}



    private Vector connections = new Vector(10);
    private String _driver = "com.mysql.jdbc.Driver",
    _url = "jdbc:mysql://127.0.0.1:3306/jspdb?serverTimezone=UTC&characterEncoding=utf-8",
    _user = "root",
    _password = "1234";
    private boolean _traceOn = false;
    private boolean initialized = false;
    private int _openConnections = 10;
    private static DButill instance = null;

    /** Use this method to set the maximum number of open connections before
     unused connections are closed.
     */

    public static DButill getInstance() {
        if (instance == null) {
            synchronized (DButill.class) {
                if (instance == null) {
                    instance = new DButill();
                }
            }
        }

        return instance;
    }

    public void setOpenConnectionCount(int count) {
        _openConnections = count;
    }


    public void setEnableTrace(boolean enable) {
        _traceOn = enable;
    }


    /** Returns a Vector of java.sql.Connection objects */
    public Vector getConnectionList() {
        return connections;
    }


    /** Opens specified "count" of connections and adds them to the existing pool */
    public synchronized void setInitOpenConnections(int count)
            throws SQLException {
        Connection c = null;
        ConnectionObject co = null;

        for (int i = 0; i < count; i++) {
            c = createConnection();
            co = new ConnectionObject(c, false);

            connections.addElement(co);
            trace("ConnectionPoolManager: Adding new DB connection to pool (" + connections.size() + ")");
        }
    }


    /** Returns a count of open connections */
    public int getConnectionCount() {
        return connections.size();
    }


    /** Returns an unused existing or new connection.  */
    public synchronized Connection getConnection()
            throws Exception {
        if (!initialized) {
            Class c = Class.forName(_driver);
            DriverManager.registerDriver((Driver) c.newInstance());

            initialized = true;
        }


        Connection c = null;
        ConnectionObject co = null;
        boolean badConnection = false;


        for (int i = 0; i < connections.size(); i++) {
            co = (ConnectionObject) connections.elementAt(i);

            // If connection is not in use, test to ensure it's still valid!
            if (!co.inUse) {
                try {
                    badConnection = co.connection.isClosed();
                    if (!badConnection)
                        badConnection = (co.connection.getWarnings() != null);
                } catch (Exception e) {
                    badConnection = true;
                    e.printStackTrace();
                }

                // Connection is bad, remove from pool
                if (badConnection) {
                    connections.removeElementAt(i);
                    trace("ConnectionPoolManager: Remove disconnected DB connection #" + i);
                    continue;
                }

                c = co.connection;
                co.inUse = true;

                trace("ConnectionPoolManager: Using existing DB connection #" + (i + 1));
                break;
            }
        }

        if (c == null) {
            c = createConnection();
            co = new ConnectionObject(c, true);
            connections.addElement(co);

            trace("ConnectionPoolManager: Creating new DB connection #" + connections.size());
        }

        return c;
    }


    /** Marks a flag in the ConnectionObject to indicate this connection is no longer in use */
    public synchronized void freeConnection(Connection c) {
        if (c == null)
            return;

        ConnectionObject co = null;

        for (int i = 0; i < connections.size(); i++) {
            co = (ConnectionObject) connections.elementAt(i);
            if (c == co.connection) {
                co.inUse = false;
                break;
            }
        }

        for (int i = 0; i < connections.size(); i++) {
            co = (ConnectionObject) connections.elementAt(i);
            if ((i + 1) > _openConnections && !co.inUse)
                removeConnection(co.connection);
        }
    }

    public void freeConnection(Connection c, PreparedStatement p, ResultSet r) {
        try {
            if (r != null) r.close();
            if (p != null) p.close();
            freeConnection(c);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void freeConnection(Connection c, Statement s, ResultSet r) {
        try {
            if (r != null) r.close();
            if (s != null) s.close();
            freeConnection(c);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void freeConnection(Connection c, PreparedStatement p) {
        try {
            if (p != null) p.close();
            freeConnection(c);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void freeConnection(Connection c, Statement s) {
        try {
            if (s != null) s.close();
            freeConnection(c);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    /** Marks a flag in the ConnectionObject to indicate this connection is no longer in use */
    public synchronized void removeConnection(Connection c) {
        if (c == null)
            return;

        ConnectionObject co = null;
        for (int i = 0; i < connections.size(); i++) {
            co = (ConnectionObject) connections.elementAt(i);
            if (c == co.connection) {
                try {
                    c.close();
                    connections.removeElementAt(i);
                    trace("Removed " + c.toString());
                } catch (Exception e) {
                    e.printStackTrace();
                }

                break;
            }
        }
    }


    private Connection createConnection()
            throws SQLException {
        Connection con = null;

        try {
            if (_user == null)
                _user = "";
            if (_password == null)
                _password = "";

            Properties props = new Properties();
            props.put("user", _user);
            props.put("password", _password);

            con = DriverManager.getConnection(_url, props);
        } catch (Throwable t) {
            throw new SQLException(t.getMessage());
        }

        return con;
    }


    /** Closes all connections and clears out the connection pool */
    public void releaseFreeConnections() {
        trace("ConnectionPoolManager.releaseFreeConnections()");

        Connection c = null;
        ConnectionObject co = null;

        for (int i = 0; i < connections.size(); i++) {
            co = (ConnectionObject) connections.elementAt(i);
            if (!co.inUse)
                removeConnection(co.connection);
        }
    }


    /** Closes all connections and clears out the connection pool */
    public void finalize() {
        trace("ConnectionPoolManager.finalize()");

        Connection c = null;
        ConnectionObject co = null;

        for (int i = 0; i < connections.size(); i++) {
            co = (ConnectionObject) connections.elementAt(i);
            try {
                co.connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }

            co = null;
        }

        connections.removeAllElements();
    }


    private void trace(String s) {
        if (_traceOn)
            System.err.println(s);
    }
    
    public DBBean getMember(String mem_id) {
	      connect();
	      	DBBean member = null;
	        ResultSet rs=null;

	        try {

	            String strQuery = "select * from member where mem_id=?";
	            
	          
	            pstmt = conn.prepareStatement(strQuery);
	            pstmt.setString(1, mem_id);
	            rs = pstmt.executeQuery();

	            if (rs.next()) {
	            member = new DBBean();
	            member.setMem_number(rs.getInt("mem_number"));
	            member.setMem_name(rs.getString("mem_name"));
	            member.setMem_email(rs.getString("mem_email"));
	            member.setMem_tel(rs.getString("mem_tel"));
	            member.setMem_birth(rs.getString("mem_birth"));
	            member.setMem_comdept(rs.getString("mem_comdept"));
	            member.setMem_memo(rs.getString("mem_memo"));
	            member.setMem_id(rs.getString("mem_id"));
	            member.setMem_password(rs.getString("mem_password"));
	            member.setMem_address(rs.getString("mem_address"));
	            }
	        } catch (Exception ex) {
	            System.out.println("Exception" + ex);
	        } finally {
	           try{
	                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
	                if ( conn != null ){ conn.close(); conn=null;    }
	            }catch(Exception e){
	                throw new RuntimeException(e.getMessage());
	            }
	        }
	        return member;
	    }
    
public int login(String mem_id, String mem_password) {
		
		String SQL = "select mem_password from member where mem_id = ? ";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, mem_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(mem_password)) {
					return 1; //success!
				}else 
					return 0; //password wrong!
				
			}
			return -1; //id wrong!
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2; //DB error
	}
	
	 public boolean checkId(String mem_id) {
	       
	        boolean checkCon = false;
	        try {
	           
	            String SQL = "select mem_id from member where mem_id = ?";
	            pstmt = conn.prepareStatement(SQL);
	            pstmt.setString(1, mem_id);
	            rs = pstmt.executeQuery();
	            checkCon = rs.next();

	        } catch (Exception e) {
	        	e.printStackTrace();
	        } finally {
	        	disconnect();
	        }
	        return checkCon;
	    }

}





class ConnectionObject {
    public java.sql.Connection connection = null;
    public boolean inUse = false;

    public ConnectionObject(Connection c, boolean useFlag) {
        connection = c;
        inUse = useFlag;
    }
}

