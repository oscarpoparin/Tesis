package modelo;

import java.util.Random;

public class GeneradorClaves {

    public static String generarClave(String nombre, String paterno, String materno) {

        String apPaterno = paterno.substring(0, 2).toUpperCase();
        String apMaterno = materno.substring(0, 2).toUpperCase();
        String parteNombre = nombre.substring(0, 1).toUpperCase();

        Random rand = new Random();
        int numeroAleatorio1 = rand.nextInt(9) + 1;
        int numeroAleatorio2 = rand.nextInt(9) + 1;
        int numeroAleatorio3 = rand.nextInt(9) + 1;
        String aleatorio1 = String.format("%01d", numeroAleatorio1);
        String aleatorio2 = String.format("%01d", numeroAleatorio2);
        String aleatorio3 = String.format("%01d", numeroAleatorio3);

        String clave = apPaterno + apMaterno + parteNombre + aleatorio1 + aleatorio2 + aleatorio3;

        if (clave.length() != 8) {
            throw new IllegalArgumentException("La clave generada no tiene 8 caracteres.");
        }

        return clave;

    }

    public static String generarClaveAsignatura(String nombre, String turno, int numero) {

        String nomAsignatura = nombre.substring(0, 3).toUpperCase();
        String turnoAsignatura = turno.substring(0, 1).toUpperCase();
        int semestre = numero;
        String numeroRomano = semestre(semestre);

        Random rand = new Random();
        int numeroAleatorio1 = rand.nextInt(9) + 1;
        String aleatorio1 = String.format("%01d", numeroAleatorio1);


        String clave = nomAsignatura + numeroRomano + turnoAsignatura + aleatorio1;

        if (clave.length() > 8 && clave.length() != 8) {
            String clave1 = nomAsignatura + numeroRomano + turnoAsignatura + aleatorio1;
            return clave1;
        }

        return clave;

    }

    public static String semestre(int num) {
        
        String[] simbolosRomanos = {"V", "IV", "I"};
        int[] valoresRomanos = {5, 4, 1};

        StringBuilder resultado = new StringBuilder();

        for (int i = 0; i < simbolosRomanos.length; i++) {
            while (num >= valoresRomanos[i]) {
                resultado.append(simbolosRomanos[i]);
                num -= valoresRomanos[i];
            }
        }

        return resultado.toString();
    }
}
