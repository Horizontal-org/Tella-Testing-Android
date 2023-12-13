package com.crowdar.examples.services;

import com.crowdar.core.actions.MobileActionManager;
import com.crowdar.examples.constants.LoginConstants;
import org.testng.Assert;


public class LoginService {

    public static void isViewLoaded(String password){
        MobileActionManager.waitVisibility(LoginConstants.START_BUTTON);
        MobileActionManager.click(LoginConstants.START_BUTTON);
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


}
