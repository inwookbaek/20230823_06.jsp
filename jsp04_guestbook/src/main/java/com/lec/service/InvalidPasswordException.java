package com.lec.service;

public class InvalidPasswordException extends RuntimeException {
	
	public InvalidPasswordException(String message) {
		super(message);
	}
}
