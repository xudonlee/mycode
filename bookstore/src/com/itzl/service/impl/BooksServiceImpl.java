package com.itzl.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itzl.dao.BooksDao;
import com.itzl.pojo.Books;
import com.itzl.pojo.FenYe;
import com.itzl.service.BooksService;
@Service
public class BooksServiceImpl implements BooksService {
	@Autowired
	private BooksDao bd;
	
	@Override
	public int deleteBooks(String[] ids) {
		int flag=1;
		for (String id : ids) {
			bd.deleteBooks(new Integer(id));
		}
		return flag;
	}

	@Override
	public int addToBooks(Books books) {
		
		return bd.addToBooks(books);
	}

	@Override
	public int updateBooks(Books books) {
		
		return bd.updateBooks(books);
	}

	@Override
	public Books queryBookById(int id) {
		
		return bd.queryBookById(id);
	}

	@Override
	public List<Books> queryBookByFy(FenYe fy) {
		fy.setRowsCount(bd.queryRowsCount(fy.getQuery()));
		if (fy.getPage()==null) {
			fy.setPage(1);
		}
		
		if(fy.getPage()<1) {
			fy.setPage(1);
		}
		if(fy.getPage()>fy.getPageCount() && fy.getPageCount()>0){
			fy.setPage(fy.getPageCount());
		}
		
		return bd.queryBookByFy(fy);
	}

	

}
