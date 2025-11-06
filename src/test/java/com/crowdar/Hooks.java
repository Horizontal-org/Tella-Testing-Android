package com.crowdar;

import io.cucumber.java.AfterStep;

import static com.crowdar.AutoPermissionHandler.handleIfPresent;

public class Hooks {
    @AfterStep
    public void checkPermissionPopups() {
        handleIfPresent();
    }
}
