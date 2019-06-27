package com.itzl.pojo;

import java.util.Date;

import org.springframework.context.annotation.Scope;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;
@Component
@Scope("prototype")
public class Query {
		public String getQbookName() {
		return qbookName;
	}
	public void setQbookName(String qbookName) {
		this.qbookName = qbookName;
	}
	public String getQbookType() {
		return qbookType;
	}
	public void setQbookType(String qbookType) {
		this.qbookType = qbookType;
	}
	public Date getQbookDayStrat() {
		return qbookDayStrat;
	}
	public void setQbookDayStrat(Date qbookDayStrat) {
		this.qbookDayStrat = qbookDayStrat;
	}
	public Date getQbookDayEnd() {
		return qbookDayEnd;
	}
	public void setQbookDayEnd(Date qbookDayEnd) {
		this.qbookDayEnd = qbookDayEnd;
	}
		private String qbookName;
		private String qbookType;
		@DateTimeFormat(pattern="yyyy-MM-dd")
		private Date qbookDayStrat;
		@DateTimeFormat(pattern="yyyy-MM-dd")
		private Date qbookDayEnd;
		
		
}
