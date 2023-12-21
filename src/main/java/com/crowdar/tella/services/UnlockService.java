package com.crowdar.tella.services;

import com.crowdar.core.actions.ActionManager;
import com.crowdar.core.actions.MobileActionManager;
import com.crowdar.driver.DriverManager;
import com.crowdar.tella.constants.UnlockConstants;
import io.appium.java_client.PerformsTouchActions;
import io.appium.java_client.TouchAction;
import io.appium.java_client.touch.WaitOptions;
import io.appium.java_client.touch.offset.PointOption;
import org.openqa.selenium.Keys;
import org.openqa.selenium.support.events.EventFiringWebDriver;
import org.testng.Assert;

import java.time.Duration;


public class UnlockService {
    private static final int NEXT_BUTTON_CLICK_COUNT = 3;

    public static void isViewLoaded() {
        MobileActionManager.waitVisibility(UnlockConstants.START_BUTTON);
        MobileActionManager.click(UnlockConstants.START_BUTTON);
    }

    public static void setPassword(String password) {
        clickNextButtons(NEXT_BUTTON_CLICK_COUNT);
        MobileActionManager.click(UnlockConstants.LOCK_PASSWORD_BUTTON);
        MobileActionManager.setInput(UnlockConstants.PASSWORD_INPUT, password);
        MobileActionManager.click(UnlockConstants.PASSWORD_RIGHT_BUTTON);
        MobileActionManager.setInput(UnlockConstants.PASSWORD_INPUT, password);
        MobileActionManager.click(UnlockConstants.PASSWORD_RIGHT_BUTTON);
        MobileActionManager.click(UnlockConstants.NEXT_BUTTON);
        Assert.assertTrue(MobileActionManager.isVisible(UnlockConstants.START_BUTTON), UnlockConstants.VIEW_NOT_DISPLAYED_MESSAGE);
    }

    public static void enterPassword(String password){
        MobileActionManager.setInput(UnlockConstants.PASSWORD_INPUT, password);
        EventFiringWebDriver driver = DriverManager.getDriverInstance();
        driver.getKeyboard().sendKeys(Keys.ENTER);
    }

    public static void goTella() {
        MobileActionManager.waitVisibility(UnlockConstants.START_BUTTON);
        MobileActionManager.click(UnlockConstants.START_BUTTON);
    }

    public static void setNumbers(String pin) {
        clickNextButtons(NEXT_BUTTON_CLICK_COUNT);
        MobileActionManager.click(UnlockConstants.LOCK_PIN_BUTTON);
        setPin(pin);
        MobileActionManager.click(UnlockConstants.PIN_OK_BUTTON);
        setPin(pin);
        MobileActionManager.click(UnlockConstants.PIN_OK_BUTTON);
        MobileActionManager.click(UnlockConstants.NEXT_BUTTON);
        Assert.assertTrue(MobileActionManager.isVisible(UnlockConstants.START_BUTTON), UnlockConstants.VIEW_NOT_DISPLAYED_MESSAGE);
    }

    public static String convertNumberToText(String number) {
        String[] textNumbers = {"zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"};
        int num;
        try {
            num = Integer.parseInt(number);
        } catch (NumberFormatException e) {
            return number;
        }
        if (num >= 0 && num <= 9) {
            return textNumbers[num];
        } else {
            return number;
        }
    }

    public static void setPin(String pin) {
        String[] strArrayNums = pin.split("");
        for (String number : strArrayNums) {
            String convertedNumber = convertNumberToText(number);
            String id = String.format("id:%sBtn", convertedNumber);
            ActionManager.click(id);
        }
    }

    public static void enterPin(String pin){
        setPin(pin);
        MobileActionManager.click(UnlockConstants.PIN_OK_BUTTON);
    }

    public static void setPattern() {
        clickNextButtons(NEXT_BUTTON_CLICK_COUNT);
        MobileActionManager.click(UnlockConstants.LOCK_PATTERN_BUTTON);
        MobileActionManager.click(UnlockConstants.LOCK_PATTERN_ID);

        MobileActionManager.waitVisibility(UnlockConstants.SCREEN_PATTERN_ID);
        definePattern();
        MobileActionManager.click(UnlockConstants.NEXT_BUTTON);
        Assert.assertTrue(MobileActionManager.isVisible(UnlockConstants.START_BUTTON), UnlockConstants.VIEW_NOT_DISPLAYED_MESSAGE);
    }

    public static void clickNextButtons(int count) {
        for (int i = 0; i < count; i++) {
            MobileActionManager.click(UnlockConstants.NEXT_BUTTON);
        }
    }

    private static void definePattern() {
        /*Código para definir el patrón por coordenadas usando touchAction*/
        TouchAction touchAction = new TouchAction((PerformsTouchActions) DriverManager.getDriverInstance().getWrappedDriver());
        touchAction.press(PointOption.point(270, 2250))
                .moveTo(PointOption.point(270, 1350))
                .moveTo(PointOption.point(1160, 1353))
                .moveTo(PointOption.point(1160, 2243))
                .release()
                .perform();

        MobileActionManager.click(UnlockConstants.NETX_BUTTON_PATTERN_ID);

        /*Se vuelve a repetir el patrón*/
        touchAction.press(PointOption.point(270, 2250))
                .moveTo(PointOption.point(270, 1350))
                .moveTo(PointOption.point(1160, 1353))
                .moveTo(PointOption.point(1160, 2243))
                .release()
                .perform();
    }

    public static void clickExit(){
        MobileActionManager.click(UnlockConstants.EXIT_BUTTON);
    }

    public static void tapTellaApp(){
        TouchAction touchAction = new TouchAction((PerformsTouchActions) DriverManager.getDriverInstance().getWrappedDriver());
        touchAction.press(PointOption.point(550, 1700))
                   .waitAction(WaitOptions.waitOptions(Duration.ofMillis(2000)))
                   .moveTo(PointOption.point(550, 400))
                   .release()
                   .perform();
        MobileActionManager.click(UnlockConstants.TELLA_APP);
    }

}
