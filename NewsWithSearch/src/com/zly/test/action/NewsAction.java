package com.zly.test.action;

import java.util.List;
import java.util.Map;

import com.zly.test.entity.NewsItem;
import com.zly.test.entity.PageControl;
import com.zly.test.service.NewsManager;

public class NewsAction extends BaseAction {

	private static final long serialVersionUID = 7780804627621048756L;

	//对应分页jsp中的跳转到第几页
	private String jumpPage;
	//对应url?category的值
	private String category;
	//对新闻数据进行处理
	private NewsManager newsManager;
	//保存<entry key="china" value="1###国内新闻" />这样的信息
	private Map<String , String> map;
	//保存<entry key="1" value="china###国内新闻" />这样的信息
	private Map<String , String> map1;
	
	public Map<String, String> getMap1() {
		return map1;
	}


	public void setMap1(Map<String, String> map1) {
		this.map1 = map1;
	}


	public Map<String, String> getMap() {
		return map;
	}


	public void setMap(Map<String, String> map) {
		this.map = map;
	}


	public String getJumpPage() {
		return jumpPage;
	}


	public void setJumpPage(String jumpPage) {
		this.jumpPage = jumpPage;
	}


	
	public NewsManager getNewsManager() {
		return newsManager;
	}


	public void setNewsManager(NewsManager newsManager) {
		this.newsManager = newsManager;
	}

	//处理newsAction.action?category=xxx
	public String execute() {
		//得到相应的    1###国内新闻
		String typeIdInfo = map.get(category);
		//这里得到的是新闻类别id
		Integer typeId = Integer.parseInt(typeIdInfo.split("###")[0]);
		//这里得到的是新闻类别字符串
		String typeString = typeIdInfo.split("###")[1];
		//将上面三个变量保存在session中，在jsp页面中显示
		this.getSession().setAttribute("category", category);
		this.getSession().setAttribute("typeString" , typeString);
		this.getSession().setAttribute("id", typeId);
		//跳转到pageAction中，处理分页
		return SUCCESS;
	}
	
	public String pageAction() {
		//取出新闻类别id
		Integer id = (Integer) this.getSession().getAttribute("id");
		//查看是不是第一次来分页，如果是，当前页设置成第一个
		if(jumpPage == null) {
			jumpPage = "1";
		}
		//从request范围内取出PageControl , 如为空，则第一次分页，创建pageControl对象
		PageControl pageControl  = (PageControl) this.getRequest().getAttribute("pageControl");
		if(pageControl == null) {
			pageControl = new PageControl();
			//第一次的时候得到相应新闻类别所对应的记录的总数
			pageControl.setMaxRowCount(newsManager.getItemCounts(id));
			//计算一共多少页
			pageControl.countMaxPage();
		}
		//设置jumpPage的值为当前页
		pageControl.setCurPage(Integer.parseInt(jumpPage));
		//计算出hibernate中firstResult的值
		int firstResult = (pageControl.getCurPage() - 1) * pageControl.getRowsPerPage() + 1;
		//设置hibernate中maxResult的值
		int maxResult = pageControl.getRowsPerPage();
		//利用hibernate得到当前页的数据，并保存在pageControl分页实体类中
		List<NewsItem> userList = newsManager.getNewsItemByFirstResultAndMaxResult(firstResult, maxResult , id);
		pageControl.setData(userList);
		//将分页实体类保存在request范围内。
		this.getRequest().setAttribute("pageControl", pageControl);
		//将页面视图跳转到result.jsp
		return SUCCESS;
	}
	
	public String showDetail() {
		//得到url中的?id=xxx
		String newsId = this.getRequest().getParameter("id");
		int id = Integer.parseInt(newsId);
		//使用hibernate得到具体id的新闻记录
		NewsItem item = newsManager.getNewsById(id);
		//得到id记录所对应的新闻类型的值   map1这种形式<entry key="1" value="china###国内新闻" />
		int typeId = newsManager.getNewsType(id);
		//得到china,添加到jsp页面的<a href="newsAction?category=">里面
		String category = map1.get("" + typeId).split("###")[0];
		//得到国内新闻，显示在jsp页面的多个位置
		String typeString = map1.get("" + typeId).split("###")[1];
		//将以上多个数据添加到request范围内，以便显示。
		this.getRequest().setAttribute("news", item);
		this.getRequest().setAttribute("category", category);
		this.getRequest().setAttribute("typeString", typeString);
		return SUCCESS;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}
	
}
