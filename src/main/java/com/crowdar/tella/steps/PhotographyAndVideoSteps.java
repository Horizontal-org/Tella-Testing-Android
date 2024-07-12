package com.crowdar.tella.steps;

import com.crowdar.tella.constants.FilesConstants;
import com.crowdar.tella.constants.HomeConstants;
import com.crowdar.tella.constants.PhotographyAndVideoServiceConstants;
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
        GenericService.commonClick(PhotographyAndVideoServiceConstants.CAMERA_GRID_SHOW);
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
        GenericService.commonClick(PhotographyAndVideoServiceConstants.VIDEO_CONFIG);
    }

    @And("the user presses the option highest possible")
    public void theUserPressesTheOptionHighestPossible() {
        GenericService.commonClick(PhotographyAndVideoServiceConstants.VIDEO_LOW_RESOLUTION_OPTION);
        GenericService.commonClick(PhotographyAndVideoServiceConstants.VIDEO_HIGHEST_POSIBLE_OPTION);
    }

    @And("the user presses the next button")
    public void theUserPressesTheNextButton() {
        GenericService.commonClick(PhotographyAndVideoServiceConstants.NEXT_BUTTON_VIDEO_CONFIG);
        PhotographyAndVideoService.videoResolutionAssert();
    }

    @Then("the video resolution is selected")
    public void theVideoResolutionIsSelected() {

    }
}