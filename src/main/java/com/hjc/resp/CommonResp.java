package com.hjc.resp;

import lombok.Data;

@Data
public class CommonResp<T> {
    private boolean success = true;
    private String message;
    private T content;

    public CommonResp(T content) {
        this.content = content;
    }

    public CommonResp(String message, T content) {
        this.content = content;
        this.message = message;
    }
}
