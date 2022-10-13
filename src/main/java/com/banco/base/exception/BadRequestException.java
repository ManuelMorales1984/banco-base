package com.banco.base.exception;

import lombok.Getter;

import java.util.List;

@Getter
public class BadRequestException extends DemoDataException {

    public BadRequestException(String message, String process, List<String> error) {
        super(message, process, error);
    }
}
