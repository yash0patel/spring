package com.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.bean.SearchLogBean;
import com.dao.SearchLogDao;
import com.util.ViewPaths;

@Controller
public class AdminController {

	@Autowired
	SearchLogDao searchLogDao;
	
	@GetMapping("admindashboard")
	public String adminDashboard() {
		return ViewPaths.ADMIN_DASHBOARD;
	}

	@GetMapping("searchlog")
	public String searchLog(Model model) {
		List<SearchLogBean> list = searchLogDao.getAllLogs();
		model.addAttribute("list", list);
		return ViewPaths.ADMIN_SEARCH_LOG_LIST;
	}
}
