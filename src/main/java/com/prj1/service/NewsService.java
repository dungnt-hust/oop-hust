package com.prj1.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.prj1.dao.NewsDAO;
import com.prj1.entities.News;

@Service
@Transactional
public class NewsService {
	
	@Autowired
	  private NewsDAO newsDAO;
	  
	  public List<News> findAll() {
		  List<News> news = newsDAO.findAll();
		  Collections.reverse(news);
	    return news;
	  }
	  
	  public List<News> findAllDeleted() {
			  List<News> news = newsDAO.findAllDeleted();
			  Collections.reverse(news);
		    return news;
		  }
	  
	  public List<News> findAllDeletedByAuthor(String author) {
		    return newsDAO.findAllDeletedByAuthor(author);
		  }
	  
	  public News findById(int id) {
	    return newsDAO.findById(id);
	  }
	  
	  public void restoreById(int id) {
		  News news = newsDAO.findById(id);
		  news.setIsDeleted(0);
		    newsDAO.update(news);
	  }
	  
	  public void save(News news){
	    // validate business
		  Date date = new Date();
		  news.setDate(date.toString());
	    newsDAO.save(news);
	  }
	  
	  
	  public void update(News news){
	    // validate business
	    newsDAO.update(news);
	  }
	  
	  public void softDelete(int id, String newsname){
	    // validate business
		  News news = newsDAO.findById(id);
			  news.setIsDeleted(1);
			  newsDAO.update(news);
	  }
	  
	  public void delete(int id){
	    // validate business
		  newsDAO.delete(newsDAO.findById(id));
	  }
	  
	public List<News> sortByName(List<News> list) {
		// TODO Auto-generated method stub
		List<News> res = new ArrayList<News>();
		int sz = list.size();
		while(list.size() != 0) {
			News tmp = list.get(0);
			for (News news : list) {
				if(tmp.getTitle().compareTo(news.getTitle()) > 0) tmp = news;
			}
			res.add(tmp);
			list.remove(tmp);
		}
		return res;
	}
	
	public List<News>loadNewsByAuthor(String author) {
		return newsDAO.loadNewsByAuthor(author);
	}

	public List<News> searchByTitle(List<News> list, String title) {
		// TODO Auto-generated method stub
		List<News> res = new ArrayList<News>();
		for (News news : list) {
			if(news.getTitle().equals(title)) {
				res.add(news);
			}
		}
		return res;
	}
}
