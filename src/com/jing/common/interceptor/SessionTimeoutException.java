package com.jing.common.interceptor;
/**
 * 前端用户登录超时
 * @author cbb
 *
 */
public class SessionTimeoutException extends RuntimeException{

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
     * 
     */
    public SessionTimeoutException() {
        super();
    }

    /**
     * @param message
     * @param cause
     */
    public SessionTimeoutException(String message, Throwable cause) {
        super(message, cause);
    }

    /**
     * @param message
     */
    public SessionTimeoutException(String message) {
        super(message);
    }

    /**
     * @param cause
     */
    public SessionTimeoutException(Throwable cause) {
        super(cause);
    }
    
    

}