package by.eftech.webapp.web;

import by.eftech.webapp.model.*;
import by.eftech.webapp.service.MachineService;
import by.eftech.webapp.utils.exceptions.ImageUploadException;
import org.apache.commons.io.FileUtils;
import org.apache.poi.hssf.usermodel.HSSFPictureData;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletContext;

@Controller
/*@RequestMapping("/admin")*/
public class MachineAdminController {
    @Autowired
    private MachineService service;
    @RequestMapping(value = "/export-excel", method = RequestMethod.GET)
    public String getUploadFile() {
        return "export-excel";
    }
	
    @RequestMapping("/export")
    public String fileUploaded(@RequestParam("file") MultipartFile uploadedFile, SessionStatus status) throws IOException {
    	Machine machine = new Machine();
    	System.out.println("Export");
    	status.setComplete();
        InputStream inputStream;
        OutputStream outputStream;
        inputStream = uploadedFile.getInputStream();
        HSSFWorkbook workbook = new HSSFWorkbook(inputStream);
        HSSFSheet sheet = workbook.getSheetAt(0);
        List<HSSFPictureData> allPictures = workbook.getAllPictures();
        List<Photo> list = new ArrayList<Photo>();
        System.out.println("Size:"+allPictures.size());
        for (HSSFPictureData picture :
                allPictures) {
            byte[] data = picture.getData();
            String s = String.valueOf(picture.hashCode());
            String s1 = picture.suggestFileExtension();
            String path = saveImage(data, s, s1);
            Photo photo = new Photo(path);
            list.add(photo);
            photo.getMachines().add(machine);
        }
        
      
        Cnc cnc = new Cnc(sheet.getRow(26).getCell(1).getStringCellValue(),sheet.getRow(27).getCell(1).getStringCellValue(),
        		sheet.getRow(28).getCell(1).getStringCellValue(),sheet.getRow(47).getCell(1).getStringCellValue());
        by.eftech.webapp.model.List l = new by.eftech.webapp.model.List(sheet.getRow(10).getCell(1).getStringCellValue(),
        		(float)sheet.getRow(11).getCell(1).getNumericCellValue());
        Turret turret = new Turret((float)sheet.getRow(19).getCell(1).getNumericCellValue(),(int)sheet.getRow(20).getCell(1).getNumericCellValue(),
        		(int)sheet.getRow(21).getCell(1).getNumericCellValue(),(int)sheet.getRow(22).getCell(1).getNumericCellValue(),
        		(int)sheet.getRow(23).getCell(1).getNumericCellValue(),(int)sheet.getRow(24).getCell(1).getNumericCellValue());
        machine.setProduct_id(sheet.getRow(0).getCell(1).getStringCellValue());
        machine.setMachine_type(sheet.getRow(1).getCell(1).getStringCellValue());
        machine.setModel(sheet.getRow(2).getCell(1).getStringCellValue());
        machine.setManufacturer(sheet.getRow(3).getCell(1).getStringCellValue());
        machine.setCountry(sheet.getRow(4).getCell(1).getStringCellValue());
        machine.setYear((int)sheet.getRow(5).getCell(1).getNumericCellValue());
        machine.setCondition(sheet.getRow(6).getCell(1).getStringCellValue());
        machine.setLocation(sheet.getRow(7).getCell(1).getStringCellValue());
        machine.setPunch_force((float)sheet.getRow(8).getCell(1).getNumericCellValue());
        machine.setX_move((float)sheet.getRow(14).getCell(1).getNumericCellValue());
        machine.setY_move((float)sheet.getRow(15).getCell(1).getNumericCellValue());
        machine.setMax_speed((int)sheet.getRow(16).getCell(1).getNumericCellValue());
        machine.setPos_accuracy(sheet.getRow(17).getCell(1).getStringCellValue());
        machine.setVoltage((int)sheet.getRow(30).getCell(1).getNumericCellValue());
        machine.setAir_compress	((int)sheet.getRow(33).getCell(1).getNumericCellValue());////////!!!
        machine.setDimensions(sheet.getRow(32).getCell(1).getStringCellValue());
        machine.setWeight((int)sheet.getRow(33).getCell(1).getNumericCellValue());
        machine.setDescription(sheet.getRow(35).getCell(1).getStringCellValue());
        machine.setStand_descr(sheet.getRow(41).getCell(1).getStringCellValue());
        machine.setInstr_descr(sheet.getRow(44).getCell(1).getStringCellValue());
        machine.setList(l);
        machine.setCnc(cnc);
        machine.setTurret(turret);
        machine.getPhoto().addAll(list);
       service.save(machine);
       
         return "redirect:/admin";
    }

    @RequestMapping(value = "/deleteMachine", method = RequestMethod.GET)
    public String deleteMachine( @RequestParam (value = "id") int id) { 
        service.delete(id);        
        return "redirect:/admin";
    }

    @Autowired
    private ServletContext sc;
    private String saveImage(byte[] data, String filename, String extension) throws ImageUploadException {
        System.out.println("Context:"+sc.getRealPath("/"));
    	String absolutePath = sc.getRealPath("/")+"/resources/machine_photo/" + filename + "." + extension;
        String relativePath = "/resources/machine_photo/" + filename + "." + extension;
        File file = new File(absolutePath);
        try {
            FileUtils.writeByteArrayToFile(file, data);
        } catch (IOException e) {
            throw new ImageUploadException("Unable to save image", e);
        }

        return relativePath;
    }
}