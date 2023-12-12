package com.crowdar.examples.services;

import com.crowdar.core.actions.MobileActionManager;
import com.crowdar.examples.constants.LoginConstants;
import org.testng.Assert;


public class LoginService {

    public static void isViewLoaded(){
        MobileActionManager.waitVisibility(LoginConstants.START_BUTTON);
    }

}
