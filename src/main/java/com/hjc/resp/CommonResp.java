package com.hjc.resp;

import lombok.Data;

@Data
public class CommonResp<T> {
    private boolean success = true;
    private String message;
    private T content;
}
