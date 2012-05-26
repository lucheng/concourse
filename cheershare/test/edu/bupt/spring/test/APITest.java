package edu.bupt.spring.test;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.taobao.api.ApiException;
import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.TaobaoClient;
import com.taobao.api.request.TaobaokeItemsDetailGetRequest;
import com.taobao.api.response.TaobaokeItemsDetailGetResponse;

import edu.bupt.spring.utils.APIUtils;
import edu.bupt.spring.utils.Constant;

public class APITest {
	
	private static final Logger logger = LoggerFactory.getLogger(APITest.class);
	
	public static void main(String[] args){
		
		String url = "http://detail.tmall.com/item.htm?id=14827259413";
		
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
		} catch (ApiException e) {
			logger.error("读取淘宝数据出错" + e.getMessage());
			// 出错返回 {"code":101}
		}
		
		JSONObject jsonObject = JSONObject.fromObject(responseStr);
//		JSONObject jsonObject = JSONObject.fromObject("{\"taobaoke_items_detail_get_response\":{\"taobaoke_item_details\":{\"taobaoke_item_detail\":[{\"click_url\":\"http:\\/\\/s.click.taobao.com\\/t_8?e=7HZ6jHSTbIWdFvalJxsYQscd03u0NBrBumtfRQjeQZFg52UFJpLUVRebFBShhZcX7c9jR5gnA3LG1OUd5XbvnOQ1%2FZ7n3ovIUQHKwcAfYvR%2BgAocNw%3D%3D&p=mm_18381334_0_0&n=19&spm=2014.12513803.1.0\",\"item\":{\"nick\":\"加乐多电器专营\",\"num_iid\":15304416468,\"title\":\"佳星电风扇 家用落地扇 落地式电扇 超静音海风系列风扇 特价包邮\"},\"seller_credit_score\":8,\"shop_click_url\":\"http:\\/\\/s.click.taobao.com\\/t_8?e=7HZ5x%2BOzfPH%2B5puIbuo8oHrn83vHontNlBXIFUTp1FYsipc0az90898atPospP6ym%2FGt4Y8UoCsR6og4WPquYyOFI2PnhRE%3D&p=mm_18381334_0_0&n=19&spm=2014.12513803.1.0\"}]},\"total_results\":1}}");
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
		jsonObj.put("photos", item_imgs);
		jsonObj.put("price", price);
		jsonObj.put("photos", item_imgs);
		jsonObj.put("productMerchant", productMerchant);
		jsonObj.put("from", click_url);
		jsonObj.put("targetSiteName", shop_click_url);

		productObj.put("product", jsonObj);
		
		logger.info(productObj.toString());
	}

}
