package com.crowdar.tella.services;

import com.crowdar.core.actions.MobileActionManager;
import com.crowdar.driver.DriverManager;
import com.crowdar.tella.constants.AudioConstants;
import org.openqa.selenium.By;
import org.openqa.selenium.TimeoutException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.Assert;

import java.util.List;

public class AudioService {

    static String nameChanged = null;

    //cambio Angi
    static boolean flagAcceptPermissions = false;

    public static void clickRecOption() {
        MobileActionManager.waitVisibility(AudioConstants.REC_OPTION);
        MobileActionManager.click(AudioConstants.REC_OPTION);
    }

    public static void clickMicrophoneIcon() throws InterruptedException {
        if (MobileActionManager.isPresent(AudioConstants.MICROPHONE_ICON)) {
            GenericService.commonClick(AudioConstants.MICROPHONE_ICON);
            //En el caso de que los permisos ya fueron aceptados
            if (flagAcceptPermissions == false) {
                try {
                    acceptPermissions();
                    MobileActionManager.click(AudioConstants.MICROPHONE_ICON);
                } catch (Exception e) {
                    System.out.println("Permits not present, continuing.");
                }
            }
        }
    }

/*
        public static void clickMicrophoneIconStop () {
        MobileActionManager.isPresent(AudioConstants.MICROPHONE_ICON_STOP);
            GenericService.commonClick(AudioConstants.MICROPHONE_ICON_STOP);
        }


 */

    public static void clickPencilIcon() {
        MobileActionManager.waitVisibility(AudioConstants.RECORD_NAME_PENCIL_ICON);
        MobileActionManager.click(AudioConstants.RECORD_NAME_PENCIL_ICON);
    }

    public static void deleteLastName() {
        WebDriver driver = DriverManager.getDriverInstance().getWrappedDriver();
        WebDriverWait wait = new WebDriverWait(driver, 10);
        WebElement inputField = wait.until(ExpectedConditions.presenceOfElementLocated(By.id(AudioConstants.TITLE_AUDIO_RECORDING_INPUT)));
        inputField.clear();
    }

    public static void addNewRecordingName(String recordingName) {
        MobileActionManager.setInput(AudioConstants.RECORD_NAME_INPUT, recordingName);
    }

    public static void clickOkButton() {
        MobileActionManager.waitClickable(AudioConstants.OK_BUTTON);
        MobileActionManager.click(AudioConstants.OK_BUTTON);
        nameChanged = MobileActionManager.getText(AudioConstants.RECORD_NAME_PENCIL_ICON);
    }

    public static void clickStopOption() {

    }

    public static void clickStopOption2() {
        MobileActionManager.waitClickable(AudioConstants.RECORD_AUDIO);
        nameChanged = MobileActionManager.getText(AudioConstants.RECORD_NAME_PENCIL_ICON);
        MobileActionManager.click(AudioConstants.RECORD_AUDIO);
    }

    public static void validateAprovalMessage(String message) {
        String aprovalMessagePage = MobileActionManager.getText(AudioConstants.MESSAGE_TITLE);
        Assert.assertEquals(message, aprovalMessagePage);
    }

    public static void validateNewName(String newName) {
        Assert.assertEquals(newName, nameChanged);
    }

    public static void acceptPermissions() {
        try {
            WebDriver driver = DriverManager.getDriverInstance().getWrappedDriver();
            WebDriverWait wait = new WebDriverWait(driver, 10);
            wait.until(ExpectedConditions.presenceOfElementLocated(By.id(AudioConstants.PERMISSIONS_MESSAGE)));
            List<WebElement> elems = DriverManager.getDriverInstance().getWrappedDriver().findElements(By.id(AudioConstants.PERMISSIONS_MESSAGE));
            if (elems.size() > 0) {
                DriverManager.getDriverInstance().getWrappedDriver().findElement(By.id(AudioConstants.PERMISSIONS_ACCEPT_BUTTON)).click();
            }
            //Aceptar permiso
            flagAcceptPermissions = true;
        } catch (TimeoutException e) {
        }
    }

    public static void clickStartOption() {
        MobileActionManager.waitClickable(AudioConstants.RECORD_AUDIO);
        MobileActionManager.click(AudioConstants.RECORD_AUDIO);
    }

    public static void clickPause() throws InterruptedException {
        MobileActionManager.waitVisibility(AudioConstants.PAUSE_BUTTON);
        MobileActionManager.click(AudioConstants.PAUSE_BUTTON);
        Thread.sleep(2000);
    }
}
