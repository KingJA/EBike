/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jing.utils;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

/**
 *
 * @author huboliang
 */
public class HttpRequestUtils {

    /**
     * 发送Http请求到Web站点
     *
     * @param path Web站点请求地址
     * @param map Http请求参数
     * @param encode 编码格式
     * @return Web站点响应的字符串
     */
    public String sendHttpClientPost(String path, Map<String, String> map, String encode) {
        List<NameValuePair> list = new ArrayList<NameValuePair>();
        if (map != null && !map.isEmpty()) {
            for (Map.Entry<String, String> entry : map.entrySet()) {
                //解析Map传递的参数，使用一个键值对对象BasicNameValuePair保存。
                list.add(new BasicNameValuePair(entry.getKey(), entry.getValue()));
            }
        }

        try {
            //实现将请求 的参数封装封装到HttpEntity中。
            UrlEncodedFormEntity entity = new UrlEncodedFormEntity(list, encode);
            //使用HttpPost请求方式
            HttpPost httpPost = new HttpPost(path);
            //设置请求参数到Form中。
            httpPost.setEntity(entity);
            //实例化一个默认的Http客户端，使用的是AndroidHttpClient
            CloseableHttpClient httpclient = HttpClients.createDefault();
            //执行请求，并获得响应数据
            HttpResponse httpResponse = httpclient.execute(httpPost);
            //判断是否请求成功，为200时表示成功，其他均问有问题。
            if (httpResponse.getStatusLine().getStatusCode() == 200) {
                //通过HttpEntity获得响应流
                InputStream inputStream = httpResponse.getEntity().getContent();
                return changeInputStream(inputStream, encode);
            }

        } catch (UnsupportedEncodingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClientProtocolException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return "";
    }

    /**
     * 把Web站点返回的响应流转换为字符串格式
     *
     * @param inputStream 响应流
     * @param encode 编码格式
     * @return 转换后的字符串
     */
    private String changeInputStream(InputStream inputStream,
            String encode) {
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        byte[] data = new byte[1024];
        int len = 0;
        String result = "";
        if (inputStream != null) {
            try {
                while ((len = inputStream.read(data)) != -1) {
                    outputStream.write(data, 0, len);
                }
                result = new String(outputStream.toByteArray(), encode);

            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return result;
    }

    public String get(String path) {
        CloseableHttpClient httpclient = HttpClients.createDefault();
        try {
            // 创建httpget.    
            HttpGet httpget = new HttpGet(path);
            // 执行get请求.    
            CloseableHttpResponse response = httpclient.execute(httpget);
            try {
                // 获取响应实体    
                HttpEntity entity = response.getEntity();
                if (entity != null) {
                    return EntityUtils.toString(entity);
                }
            } finally {
                response.close();
            }
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            // 关闭连接,释放资源    
            try {
                httpclient.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return "";
    }
}