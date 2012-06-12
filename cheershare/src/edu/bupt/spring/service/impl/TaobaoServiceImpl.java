package edu.bupt.spring.service.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.taobao.api.ApiException;
import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.TaobaoClient;
import com.taobao.api.request.ShopGetRequest;
import com.taobao.api.request.TaobaokeItemsDetailGetRequest;
import com.taobao.api.response.ShopGetResponse;
import com.taobao.api.response.TaobaokeItemsDetailGetResponse;

import edu.bupt.spring.entity.Image;
import edu.bupt.spring.entity.Product;
import edu.bupt.spring.entity.Shop;
import edu.bupt.spring.service.ProductService;
import edu.bupt.spring.service.ShopService;
import edu.bupt.spring.service.TaobaoService;
import edu.bupt.spring.utils.APIUtils;
import edu.bupt.spring.utils.Constant;
import edu.bupt.spring.utils.JsonResponse;
import edu.bupt.spring.web.controller.ProductController;

/**
 * 淘宝接口实现
 * @author  linzhe
 * @Date    2012-6-10
 * @email   m23linzhe@gmail.com
 * @qq      398024808
 * @version 1.0
 *
 */

@Service
public class TaobaoServiceImpl implements TaobaoService {

	private static final Logger logger = LoggerFactory.getLogger(TaobaoServiceImpl.class);
	
	@Resource(name="shopServiceImpl")
	private ShopService shopService;
	
	@Resource(name="productServiceImpl")
	private ProductService productService;
	
	public JsonResponse<Product> getProductByUrl(String url) {
		
		TaobaoClient client = new DefaultTaobaoClient(Constant.url, Constant.appkey, Constant.appSecret);
		TaobaokeItemsDetailGetRequest req = new TaobaokeItemsDetailGetRequest();
		req.setFields("click_url,shop_click_url,seller_credit_score,num_iid,title,nick,price,pic_url,item_img");
		req.setNumIids(APIUtils.getId(url));
		req.setNick(Constant.nick);

		try {
			
			Product product = new Product();
			Set<Image> productImages = new HashSet<Image>();
//			Shop shop = new Shop();
			
			TaobaokeItemsDetailGetResponse response = client.execute(req);
			logger.info(response.getBody());
			
			JSONObject jsonObject = JSONObject.fromObject(response.getBody());
			JSONObject items_details = (JSONObject)jsonObject.get("taobaoke_items_detail_get_response");
			JSONObject items_detail = (JSONObject)items_details.get("taobaoke_item_details");
			JSONArray items_Array = JSONArray.fromObject(items_detail.get("taobaoke_item_detail"));     
			JSONObject item = (JSONObject)items_Array.get(0);
			
			JSONObject item_detail = (JSONObject)item.get("item");
			String click_url = item.getString("click_url");
			int seller_credit_score = item.getInt("seller_credit_score");
			String shop_click_url = item.getString("shop_click_url");
			
			String productName = item_detail.getString("title");
			Long num_iid = item_detail.getLong("num_iid");
			String nick = item_detail.getString("nick");
			double price = item_detail.getDouble("price");
			
			if(productService.findByNumiid(num_iid) == true){
				return new JsonResponse<Product>(product, JsonResponse.IS_EXIST);
			}
			
			
			JSONObject imgs = (JSONObject)item_detail.get("item_imgs");
			JSONArray imagesArray = (JSONArray)imgs.getJSONArray("item_img");
			
			for(int i = 0; i < imagesArray.length(); i++){  
				JSONObject image = (JSONObject) imagesArray.get(i);
				int position = image.getInt("position");
				String imagePath = (String)image.get("url");
//				logger.info(imagePath);
				productImages.add(new Image(product, imagePath, position));
            }
			
			
			Shop shop = shopService.findByNick(nick);
			if(shop == null){
				JsonResponse<Shop> json = getShopByNick(nick);
				shop = json.getObject();
			}
			
			product.setOriginUrl(url);
			product.setPrice(price);
			product.setName(productName);
			product.setUrl(click_url);
			product.setNum_iid(num_iid);
			
			product.setImages(productImages);
			product.setShop(shop);
			
			return new JsonResponse<Product>(product, JsonResponse.SUCCESS);
		} catch (ApiException e) {
			logger.error("读取淘宝数据出错" + e.getMessage());
			return new JsonResponse<Product>(JsonResponse.FAIL, e.getMessage());
		}
	}

	public JsonResponse<Shop> getShopByNick(String nick) {
		
		TaobaoClient client = new DefaultTaobaoClient(Constant.url, Constant.appkey, Constant.appSecret);
		ShopGetRequest req=new ShopGetRequest();
		req.setFields("sid,cid,title,nick,desc,bulletin,pic_path,created,modified");
		req.setNick(nick);
		ShopGetResponse response;
		try {
			response = client.execute(req);
			JSONObject jsonObject = JSONObject.fromObject(response.getBody());
			JSONObject shop_details = (JSONObject)jsonObject.get("shop_get_response");
			JSONObject shop_detail = (JSONObject)shop_details.get("shop");
			
			String title = shop_detail.getString("title");
			Long sid = shop_detail.getLong("sid");
			String pic_path = shop_detail.getString("pic_path");
			Long cid = shop_detail.getLong("cid");
			
			Shop shop = new Shop();
			
			shop.setCid(cid);
			shop.setNick(nick);
			shop.setPic_path("http://logo.taobao.com/shop-logo" + pic_path);
			shop.setTitle(title);
			shop.setSid(sid);
			
			return new JsonResponse<Shop>(shop, JsonResponse.SUCCESS);
		} catch (ApiException e) {
			logger.error("读取淘宝数据出错" + e.getMessage());
			e.printStackTrace();
			return new JsonResponse<Shop>(JsonResponse.FAIL, e.getMessage());
		}
	}
	
	public static void main(String[] args) throws ApiException{
		
		String nick = "相宜本草丽人丽妆";
		String url = "http://detail.tmall.com/item.htm?id=3997546494&ali_trackid=2:mm_18381334_0_0:1339323302_4z5_12233364";
		
		TaobaoService service = new TaobaoServiceImpl();
//		Shop shop = service.getShopByName(nick);
//		System.out.println(shop.getPic_path());
		
		service.getProductByUrl(url);
//		http://logo.taobao.com/shop-logo/a4/1e/T1exi_XkhaXXaCwpjX
	}

}