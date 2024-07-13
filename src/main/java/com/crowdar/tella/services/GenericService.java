package com.crowdar.tella.services;

import com.crowdar.core.actions.MobileActionManager;
import com.crowdar.driver.DriverManager;
import io.appium.java_client.AppiumDriver;
import io.appium.java_client.MobileBy;
import io.appium.java_client.MobileElement;
import io.appium.java_client.TouchAction;
import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.touch.offset.PointOption;
import org.openqa.selenium.*;
import org.openqa.selenium.io.FileHandler;


import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;



public class GenericService {

    public static By stringToBy(String locatorString) {
        if (locatorString.startsWith("id:")) {
            return By.id(locatorString.substring("id:".length()));
        } else if (locatorString.startsWith("xpath:")) {
            return By.xpath(locatorString.substring("xpath:".length()));
        } else if (locatorString.startsWith("accessibilityId:")) {
        return MobileBy.AccessibilityId(locatorString.substring("ACCESSIBILITYID:".length()));
        }
        return null;
    }

    public static void commonClick(String locator) {
        By byLocator = stringToBy(locator);
        if (byLocator != null) {
            MobileActionManager.waitVisibility(locator);  // Pasa la cadena directamente
            MobileActionManager.click(locator);  // Pasa la cadena directamente
        } else {
            // Maneja el caso donde byLocator es null si es necesario
            System.err.println("Tipo de localizador no soportado: " + locator);
        }
    }
}

   /*
      public static void commonClick1(By locator) {
        MobileActionManager.waitVisibility(locatorString);
        MobileActionManager.click(locatorString);
    }



   private static AndroidDriver driver = (AndroidDriver) DriverManager.getDriverInstance().getWrappedDriver();

    public void ScreenTextRetriever(AndroidDriver<MobileElement> driver) {
        this.driver = driver;
    }

    public static String getTextAtCoordinates(double percentX, double percentY) {
        // Obtener el tamaño de la pantalla
        Dimension size = driver.manage().window().getSize();

        // Calcular las coordenadas absolutas
        int x = (int) (size.width * percentX);
        int y = (int) (size.height * percentY);

        // Tocar la pantalla en las coordenadas especificadas
        TouchAction touchAction = new TouchAction(driver);
        touchAction.tap(PointOption.point(x, y)).perform();

        // Obtener el elemento en la posición especificada
        MobileElement element = (MobileElement) driver.findElementByXPath("//*[contains(@text, '') and @bounds='[" + x + "," + y + "]']");

        // Extraer y devolver el texto del elemento
        return element.getText();
    }


    public static class ScreenUtils {

        private AndroidDriver<MobileElement> driver;

        public ScreenUtils(AndroidDriver<MobileElement> driver) {
            this.driver = driver;
        }


        public void takeScreenshotOfRegion(Point point, int width, int height, String fileName) throws IOException {
            File screenshot = ((TakesScreenshot) driver).getScreenshotAs(OutputType.FILE);
            BufferedImage fullImg = ImageIO.read(screenshot);

            // Recortar la región específica de la captura de pantalla
            BufferedImage regionImg = fullImg.getSubimage(point.getX(), point.getY(), width, height);
            ImageIO.write(regionImg, "png", screenshot);

            // Guardar la imagen recortada
            FileHandler.copy(screenshot, new File(fileName));
        }

        public String extractTextFromImage(String imagePath) {
            ITesseract instance = new Tesseract();
            try {
                return instance.doOCR(new File(imagePath));
            } catch (TesseractException e) {
                e.printStackTrace();
                return null;
            }
        }

        public Point getCoordinates(double percentX, double percentY) {
            Dimension size = driver.manage().window().getSize();
            int x = (int) (size.width * percentX);
            int y = (int) (size.height * percentY);
            return new Point(x, y);
        }
    }
}

 */