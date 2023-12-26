package com.crowdar.tella.services;

import com.crowdar.core.actions.MobileActionManager;
import com.crowdar.driver.DriverManager;
import com.crowdar.tella.constants.AudioConstants;
import com.crowdar.tella.constants.FilesConstants;
import io.appium.java_client.MobileBy;
import org.openqa.selenium.By;
import org.openqa.selenium.TimeoutException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.Assert;

import java.util.List;

public class FilesService {

    static String message=null;
    static String createdFile=null;

    public static void enterFolder(String nameFolder){
        WebElement folderElement = DriverManager.getDriverInstance().getWrappedDriver().findElement(MobileBy.AndroidUIAutomator(
                "new UiScrollable(new UiSelector().scrollable(true).instance(0))" +
                        ".scrollIntoView(new UiSelector()" +
                        ".textMatches(\"" + nameFolder + "\").instance(0))"));
        folderElement.click();
    }

    public static void tapPlusIcon(){
        MobileActionManager.waitVisibility(FilesConstants.PLUS_ICON);
        MobileActionManager.click(FilesConstants.PLUS_ICON);
    }

    public static void goPhotoVideoOption(){
        MobileActionManager.waitVisibility(FilesConstants.PHOTOVIDEO_OPTION);
        MobileActionManager.click(FilesConstants.PHOTOVIDEO_OPTION);
        acceptPermissions();
    }

    public static void selectOpcion(String option){
        MobileActionManager.waitVisibility(FilesConstants.PHOTO_OPTION);
        String optionLowerCase = option.toLowerCase();
        if(optionLowerCase.contains("photo")){
            MobileActionManager.click(FilesConstants.PHOTO_OPTION);
        }else if(optionLowerCase.contains("video")){
            MobileActionManager.click(FilesConstants.VIDEO_OPTION);
        }
    }

    public static void captureFile(String type){

        MobileActionManager.click(FilesConstants.CAPTURE_BUTTON);

        if(type.contains("image")){
            MobileActionManager.waitVisibility(FilesConstants.MESSAGE_FILE_ENCRYTED);
            message = MobileActionManager.getText(FilesConstants.MESSAGE_FILE_ENCRYTED);
        }else if(type.contains("video")){
            MobileActionManager.waitVisibility(FilesConstants.STOP_RECORDING_BUTTON);
            MobileActionManager.click(FilesConstants.STOP_RECORDING_BUTTON);
            MobileActionManager.waitVisibility(FilesConstants.MESSAGE_FILE_ENCRYTED);
            message = MobileActionManager.getText(FilesConstants.MESSAGE_FILE_ENCRYTED);
        }
    }

    public static void validateMessage(String expectedMessage){
        Assert.assertEquals(expectedMessage, message);
        MobileActionManager.click(FilesConstants.CLOSE_BUTTON);

        //regresamos al homepage de la aplicación
        MobileActionManager.click(FilesConstants.BACK_BUTTON);
    }

    public static void validateFileCreation(String type, String nameFolder){
        WebElement folderSaveElement = DriverManager.getDriverInstance().getWrappedDriver().findElement(MobileBy.AndroidUIAutomator(
                "new UiScrollable(new UiSelector().scrollable(true).instance(0))" +
                        ".scrollIntoView(new UiSelector()" +
                        ".textMatches(\"" + nameFolder + "\").instance(0))"));
        folderSaveElement.click();

        String currentFolder = MobileActionManager.getText(FilesConstants.CURRENT_FOLDER);
        Assert.assertEquals(currentFolder, nameFolder);
        validateExtension(type);
        createdFile = MobileActionManager.getText(FilesConstants.CREATED_FILE_NAME);
    }

    public static void validateAppearsFolderSave(String folderSave){
        MobileActionManager.waitVisibility(FilesConstants.CREATED_FILE_NAME);
        String currentFolder = MobileActionManager.getText(FilesConstants.CURRENT_FOLDER);
        Assert.assertEquals(currentFolder, folderSave);
        //regresamos al homepage de la aplicación
        MobileActionManager.click(FilesConstants.BACK_BUTTON);
    }

    public static void validateFileInAllFiles(){
        MobileActionManager.waitVisibility(FilesConstants.ALL_FILES_FOLDER);
        MobileActionManager.click(FilesConstants.ALL_FILES_FOLDER);
        MobileActionManager.waitVisibility(FilesConstants.CURRENT_FILE);
        String currentFile = MobileActionManager.getText(FilesConstants.CURRENT_FILE);
        Assert.assertEquals(createdFile, currentFile);
    }


    public static void acceptPermissions() {
        try {
            WebDriver driver = DriverManager.getDriverInstance().getWrappedDriver();
            WebDriverWait wait = new WebDriverWait(driver, 10);
            wait.until(ExpectedConditions.presenceOfElementLocated(By.id(AudioConstants.PERMISSIONS_MESSAGE)));
            List<WebElement> elems = DriverManager.getDriverInstance().getWrappedDriver().findElements(By.id(AudioConstants.PERMISSIONS_MESSAGE));
            if (elems.size() > 0) {
                DriverManager.getDriverInstance().getWrappedDriver().findElement(By.id(AudioConstants.PERMISSIONS_ACCEPT_BUTTON)).click();
                DriverManager.getDriverInstance().getWrappedDriver().findElement(By.id(AudioConstants.PERMISSIONS_ACCEPT_BUTTON)).click();
            }
        } catch (TimeoutException e) {
        }
    }

    public static void validateExtension(String type){
        String createdFileName = MobileActionManager.getText(FilesConstants.CREATED_FILE_NAME);
        if (createdFileName != null) {
            if (type.toLowerCase().contains("image")) {
                Assert.assertTrue(createdFileName.endsWith(".jpg"), "La validación para imagen falló: " + createdFileName);
            } else if (type.toLowerCase().contains("video")) {
                Assert.assertTrue(createdFileName.endsWith(".mp4"), "La validación para video falló: " + createdFileName);
            }
        }
    }
}
