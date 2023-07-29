package util;

import org.apache.commons.codec.digest.DigestUtils;

public class PasswordEncryption {
    public String encrypt(String str){
        String md5Hex = DigestUtils.md5Hex(str).toUpperCase();
        return md5Hex;
    }

    public static void main(String[] args) {
        String password = "1234";
        PasswordEncryption passwordEncryption = new PasswordEncryption();
        String encryptedPassword = passwordEncryption.encrypt(password);
        System.out.println("Encrypted password: " + encryptedPassword);
    }
}

