package com.fxb.jeesite.modules.fileUpload.web;

import com.fxb.jeesite.common.config.Global;
import com.fxb.jeesite.common.web.BaseController;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

/**
 * @create by: wangxiyue on 2017/8/1 11:04.
 * @ClassName:
 * @userfor:
 * @description:
 *      集群环境下，用户上传文件不知道会上传到那个服务器，下载时候就无法下载。
 *      上传的时候，把文件复制到其他服务器各一份。
 *  1.先写文件上传
 *  2. 再在上传的过程中加入分发的过程。
 */

@Controller
@RequestMapping(value = "${adminPath}/fileUpload/")
public class FileController extends BaseController {

    @RequestMapping({"upload","receive"})
    public String upload(@RequestParam(value = "uploadFile", required = false) MultipartFile file, HttpServletRequest request, RedirectAttributes redirectAttributes){

        String path = request.getSession().getServletContext().getRealPath("upload");
        String fileName = file.getOriginalFilename();
        try {
            fileName = URLDecoder.decode(fileName, "utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        System.out.println(path);
        File targetFile = new File(path, fileName);
        if(!targetFile.exists()){
            targetFile.mkdirs();
        }
        //保存
        try {
            file.transferTo(targetFile);
        } catch (Exception e) {
            e.printStackTrace();
        }
        addMessage(redirectAttributes, request.getContextPath()+"/upload/"+fileName);

        return "redirct:"+ Global.getAdminPath()+"/fileUpload/";
    }

    @RequiresPermissions("user:fileUpload:view")
    @RequestMapping({"list",""})
    public String toUpload(){

        return "modules/fileUpload/upload";
    }
}