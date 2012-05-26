package edu.bupt.spring.web.controller;

import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.taobao.api.ApiException;
import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.TaobaoClient;
import com.taobao.api.request.TaobaokeItemsDetailGetRequest;
import com.taobao.api.response.TaobaokeItemsDetailGetResponse;

import edu.bupt.spring.entity.Product;
import edu.bupt.spring.utils.APIUtils;
import edu.bupt.spring.utils.Constant;

/**
 * 
 * @author linzhe
 * @Date 2012-5-25
 * @email m23linzhe@gmail.com
 * @qq 398024808
 * @version 1.0
 * 
 */
@Controller("apiController")
public class APIController {

	private static final Logger logger = LoggerFactory
			.getLogger(AdminController.class);

	@RequestMapping(value = "/api/findProduct", method = { RequestMethod.POST })
	@ResponseBody
	public String menuSetting(@RequestParam String url) {

		logger.info(url);

		String responseStr = "";

		TaobaoClient client = new DefaultTaobaoClient(Constant.url,
				Constant.appkey, Constant.appSecret);
		TaobaokeItemsDetailGetRequest req = new TaobaokeItemsDetailGetRequest();
		req.setFields("click_url,shop_click_url,seller_credit_score,num_iid,title,nick,price,pic_url,item_img");
		req.setNumIids(APIUtils.getId(url));
		req.setNick(Constant.nick);

		try {
			TaobaokeItemsDetailGetResponse response = client.execute(req);
			logger.info(response.getBody());
			responseStr = response.getBody();
			
			JSONObject jsonObject = JSONObject.fromObject(responseStr);
			JSONObject items_details = (JSONObject)jsonObject.get("taobaoke_items_detail_get_response");
			JSONObject items_detail = (JSONObject)items_details.get("taobaoke_item_details");
			JSONArray items_Array = JSONArray.fromObject(items_detail.get("taobaoke_item_detail"));     
			JSONObject item = (JSONObject)items_Array.get(0);
			
			JSONObject item_detail = (JSONObject)item.get("item");
			String click_url = item.get("click_url").toString();
			String shop_click_url = item.get("shop_click_url").toString();
			
			String productName = item_detail.get("title").toString();
			String productMerchant = item_detail.get("nick").toString();
			String num_iid = item_detail.get("num_iid").toString();
			String price = item_detail.get("price").toString();
			
			JSONObject imgs = (JSONObject)item_detail.get("item_imgs");
			JSONArray item_imgs = (JSONArray)imgs.get("item_img");
			
			JSONObject productObj = new JSONObject();
			
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("url", url);
			jsonObj.put("productName", productName);
			jsonObj.put("price", price);
			jsonObj.put("photos", item_imgs);
			jsonObj.put("productMerchant", productMerchant);
			jsonObj.put("from", click_url);
			jsonObj.put("targetSiteName", shop_click_url);
			jsonObj.put("collectionNumber", 1);
			jsonObj.put("commentNumber", 0);
			jsonObj.put("editFirst", false);
			jsonObj.put("skipPhotos", false);
			jsonObj.put("skipPhotos", false);
			jsonObj.put("likeNumber", 0);

			productObj.put("code", 100);
			productObj.put("product", jsonObj);
			
			// {"product":{"tags":null,"url":"http://detail.tmall.com/item.htm?id=14827259413","proComment":null,"productName":"沁园净水器 家用直饮厨房 QG-U1-17 净水器水龙 正品包邮","productMerchant":"加乐多电器专营","proId":null,"photos":["http://img04.taobaocdn.com/bao/uploaded/i4/T1vnTbXgXjXXX8SYM5_055112.jpg_310x310.jpg","http://img03.taobaocdn.com/imgextra/i3/820476625/T2lxSyXaXaXXXXXXXX_!!820476625.jpg_310x310.jpg","http://img02.taobaocdn.com/imgextra/i2/820476625/T244myXl4aXXXXXXXX_!!820476625.jpg_310x310.jpg","http://img02.taobaocdn.com/imgextra/i2/820476625/T2YxyyXhpaXXXXXXXX_!!820476625.jpg_310x310.jpg","http://img04.taobaocdn.com/imgextra/i4/820476625/T2HhGyXedaXXXXXXXX_!!820476625.jpg_310x310.jpg"],"likeNumber":0,"creatorId":null,"inLibState":null,"saveType":null,"productRecommend":null,"categorys":null,"specialTags":null,"mtime":null,"brand":null,"loverIds":null,"typeVO":null,"statusVO":null,"collectionNumber":1,"commentNumber":0,"targetSiteName":null,"salesVolume":0,"price":298.0,"editor":null,"publishType":null,"featureTags":null,"functionTags":null,"personTags":null,"otherTags":null,"productVoId":null,"favor":null,"pictures":null,"editFirst":false,"skipPhotos":false,"from":null,"lovers":null},"code":100}

			return productObj.toString();
		} catch (ApiException e) {
			logger.error("读取淘宝数据出错" + e.getMessage());
			JSONObject productObj = new JSONObject();
			productObj.put("code", 101);
			return productObj.toString();
		}
		
		
	}

}
