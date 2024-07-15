package com.crowdar.tella.steps;

import com.crowdar.tella.constants.FilesConstants;
import com.crowdar.tella.constants.HomeConstants;
import com.crowdar.tella.constants.PhotographyAndVideoConstants;
import com.crowdar.tella.services.FilesService;
import com.crowdar.tella.services.GenericService;
import com.crowdar.tella.services.PhotographyAndVideoService;
import io.cucumber.java.en.*;

public class PhotographyAndVideoSteps {

    @When("the user presses the camera button")
    public void theUserPressesTheCameraButton() {
        GenericService.commonClick(HomeConstants.CAMERA_BUTTON);
        FilesService.acceptPermissions();
    }

    @And("the user presses grid lines button")
    public void theUserPressesGridLinesButton() {
        GenericService.commonClick(PhotographyAndVideoConstants.CAMERA_GRID_SHOW);
    }

    @Then("the grid lines are now activated")
    public void theGridLinesAreNowActivated() {
        PhotographyAndVideoService.tapGridButtonAssert();
    }

    @And("the user presses the video button")
    public void theUserPressesTheVideoButton() {
        GenericService.commonClick(FilesConstants.VIDEO_OPTION);
    }

    @When("the user presses the configurations button")
    public void theUserPressesTheConfigurationsButton() {
        GenericService.commonClick(PhotographyAndVideoConstants.VIDEO_CONFIG);
    }

    @And("the user presses the option highest possible")
    public void theUserPressesTheOptionHighestPossible() {
        PhotographyAndVideoService.videoResolution();
    }

    @And("the user presses the next button")
    public void theUserPressesTheNextButton() {
        GenericService.commonClick(PhotographyAndVideoConstants.NEXT_BUTTON_VIDEO_CONFIG);
    }

    @Then("the video resolution is selected")
    public void theVideoResolutionIsSelected() {
    }

    @And("the user takes a photography")
    public void theUserTakesAPhotography() {
        GenericService.commonClick(PhotographyAndVideoConstants.CAPTURE_PHOTO_OR_VIDEO_BUTTON);
    }

    @When("the user presses the image located at the bottom right to the screen")
    public void theUserPressesTheImageLocatedAtTheBottomRightToTheScreen() {
        GenericService.commonClick(PhotographyAndVideoConstants.PREVIEW_FILE);
    }

    @And("the user presses the three points button located at the top right screen")
    public void theUserPressesTheThreePointsButtonLocatedAtTheTopRightScreen() throws InterruptedException {
        Thread.sleep(5000);
        GenericService.commonClick(PhotographyAndVideoConstants.THREE_POINTS_FILE_BUTTON);
    }


    @And("the user presses Delete button")
    public void theUserPressesDeleteButton() {
        GenericService.commonClick(PhotographyAndVideoConstants.DELETE_FILE_BUTTON);
    }

    @And("the user presses confirm Delete button")
    public void theUserPressesConfirmDeleteButton() {
        GenericService.commonClick(PhotographyAndVideoConstants.CONFIRM_DELETE_FILE_BUTTON);
    }

    @Then("the file is deleted")
    public void theFileIsDeleted() {
        PhotographyAndVideoService.previewFileAssert(PhotographyAndVideoConstants.PREVIEW_FILE);
    }

    @And("the user presses the button File information")
    public void theUserPressesTheButtonFileInformation() {
        GenericService.commonClick(PhotographyAndVideoConstants.FILE_INFORMATION_BUTTON);
    }

    @Then("the file information is in the screen")
    public void theFileInformationIsInTheScreen() {
        PhotographyAndVideoService.fileInformationAssert();
    }


    @And("the user presses Rename button")
    public void theUserPressesRenameButton() {
        GenericService.commonClick(PhotographyAndVideoConstants.RENAME_BUTTON);
    }

    @And("the user writes a new name (.*)")
    public void theUserWritesANewName(String tella) {
        PhotographyAndVideoService.deleteTextAndSendKeys();
    }

    @And("the user enters the images folder")
    public void theUserEntersTheImagesFolder() {
        GenericService.commonClick(PhotographyAndVideoConstants.OK_RENAME_FILE_BUTTON);
        GenericService.commonClick(PhotographyAndVideoConstants.GO_BACK_BUTTON);
        GenericService.commonClick(FilesConstants.CLOSE_BUTTON);
        GenericService.commonClick(FilesConstants.IMAGES_FILE);
    }

    @Then("the file is saved with the new name")
    public void theFileIsSavedWithTheNewName() {
        PhotographyAndVideoService.changeNameAssert();
    }

    @And("the user has an email account registered on the cell phone")
    public void theUserHasAnEmailAccountRegisteredOnTheCellPhone() {
    }

    @And("the user presses the Share button")
    public void theUserPressesTheShareButton() {
        GenericService.commonClick(PhotographyAndVideoConstants.SHARE_BUTTON);
    }

    @And("the user presses the Continue button")
    public void theUserPressesTheContinueButton() {
        GenericService.commonClick(PhotographyAndVideoConstants.OK_RENAME_FILE_BUTTON);
    }

    @And("the user presses the Gmail button")
    public void theUserPressesTheGmailButton() {
        GenericService.commonClick(PhotographyAndVideoConstants.GMAIL_BUTTON);
    }
}



