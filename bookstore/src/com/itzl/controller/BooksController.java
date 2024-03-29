package com.itzl.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itzl.pojo.BookType;
import com.itzl.pojo.Books;
import com.itzl.pojo.FenYe;
import com.itzl.service.BookTypeService;
import com.itzl.service.BooksService;


@Controller
@RequestMapping("/book")
public class BooksController {
	
	@Autowired
	private BooksService bs;
	@Autowired
	private BookTypeService bts;
	@RequestMapping(method = RequestMethod.GET)
	public String bookList(Map<String,Object> map,FenYe fy) {
		List<Books> books = bs.queryBookByFy(fy);
		List<BookType> bookType =  (List<BookType>) bts.queryBookType();
		map.put("books", books);
		map.put("bts",bookType);
		return "bookList";
	
	}
	
	/* 添加 */
	@RequestMapping(method = RequestMethod.POST)
	public String addToBooks(Books books) {
		bs.addToBooks(books);
		
		return "redirect:/book";
	}

	/* 删除 */
	@RequestMapping(method = RequestMethod.DELETE)
	public String deleteBooks(HttpServletRequest req) {
		String[] ids = req.getParameterValues("ids");
		bs.deleteBooks(ids);
		return "redirect:/book";
		
	}
	
	@RequestMapping(value = "/{id}",method = RequestMethod.GET)
	public String updateToBooks(@PathVariable int id,Map<String,Object> map) {
		Books books = bs.queryBookById(id);
		map.put("n", books);
		return "updateBooks";
		
	}
	
	@RequestMapping(method = RequestMethod.PUT)
	public String updateBooks(Books books) {
		
		bs.updateBooks(books);
		return "redirect:/book";
		
	}
	@RequestMapping("/toAddBook")
	public String toAddBook(Map<String,Object> map) {
		//类型列表
		List<BookType> bookTypes=(List<BookType>) bts.queryBookType();
		map.put("bts", bookTypes);
		return "addBook";
	}

}
