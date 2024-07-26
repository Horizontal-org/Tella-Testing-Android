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
        buttons.put("SAVE", ServersConstants.SAVE_BUTTON);

        String getButton = buttons.get(button);
        MobileActionManager.waitVisibility(getButton);
        MobileActionManager.click(getButton);
    }

    public static void viewSettingServer(String server) {
        MobileActionManager.waitVisibility(ServersConstants.URL_INPUT);
        Assert.assertTrue(ActionManager.isPresent(ServersConstants.URL_INPUT));
    }

    public static void inputServerName(String serverName) {
        MobileActionManager.waitVisibility(ServersConstants.SERVER_NAME_INPUT);
        MobileActionManager.setInput(ServersConstants.SERVER_NAME_INPUT, serverName);
    }

    public static void inputServerUrl(String serverUrl) {
        MobileActionManager.waitVisibility(ServersConstants.URL_INPUT).clear();
        MobileActionManager.setInput(ServersConstants.URL_INPUT, serverUrl);
    }

    public static void viewMessage(String message) {
        MobileActionManager.waitVisibility(ServersConstants.TEXT_SERVER_MSG);
        Assert.assertTrue(MobileActionManager.getText(ServersConstants.TEXT_SERVER_MSG).contains(message));
    }

    public static void viewServerOnTheList(String serverName) {
        MobileActionManager.waitVisibility(ServersConstants.PLUS_BUTTON);
        Assert.assertTrue(MobileActionManager.getText(ServersConstants.SERVER_TITLE_LIST).contains(serverName));
    }

    public static void viewLoginToProject(String titleLogin) {
        MobileActionManager.waitVisibility(ServersConstants.LOGIN_TITLE);
        Assert.assertTrue(MobileActionManager.getText(ServersConstants.LOGIN_TITLE).contains(titleLogin));
    }

    public static void viewFieldsLogin(String username, String password) {
        MobileActionManager.waitVisibility(ServersConstants.LOGIN_TITLE);
        Assert.assertTrue(MobileActionManager.getText(ServersConstants.LOGIN_USERNAME_INPUT).contains(username));
        Assert.assertTrue(MobileActionManager.getText(ServersConstants.LOGIN_PASSWORD_INPUT).contains(password));
    }

    public static void viewListAccessButton(List<String> listAccessButton) {
        MobileActionManager.waitVisibility(ServersConstants.WHAT_SERVER_TITLE);
        for (String accessName : listAccessButton) {
            Assert.assertTrue(MobileActionManager.isPresent(ServersConstants.TEXT_SERVER_BUTTON, accessName));
        }
    }
}
