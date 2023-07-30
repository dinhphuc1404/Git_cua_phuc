package com.example.mephim.controller;
import lombok.AllArgsConstructor;
import lombok.Data;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Base64;

@RestController
public class AttachmentController {

    @PostMapping("/upload")
    public ResponseEntity<?> uploadFile(@RequestParam("file") MultipartFile file) throws Exception {
        System.out.println(file);
        String downloadURl = "";

        String fileName = StringUtils.cleanPath(file.getOriginalFilename());
        byte[] fileSize =file.getBytes();
        String contentType = file.getContentType();

        byte[] encoded = Base64.getEncoder().encode(fileSize);

        try {
            File myObj = new File("filename.txt");
            if (myObj.createNewFile()) {
                System.out.println("File created: " + myObj.getName());
            } else {
                System.out.println("File already exists.");
            }
        } catch (IOException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }

        try {
            FileWriter myWriter = new FileWriter("filename.txt");
            myWriter.write(new String(encoded));
            myWriter.close();
            System.out.println("Successfully wrote to the file.");
        } catch (IOException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }


        ResponseData responseData = new ResponseData(fileName, contentType, fileSize);

        return new ResponseEntity<>(responseData,HttpStatus.OK);
    }

    @Data
    @AllArgsConstructor
    static class ResponseData {
        private String fileName;
        private String fileType;
        private byte[] fileSize;
    }
}
