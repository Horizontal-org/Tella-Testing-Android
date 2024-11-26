package com.crowdar.tella.steps;

import com.crowdar.core.actions.MobileActionManager;
import com.crowdar.tella.constants.AudioConstants;
import com.crowdar.tella.services.AudioService;
import io.cucumber.java.en.*;

public class AudioSteps {

    @When("the user press the Rec option")
    public void theUserTapsTheRecOption() {
        AudioService.clickRecOption();
    }

    @And("the user press the microphone")
    public void tapsTheGeneralOption() throws InterruptedException {
        AudioService.clickMicrophoneIcon();
    }

    @And("the user press the pencil icon")
    public void tapsTheLanguageOption() {
        AudioService.clickPencilIcon();
    }

    @And("the user delete the existing name pressing the delete button")
    public void deleteLastNameRecord() {
        AudioService.deleteLastName();
    }

    @And("the user write a new recording name (.*)")
    public void writeNewRecordingName(String recordName) {
        AudioService.addNewRecordingName(recordName);
    }

    @And("the user press ok")
    public void pressOKoption() {
        AudioService.clickOkButton();
    }

    @And("the user press stop option")
    public void pressStopOption() throws InterruptedException {
        AudioService.clickMicrophoneIcon();
    }

    @Then("the approval message (.*) is displayed")
    public void validateAprovalMessage(String message) {
        AudioService.validateAprovalMessage(message);
    }

    @Then("the file change the original name for a new one: (.*)")
    public void validateNewName(String recordName) {
        AudioService.validateNewName(recordName);
    }

    @And("the user press start option")
    public void theUserPressStartOption() {
        AudioService.clickStartOption();
    }

    @And("the user press pause")
    public void theUserPressPause() throws InterruptedException {
        AudioService.clickPause();
    }

    @And("the user press the microphone again")
    public void theUserPressTheMicrophoneAgain() throws InterruptedException {
        MobileActionManager.click(AudioConstants.MICROPHONE_ICON);
        Thread.sleep(2000);
    }
}
