package com.crowdar.tella.services;

import com.crowdar.core.actions.ActionManager;
import com.crowdar.core.actions.MobileActionManager;
import com.crowdar.tella.constants.ServersConstants;
import org.testng.Assert;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class ServersService {
    public static void clickPlusButton() {
        MobileActionManager.waitVisibility(ServersConstants.PLUS_BUTTON);
        ActionManager.click(ServersConstants.PLUS_BUTTON);
    }
    public static void viewConectionsServerOptions(List<String> listServer) {
        MobileActionManager.waitVisibility(ServersConstants.WHAT_SERVER_TITLE);
        for (String serverName : listServer) {
            Assert.assertTrue(MobileActionManager.isPresent(ServersConstants.TEXT_SERVER_BUTTON, serverName));
        }
    }
    public static void selectServer(String server) {
        MobileActionManager.waitVisibility(ServersConstants.WHAT_SERVER_TITLE);
        ActionManager.click(ServersConstants.TEXT_SERVER_BUTTON, server);
    }

    public static void pressButton(String button) {
        Map<String, String> buttons = new HashMap<>();
        buttons.put("OK", ServersConstants.OK_BUTTON);
        buttons.put("Cancel", ServersConstants.CANCEL_BUTTON);
        buttons.put("Next", ServersConstants.NEXT_BUTTON);
        String getButton = buttons.get(button);
        MobileActionManager.waitVisibility(getButton);
        MobileActionManager.click(getButton);
    }

    public static void viewSettingServer(String server) {
        MobileActionManager.waitVisibility(ServersConstants.URL_INPUT);
        Assert.assertTrue(ActionManager.isPresent(ServersConstants.URL_INPUT));
    }
}
