package com.crowdar.examples.services;

import com.crowdar.core.actions.MobileActionManager;
import com.crowdar.examples.constants.HomeConstants;
import com.crowdar.examples.constants.LoginConstants;
import org.testng.Assert;


public class HomeService {

    public static void isHomeLoaded() {
        MobileActionManager.waitVisibility(LoginConstants.HOME_BUTTON);
        MobileActionManager.waitVisibility(LoginConstants.CAMERA_BUTTON);
        MobileActionManager.waitVisibility(LoginConstants.MIC_BUTTON);
        Assert.assertTrue(MobileActionManager.isVisible(LoginConstants.HOME_BUTTON), HomeConstants.VIEW_NOT_DISPLAYED_MESSAGE);
    }
}
