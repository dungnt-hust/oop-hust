package com.prj1.service;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.prj1.dao.NotiDAO;
import com.prj1.entities.Noti;

@Service
@Transactional
public class NotiService {
	
	@Autowired
	  private NotiDAO notiDAO;

	public List<Noti> findAll() {
		List<Noti> notis = notiDAO.findAll();
		Collections.reverse(notis);
	    return notis;
	  }
	  
	  public List<Noti> findAllDeleted() {
		    return notiDAO.findAllDeleted();
		  }
	  
	  public Noti findById(int id) {
	    return notiDAO.findById(id);
	  }
	  
	  public void restoreById(int id) {
		  Noti noti = notiDAO.findById(id);
		    notiDAO.update(noti);
	  }
	  
	  public void save(Noti noti){
	    // validate business
	    notiDAO.save(noti);
	  }
	  
	  public List<Noti> loadNotiByUsername(String username) { 

			List<Noti> notis = notiDAO.loadNotiByUsername(username);
			Collections.reverse(notis);
		  return notis;
	  }
	  
	  public void softDelete(int id, String notiname){
	    // validate business
		  Noti noti = notiDAO.findById(id);
			  notiDAO.update(noti);
	  }
	  
	  public void delete(int id){
	    // validate business
		  notiDAO.delete(notiDAO.findById(id));
	  }
}
