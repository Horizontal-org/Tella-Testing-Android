package com.crowdar.tella.services;

import com.crowdar.core.PropertyManager;
import com.crowdar.core.actions.ActionManager;
import com.crowdar.core.actions.MobileActionManager;
import com.crowdar.driver.DriverManager;
import com.crowdar.tella.constants.FilesConstants;
import com.crowdar.tella.constants.HomeConstants;
import com.crowdar.tella.constants.LockUnlockConstants;
import com.crowdar.tella.constants.ServersConstants;
import io.appium.java_client.MobileDriver;
import io.appium.java_client.android.AndroidDriver;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
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

    public static void selectButton(String server) {
        MobileActionManager.waitVisibility(ServersConstants.WHAT_SERVER_TITLE);
        ActionManager.click(ServersConstants.TEXT_SERVER_BUTTON, server);
    }

    public static void pressButton(String button) {
        Map<String, String> buttons = new HashMap<>();
        buttons.put("OK", ServersConstants.GRAL_NEXT_BUTTON);
        buttons.put("Cancel", ServersConstants.GRAL_NEXT_BUTTON);
        buttons.put("Next", ServersConstants.GRAL_NEXT_BUTTON);
        buttons.put("SAVE", ServersConstants.SAVE_BUTTON);
        buttons.put("NEW REPORT", ServersConstants.NEW_REPORT_BUTTON);
        buttons.put("SUBMIT", ServersConstants.SUBMIT_BUTTON);

        String getButton = buttons.get(button);
        MobileActionManager.waitVisibility(getButton);
        MobileActionManager.click(getButton);
    }

    public static void viewSettingServer(String server) {
        if (MobileActionManager.isPresent(ServersConstants.URL_INPUT)) {
            Assert.assertTrue(ActionManager.isPresent(ServersConstants.URL_INPUT));
        } else if (MobileActionManager.isPresent(HomeConstants.LEAVE_TELLA_MESSAGE)) {
            Assert.assertTrue(ActionManager.isPresent(HomeConstants.LEAVE_TELLA_MESSAGE));
        }
    }

    public static void inputServerName(String serverName) {
        MobileActionManager.waitVisibility(ServersConstants.SERVER_NAME_INPUT);
        MobileActionManager.setInput(ServersConstants.SERVER_NAME_INPUT, serverName);
    }

    public static void inputServerUrl(String serverUrl) {
        MobileActionManager.waitVisibility(ServersConstants.URL_INPUT).clear();
        MobileActionManager.setInput(ServersConstants.URL_INPUT, serverUrl);
    }

    public static void viewMessage(String message) throws InterruptedException {
        if (MobileActionManager.isPresent(ServersConstants.TEXT_SERVER_MSG)) {
            String actualMessage = MobileActionManager.getText(ServersConstants.TEXT_SERVER_MSG);
            System.out.println("Actual message: " + actualMessage);
            Assert.assertTrue(actualMessage.contains(message));  // Compara si contiene el mensaje esperado
        }
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

    public static void selectLanguage(String language) {
        MobileActionManager.waitVisibility(ServersConstants.LANGUAGE_TITLE);
        Map<String, String> languages = new HashMap<>();
        languages.put("English", ServersConstants.TEXT_LANGUAGE_TITLE + "[1]");
        languages.put("Spanish", ServersConstants.TEXT_LANGUAGE_TITLE + "[2]");
        languages.put("French", ServersConstants.TEXT_LANGUAGE_TITLE + "[3]");
        ActionManager.click(languages.get(language));
    }

    public static void viewConnectMessage(String message) {
        MobileActionManager.waitVisibility(ServersConstants.CONNECTED_SERVER_TITLE);
        Assert.assertTrue(MobileActionManager.getText(ServersConstants.CONNECTED_SERVER_MSG).contains(message));
    }

    public static void connectToTellaServer() {
        MobileActionManager.waitVisibility(ServersConstants.TELLA_LOGIN_BUTTON);
        MobileActionManager.setInput(ServersConstants.TELLA_USER_INPUT, PropertyManager.getProperty("tellauser"));
        MobileActionManager.setInput(ServersConstants.TELLA_PASS_INPUT, PropertyManager.getProperty("tellapass"));
        MobileActionManager.click(ServersConstants.TEXT_SERVER_BUTTON, "Log in");
        MobileActionManager.click(ServersConstants.SAVE_BUTTON);
        MobileActionManager.click(ServersConstants.TEXT_SERVER_BUTTON, "OK");
        MobileActionManager.click(ServersConstants.BACK_BUTTON);
        MobileActionManager.click(ServersConstants.BACK_BUTTON);
    }

    public static void tapsConnection(String connection) {
        Map<String, String> connections = new HashMap<>();
        connections.put("Reports", ServersConstants.CONNECTIONS_VIEW_GROUP + "[1]");
        connections.put("Resources", ServersConstants.CONNECTIONS_VIEW_GROUP + "[2]");
        ActionManager.click(connections.get(connection));
    }

    public static void completeReport(String title, String description) {
        MobileActionManager.waitVisibility(ServersConstants.REPORT_TITLE_TEXTVIEW);
        MobileActionManager.setInput(ServersConstants.REPORT_TITLE_INPUT, title);
        MobileActionManager.setInput(ServersConstants.REPORT_DESCRIPTION_INPUT, description);
    }

    public static void clickAttachFiles() {
        MobileActionManager.waitVisibility(ServersConstants.ATTACH_BUTTON);
        MobileActionManager.click(ServersConstants.ATTACH_BUTTON);
    }

    public static void selectFiles(String filesOptions) {
        MobileActionManager.waitVisibility(ServersConstants.SELECT_FILES_TITLE);
        Map<String, String> file = new HashMap<>();
        file.put("Take photo with camera", ServersConstants.PHOTO_FILES_SELECT);
        file.put("Record audio", ServersConstants.AUDIO_FILES_SELECT);
        ActionManager.click(file.get(filesOptions));
    }

    public static void takePhoto() {
        MobileActionManager.waitVisibility(ServersConstants.TAKE_PHOTO_BUTTON);
        MobileActionManager.click(ServersConstants.TAKE_PHOTO_BUTTON);
    }

    public static void viewFileUpload(String title, String description) {
        MobileActionManager.waitVisibility(ServersConstants.REPORT_TITLE_TEXTVIEW);
        Assert.assertTrue(MobileActionManager.getText(ServersConstants.TITLE_UPLOAD_TEXT).contains(title));
        Assert.assertTrue(MobileActionManager.getText(ServersConstants.DESCRIPTION_UPLOAD_TEXT).contains(description));
        Assert.assertTrue(MobileActionManager.getText(ServersConstants.UPLOAD_TEXT).contains("uploaded"));
    }


    public static void googleDrive() {
        MobileActionManager.click(ServersConstants.CREATE_NEW_GOOGLE_DRIVE_FOLDER);
        MobileActionManager.click(LockUnlockConstants.NEXT_BUTTON);
        MobileActionManager.click(ServersConstants.INPUT_FOLDER_NAME);
        MobileActionManager.setInput(ServersConstants.INPUT_FOLDER_NAME, "GoogleDriveAutomatedTest");
        MobileActionManager.click(LockUnlockConstants.NEXT_BUTTON);
        MobileActionManager.waitVisibility(ServersConstants.ASSERT_SERVER_CONNECTION);
        MobileActionManager.click(ServersConstants.GO_TO_GOOGLE_DRIVE_BUTTON);
        MobileActionManager.waitVisibility(ServersConstants.TEXT_SERVER_MSG);
        //  Assert.assertTrue(Boolean.parseBoolean(ServersConstants.TEXT_SERVER_MSG));
        MobileActionManager.click(FilesConstants.BACK_BUTTON);
        MobileActionManager.click(FilesConstants.BACK_BUTTON);
    }


}