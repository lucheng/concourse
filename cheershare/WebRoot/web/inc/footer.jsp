<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div class="footer" id="footer">
		<a class="guangLink" href="http://guang.com/"></a>
		<div class="footer-nav clearfix">
			<dl class="about">
				<dt>关于我们</dt>
				<dd><a href="http://guang.com/aboutus" target="_blank">关于逛</a></dd>
				<dd><a href="http://blog.guang.com/joinus/" target="_blank">加入我们</a></dd>
				<dd><a href="http://guang.com/contact" target="_blank">合作联系</a></dd>
				<dd><a href="http://site.douban.com/widget/board/5901738/" target="_blank">提建议</a></dd>
			</dl>
			<dl class="followus">
				<dt>关注我们</dt>
				<dd><a class="f-Qzone" href="http://user.qzone.qq.com/2408899511" target="_blank">QQ空间</a></dd>
				<dd><a class="f-sina" href="http://weibo.com/guang" target="_blank">新浪微博</a></dd>
				<dd><a class="f-tencent" href="http://t.qq.com/iguang2011" target="_blank">腾讯微博</a></dd>
				<dd><a class="f-douban" href="http://site.douban.com/134349/" target="_blank">豆瓣</a></dd>
			</dl>
			<dl class="friendlinks">
				<dt>友情链接<a class="ml10 fs12" href="/common/friends" target="_blank">更多…</a></dt>
						<dd style="position: absolute; left: -4000px; "><a href="http://www.ny1988.com/" target="_blank">女友网</a></dd>
						<dd><a href="http://guoku.com/" target="_blank">果库</a></dd>
						<dd><a href="http://www.duitang.com/" target="_blank">堆糖网</a></dd> 
						<dd><a href="http://donews.com/" target="_blank">Donews</a></dd>
						<dd style="position: absolute; left: -4000px; "><a href="http://www.5w.com/" target="_blank">5W网</a></dd>
						<dd style="position: absolute; left: -4000px; "><a href="http://hitao.com/" target="_blank">嗨淘网</a></dd>
						<dd style="position: absolute; left: -4000px; "><a href="http://www.19lou.com/" target="_blank">19lou</a></dd>
						<dd style="position: absolute; left: -4000px; "><a href="http://info.china.alibaba.com/" target="_blank">阿里巴巴</a></dd>
						<dd style="position: absolute; left: -4000px; "><a href="http://zj.sina.com.cn/" target="_blank">新浪浙江</a></dd>
						<dd><a href="http://www.yupsky.com/" target="_blank">潮人网</a></dd>			
						<dd style="position: absolute; left: -4000px; "><a href="http://www.1626.com/" target="_blank">1626潮流网</a></dd>
						<dd style="position: absolute; left: -4000px; "><a href="http://www.julemai.com/" target="_blank">聚乐买</a></dd>
						<dd style="position: absolute; left: -4000px; "><a href="http://www.onlylady.com/" target="_blank">Onlylady女人志</a></dd>
						<dd style="position: absolute; left: -4000px; "><a href="http://www.womai.com/" target="_blank">中粮我买网</a></dd>
						<dd style="position: absolute; left: -4000px; "><a href="http://www.chenguangblog.com/" target="_blank">晨光博客</a></dd>
						<dd style="position: absolute; left: -4000px; "><a href="http://www.poboo.com/" target="_blank">poboo</a></dd>
						<dd><a href="http://www.tuolar.com/" target="_blank">拖拉网</a></dd>
						<dd style="position: absolute; left: -4000px; "><a href="http://www.maichawang.com/" target="_blank">买茶网</a></dd>
						<dd><a href="http://www.nvsheng.com/" target="_blank">女生闺蜜坊</a></dd>
						<dd style="position: absolute; left: -4000px; "><a href="http://www.q68.com/" target="_blank">丰胸方法</a></dd>
						<dd style="position: absolute; left: -4000px; "><a href="http://www.sahu.net/" target="_blank">啥狐女人网</a></dd>
						<dd style="position: absolute; left: -4000px; "><a href="http://www.meiguici.com/" target="_blank">玫瑰刺女性网</a></dd>
						<dd><a href="http://www.baixiangxiang.com/" target="_blank">白相相</a></dd>	
						<dd style="position: absolute; left: -4000px; "><a href="http://beauty.familydoctor.com.cn/" target="_blank">家庭医生美容</a></dd>						 
						<dd><a href="http://www.memejie.com/" target="_blank">服饰搭配</a></dd>						 
						<dd><a href="http://www.qianjiao.cn/" target="_blank">千娇女性网</a></dd>
						<dd style="position: absolute; left: -4000px; "><a href="http://www.piaoliang.com/" target="_blank">漂亮女人</a></dd>						 
						<dd><a href="http://www.bianzhirensheng.com/" target="_blank">编织人生</a></dd>						 
						<dd><a href="http://www.jianfei.com/" target="_blank">中国减肥网</a></dd>						 
						<dd><a href="http://www.modeko.cn/" target="_blank">人物摄影</a></dd>
						<dd style="position: absolute; left: -4000px; "><a href="http://www.tu6.cn/" target="_blank">桌面壁纸</a></dd>						 
						<dd style="position: absolute; left: -4000px; "><a href="http://www.doudou.com/" target="_blank">豆豆网</a></dd>						 
 					 
			</dl>
		</div>
		<p class="cp">Copyright ©2011-2012 Guang.com, All Rights Reserved. 浙ICP备11008561-3</p>
	</div>
	<a id="returnTop" href="javascript:;" style="display: none; ">回到顶部</a>

	<script type="text/javascript">
			var photo = "user/15/20/109/1092015_21434397695211092015_50x50.jpg";
			if(photo == ""){
				photo = "http://static.guang.com/images/user/photo/avatar-50.png";
			}else{
				photo = "http://img.guang.com/"+photo;
			}
			GUANGER = { 
				userId:"1092015",
				userPhoto:photo,
				nick:"我是林哲_7896",
				path:"<%=path%>",
				isBlack: "",
				checkInTotalScore: "", 
				checkInDays: "",
				referer : ""
			}
		</script>