package com.crowdar.tella.services;

import com.crowdar.driver.DriverManager;
import io.appium.java_client.AppiumDriver;
import org.openqa.selenium.Dimension;
import java.time.Duration;
import com.crowdar.core.actions.MobileActionManager;
import com.crowdar.tella.constants.LockUnlockConstants;
import com.crowdar.tella.constants.SettingsConstants;
import io.appium.java_client.MobileBy;
import io.appium.java_client.MobileElement;
import io.appium.java_client.android.AndroidDriver;
import org.openqa.selenium.By;
import org.openqa.selenium.StaleElementReferenceException;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.PointerInput;
import org.openqa.selenium.interactions.Sequence;
import org.testng.Assert;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import static com.crowdar.driver.DriverManager.*;

public class SettingsService {

    public static void clickSettingsIcon() {
        MobileActionManager.waitVisibility(SettingsConstants.SETTINGS_ICON);
        GenericService.clickElementByCoordinates(SettingsConstants.SETTINGS_ICON);
    }

    public static void clickGeneralIcon() {
        MobileActionManager.waitVisibility(SettingsConstants.GENERAL_BUTTON);
        GenericService.clickElementByCoordinates(SettingsConstants.GENERAL_BUTTON);
    }

    public static void clickLanguageOptions() {
        MobileActionManager.waitVisibility(SettingsConstants.LANGUAGE_BUTTON);
        GenericService.clickElementByCoordinates(SettingsConstants.LANGUAGE_BUTTON);
    }

    public static void verifyListOfLanguages() {
        MobileActionManager.waitVisibility(SettingsConstants.LANGUAGE_LIST);
        Assert.assertTrue(MobileActionManager.isVisible(SettingsConstants.LANGUAGE_LIST));
    }

    public static void clickChoosenLanguage(String language) {
        for (int i = 0; i < 3; i++) {
            try {
                WebElement pedidoEle = getDriverInstance().getWrappedDriver().findElement(MobileBy.AndroidUIAutomator(
                        "new UiScrollable(new UiSelector().scrollable(true).instance(0))" +
                                ".scrollIntoView(new UiSelector()" +
                                ".textMatches(\"" + language + "\").instance(0))"));
                GenericService.clickElementByCoordinatesWithElement(pedidoEle);
                return;
            } catch (StaleElementReferenceException e) {
                GenericService.sleep(200);
            }
        }
    }

    public static void verifyLanguageTitle(String title) {
        MobileActionManager.waitVisibility(SettingsConstants.LANGUAGE_TITLE);
        Assert.assertTrue(MobileActionManager.isVisible(SettingsConstants.LANGUAGE_TITLE));
        String LanguageTitle = MobileActionManager.getText(SettingsConstants.LANGUAGE_TITLE);
        Assert.assertEquals(LanguageTitle, title);

        clickBackButton();
        MobileActionManager.waitVisibility(SettingsConstants.TITLE_LANGUAGE_SETTING);
        Assert.assertTrue(MobileActionManager.isVisible(SettingsConstants.TITLE_LANGUAGE_SETTING));
    }

    public static void clickCategory(String category) {
        Map<String, String> links = new HashMap<>();
        links.put("General", SettingsConstants.GENERAL_BUTTON);
        links.put("Security", SettingsConstants.SECURITY_BUTTON);
        links.put("Connections", SettingsConstants.SERVERS_BUTTON);
        links.put("About & Help", SettingsConstants.ABOUT_HELP_BUTTON);
        links.put("Feedback", SettingsConstants.FEEDBACK_BUTTON);

        String locator = links.get(category);
        for (int i = 0; i < 3; i++) {
            try {
                MobileActionManager.waitVisibility(locator);
                GenericService.clickElementByCoordinates(locator);
                return;
            } catch (StaleElementReferenceException e) {
                GenericService.sleep(200);
            }
        }
    }

    public static void accessCategory(String category) {
        MobileActionManager.waitVisibility(SettingsConstants.CATEGORY_SETTINGS_TITLE);
        Assert.assertTrue(MobileActionManager.isVisible(SettingsConstants.CATEGORY_SETTINGS_TITLE));
        String LanguageTitle = MobileActionManager.getText(SettingsConstants.CATEGORY_SETTINGS_TITLE);
        Assert.assertEquals(LanguageTitle, category);
    }

    public static void viewListGeneralConfifuration() {
        MobileActionManager.waitVisibility(SettingsConstants.LANGUAGE_SECTION);
        Assert.assertTrue(MobileActionManager.isVisible(SettingsConstants.LANGUAGE_SECTION));
        MobileActionManager.waitVisibility(SettingsConstants.VERIFICATION_MODE);
        Assert.assertTrue(MobileActionManager.isVisible(SettingsConstants.VERIFICATION_MODE));
        MobileActionManager.waitVisibility(SettingsConstants.FILES_SECTION);
        Assert.assertTrue(MobileActionManager.isVisible(SettingsConstants.FILES_SECTION));
        MobileActionManager.waitVisibility(SettingsConstants.SECTION_TEXT);
        Assert.assertTrue(MobileActionManager.isVisible(SettingsConstants.SECTION_TEXT));
    }

    public static String viewButton(String configuration) {
        Map<String, String> buttons = new HashMap<>();
        buttons.put("Share data to improve Tella", SettingsConstants.SWITCH_LIST_BUTTON);
        buttons.put("Share crash reports", SettingsConstants.SWITCH_LIST_BUTTON);
        buttons.put("Verification mode", SettingsConstants.SWITCH_LIST_BUTTON);
        buttons.put("Recent files", SettingsConstants.SWITCH_LIST_BUTTON);
        buttons.put("Favorite forms", SettingsConstants.SWITCH_LIST_BUTTON);
        buttons.put("Favorite templates", SettingsConstants.SWITCH_LIST_BUTTON);
        buttons.put("Text justification", SettingsConstants.SWITCH_LIST_BUTTON);
        buttons.put("Increase text spacing", SettingsConstants.SWITCH_LIST_BUTTON);
        buttons.put("Quick delete", SettingsConstants.SECURITY_SWITCH_LIST_BUTTON);
        buttons.put("Preserve metadata when importing", SettingsConstants.SECURITY_SWITCH_LIST_BUTTON);
        buttons.put("Camera silent mode", SettingsConstants.SECURITY_SWITCH_LIST_BUTTON);
        buttons.put("Screen security", SettingsConstants.SECURITY_SWITCH_LIST_BUTTON + "[4]");
        return buttons.get(configuration);
    }

    public static void switchButtonEnable(String configuration) {
        configuration = configuration.trim().replaceAll("^\"|\"$", "");
        String button = viewButton(configuration);
        if (button == null) {
            throw new IllegalArgumentException("Configuration not found in viewButton map: " + configuration);
        }
        String buttonFormat = String.format(button, configuration);

        for (int attempt = 0; attempt < 5; attempt++) {
            try {
                if (MobileActionManager.getElements(buttonFormat).isEmpty()) {
                    scrollDown();
                    GenericService.sleep(300);
                    continue;
                }
                MobileActionManager.waitVisibility(buttonFormat);
                String check = MobileActionManager.getAttribute(buttonFormat, "checked");
                if (Boolean.parseBoolean(check) != true) {
                    GenericService.clickElementByCoordinates(buttonFormat);
                }
                return;
            } catch (StaleElementReferenceException e) {
                GenericService.sleep(200);
            } catch (Exception e) {
                scrollDown();
                GenericService.sleep(300);
            }
        }
    }

    public static void switchButtonDisable(String configuration) {
        String buttonLocator = viewButton(configuration);
        for (int i = 0; i < 3; i++) {
            try {
                MobileActionManager.waitVisibility(buttonLocator);
                String check = MobileActionManager.getAttribute(buttonLocator, "checked");
                if (Boolean.parseBoolean(check) == true) {
                    GenericService.clickElementByCoordinates(buttonLocator);
                }
                return;
            } catch (StaleElementReferenceException e) {
                GenericService.sleep(200);
            }
        }
    }

    public static void viewButtonEnableGeneral(String configuration) {
        configuration = configuration.trim().replaceAll("^\"|\"$", "");
        MobileActionManager.waitVisibility(SettingsConstants.CATEGORY_SETTINGS_TITLE);
        if (!MobileActionManager.getText(SettingsConstants.CATEGORY_SETTINGS_TITLE).equalsIgnoreCase("General")){
            generalButton();
        }

        String button = viewButton(configuration);
        String buttonFormat = String.format(button, configuration);

        for (int attempt = 0; attempt < 5; attempt++) {
            try {
                if (MobileActionManager.getElements(buttonFormat).isEmpty()) {
                    scrollDown();
                    GenericService.sleep(300);
                    continue;
                }
                MobileActionManager.waitVisibility(buttonFormat);
                Assert.assertTrue(MobileActionManager.getAttribute(buttonFormat, "checked").contains("true"));
                return;
            } catch (Exception e) {
                scrollDown();
                GenericService.sleep(300);
            }
        }
    }

    public static void viewButtonEnableSecurity(String option) {
        option = option.trim().replaceAll("^\"|\"$", "");
        String button = viewButton(option);
        String buttonFormat = String.format(button, option);
        if (MobileActionManager.getElements(buttonFormat).isEmpty()) {
            scrollDown();
        }
        MobileActionManager.waitVisibility(buttonFormat);
        Assert.assertTrue(MobileActionManager.getAttribute(buttonFormat, "checked").contains("true"));
    }

    public static void viewTellaIcon() {
        MobileActionManager.waitVisibility(SettingsConstants.TELLA_ICON);
        Assert.assertTrue(MobileActionManager.getAttribute(SettingsConstants.TELLA_ICON, "resource-id").contains("id" +
                "/logo")
        );
    }

    public static void viewVersion() {
        MobileActionManager.waitVisibility(SettingsConstants.VERSION_TEXT);
        Assert.assertTrue(MobileActionManager.isVisible(SettingsConstants.VERSION_TEXT));
    }

    public static void viewList() {
        MobileActionManager.waitVisibility(SettingsConstants.ABOUT_HELP_OPTIONS);
        Assert.assertTrue(MobileActionManager.isVisible(SettingsConstants.ABOUT_HELP_OPTIONS));
    }

    public static void generalButton() {
        MobileActionManager.waitVisibility(SettingsConstants.GENERAL_BUTTON);
        GenericService.clickElementByCoordinates(SettingsConstants.GENERAL_BUTTON);
    }

    public static void tapTheOption(String option) {
        Map<String, String> options = new HashMap<>();
        options.put("FAQ", "faq");
        options.put("Contact us", "contact_us");
        options.put("Privacy policy", "privacy_policy");
        String opt = "id:" + options.get(option);

        for (int i = 0; i < 3; i++) {
            try {
                MobileActionManager.waitVisibility(opt);
                GenericService.clickElementByCoordinates(opt);
                return;
            } catch (StaleElementReferenceException e) {
                GenericService.sleep(200);
            }
        }
    }

    public static void redirectedSite(String site) {
        MobileActionManager.waitVisibility(SettingsConstants.URL_BAR);
        Assert.assertTrue(MobileActionManager.getText(SettingsConstants.URL_BAR).equals(site));
    }

    public static void clicksOptions(String option) {
        int index = mapOptionToIndex(option);
        MobileActionManager.waitVisibility(SettingsConstants.OPTIONS_TITLE, String.valueOf(index));
        GenericService.clickElementByCoordinates(SettingsConstants.OPTIONS_TITLE, String.valueOf(index));
    }

    public static void SelectGeneralOption(String timeout) {
        MobileActionManager.waitVisibility(SettingsConstants.TIMEOUT_SHEET_TITLE);
        String check = MobileActionManager.getAttribute(SettingsConstants.GENERAL_RADIO_BUTTON, "checked", timeout);
        if (Boolean.parseBoolean(check) != true) {
            GenericService.clickElementByCoordinates(SettingsConstants.GENERAL_RADIO_BUTTON, timeout);
        }
    }

    public static void clickButton(String button) {
        Map<String, String> buttons = new HashMap<>();
        buttons.put("OK", SettingsConstants.OK_BUTTON);
        buttons.put("CANCEL", SettingsConstants.CANCEL_BUTTON);
        buttons.put("Exit Tella", SettingsConstants.OK_BUTTON);

        String locator = buttons.get(button);
        MobileActionManager.waitVisibility(locator);
        GenericService.clickElementByCoordinates(locator);
    }

    public static void selectedTimeout(String timeout) {
        MobileActionManager.waitVisibility(SettingsConstants.GENERAL_TEXTVIEW_LABEL, timeout);
        Assert.assertTrue(MobileActionManager.isEnabled(SettingsConstants.GENERAL_TEXTVIEW_LABEL));
    }

    public static void setIncorrectPinWithAttempts(String pin, String attempts) throws InterruptedException {
        String number = attempts.replaceAll("\\D+", "");
        Integer attempt = Integer.parseInt(number);
        for (int i = 0; i < attempt; i++) {
            UnlockService.enterPassword(pin);
            GenericService.sleep(500);
        }
    }

    public static void selectMethodCamuflage(String option) {
        Map<String, String> options = new HashMap<>();
        options.put("CHANGE NAME AND ICON", SettingsConstants.ICON_CAMOUFLAGE_BUTTON);
        options.put("HIDE BEHIND A CALCULATOR APP", SettingsConstants.APP_CAMOUFLAGE_BUTTON);

        String locator = options.get(option);
        MobileActionManager.waitVisibility(locator);
        GenericService.clickElementByCoordinates(locator);
    }

    public static void selectIcon(String icon) {
        MobileActionManager.waitVisibility(SettingsConstants.ICON_CAMOUFLAGE_TEXT);
        String iconSelected = SettingsConstants.ICON_CAMOUFLAGE_TEXT + "[@text='" + icon + "']";
        GenericService.clickElementByCoordinates(iconSelected);
    }

    public static void showMessage(String message) {
        MobileActionManager.waitVisibility(SettingsConstants.MESSAGE_CONTENT);
        Assert.assertTrue(MobileActionManager.getText(SettingsConstants.MESSAGE_CONTENT).contains(message));
    }

    public static void viewMessage(String message) {
        if (!message.isEmpty()) {
            MobileActionManager.waitPresence(SettingsConstants.MESSAGE_LABEL);
            Assert.assertTrue(MobileActionManager.getText(SettingsConstants.MESSAGE_LABEL).contains(message));
        }
    }

    public static void changeStatus(String option, String status) {
        AndroidDriver driver = (AndroidDriver) getDriverInstance().getWrappedDriver();
        WebElement switchElement = driver.findElement(By.xpath("(//android.widget.Switch[@resource-id='org.hzontal.tella:id/mSwitch'])[1]"));
        String checked = switchElement.getAttribute("checked");

        if ("true".equals(checked)) {
            System.out.println("El switch está activado.");
        } else {
            System.out.println("El switch no está activado.");
        }
    }

    public static void clickHelpInfo(String option) {
        Map<String, String> options = new HashMap<>();
        options.put("Delete files", SettingsConstants.DELETE_INFO_ICON);
        options.put("Delete Connections", SettingsConstants.DELETE_SERVER_ICON);
        options.put("Delete Tella", SettingsConstants.DELETE_FORM_ICON);

        String locator = options.get(option);
        MobileActionManager.waitVisibility(locator);
        GenericService.clickElementByCoordinates(locator);
    }

    public static void showHelpInfoMessage(String helpInfo) {
        MobileActionManager.waitVisibility(SettingsConstants.HELP_INFO_TEXTVIEW, helpInfo);
        Assert.assertTrue(MobileActionManager.getText(SettingsConstants.HELP_INFO_TEXTVIEW, helpInfo).equals(helpInfo));
    }

    public static void checkedButton() {
        MobileActionManager.waitVisibility(SettingsConstants.REMAINING_UNLOCK_ATTEMPTS);
        AndroidDriver driver = (AndroidDriver) GenericService.getDriver();
        MobileElement checked = (MobileElement) driver.findElement(MobileBy.xpath(SettingsConstants.REMAINING_UNLOCK_ATTEMPTS));
        Assert.assertTrue(checked.isEnabled());
    }

    public static void pressHomeAndroid(String waitTime) throws InterruptedException {
        int timeSelect = selectMinuteSecondTime(waitTime);
        GenericService.waitOnHomeScreenReturnApp(timeSelect);
    }

    public static void pressBlockInAndroid(String waitTime) throws InterruptedException {
        int timeSelect = selectMinuteSecondTime(waitTime);
        GenericService.lockScreenWaitAndUnlock(timeSelect);
    }

    public static void checkscreenlockdisplayed() {
        Assert.assertTrue(MobileActionManager.waitVisibility(LockUnlockConstants.PASSWORD_INPUT).isDisplayed());
    }
    public static void checkscreenlocknotdisplayed() {
        Assert.assertFalse(GenericService.isElementPresent(LockUnlockConstants.PASSWORD_INPUT));
    }

    private static int selectMinuteSecondTime(String waitTime) {
        switch (waitTime) {
            case "Immediately":
                return 10;
            case "1 minute":
                return 65;
            case "5 minutes":
                return 305;
            case "30 minutes":
                return 1805;
            case "1 hour":
                return 3605;
            case "20 seconds":
                return 20;
            case "40 seconds":
                return 40;
            case "80 seconds":
                return 80;
            case "120 seconds":
                return 120;
            default:
                throw new IllegalArgumentException("Unsupported wait time: " + waitTime);
        }
    }

    public static void selectedDeleteCheck(String quickDeleteCheck) {
        String selectDeleteCheck = "";
        switch (quickDeleteCheck) {
            case "Delete files":
                selectDeleteCheck = SettingsConstants.CHECKBOX_DELETE_FILE;
                break;
            case "Delete draft and submitted forms":
                selectDeleteCheck = SettingsConstants.CHECKBOX_DELETE_DRAFT_SUBMITTE_DFORMS;
                break;
            case "Delete server settings":
                selectDeleteCheck = SettingsConstants.CHECKBOX_DELETE_SERVER_SETTING;
                break;
            default:
                System.out.println("[WARNING] Opcion invalida");
        }
        MobileActionManager.waitVisibility(selectDeleteCheck);
        GenericService.clickElementByCoordinates(selectDeleteCheck);
    }

    public static void goToHomeFromASettingPage() {
        for (int i = 0; i < 2; i++) {
            try {
                MobileActionManager.waitVisibility(SettingsConstants.GO_BACK_BUTTON);
                GenericService.clickElementByCoordinates(SettingsConstants.GO_BACK_BUTTON);
                GenericService.sleep(300);
            } catch (StaleElementReferenceException e) {
                GenericService.sleep(200);
            }
        }
    }

    public static void viewCounterMessage(String expectedText) {
        if (!expectedText.isEmpty()) {
            MobileActionManager.waitPresence(SettingsConstants.VIEW_COUNTER_MESSAGE, expectedText);
            String actualText = MobileActionManager.getText(SettingsConstants.VIEW_COUNTER_MESSAGE, expectedText);
            Assert.assertTrue(actualText.contains(expectedText));
        }
    }

    public static void theAppIsClosed() throws InterruptedException {
        GenericService.sleep(3000);
        Assert.assertTrue(GenericService.verifyActiveAppTella());
    }

    public static void scrollDown() {
        AppiumDriver driver = (AppiumDriver) DriverManager.getDriverInstance().getWrappedDriver();
        Dimension size = driver.manage().window().getSize();

        int startX = size.width / 2;
        int startY = (int) (size.height * 0.7);
        int endY = (int) (size.height * 0.3);
        PointerInput finger = new PointerInput(PointerInput.Kind.TOUCH, "finger");
        Sequence swipe = new Sequence(finger, 1);
        swipe.addAction(finger.createPointerMove(Duration.ZERO, PointerInput.Origin.viewport(), startX, startY));
        swipe.addAction(finger.createPointerDown(PointerInput.MouseButton.LEFT.asArg()));
        swipe.addAction(finger.createPointerMove(Duration.ofMillis(500), PointerInput.Origin.viewport(), startX, endY));
        swipe.addAction(finger.createPointerUp(PointerInput.MouseButton.LEFT.asArg()));
        driver.perform(Collections.singletonList(swipe));
    }
    public static WebElement scrollTo(String locatorString) {
        AppiumDriver driver = (AppiumDriver) DriverManager.getDriverInstance().getWrappedDriver();
        String uiAutomatorCommand = "";

        int separatorIndex = locatorString.indexOf(":");
        String type = (separatorIndex != -1) ? locatorString.substring(0, separatorIndex).toLowerCase() : "text";
        String value = (separatorIndex != -1) ? locatorString.substring(separatorIndex + 1) : locatorString;
        switch (type) {
            case "id":
            case "ID":
                uiAutomatorCommand = "new UiScrollable(new UiSelector().scrollable(true))" +
                        ".scrollIntoView(new UiSelector().resourceId(\"" + value + "\"))";
                break;
            case "text":
            case "TEXT":
                uiAutomatorCommand = "new UiScrollable(new UiSelector().scrollable(true))" +
                        ".scrollIntoView(new UiSelector().text(\"" + value + "\"))";
                break;
            default:
                throw new IllegalArgumentException("El método scrollTo solo soporta 'id:', 'text:' o 'description:'. XPath no es soportado por UiScrollable.");
        }

        return driver.findElement(MobileBy.AndroidUIAutomator(uiAutomatorCommand));
    }

    public static void clickBackButton() {
        for (int i = 0; i < 2; i++) {
            try {
                MobileActionManager.waitVisibility(SettingsConstants.BUTTON_BACK_LANG);
                GenericService.clickElementByCoordinates(SettingsConstants.BUTTON_BACK_LANG);
                GenericService.sleep(300);
            } catch (Exception e) {
                GenericService.sleep(200);
            }
        }
    }

    public static void DefaultVisibleLanguage(String languageDefault) {
        for (int i = 0; i < 3; i++) {
            try {
                WebElement pedidoEle = getDriverInstance().getWrappedDriver().findElement(MobileBy.AndroidUIAutomator(
                        "new UiScrollable(new UiSelector().scrollable(true).instance(0))" +
                                ".scrollIntoView(new UiSelector()" +
                                ".textMatches(\"" + languageDefault + "\").instance(0))"));
                Assert.assertTrue(pedidoEle.isDisplayed(), "El idioma " + languageDefault + "no es visible");
                return;
            } catch (StaleElementReferenceException e) {
                GenericService.sleep(200);
            }
        }
    }

    private static int mapOptionToIndex(String option) {
        switch (option) {
            case "Lock":
                return 1;
            case "Lock Timeout":
                return 2;
            case "Delete after failed unlock":
                return 3;
            case "Camouflage":
                return 4;
            default:
                throw new IllegalArgumentException("Unsupported option: " + option);
        }
    }
}
