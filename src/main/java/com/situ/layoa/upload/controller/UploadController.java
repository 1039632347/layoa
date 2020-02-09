package com.situ.layoa.upload.controller;

import java.io.Serializable;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.layoa.commons.LayResult;
import com.situ.layoa.commons.UploadFile;

@Controller
public class UploadController implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	
	@ResponseBody
	@RequestMapping("/upload")
	public LayResult doUploadFile(UploadFile uploadFile) {
		System.out.println(uploadFile.getUploadFile());
		
		String src ="layoafile/xxxxx.png";
		/*return new LayResult(0,"",src);*/
		
		return null;
		
		
	}
	
	
	
	
	
	
	
}
