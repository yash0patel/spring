package com.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;

@Service
public class SmsService {

    @Value("${twilio.account_sid}")
    private String accountSid;

    @Value("${twilio.auth_token}")
    private String authToken;

    public void sendWelcomeSms(String mobileNo) {
        Twilio.init(accountSid, authToken);

        Message message = Message.creator(
                new com.twilio.type.PhoneNumber("+91" + mobileNo),
                new com.twilio.type.PhoneNumber("+18568562948"),
                "Welcome to What's Inside! Your account is ready. Start exploring now and discover more. – Team What's Inside"
        ).create();

        System.out.println(message.getSid());
    }
}
