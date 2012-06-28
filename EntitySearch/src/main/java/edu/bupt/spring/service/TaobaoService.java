package edu.bupt.spring.service;

import edu.bupt.spring.entity.Product;
import edu.bupt.spring.entity.Shop;
import edu.bupt.spring.utils.JsonResponse;

/**
 * 淘宝接口
 * @author  linzhe
 * @Date    2012-6-10
 * @email   m23linzhe@gmail.com
 * @qq      398024808
 * @version 1.0
 *
 */
public interface TaobaoService {
	
	public JsonResponse<Product> getProductByUrl(String url);
	public JsonResponse<Shop> getShopByNick(String nick);
	

}