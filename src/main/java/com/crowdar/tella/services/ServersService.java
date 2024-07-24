package com.crowdar.tella.services;

import com.crowdar.core.actions.ActionManager;
import com.crowdar.core.actions.MobileActionManager;
import com.crowdar.tella.constants.ServersConstants;
import org.testng.Assert;


public class ServersService {
    public static void clickPlusButton() {
        MobileActionManager.waitVisibility(ServersConstants.PLUS_BUTTON);
        ActionManager.click(ServersConstants.PLUS_BUTTON);
    }

    public static void viewConectionsServerOptions() {
        MobileActionManager.waitVisibility(ServersConstants.WHAT_SERVER_TITLE);
        Assert.assertTrue(ActionManager.isPresent(ServersConstants.TEXT_SERVER_BUTTON,"Open Data Kit (ODK)"));
        Assert.assertTrue(ActionManager.isPresent(ServersConstants.TEXT_SERVER_BUTTON,"Tella Web"));
        Assert.assertTrue(ActionManager.isPresent(ServersConstants.TEXT_SERVER_BUTTON,"Uwazi"));
    }
}
