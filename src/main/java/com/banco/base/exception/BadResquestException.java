package com.banco.base.exception;

import lombok.Getter;

import java.util.List;

@Getter
public class BadResquestException extends DemoDataException {

    public BadResquestException(List<String> error) {
        super(error);
    }

    public BadResquestException(String message, List<String>  error) {
        super(message, error);
    }

}
