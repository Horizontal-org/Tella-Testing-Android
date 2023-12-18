package com.crowdar.examples.services;

import com.crowdar.core.actions.ActionManager;
import com.crowdar.core.actions.MobileActionManager;
import com.crowdar.examples.constants.LoginConstants;
import org.testng.Assert;


public class LoginService {

    public static void isViewLoaded(){
        MobileActionManager.waitVisibility(LoginConstants.START_BUTTON);
        MobileActionManager.click(LoginConstants.START_BUTTON);
    }

    public static void setPassword(String password){
        for (int i = 0; i < 3; i++) {
            MobileActionManager.click(LoginConstants.NEXT_BUTTON);
        }
        MobileActionManager.click(LoginConstants.LOCK_PASSWORD_BUTTON);
        MobileActionManager.setInput(LoginConstants.PASSWORD_INPUT, password);
        MobileActionManager.click(LoginConstants.PASSWORD_RIGHT_BUTTON);
        MobileActionManager.setInput(LoginConstants.PASSWORD_INPUT, password);
        MobileActionManager.click(LoginConstants.PASSWORD_RIGHT_BUTTON);
        MobileActionManager.click(LoginConstants.NEXT_BUTTON);
        Assert.assertTrue(MobileActionManager.isVisible(LoginConstants.START_BUTTON), LoginConstants.VIEW_NOT_DISPLAYED_MESSAGE);
    }

    public static void goTella(){
        MobileActionManager.waitVisibility(LoginConstants.START_BUTTON);
        MobileActionManager.click(LoginConstants.START_BUTTON);
    }

    public static void setNumbers(String pin)  {
        for (int i = 0; i < 3; i++) {
            MobileActionManager.click(LoginConstants.NEXT_BUTTON);
        }
        MobileActionManager.click(LoginConstants.LOCK_PIN_BUTTON);
        setPin(pin);
        MobileActionManager.click(LoginConstants.PIN_OK_BUTTON);
        setPin(pin);
        MobileActionManager.click(LoginConstants.PIN_OK_BUTTON);
        MobileActionManager.click(LoginConstants.NEXT_BUTTON);
        Assert.assertTrue(MobileActionManager.isVisible(LoginConstants.START_BUTTON), LoginConstants.VIEW_NOT_DISPLAYED_MESSAGE);
    }
    public static String convertNumberToText(String number) {
        String[] textNumbers = {"zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"};
        int num;
        try {
            num = Integer.parseInt(number);
        } catch (NumberFormatException e) {
            return number;
        }
        if (num >= 0 && num <= 9) {
            return textNumbers[num];
        } else {
            return number;
        }
    }
    public static void setPin(String pin) {
        String[] strArrayNums = pin.split("");
        for (String number : strArrayNums) {
            String convertedNumber = convertNumberToText(number);
            String id = String.format("id:%sBtn", convertedNumber);
            ActionManager.click(id);
        }
    }

    public static void setPattern() {
        for (int i = 0; i < 3; i++) {
            MobileActionManager.click(LoginConstants.NEXT_BUTTON);
        }
        MobileActionManager.click(LoginConstants.LOCK_PATTERN_BUTTON);
        MobileActionManager.click(LoginConstants.LOCK_PATTERN_ID);
    }


}
