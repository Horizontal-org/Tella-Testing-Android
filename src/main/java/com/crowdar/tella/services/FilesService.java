package com.crowdar.tella.services;

import com.crowdar.core.actions.MobileActionManager;
import com.crowdar.driver.DriverManager;
import com.crowdar.tella.constants.*;
import io.appium.java_client.AppiumDriver;
import io.appium.java_client.MobileBy;
import io.appium.java_client.MobileElement;
import io.appium.java_client.android.AndroidDriver;
import org.openqa.selenium.*;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.Assert;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.NoSuchElementException;

import static com.crowdar.core.actions.ActionManager.*;

public class FilesService {

    static String message = null;
    static String createdFile = null;

    public static void enterFolder(String nameFolder) {
        Map<String, String> buttons = new HashMap<>();
        buttons.put("All files", HomeConstants.HOME_FOLDER_ALL_FILES_BUTTON);
        buttons.put("Images", HomeConstants.HOME_FOLDER_IMAGES_BUTTON);
        buttons.put("Videos", HomeConstants.HOME_FOLDER_VIDEOS_BUTTON);
        buttons.put("Audio", HomeConstants.HOME_FOLDER_AUDIO_BUTTON);
        buttons.put("Documents", HomeConstants.HOME_FOLDER_DOCUMENTS_BUTTON);
        buttons.put("Others", HomeConstants.HOME_FOLDER_OTHERS_BUTTON);

        String button = buttons.get(nameFolder);
        for (int i = 0; i < 3; i++) {
            try {
                MobileActionManager.waitVisibility(button);
                GenericService.clickElementByCoordinates(button);
                return;
            } catch (StaleElementReferenceException e) {
                GenericService.sleep(200);
            }
        }
    }

    public static void tapPlusIcon() {
        MobileActionManager.waitVisibility(FilesConstants.PLUS_ICON);
        GenericService.clickElementByCoordinates(FilesConstants.PLUS_ICON);
    }

    public static void goPhotoVideoOption() {
        MobileActionManager.waitVisibility(FilesConstants.PHOTOVIDEO_OPTION);
        GenericService.clickElementByCoordinates(FilesConstants.PHOTOVIDEO_OPTION);
        acceptPermissions();
    }

    public static void selectOpcion(String option) {
        MobileActionManager.waitVisibility(FilesConstants.PHOTO_OPTION);
        String optionLowerCase = option.toLowerCase();
        if (optionLowerCase.contains("photo")) {
            GenericService.clickElementByCoordinates(FilesConstants.PHOTO_OPTION);
        } else if (optionLowerCase.contains("video")) {
            GenericService.clickElementByCoordinates(FilesConstants.VIDEO_OPTION);
        }
    }

    public static void captureFile(String type) {
        GenericService.clickElementByCoordinates(FilesConstants.CAPTURE_BUTTON);

        if (type.contains("image")) {
        } else if (type.contains("video")) {
            MobileActionManager.waitVisibility(FilesConstants.STOP_RECORDING_BUTTON);
            GenericService.clickElementByCoordinates(FilesConstants.STOP_RECORDING_BUTTON);
        }

        GenericService.clickElementByCoordinates(FilesConstants.CLOSE_BUTTON);
        GenericService.clickElementByCoordinates(FilesConstants.BACK_BUTTON);
    }

    public static void validateMessage(String expectedMessage) {
        for (int i = 0; i < 5; i++) {
            try {
                GenericService.sleep(300);
                String actualMessage = MobileActionManager.getText(AudioConstants.MESSAGE_TITLE);
                Assert.assertEquals(actualMessage, expectedMessage, "The actual message does not match the expected message");
                return;
            } catch (Exception e) {
                if (i == 4) throw e;
            }
        }
    }

    public static void validateFileCreation(String type, String nameFolder) {
        WebDriver driver = DriverManager.getDriverInstance().getWrappedDriver();
        WebDriverWait wait = new WebDriverWait(driver, 20);

        for (int attempt = 0; attempt < 3; attempt++) {
            try {
                System.out.println("Buscando la carpeta: " + nameFolder);
                WebElement folderSaveElement = wait.until(ExpectedConditions.presenceOfElementLocated(MobileBy.AndroidUIAutomator(
                        "new UiScrollable(new UiSelector().scrollable(true).instance(0)).scrollIntoView(new UiSelector().text(\"" + nameFolder + "\"))")));
                System.out.println("Carpeta encontrada: " + nameFolder);
                GenericService.clickElementByCoordinatesWithElement(folderSaveElement);

                WebElement currentFolderElement = wait.until(ExpectedConditions.presenceOfElementLocated(MobileBy.AndroidUIAutomator(
                        "new UiSelector().resourceId(\"org.hzontal.tella:id/startTitleTv\")")));
                String currentFolder = currentFolderElement.getText();
                System.out.println("Carpeta actual: " + currentFolder);

                Assert.assertEquals(currentFolder, nameFolder);

                WebElement createdFileElement = wait.until(ExpectedConditions.presenceOfElementLocated(MobileBy.AndroidUIAutomator(
                        "new UiSelector().resourceId(\"" + FilesConstants.CREATED_FILE_NAME + "\")")));
                String createdFileText = createdFileElement.getText();
                System.out.println("Archivo creado: " + createdFileText);
                return;
            } catch (StaleElementReferenceException e) {
                GenericService.sleep(200);
            } catch (NoSuchElementException e) {
                System.err.println("No se encontró el elemento: " + e.getMessage());
                if (attempt == 2) throw e;
            }
        }
    }

    public static void validateAppearsFolderSave(String folderSave) {
        MobileActionManager.waitVisibility(FilesConstants.CREATED_FILE_NAME);
        String currentFolder = MobileActionManager.getText(FilesConstants.CURRENT_FOLDER);
        Assert.assertEquals(currentFolder, folderSave);
        GenericService.clickElementByCoordinates(FilesConstants.BACK_BUTTON);
    }

    public static void validateFileInAllFiles() {
        MobileActionManager.waitVisibility(FilesConstants.ALL_FILES_FOLDER);
        GenericService.clickElementByCoordinates(FilesConstants.ALL_FILES_FOLDER);
        MobileActionManager.waitVisibility(FilesConstants.CURRENT_FILE);
        String currentFile = MobileActionManager.getText(FilesConstants.CURRENT_FILE);
        Assert.assertEquals(createdFile, currentFile);
    }

    public static void acceptPermissions() {
        try {
            AppiumDriver<MobileElement> driver = (AppiumDriver<MobileElement>) DriverManager.getDriverInstance().getWrappedDriver();
            WebDriverWait wait = new WebDriverWait(driver, 10);
            wait.until(ExpectedConditions.presenceOfElementLocated(MobileBy.id(AudioConstants.PERMISSIONS_MESSAGE)));
            List<MobileElement> elems = driver.findElements(MobileBy.id(AudioConstants.PERMISSIONS_MESSAGE));
            if (elems.size() > 0) {
                GenericService.clickElementByCoordinates("id:" + AudioConstants.PERMISSIONS_ACCEPT_BUTTON);
            }
        } catch (TimeoutException | NoSuchElementException e) {
        }
    }

    public static void createAudioFiles() {
        for (int i = 0; i < 3; i++) {
            try {
                GenericService.clickElementByCoordinates(AudioConstants.MICROPHONE_ICON2);
                AudioService.clickStartOption();
                AudioService.acceptPermissions();
                AudioService.clickStartOption();
                AudioService.clickStopOption2();
                return;
            } catch (StaleElementReferenceException e) {
                GenericService.sleep(200);
            }
        }
    }

    public static void createPhotoFiles() {
        for (int i = 0; i < 3; i++) {
            try {
                GenericService.clickElementByCoordinates(HomeConstants.CAMERA_BUTTON);
                FilesService.acceptPermissions();
                GenericService.clickElementByCoordinates(PhotographyAndVideoConstants.CAPTURE_PHOTO_OR_VIDEO_BUTTON);
                return;
            } catch (StaleElementReferenceException e) {
                GenericService.sleep(200);
            }
        }
    }

    public static void createVideoFiles() {
        for (int attempt = 0; attempt < 3; attempt++) {
            try {
                GenericService.clickElementByCoordinates(FilesConstants.VIDEO_OPTION);
                GenericService.clickElementByCoordinates(PhotographyAndVideoConstants.CAPTURE_PHOTO_OR_VIDEO_BUTTON);
                GenericService.sleep(5000);
                GenericService.clickElementByCoordinates(PhotographyAndVideoConstants.CAPTURE_PHOTO_OR_VIDEO_BUTTON);
                GenericService.sleep(5000);
                MobileActionManager.waitClickable(FilesConstants.CLOSE_BUTTON);
                GenericService.clickElementByCoordinates(FilesConstants.CLOSE_BUTTON);
                return;
            } catch (StaleElementReferenceException e) {
                GenericService.sleep(200);
            }
        }
    }

    public static void createFolder() {
        for (int i = 0; i < 3; i++) {
            try {
                GenericService.clickElementByCoordinates(FilesConstants.ALL_FILES);
                GenericService.clickElementByCoordinates(FilesConstants.PLUS_ICON);
                GenericService.clickElementByCoordinates(FilesConstants.CREATE_FOLDER_BUTTON);
                PhotographyAndVideoService.deleteTextAndSendKeys();
                GenericService.clickElementByCoordinates(SettingsConstants.OK_BUTTON);
                GenericService.clickElementByCoordinates(FilesConstants.BACK_BUTTON);
                return;
            } catch (StaleElementReferenceException e) {
                GenericService.sleep(200);
            }
        }
    }

    public static void validateFolderCreation() {
        MobileActionManager.waitVisibility(FilesConstants.CREATED_FILE_NAME);
        Assert.assertTrue(MobileActionManager.isEnabled(FilesConstants.CREATED_FILE_NAME));
    }

    public static void createFilesAndFolder() {
        createFolder();
        createAudioFiles();
        createPhotoFiles();
        createVideoFiles();
    }

    public static void createFiles() {
        createAudioFiles();
        createPhotoFiles();
        createVideoFiles();
    }

    public static void orderBy() {
        for (int i = 0; i < 3; i++) {
            try {
                GenericService.clickElementByCoordinates(FilesConstants.SORT_BUTTON);
                GenericService.clickElementByCoordinates(FilesConstants.SORT_OLDEST_TO_NEWEST_BUTTON);
                return;
            } catch (StaleElementReferenceException e) {
                GenericService.sleep(200);
            }
        }
    }

    public static void validateFolderEmptyFolder() {
        MobileActionManager.waitInvisibility(FilesConstants.EMPTY_VIEW_MSG_CONTAINER);
        Assert.assertFalse(MobileActionManager.isEnabled(FilesConstants.CREATED_FILE_NAME));
    }

    public static void validateFolderName() {
        AppiumDriver<MobileElement> driver = (AppiumDriver<MobileElement>) DriverManager.getDriverInstance().getWrappedDriver();
        MobileElement folderNameElement = driver.findElement(By.xpath("//android.widget.TextView[@resource-id='org.hzontal.tella:id/fileNameTextView' and @text='Tella']"));
        boolean isDisplayed = folderNameElement.isDisplayed();
        Assert.assertTrue(isDisplayed, "The folder named 'Tella' is not displayed on the screen");
    }

    public static void clickFiles() {
        MobileActionManager.click(HomeConstants.HOME_BUTTON);
        MobileActionManager.waitVisibility(FilesConstants.ALL_FILES);
        GenericService.clickElementByCoordinates(FilesConstants.ALL_FILES);
    }

    public static void chooseNewCreatedFolder() {
        MobileActionManager.getText(FilesConstants.NEW_FOLDER);
        GenericService.clickElementByCoordinates(FilesConstants.NEW_FOLDER);
    }

    public static void chooseFolder() {
        GenericService.clickElementByCoordinates(FilesConstants.PICK_FOLDER);
    }

    public static void clickFolder(String nameFolder) {
        for (int i = 0; i < 3; i++) {
            try {
                String locator = FilesConstants.SELECT_FOLDER_ICON;
                MobileActionManager.waitVisibility(locator, nameFolder);
                MobileActionManager.waitClickable(locator, nameFolder);
                GenericService.clickElementByCoordinates(locator, nameFolder);
                return;
            } catch (StaleElementReferenceException e) {
                GenericService.sleep(200);
            }
        }
    }

    public static void validateIsNotEmptyFolderAllFile() {
        clickFolder("All files");
        Assert.assertTrue(MobileActionManager.waitVisibility(FilesConstants.ICON_FILE_AUDIO).isDisplayed());
    }

    public static void validateIsEmptyFolderAllFile() {
        clickFolder("All files");
        Assert.assertTrue(MobileActionManager.waitVisibility(FilesConstants.EMPTY_VIEW_MSG_CONTAINER).isDisplayed());
    }

    public static void tapsThreeButtonCreatedFolder() {
        String ThreeButton = String.format(FilesConstants.FOLDER_OPTIONS_BY_NAME, "TellaFolder");
        MobileActionManager.waitVisibility(ThreeButton);
        GenericService.clickElementByCoordinates(ThreeButton);
    }

    public static void SelectsMultipleTypeFiles() {
        MobileActionManager.waitVisibility(FilesConstants.CHECKBOX_BUTTON);
        GenericService.clickElementByCoordinates(FilesConstants.CHECKBOX_BUTTON);
        MobileActionManager.waitVisibility(FilesConstants.CHECKBOX_BUTTON);
        GenericService.clickElementByCoordinates(FilesConstants.CHECKBOX_BUTTON);
    }

    public static void SelectTypeFile(String type) {
        MobileActionManager.waitVisibility(FilesConstants.THREE_BUTTONS_OPTION_FILE, type);
        GenericService.clickElementByCoordinates(FilesConstants.THREE_BUTTONS_OPTION_FILE, type);
    }
}
