package com.crowdar.tella;

import com.crowdar.bdd.cukes.TestNGSecuencialRunner;
import org.testng.annotations.BeforeClass;

import java.io.File;
import java.util.List;

public class MobileSecuencialTestRunner extends TestNGSecuencialRunner {
    @BeforeClass
    public void setUpClass() throws Exception {
        File directory = new File("C:/Workspace/Tella-Testing/Ignore");
        if (!directory.exists()) {
            // Crear el directorio si no existe
            if (!directory.mkdirs()) {
                throw new IllegalArgumentException("No se pudo crear el directorio: " + directory.getAbsolutePath());
            }
        } else if (!directory.isDirectory()) {
            throw new IllegalArgumentException("No es un directorio: " + directory.getAbsolutePath());
        }

        // Ejemplo de cómo manejar una lista
        List<String> exampleList = getExampleList();
        if (exampleList.isEmpty()) {
            throw new IllegalArgumentException("La lista de ejemplos está vacía.");
        }
        // Acceso seguro al primer elemento de la lista
        String firstElement = exampleList.get(0);
        System.out.println("Primer elemento de la lista: " + firstElement);
    }

    // Método de ejemplo para obtener una lista
    private static List<String> getExampleList() {
        // Implementa tu lógica para obtener la lista
        return List.of(); // Retorna una lista vacía como ejemplo
    }
}
