package com.jing.common.interceptor;
/**
 * 后端用户登录超时
 * @author cbb
 *
 */
public class BackendTimeoutException extends RuntimeException{

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
     * 
     */
    public BackendTimeoutException() {
        super();
    }

    /**
     * @param message
     * @param cause
     */
    public BackendTimeoutException(String message, Throwable cause) {
        super(message, cause);
    }

    /**
     * @param message
     */
    public BackendTimeoutException(String message) {
        super(message);
    }

    /**
     * @param cause
     */
    public BackendTimeoutException(Throwable cause) {
        super(cause);
    }
    
    

}