package com.crowdar.tella.services;

import com.crowdar.core.PropertyManager;
import com.crowdar.core.actions.ActionManager;
import com.crowdar.core.actions.MobileActionManager;
import com.crowdar.driver.DriverManager;
import com.crowdar.tella.constants.*;
import io.appium.java_client.MobileBy;
import io.appium.java_client.android.AndroidDriver;
import org.openqa.selenium.*;
import org.openqa.selenium.interactions.Pause;
import org.openqa.selenium.interactions.PointerInput;
import org.openqa.selenium.interactions.Sequence;
import org.testng.Assert;

import java.time.Duration;
import java.util.*;


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
        buttons.put("Log in", ServersConstants.SERVER_LOGIN_BUTTON);
        buttons.put("GO TO REPORTS", ServersConstants.SERVER_LOGIN_BUTTON);


        String getButton = buttons.get(button);
        if (MobileActionManager.getElements(getButton).isEmpty()) {
            SettingsService.scrollDown();
        }
        MobileActionManager.waitVisibility(getButton);
        MobileActionManager.click(getButton);
    }


    public static void okServerButton() {
        AndroidDriver driver = (AndroidDriver) DriverManager.getDriverInstance().getWrappedDriver();

        Dimension size = driver.manage().window().getSize();
        int startX = size.getWidth() / 2;
        int startY = (int) (size.getHeight() * 0.8);
        int endY = (int) (size.getHeight() * 0.4);

        PointerInput finger = new PointerInput(PointerInput.Kind.TOUCH, "finger");
        Sequence scroll = new Sequence(finger, 1)
                .addAction(finger.createPointerMove(Duration.ZERO, PointerInput.Origin.viewport(), startX, startY))
                .addAction(finger.createPointerDown(PointerInput.MouseButton.LEFT.asArg()))
                .addAction(new Pause(finger, Duration.ofMillis(500)))
                .addAction(finger.createPointerMove(Duration.ofMillis(1000), PointerInput.Origin.viewport(), startX, endY))
                .addAction(finger.createPointerUp(PointerInput.MouseButton.LEFT.asArg()));

        List<Sequence> actions = new ArrayList<>();
        actions.add(scroll);
        driver.perform(actions);

        MobileActionManager.click(ServersConstants.GRAL_NEXT_BUTTON);
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

    public static void viewMessage(String message) {
        MobileActionManager.waitVisibility(ServersConstants.TEXT_SERVER_MSG);
        String actualMessage = MobileActionManager.getText(ServersConstants.TEXT_SERVER_MSG);
        Assert.assertTrue(actualMessage.contains(message));
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
        MobileActionManager.click(ServersConstants.TEXT_SERVER_BUTTON, "GO TO REPORTS");
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


    public static void clicNextBtn() {
        scrollAndroid("text", "OK", 0);
        MobileActionManager.waitVisibility(FilesConstants.NEXT_BTN);
        MobileActionManager.click(FilesConstants.NEXT_BTN);
        //El click suele fallar asi que se agrega una comprobacion
        try {
            MobileActionManager.waitVisibility(ServersConstants.URL_INPUT);
        } catch (Exception e) {
            MobileActionManager.click(FilesConstants.NEXT_BTN);
        }
    }

    private static WebElement scrollAndroid(String locatorType, String locatorValue, int index) {
        String locator = String.format(
                "new UiScrollable(new UiSelector().scrollable(true).instance(0))" +
                        ".setAsVerticalList()" +
                        ".scrollForward()" +
                        ".scrollIntoView(new UiSelector().%s(\"%s\").instance(%d))",
                locatorType, locatorValue, index
        );

        return DriverManager.getDriverInstance().findElement(MobileBy.AndroidUIAutomator(locator));
    }

    public static void inputServerUserName(String userName) {
        MobileActionManager.setInput(ServersConstants.LOGIN_SERVER_USERNAME, userName);
    }

    public static void inputServerPassword(String password) {

    }

    public static void inputServerCredencialCredentials(String serverName) {
        String username = "";
        String password = "";

        switch (serverName) {

            case "Tella Web":
                username = PropertyManager.getProperty("tellauser");
                password = PropertyManager.getProperty("tellapass");
                break;

            case "Uwazi":
                username = PropertyManager.getProperty("uwaziuser");
                password = PropertyManager.getProperty("uwazipass");
                break;

            case "Google Drive":
                username = PropertyManager.getProperty("googledriveuser");
                password = PropertyManager.getProperty("googledrivepass");
                break;

            case "Open Data Kit (ODK)":
                username = PropertyManager.getProperty("odkuser");
                password = PropertyManager.getProperty("odkpass");
                break;

        }
        MobileActionManager.setInput(ServersConstants.LOGIN_SERVER_USERNAME, username);
        MobileActionManager.setInput(ServersConstants.LOGIN_SERVER_PASSWORD, password);
    }

    public static void googleDriveUserInput() {
        MobileActionManager.waitVisibility(ServersConstants.GOOGLE_LOGIN_TEXTBOX);
        MobileActionManager.setInput(
                ServersConstants.GOOGLE_LOGIN_TEXTBOX,
                PropertyManager.getProperty("googledriveuser"));
        MobileActionManager.waitVisibility(ServersConstants.GOOGLE_BUTTONS,"NEXT");
        MobileActionManager.click(ServersConstants.GOOGLE_BUTTONS,"NEXT");
    }

    public static void googleDrivePasswordInput() throws InterruptedException{
        Thread.sleep(2000);
        MobileActionManager.waitVisibility(ServersConstants.GOOGLE_PASSWORD_TEXTBOX);
        MobileActionManager.setInput(
                ServersConstants.GOOGLE_PASSWORD_TEXTBOX,
                PropertyManager.getProperty("googledrivepass"));
        MobileActionManager.waitVisibility(ServersConstants.GOOGLE_BUTTONS,"NEXT");
        MobileActionManager.click(ServersConstants.GOOGLE_BUTTONS,"NEXT");
    }

    public static void googleDriveAgreeTerms() throws InterruptedException {
        Thread.sleep(2000);
        MobileActionManager.waitVisibility(ServersConstants.GOOGLE_LOGIN_WELCOME_MSG);
        MobileActionManager.click(ServersConstants.GOOGLE_TERMS_AGREE_BUTTON, "I agree");
    }

    public static void googleDriveAcceptPermissions() throws InterruptedException {
        Thread.sleep(2000);
        MobileActionManager.waitVisibility(ServersConstants.GOOGLE_PERMISSIONS_MSG);
        MobileActionManager.click(ServersConstants.GOOGLE_BUTTONS, "MORE");
        MobileActionManager.waitVisibility(ServersConstants.GOOGLE_BUTTONS, "ACCEPT");
        MobileActionManager.click(ServersConstants.GOOGLE_BUTTONS, "ACCEPT");
    }

    public static void googleDriveNewFolder(String folder) {
        MobileActionManager.waitVisibility(ServersConstants.INPUT_FOLDER_NAME);
        MobileActionManager.setInput(ServersConstants.INPUT_FOLDER_NAME, folder);
        MobileActionManager.click(ServersConstants.GRAL_NEXT_BUTTON);
    }

    public static void googleDriveAdditionalPermissions() {
        try {
            MobileActionManager.waitVisibility(ServersConstants.GOOGLE_ADDITIONAL_PERMISSIONS_MSG);
            scrollAndroid("text","Continue", 0);
            MobileActionManager.waitVisibility(ServersConstants.GOOGLE_ADDITIONAL_PERMISSIONS_BUTTON);
            MobileActionManager.click(ServersConstants.GOOGLE_ADDITIONAL_PERMISSIONS_BUTTON);
        } catch (TimeoutException e) {
            System.out.println("Google additional permissions did not appear. Continuing test.");
        }
    }

    public static void connectedToServerMsg() {
        MobileActionManager.waitVisibility(ServersConstants.CONNECTED_TO_SERVER_MSG);
        MobileActionManager.click(ServersConstants.SERVER_LOGIN_BUTTON);
    }

    public static void clickExistingGoogleAccount() {
        MobileActionManager.waitVisibility(ServersConstants.GOOGLE_CHOOSE_ACCOUNT_MSG);
        MobileActionManager.waitVisibility(ServersConstants.GOOGLE_FIRST_LISTED_ACCOUNT);
        MobileActionManager.click(ServersConstants.GOOGLE_FIRST_LISTED_ACCOUNT);
    }

    public static void clickAgreeAndShare() {
        try {
            MobileActionManager.waitVisibility(ServersConstants.GOOGLE_SHARE_AGREE_BUTTON);
            MobileActionManager.click(ServersConstants.GOOGLE_SHARE_AGREE_BUTTON);
        } catch (TimeoutException e) {
            System.out.println("Google share agreement did not appear. Continuing test.");
        }
    }

    public static void clickAddAnotherGoogleAccount() {
        try {
            MobileActionManager.waitVisibility(ServersConstants.GOOGLE_ADD_ACCOUNT);
            MobileActionManager.click(ServersConstants.GOOGLE_ADD_ACCOUNT);
        } catch (TimeoutException e) {
            System.out.println("No existing accounts were found. Continuing test.");
        }
    }

    public static void clickAdvancedODK() {
        MobileActionManager.click(ServersConstants.ODK_CONNECT_ADVANCED_BUTTON);
    }

    public static void clickRefreshODK() {
        MobileActionManager.click(ServersConstants.ODK_REFRESH_BUTTON);
    }

    public static void clickDownloadFirstODK() throws InterruptedException {
        Thread.sleep(1000);
        MobileActionManager.click(ServersConstants.ODK_DOWNLOAD_BUTTON);
    }

    public static void clickFirstFormODK() throws InterruptedException {
        Thread.sleep(1000);
        MobileActionManager.click(ServersConstants.ODK_FIRST_FORM);
    }

    public static void clickNextButtonODKForm() {
        MobileActionManager.click(ServersConstants.ODK_FORM_NEXT_BUTTON);
    }

    public static void clickSaveForLaterODK() {
        MobileActionManager.click(ServersConstants.ODK_FORM_SAVE_OUTBOX_BUTTON);
    }

    public static void isFormPresentInTab(String formName, String tab) {
        Assert.assertTrue(
                Boolean.parseBoolean(
                        MobileActionManager.getAttribute(
                                ServersConstants.ODK_TABS, "selected", tab
                        )
                ),
                tab + " tab not selected"
        );
        Assert.assertTrue(
                MobileActionManager.isVisible(ServersConstants.ODK_FORM_NAME, formName),
                "Form '" + formName + "' not visible in " + tab
        );
        String actualFormName = MobileActionManager.getText(
                ServersConstants.ODK_FORM_NAME, formName
        );
        Assert.assertEquals(
                actualFormName,
                formName,
                "Form name mismatch in " + tab
        );
    }

    public static void completeFormAriTestODK() throws InterruptedException {
        MobileActionManager.setInput(ServersConstants.ODK_FORM_EDIT_TEXT, "Si?");
        MobileActionManager.click(ServersConstants.ODK_FORM_NEXT_BUTTON);
        MobileActionManager.click(ServersConstants.ODK_FORM_NEXT_BUTTON);

        attachPhotoInODKForm();
        recordAudioInODKForm();
        recordVideoInODKForm();

        MobileActionManager.click(ServersConstants.ODK_FORM_CHECKBOX, "OK. Please continue.");
        MobileActionManager.click(ServersConstants.ODK_FORM_NEXT_BUTTON);

        selectODKOptions();

        MobileActionManager.click(ServersConstants.ODK_FORM_NEXT_BUTTON);
        MobileActionManager.setInput(ServersConstants.ODK_FORM_EDIT_TEXT, "70 señor");
    }

    private static void attachPhotoInODKForm() {
        MobileActionManager.click(ServersConstants.ODK_FORM_ATTACH_FILE, "Attach photo");
        MobileActionManager.click(ServersConstants.PHOTO_FILES_SELECT);
        MobileActionManager.click(ServersConstants.TAKE_PHOTO_BUTTON);
        MobileActionManager.click(ServersConstants.ODK_FORM_NEXT_BUTTON);
    }

    private static void recordAudioInODKForm() throws InterruptedException {
        MobileActionManager.click(ServersConstants.ODK_FORM_ATTACH_FILE, "Attach audio recording");
        MobileActionManager.click(ServersConstants.AUDIO_FILES_SELECT);
        MobileActionManager.click(AudioConstants.RECORD_AUDIO);
        Thread.sleep(5000);
        MobileActionManager.click(AudioConstants.RECORD_AUDIO);
        MobileActionManager.click(AudioConstants.AUDIO_EXIT_BUTTON);
        MobileActionManager.click(ServersConstants.ODK_FORM_NEXT_BUTTON);
    }

    private static void recordVideoInODKForm() throws InterruptedException {
        MobileActionManager.click(ServersConstants.ODK_FORM_ATTACH_FILE, "Attach video");
        MobileActionManager.click(ServersConstants.PHOTO_FILES_SELECT);
        MobileActionManager.click(PhotographyAndVideoConstants.CAPTURE_PHOTO_OR_VIDEO_BUTTON);
        Thread.sleep(5000);
        MobileActionManager.click(PhotographyAndVideoConstants.CAPTURE_PHOTO_OR_VIDEO_BUTTON);
        MobileActionManager.click(ServersConstants.ODK_FORM_NEXT_BUTTON);
        MobileActionManager.click(ServersConstants.ODK_FORM_NEXT_BUTTON);
    }

    private static void selectODKOptions() {
        MobileActionManager.click(ServersConstants.ODK_FORM_TEXTVIEW, "1");
        MobileActionManager.click(ServersConstants.ODK_FORM_CHECKED_TEXTVIEW, "2");
        MobileActionManager.click(ServersConstants.ODK_FORM_TEXTVIEW, "2");
        MobileActionManager.click(ServersConstants.ODK_FORM_CHECKED_TEXTVIEW, "3");
        MobileActionManager.click(ServersConstants.ODK_FORM_TEXTVIEW, "3");
        MobileActionManager.click(ServersConstants.ODK_FORM_CHECKED_TEXTVIEW, "4");
    }

    public static void clickSaveFormODK() {
        MobileActionManager.click(ServersConstants.ODK_FORM_SAVE_DRAFT_BUTTON);
    }

    public static void clickCloseForm() {
        MobileActionManager.click(ServersConstants.ODK_CLOSE_FORM_BUTTON);
    }

    public static void clickTabODK(String tab) {
        MobileActionManager.click(ServersConstants.ODK_TABS, tab);
    }

    public static void sendFormToDraftOutbox(String tab) {
        switch (tab.trim().toLowerCase()) {
            case "draft":
                clickSaveFormODK();
                clickCloseForm();
                clickTabODK("Draft");
                break;

            case "outbox":
                MobileActionManager.click(ServersConstants.ODK_FORM_NEXT_BUTTON);
                MobileActionManager.click(ServersConstants.ODK_FORM_SAVE_OUTBOX_BUTTON);
                break;

            default:
                throw new IllegalArgumentException("Unknown tab: " + tab);
        }
    }

    public static void clickOptionForm() {
        MobileActionManager.click(ServersConstants.ODK_FORM_OPTION_BUTTON);
    }

    public static void clickDeleteForm() {
        MobileActionManager.click(ServersConstants.ODK_FORM_OPTION_DELETE_BUTTON);
    }
}
