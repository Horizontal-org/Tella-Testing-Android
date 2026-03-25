package com.crowdar.tella.services;

import com.crowdar.core.actions.ActionManager;
import com.crowdar.core.actions.MobileActionManager;
import com.crowdar.driver.DriverManager;
import com.crowdar.tella.constants.LockUnlockConstants;
import com.crowdar.tella.constants.LockUnlockConstantsIOS;
import io.appium.java_client.*;
import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.android.nativekey.AndroidKey;
import io.appium.java_client.android.nativekey.KeyEvent;
import io.appium.java_client.touch.WaitOptions;
import io.appium.java_client.touch.offset.PointOption;
import org.openqa.selenium.Keys;
import org.openqa.selenium.Point;
import org.openqa.selenium.interactions.Pause;
import org.openqa.selenium.interactions.PointerInput;
import org.openqa.selenium.interactions.Sequence;
import org.openqa.selenium.support.events.EventFiringWebDriver;
import org.testng.Assert;

import java.time.Duration;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Map;


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
        MobileActionManager.click(LockUnlockConstants.LOCK_UNDERSTAND_BUTTON);
        MobileActionManager.setInput(LockUnlockConstants.PASSWORD_INPUT, password);
        MobileActionManager.click(LockUnlockConstants.PASSWORD_RIGHT_BUTTON);
        MobileActionManager.setInput(LockUnlockConstants.PASSWORD_INPUT, password);
        MobileActionManager.click(LockUnlockConstants.PASSWORD_RIGHT_BUTTON);
        MobileActionManager.click(LockUnlockConstants.CONTINUE_BUTTON);
        MobileActionManager.click(LockUnlockConstants.PASSWORD_NEXT_BUTTON);
        MobileActionManager.waitVisibility(LockUnlockConstants.START_BUTTON);
        Assert.assertTrue(MobileActionManager.isVisible(LockUnlockConstants.START_BUTTON), LockUnlockConstants.VIEW_NOT_DISPLAYED_MESSAGE);
    }

    public static void enterPassword(String password) throws InterruptedException {
        if (MobileActionManager.isAndroid()) {
            MobileActionManager.setInput(LockUnlockConstants.PASSWORD_INPUT, password);
            MobileActionManager.waitClickable(LockUnlockConstants.BTN_UNLOCK).click();
        } else {
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
        } else {
            GenericService.commonClick(LockUnlockConstantsIOS.PIN_OK_BUTTON);
        }
    }

    public static void clickNextButtons(int count) {
        for (int i = 0; i < count; i++) {
            MobileActionManager.click(LockUnlockConstants.NEXT_BUTTON);
        }
    }

    private static final Map<Integer, Point> PATTERN_POINTS = Map.of(
            1, new Point(180, 900),
            2, new Point(540, 900),
            3, new Point(900, 900),
            4, new Point(180, 1260),
            5, new Point(540, 1260),
            6, new Point(900, 1260),
            7, new Point(180, 1620),
            8, new Point(540, 1620),
            9, new Point(900, 1620)
    );

    private static final List<Integer> PATTERN_ORDER = Arrays.asList(1, 2, 3, 6, 5, 4, 7, 8, 9);

    public static void setPattern(int dots) {
        MobileActionManager.waitVisibility(LockUnlockConstants.SCREEN_PATTERN_ID);
        definePattern(dots);
    }

    private static void definePattern(int dots) {
        if (dots < 1 || dots > 9) {
            throw new IllegalArgumentException("Pattern dots must be between 1 and 9.");
        }

        AndroidDriver driver = (AndroidDriver) DriverManager.getDriverInstance().getWrappedDriver();

        List<Integer> selectedDots = PATTERN_ORDER.subList(0, dots);

        PointerInput finger = new PointerInput(PointerInput.Kind.TOUCH, "finger");
        Sequence sequence = new Sequence(finger, 1);

        Point firstPoint = PATTERN_POINTS.get(selectedDots.get(0));

        sequence.addAction(finger.createPointerMove(
                Duration.ZERO,
                PointerInput.Origin.viewport(),
                firstPoint.x,
                firstPoint.y
        ));

        sequence.addAction(finger.createPointerDown(PointerInput.MouseButton.LEFT.asArg()));

        sequence.addAction(new Pause(finger, Duration.ofMillis(200)));

        for (int i = 1; i < selectedDots.size(); i++) {
            Point point = PATTERN_POINTS.get(selectedDots.get(i));

            sequence.addAction(finger.createPointerMove(
                    Duration.ofMillis(250),
                    PointerInput.Origin.viewport(),
                    point.x,
                    point.y
            ));
        }

        sequence.addAction(finger.createPointerUp(PointerInput.MouseButton.LEFT.asArg()));

        driver.perform(Collections.singletonList(sequence));
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
        }
    }

    public static void clickNextPatternButton() {
        MobileActionManager.click(LockUnlockConstants.PATTERN_RIGHT_BUTTON);
    }

    public static void validateNextButtonIsDisabled() {
        String enabled = MobileActionManager.getAttribute(LockUnlockConstants.PATTERN_RIGHT_BUTTON, "enabled");
        Assert.assertEquals(enabled, "false");
    }

    public static void enterPasswordAndtapsEnter(String password) {
        MobileActionManager.setInput(LockUnlockConstants.PASSWORD_INPUT, password);
        GenericService.pressEnter();
    }
}

