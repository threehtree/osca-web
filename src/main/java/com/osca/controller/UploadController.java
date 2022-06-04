package com.osca.controller;


import com.osca.dto.UploadResultDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import net.coobird.thumbnailator.Thumbnails;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
@Log4j2
@RequiredArgsConstructor
public class UploadController {


    @PostMapping("/delete")
    @ResponseBody
    public Map<String, String> deleteFile(String fileName){

        int idx = fileName.lastIndexOf("/"); // 마지막 / 를 체크해서 경로 자를려고
        String path = fileName.substring(0,idx); //이걸로 경로자르고
        String name = fileName.substring(idx+1); //마지막/ 이후부터 이름 , uuid_fileName
        String uuid = name.substring(0,name.indexOf("_"));

        log.info("path: "+ path);
        log.info("name: " + name);
        File targetFile = new File("C:\\upload\\" + fileName);
        //경로가 있어야 삭제를하지

        boolean result = targetFile.delete();

        //이미지 파일을 삭제했다면 thumbnail 도 삭제해야한다
        if(result){
            File thumbFile = new File("C:\\upload\\"+path+"\\s_"+name);
            thumbFile.delete();
        }


        return Map.of("result", "success");// 삭제했다는 결과만 알려주면되지
    }

    @GetMapping("/view")
    public ResponseEntity<byte[]> viewFile(String fileName) {
        log.info("+++++++++++++++");
        log.info("FileName.........: " + fileName);

        File targetFile = new File("C:\\upload\\" + fileName);

        log.info(targetFile);
        //java에서 이제 파일을 보내주려면http 규약에 맞춰 해더 + 마임타입을 보내야하지

        String mimeType = null;
        try {
            mimeType = Files.probeContentType(targetFile.toPath());
            log.info("=========================");
            log.info(mimeType);

            byte[] data = FileCopyUtils.copyToByteArray(targetFile);

            return ResponseEntity.ok().header("Content-Type", mimeType).body(data);
        } catch (IOException e) {
            e.printStackTrace();
            return ResponseEntity.status(404).build();
        }
        //여기까지 브라우저에 업로드 됫음 , 이제 삭제가 필요하다

    }


    @PostMapping("/upload1")
    @ResponseBody //restController때는 객체 보내면 json처리가 되는데 우린 그냥 controller썻으니 이걸 씀
    public List<UploadResultDTO> upload1(MultipartFile[] files){
        log.info("==================");
        log.info(files);

        List<UploadResultDTO> list = new ArrayList<>();

        for(MultipartFile file:files){ //업로드 된 파일이 있다는 가정

            String oiginalFileName = file.getOriginalFilename();

            boolean img = file.getContentType().startsWith("image");

            String uuid =  UUID.randomUUID().toString();

            String saveName =uuid+"_"+oiginalFileName;// 여기까지 중복해결

            log.info(file.getResource());
            String saveFolder = makeFolders();

            File saveFile = new File("C:\\upload\\" +saveFolder+"\\"+saveName);

            try(InputStream in = file.getInputStream();
                FileOutputStream fos = new FileOutputStream("C:\\upload\\" +saveFolder+"\\"+ saveName);
            ) {
                FileCopyUtils.copy(in,fos);
            } catch (IOException e) {
                e.printStackTrace();
            }

            if(img){ // 만약 이미지가 true인 상황이면 섬네일을 만들어야지

//                saveName = UUID+"_"+fileName
                String thumbFileName = saveFolder+"\\s_"+saveName;
                File thumbFile = new File("C:\\upload\\" +thumbFileName);
                //File 메소드에 경로지정이 있는건가 , ㅇㅇ 경로지정용

                try {
                    Thumbnails.of(saveFile)
                            .size(200,200)
                            .toFile(thumbFile);
                } catch (IOException e) {
                    e.printStackTrace();
                }

            }//end if

            UploadResultDTO uploadResultDTO = UploadResultDTO.builder()
                    .fileName(oiginalFileName)
                    .uuid(uuid)
                    .img(img)
                    .savePath(saveFolder)
                    .build();

            list.add(uploadResultDTO);

        }//end for
        return list;
    }
    private String makeFolders(){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
        String str = sdf.format(new java.util.Date());//혹시 다른 DATE들고올까봐 다씀
        File forderPath = new File("C:\\upload\\" + str);

        if(!forderPath.exists()){ //만약 forderPath에 해당하는 폴더가 잇으면 x,
            forderPath.mkdirs();//폴더들을 생성한다
        }
                return str;
    }
    //이제 부터 섬네일


}
