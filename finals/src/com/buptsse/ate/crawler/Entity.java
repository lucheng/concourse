package com.buptsse.ate.crawler;

public class Entity {
		
		private String name;
		private int weight;
		private int position;
		
		public Entity(String name, int weight) {
			this.name = name;
			this.weight = weight;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public int getWeight() {
			return weight;
		}

		public void setWeight(int weight) {
			this.weight = weight;
		}

		public int getPosition() {
			return position;
		}

		public void setPosition(int position) {
			this.position = position;
		}
	}