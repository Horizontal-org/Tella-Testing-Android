package com.crowdar.tella.services;

import com.crowdar.core.actions.MobileActionManager;
import com.crowdar.core.actions.WebActionManager;
import com.crowdar.driver.DriverManager;
import com.crowdar.tella.constants.SettingsConstants;
import io.appium.java_client.MobileBy;
import io.appium.java_client.MobileElement;
import io.appium.java_client.android.AndroidDriver;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.Assert;
import java.util.HashMap;
import java.util.Map;

public class SettingsService {

    public static void clickSettingsIcon() {
        MobileActionManager.waitVisibility(SettingsConstants.SETTINGS_ICON);
        MobileActionManager.click(SettingsConstants.SETTINGS_ICON);
    }

    public static void clickGeneralIcon() {
        MobileActionManager.waitVisibility(SettingsConstants.GENERAL_BUTTON);
        MobileActionManager.click(SettingsConstants.GENERAL_BUTTON);
    }

    public static void clickLanguageOptions() {
        MobileActionManager.waitVisibility(SettingsConstants.LANGUAGE_BUTTON);
        MobileActionManager.click(SettingsConstants.LANGUAGE_BUTTON);
    }

    public static void verifyListOfLanguages() {
        MobileActionManager.waitVisibility(SettingsConstants.LANGUAGE_LIST);
        Assert.assertTrue(MobileActionManager.isVisible(SettingsConstants.LANGUAGE_LIST));
    }

    public static void clickChoosenLanguage(String language) {
        WebElement pedidoEle = DriverManager.getDriverInstance().getWrappedDriver().findElement(MobileBy.AndroidUIAutomator(
                "new UiScrollable(new UiSelector().scrollable(true).instance(0))" +
                        ".scrollIntoView(new UiSelector()" +
                        ".textMatches(\"" + language + "\").instance(0))"));
        pedidoEle.click();
    }

    public static void verifyLanguageTitle(String title) {
        MobileActionManager.waitVisibility(SettingsConstants.LANGUAGE_TITLE);
        Assert.assertTrue(MobileActionManager.isVisible(SettingsConstants.LANGUAGE_TITLE));
        String LanguageTitle = MobileActionManager.getText(SettingsConstants.LANGUAGE_TITLE);
        Assert.assertEquals(LanguageTitle, title);

        MobileActionManager.click(SettingsConstants.BUTTON_BACK_LANG);
        MobileActionManager.waitVisibility(SettingsConstants.TITLE_LANGUAGE_SETTING);
        Assert.assertTrue(MobileActionManager.isVisible(SettingsConstants.TITLE_LANGUAGE_SETTING));
    }

    public static void clickCategory(String category) {
        Map<String, String> links = new HashMap<>();
        links.put("General", SettingsConstants.GENERAL_BUTTON);
        links.put("Security", SettingsConstants.SECURITY_BUTTON);
        links.put("Servers", SettingsConstants.SERVERS_BUTTON);
        links.put("About & Help", SettingsConstants.ABOUT_HELP_BUTTON);
        links.put("Feedback", SettingsConstants.FEEDBACK_BUTTON);
        try {
            MobileActionManager.waitVisibility(links.get(category));
            MobileActionManager.click(links.get(category));
        } catch (Exception e) {
            MobileActionManager.click(links.get(category));
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
        buttons.put("Share crash reports", SettingsConstants.SWITCH_LIST_BUTTON + "[1]");
        buttons.put("Verification mode", SettingsConstants.SWITCH_LIST_BUTTON + "[2]");
        buttons.put("Recent files", SettingsConstants.SWITCH_LIST_BUTTON + "[3]");
        buttons.put("Favorite forms", SettingsConstants.SWITCH_LIST_BUTTON + "[4]");
        buttons.put("Favorite templates", SettingsConstants.SWITCH_LIST_BUTTON + "[5]");
        buttons.put("Test justification", SettingsConstants.SWITCH_LIST_BUTTON + "[6]");
        buttons.put("Increase text spacing", SettingsConstants.SWITCH_LIST_BUTTON + "[7]");
        buttons.put("Quick delete", SettingsConstants.SECURITY_SWITCH_LIST_BUTTON +"[1]" );
        buttons.put("Preserve metadata when importing", SettingsConstants.SECURITY_SWITCH_LIST_BUTTON +"[2]" );
        buttons.put("Camera silent mode", SettingsConstants.SECURITY_SWITCH_LIST_BUTTON +"[3]");
        buttons.put("Screen security", SettingsConstants.SECURITY_SWITCH_LIST_BUTTON +"[4]");
        return buttons.get(configuration);
    }

    public static void switchButtonEnable(String configuration) {
        String button = viewButton(configuration);
        MobileActionManager.waitVisibility(button);
        String check = MobileActionManager.getAttribute(button, "checked");
        if (Boolean.parseBoolean(check) != true) {
            MobileActionManager.click(button);
        }
    }
    public static void viewButtonEnable(String configuration) {
        String button = viewButton(configuration);
        MobileActionManager.waitVisibility(button);
        Assert.assertTrue(MobileActionManager.getAttribute(button, "checked").contains("true"));
    }

    public static void viewTellaIcon() {
        MobileActionManager.waitVisibility(SettingsConstants.TELLA_ICON);
        Assert.assertTrue(MobileActionManager.getAttribute(SettingsConstants.TELLA_ICON, "resource-id").contains("id" +
                "/logo")
        );
    }
    public static void viewVersion(String version) {
        MobileActionManager.waitVisibility(SettingsConstants.VERSION_TEXT);
        Assert.assertEquals(MobileActionManager.getText(SettingsConstants.VERSION_TEXT),version);
    }
    public static void viewList() {
        MobileActionManager.waitVisibility(SettingsConstants.ABOUT_HELP_OPTIONS);
        Assert.assertTrue(MobileActionManager.isVisible(SettingsConstants.ABOUT_HELP_OPTIONS));
    }

    public static void generalButton() {
        MobileActionManager.waitVisibility(SettingsConstants.GENERAL_BUTTON);
        MobileActionManager.click(SettingsConstants.GENERAL_BUTTON);
    }

    public static void tapTheOption(String option) {
        Map<String, String> options = new HashMap<>();
        options.put("FAQ" ,"faq");
        options.put("Contact us", "contact_us");
        options.put("Privacy policy", "privacy_policy");
        String opt = "id:"+options.get(option);
        try {
            MobileActionManager.waitVisibility(opt);
            MobileActionManager.click(opt);
        } catch (Exception e) {
            MobileActionManager.click(opt);
        }
    }

    public static void redirectedSite(String site) {
        MobileActionManager.waitVisibility(SettingsConstants.URL_BAR);
        Assert.assertTrue(MobileActionManager.getText(SettingsConstants.URL_BAR).equals(site));

    }
    public static void clicksOptions(String option) {
        MobileActionManager.waitVisibility(SettingsConstants.OPTIONS_TITLE,option);
        MobileActionManager.click(SettingsConstants.OPTIONS_TITLE,option);
    }
    public static void SelectGeneralOption(String timeout) {
        MobileActionManager.waitVisibility(SettingsConstants.TIMEOUT_SHEET_TITLE);
        String check = MobileActionManager.getAttribute(SettingsConstants.GENERAL_RADIO_BUTTON,"checked" , timeout);
        if (Boolean.parseBoolean(check) != true) {
            MobileActionManager.click(SettingsConstants.GENERAL_RADIO_BUTTON,timeout);
        }
    }
    public static void clickButton(String button) {
        Map<String, String> buttons = new HashMap<>();
        buttons.put("OK", SettingsConstants.OK_BUTTON);
        buttons.put("CANCEL", SettingsConstants.CANCEL_BUTTON);
        buttons.put("Exit Tella", SettingsConstants.OK_BUTTON);
        MobileActionManager.waitVisibility(buttons.get(button));
        MobileActionManager.click(buttons.get(button));
    }

    public static void selectedTimeout(String timeout) {
        MobileActionManager.waitVisibility(SettingsConstants.GENERAL_TEXTVIEW_LABEL, timeout);
        Assert.assertTrue(MobileActionManager.getText(SettingsConstants.GENERAL_TEXTVIEW_LABEL,timeout).equals(timeout));
    }

    public static void setIncorrectPinWithAttempts(String pin, String attempts) throws InterruptedException {
        // Usamos una expresión regular para extraer el número del String
        String number = attempts.replaceAll("\\D+", "");
        // Convertimos el String con el número a un Integer
        Integer attempt = Integer.parseInt(number);
        // Usamos el valor convertido en el bucle for
        for (int i = 0; i < attempt; i++) {
            UnlockService.enterPassword(pin);
        }
    }

    public static void selectMethodCamuflage(String option) {
        Map<String, String> options = new HashMap<>();
        options.put("CHANGE NAME AND ICON", SettingsConstants.ICON_CAMOUFLAGE_BUTTON);
        options.put("HIDE BEHIND A CALCULATOR APP", SettingsConstants.APP_CAMOUFLAGE_BUTTON);
        MobileActionManager.waitVisibility(options.get(option));
        MobileActionManager.click(options.get(option));
    }

    public static void selectIcon(String icon) {
        MobileActionManager.waitVisibility(SettingsConstants.ICON_CAMOUFLAGE_TEXT);
        String iconSelected = MobileActionManager.getText(SettingsConstants.ICON_CAMOUFLAGE_TEXT, icon);
        MobileActionManager.click(iconSelected);
    }
    public static void showMessage(String message) {
        MobileActionManager.waitVisibility(SettingsConstants.MESSAGE_CONTENT);
        Assert.assertTrue(MobileActionManager.getText(SettingsConstants.MESSAGE_CONTENT).contains(message));
    }

    public static void viewMessage(String message) {
        if (message != "") {
            MobileActionManager.waitVisibility(SettingsConstants.MESSAGE_LABEL);
            Assert.assertTrue(MobileActionManager.getText(SettingsConstants.MESSAGE_LABEL).contains(message));
        }
    }
    public static void changeStatus(String option, String status) {
        MobileActionManager.waitVisibility(SettingsConstants.GENERAL_TEXTVIEW_LABEL, status);
        Assert.assertTrue(MobileActionManager.getText(SettingsConstants.GENERAL_TEXTVIEW_LABEL,status).equals(status));
    }


    public static void clickHelpInfo(String option) {
        Map<String, String> options = new HashMap<>();
        options.put("Delete files", SettingsConstants.DELETE_INFO_ICON);
        options.put("Delete draft and submitted forms", SettingsConstants.DELETE_FORM_ICON);
        options.put("Delete server settings", SettingsConstants.DELETE_SERVER_ICON);
        MobileActionManager.waitVisibility(options.get(option));
        MobileActionManager.click(options.get(option));
    }

    public static void showHelpInfoMessage(String helpInfo) {
        MobileActionManager.waitVisibility(SettingsConstants.HELP_INFO_TEXTVIEW, helpInfo);
        Assert.assertTrue(MobileActionManager.getText(SettingsConstants.HELP_INFO_TEXTVIEW, helpInfo).equals(helpInfo));
    }

    public static void checkedButton() {
        AndroidDriver driver = (AndroidDriver) GenericService.getDriver();
        MobileElement checked = (MobileElement) driver.findElement(MobileBy.xpath(SettingsConstants.REMAINING_UNLOCK_ATTEMPTS));
        Assert.assertTrue(checked.isEnabled());
    }
}
