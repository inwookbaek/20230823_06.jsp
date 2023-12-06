package com.lec.service;

public class MessageNotFoundException extends RuntimeException {

	public MessageNotFoundException(String message) {
		super(message);
	}
}
