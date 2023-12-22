package com.crowdar.tella.steps;

import com.crowdar.tella.services.AudioService;
import com.crowdar.tella.services.UnlockService;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;

public class AudioSteps {

    @Given("the user is in Tella home page")
    public void theUserIsInTellaHomePage() {
        UnlockService.isViewLoaded();
        UnlockService.setPassword("654321");
        UnlockService.goTella();
    }
    @When("the user press Rec")
    public void theUserPressRec() {
        AudioService.clickRecIcon();
    }
    @And("the user press the pencil")
    public void theUserPressThePencil() {
        AudioService.clickEditFileIcon();
    }
    @And("the user delete the existing name pressing the delete button")
    public void theUserDeleteTheExistingName() {
        AudioService.deleteAudioFileName();
    }
    @And("the user write a new name (.*)")
    public void theUserWriteANewName(String name) {
        AudioService.enterNewName(name);
    }
}
