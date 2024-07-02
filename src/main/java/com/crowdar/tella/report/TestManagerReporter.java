package com.crowdar.tella.report;

import io.appium.java_client.MobileElement;
import io.lippia.reporter.ltm.TestManagerAPIAdapter;
import io.appium.java_client.AppiumDriver;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;

import java.sql.SQLException;

import static java.sql.DriverManager.getDriver;

public class TestManagerReporter extends TestManagerAPIAdapter {

    public TestManagerReporter(String arg) {
        super();
    }

    @Override
    @SuppressWarnings("unchecked")
    public String getBase64Image() {
        try {
            Object driver = getDriver("android");
            if (driver instanceof AppiumDriver) {
                AppiumDriver<MobileElement> androidDriver = (AppiumDriver<MobileElement>) driver;
                return ((TakesScreenshot) androidDriver).getScreenshotAs(OutputType.BASE64);
            } else {
                throw new IllegalArgumentException("Driver is not an instance of AppiumDriver<MobileElement>");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
