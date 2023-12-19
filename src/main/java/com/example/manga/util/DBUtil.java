package com.example.manga.util;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DBUtil {
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public static String url = "jdbc:mysql://localhost:3306/manga";//本地数据库
//    public static String url = "jdbc:mysql://101.200.220.142:3306/manga";
    public static String user = "root";
    public static String password = "20021205ghc";//本地数据库密码
//    public static String password = "20021205Ghc";

    public static Connection getConn(){
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(url,user,password);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return conn;
    }

    public static int update(String sql, Object... params){
        Connection conn = getConn();
        PreparedStatement preparedStatement=null;
        int num=-1;
        try {
            preparedStatement = conn.prepareStatement(sql);
            setParams(preparedStatement,params);
            num = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            closeAll(null,preparedStatement,conn);
        }
        return num;
    }

    public static List<List> queryToList(String sql, Object... params){
        Connection conn = getConn();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        ArrayList<List> lists = new ArrayList<>();
        try {
            preparedStatement = conn.prepareStatement(sql);
            setParams(preparedStatement,params);
            resultSet = preparedStatement.executeQuery();
            ResultSetMetaData resultSetMetaData = resultSet.getMetaData();
            while (resultSet.next())
            {
                ArrayList<Object> list = new ArrayList<>();
                for(int i=0;i < resultSetMetaData.getColumnCount();i++)
                {
                    list.add(resultSet.getObject(i+1));
                }
                lists.add(list);
            }
            return lists;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            closeAll(resultSet,preparedStatement,conn);
        }
    }

    public static List<Map<String,Object>> queryToMap(String sql, Object... params){
        Connection conn = getConn();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        ArrayList<Map<String,Object>> maps = new ArrayList<>();
        try {
            preparedStatement = conn.prepareStatement(sql);
            setParams(preparedStatement,params);
//            System.out.println(params[0]);
            resultSet = preparedStatement.executeQuery();
            ResultSetMetaData resultSetMetaData = resultSet.getMetaData();
            while (resultSet.next())
            {
                HashMap<String,Object> map = new HashMap<>();
                for(int i=0;i < resultSetMetaData.getColumnCount();i++)
                {
                    map.put(resultSetMetaData.getColumnName(i+1),resultSet.getObject(i+1));
                }
                maps.add(map);
            }
            return maps;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            closeAll(resultSet,preparedStatement,conn);
        }
    }

    public static void setParams(PreparedStatement preparedStatement, Object... params){
        try {
            if(params!=null){
                for (int i = 0; i < params.length; i++) {
                    preparedStatement.setObject(i+1,params[i]);
                }
            }
        }catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static void closeAll(ResultSet resultSet, PreparedStatement preparedStatement, Connection connection)
    {
        if(resultSet != null){
            try {
                resultSet.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        if(preparedStatement != null){
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        if (connection != null)
        {
            try {
                connection.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }
}
