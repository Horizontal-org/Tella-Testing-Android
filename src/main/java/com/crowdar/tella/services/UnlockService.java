package com.crowdar.tella.services;

import com.crowdar.core.actions.ActionManager;
import com.crowdar.core.actions.MobileActionManager;
import com.crowdar.driver.DriverManager;
import com.crowdar.tella.constants.LockUnlockConstants;
import com.crowdar.tella.constants.LockUnlockConstantsIOS;
import io.appium.java_client.*;
import io.appium.java_client.touch.WaitOptions;
import io.appium.java_client.touch.offset.PointOption;
import org.openqa.selenium.Keys;
import org.openqa.selenium.support.events.EventFiringWebDriver;
import org.testng.Assert;

import java.time.Duration;


public class UnlockService {
    public static final int NEXT_BUTTON_CLICK_COUNT = 4;

    public static void isViewLoaded() {
        if (MobileActionManager.isAndroid()) {
            MobileActionManager.waitVisibility(LockUnlockConstants.START_BUTTON);
            MobileActionManager.click(LockUnlockConstants.START_BUTTON);
        } else {
            MobileActionManager.waitVisibility(LockUnlockConstantsIOS.START_BUTTON);
            MobileActionManager.click(LockUnlockConstantsIOS.START_BUTTON);
        }
    }


    public static void isViewLoadedReopenAppWithPassword() {
        MobileActionManager.waitVisibility(LockUnlockConstants.REOPEN_APP_PASSWORD_VERIFICATION);
        MobileActionManager.click(LockUnlockConstants.REOPEN_APP_PASSWORD_VERIFICATION);
    }

    public static void isViewLoadedReopenAppWithPin() {
        if (MobileActionManager.isAndroid()) {
        MobileActionManager.waitVisibility(LockUnlockConstants.REOPEN_APP_PIN_VERIFICATION);
        MobileActionManager.click(LockUnlockConstants.REOPEN_APP_PIN_VERIFICATION);
    } else {
            GenericService.commonClick(LockUnlockConstantsIOS.REOPEN_APP_PIN_VERIFICATION);
        }
    }

    public static void setPassword(String password) {
        clickNextButtons(NEXT_BUTTON_CLICK_COUNT);
        MobileActionManager.click(LockUnlockConstants.LOCK_PASSWORD_BUTTON);
        MobileActionManager.setInput(LockUnlockConstants.PASSWORD_INPUT, password);
        MobileActionManager.click(LockUnlockConstants.PASSWORD_RIGHT_BUTTON);
        MobileActionManager.setInput(LockUnlockConstants.PASSWORD_INPUT, password);
        MobileActionManager.click(LockUnlockConstants.PASSWORD_RIGHT_BUTTON);
        MobileActionManager.click(LockUnlockConstants.NEXT_BUTTON);
        Assert.assertTrue(MobileActionManager.isVisible(LockUnlockConstants.START_BUTTON), LockUnlockConstants.VIEW_NOT_DISPLAYED_MESSAGE);
    }

    public static void enterPassword(String password) throws InterruptedException {
        if (MobileActionManager.isAndroid()) {
            MobileActionManager.setInput(LockUnlockConstants.PASSWORD_INPUT, password);
            EventFiringWebDriver driver = DriverManager.getDriverInstance();
            driver.getKeyboard().sendKeys(Keys.ENTER);
        }else{
            Thread.sleep(1000);
            MobileActionManager.waitVisibility(LockUnlockConstantsIOS.PASSWORD_INPUT);
            MobileActionManager.waitClickable(LockUnlockConstantsIOS.PASSWORD_INPUT);
            MobileActionManager.setInput(LockUnlockConstantsIOS.PASSWORD_INPUT, password);
            setPin(password);
            EventFiringWebDriver driver = DriverManager.getDriverInstance();
            driver.getKeyboard().sendKeys(Keys.ENTER);
        }
    }

    public static void goTella() {
        if (MobileActionManager.isAndroid()) {
            MobileActionManager.waitVisibility(LockUnlockConstants.START_BUTTON);
            MobileActionManager.click(LockUnlockConstants.START_BUTTON);
        } else {
            GenericService.commonClick(LockUnlockConstantsIOS.GO_TO_TELLA);
        }
    }

    public static void setNumbers(String pin) {
        if (MobileActionManager.isAndroid()) {
            clickNextButtons(NEXT_BUTTON_CLICK_COUNT);
            MobileActionManager.click(LockUnlockConstants.LOCK_PIN_BUTTON);
            setPin(pin);
            MobileActionManager.click(LockUnlockConstants.PIN_OK_BUTTON);
            setPin(pin);
            MobileActionManager.click(LockUnlockConstants.PIN_OK_BUTTON);
            MobileActionManager.click(LockUnlockConstants.NEXT_BUTTON);
            Assert.assertTrue(MobileActionManager.isVisible(LockUnlockConstants.START_BUTTON), LockUnlockConstants.VIEW_NOT_DISPLAYED_MESSAGE);
        } else {
            MobileActionManager.click(LockUnlockConstantsIOS.LOCK_PIN_BUTTON);
            setPin(pin);
            MobileActionManager.click(LockUnlockConstantsIOS.NEXT_BUTTON);
            setPin(pin);
            MobileActionManager.click(LockUnlockConstantsIOS.NEXT_BUTTON);
        }
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
        String IOSxpath = "xpath:\t/XCUIElementTypeApplication/XCUIElementTypeWindow/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeButton['%s']";
        String[] strArrayNums = pin.split("");
        for (String number : strArrayNums) {
            String convertedNumber = convertNumberToText(number);
            if (MobileActionManager.isAndroid()) {
                String id = String.format("id:%sBtn", convertedNumber);
                ActionManager.click(id);
            } else if (MobileActionManager.isPresent(IOSxpath, number)) {
                System.out.println("numero:" + number);
                ActionManager.click(IOSxpath, number);
            } else {
                String IOSxpath2 = "xpath:/XCUIElementTypeApplication/XCUIElementTypeWindow/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeButton['%s']";
                System.out.println("numero:" + number);
                ActionManager.click(IOSxpath2, number);
            }
        }
    }

        public static void enterPin(String pin) {
        setPin(pin);
        if (MobileActionManager.isAndroid()) {
            MobileActionManager.click(LockUnlockConstants.PIN_OK_BUTTON);
        }else {
            GenericService.commonClick(LockUnlockConstantsIOS.PIN_OK_BUTTON);
        }
    }

    public static void setPattern() {
        clickNextButtons(NEXT_BUTTON_CLICK_COUNT);
        MobileActionManager.click(LockUnlockConstants.LOCK_PATTERN_BUTTON);
        MobileActionManager.click(LockUnlockConstants.LOCK_PATTERN_ID);

        MobileActionManager.waitVisibility(LockUnlockConstants.SCREEN_PATTERN_ID);
        definePattern();
        MobileActionManager.click(LockUnlockConstants.NEXT_BUTTON);
        Assert.assertTrue(MobileActionManager.isVisible(LockUnlockConstants.START_BUTTON), LockUnlockConstants.VIEW_NOT_DISPLAYED_MESSAGE);
    }

    public static void clickNextButtons(int count) {
        for (int i = 0; i < count; i++) {
            MobileActionManager.click(LockUnlockConstants.NEXT_BUTTON);
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

        MobileActionManager.click(LockUnlockConstants.NETX_BUTTON_PATTERN_ID);

        /*Se vuelve a repetir el patrón*/
        touchAction.press(PointOption.point(270, 2250))
                .moveTo(PointOption.point(270, 1350))
                .moveTo(PointOption.point(1160, 1353))
                .moveTo(PointOption.point(1160, 2243))
                .release()
                .perform();
    }

    public static void clickExit() {
        MobileActionManager.click(LockUnlockConstants.EXIT_BUTTON);
    }

    public static void tapTellaApp() {
        TouchAction touchAction = new TouchAction((PerformsTouchActions) DriverManager.getDriverInstance().getWrappedDriver());
        touchAction.press(PointOption.point(550, 1700))
                .waitAction(WaitOptions.waitOptions(Duration.ofMillis(3000)))
                .moveTo(PointOption.point(550, 400))
                .release()
                .perform();
        MobileActionManager.click(LockUnlockConstants.TELLA_APP);
    }

    public static void reopenTheApp() throws InterruptedException {
        AppiumDriver<MobileElement> driver;
        driver = (AppiumDriver<MobileElement>) DriverManager.getDriverInstance().getWrappedDriver();
        driver.runAppInBackground(Duration.ofSeconds(5)); // Envía la app al fondo por 5 segundos
        if (MobileActionManager.isAndroid()) {
            driver.activateApp("org.hzontal.tella");
        } else {
            driver.activateApp("org.wearehorizontal.tella"); // Usa el package name de tu app para traerla de vuelta al frente


}}}

