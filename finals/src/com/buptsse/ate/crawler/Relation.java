package com.buptsse.ate.crawler;
public class Relation {
		
		public Relation(String link, String title) {
			this.link = link;
			this.title = title;
		}
		
		protected String title;
		protected String link;
		
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getLink() {
			return link;
		}
		public void setLink(String link) {
			this.link = link;
		}
		
	}