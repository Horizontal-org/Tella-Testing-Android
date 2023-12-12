package com.crowdar.examples.services;

import com.crowdar.core.actions.MobileActionManager;
import com.crowdar.examples.constants.SignUpConstants;

/**
 * This class contains the business logic.
 * We can have querys, requests or steps to do certain things (how to log into the app).
 * If we need to only complete a field or click a button, we can put it in the steps.
 */
public class SignUpService {

    public static void doSignUp(String username, String email, String password){
        MobileActionManager.setInput(SignUpConstants.USERNAME_INPUT_LOCATOR, username);
        MobileActionManager.setInput(SignUpConstants.EMAIL_INPUT_LOCATOR, email);
        MobileActionManager.setInput(SignUpConstants.PASSWORD_INPUT_LOCATOR, password);
        MobileActionManager.click(SignUpConstants.SIGN_UP_BUTTON_LOCATOR);
    }
}
