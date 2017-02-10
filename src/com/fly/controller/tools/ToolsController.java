package com.fly.controller.tools;

import com.fly.controller.BaseController;
import com.fly.entity.Beauty;
import com.fly.entity.User;
import com.fly.util.HtmlUtil;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.jfinal.plugin.activerecord.Page;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by jwp on 2017/2/10.
 */
public class ToolsController extends BaseController {

    public void rmbconversion()
    {
        render("rmbconversion.jsp");
    }
}
