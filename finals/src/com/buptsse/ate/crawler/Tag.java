package com.buptsse.ate.crawler;
public class Tag {
		public Tag(String link, String tag) {
			this.link = link;
			this.tag = tag;
		}
		public String getTag() {
			return tag;
		}
		public void setTag(String tag) {
			this.tag = tag;
		}
		protected String tag;
		protected String link;
		
		public String getLink() {
			return link;
		}
		public void setLink(String link) {
			this.link = link;
		}
	}