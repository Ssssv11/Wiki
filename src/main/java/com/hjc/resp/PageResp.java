package com.hjc.resp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

@Getter
@Setter
@ToString
public class PageResp<T> {
    private Long total;
    private List<T> list;
}
