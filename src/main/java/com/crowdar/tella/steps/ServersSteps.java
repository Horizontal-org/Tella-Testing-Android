package com.crowdar.tella.steps;

import com.crowdar.core.PageSteps;
import com.crowdar.tella.services.ServersService;
import io.cucumber.java.en.When;


public class ServersSteps extends PageSteps {
    @When("the user presses the + button")
    public void theUserPressesTheButton() {
       ServersService.clickPlusButton();
    }
}
