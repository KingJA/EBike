package com.jing.common.interceptor;
/**
 * 没有权限
 * @author admin
 *
 */
public class NoPrivException extends RuntimeException{

	private static final long serialVersionUID = 1L;

	/**
     * 
     */
    public NoPrivException() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @param message
     * @param cause
     */
    public NoPrivException(String message, Throwable cause) {
        super(message, cause);
        // TODO Auto-generated constructor stub
    }

    /**
     * @param message
     */
    public NoPrivException(String message) {
        super(message);
        // TODO Auto-generated constructor stub
    }

    /**
     * @param cause
     */
    public NoPrivException(Throwable cause) {
        super(cause);
        // TODO Auto-generated constructor stub
    }
    
    

}