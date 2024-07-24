package com.crowdar.tella.services;

import com.crowdar.core.actions.MobileActionManager;
import com.crowdar.tella.constants.HomeConstants;
import org.testng.Assert;


public class ServersService {

    public static void isHomeLoaded() {
        MobileActionManager.waitVisibility(HomeConstants.HOME_BUTTON);
        MobileActionManager.waitVisibility(HomeConstants.CAMERA_BUTTON);
        MobileActionManager.waitVisibility(HomeConstants.MIC_BUTTON);
        Assert.assertTrue(MobileActionManager.isVisible(HomeConstants.HOME_BUTTON), HomeConstants.VIEW_NOT_DISPLAYED_MESSAGE);
    }
}
