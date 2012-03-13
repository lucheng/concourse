package com.happiness.client.common;

import java.util.ArrayList;
import java.util.List;

import com.google.gwt.core.client.GWT;
import com.google.gwt.http.client.Request;
import com.google.gwt.http.client.RequestCallback;
import com.google.gwt.http.client.Response;
import com.google.gwt.json.client.JSONException;
import com.google.gwt.json.client.JSONParser;
import com.google.gwt.json.client.JSONValue;
import com.google.gwt.user.client.ui.Button;
import com.google.gwt.user.client.ui.ClickListener;
import com.google.gwt.user.client.ui.FormPanel;
import com.google.gwt.user.client.ui.FormPanel.SubmitCompleteEvent;
import com.google.gwt.user.client.ui.FormPanel.SubmitEvent;
import com.google.gwt.user.client.ui.FormPanel.SubmitHandler;
import com.google.gwt.user.client.ui.HorizontalPanel;
import com.google.gwt.user.client.ui.TextBox;
import com.google.gwt.user.client.ui.Widget;
import com.smartgwt.client.data.DataSource;
import com.smartgwt.client.data.DataSourceField;
import com.smartgwt.client.data.fields.DataSourceImageField;
import com.smartgwt.client.types.Alignment;
import com.smartgwt.client.types.FieldType;
import com.smartgwt.client.types.SelectionType;
import com.smartgwt.client.types.Visibility;
import com.smartgwt.client.util.SC;
import com.smartgwt.client.widgets.IButton;
import com.smartgwt.client.widgets.Window;
import com.smartgwt.client.widgets.events.ClickEvent;
import com.smartgwt.client.widgets.events.ClickHandler;
import com.smartgwt.client.widgets.events.CloseClickEvent;
import com.smartgwt.client.widgets.events.CloseClickHandler;
import com.smartgwt.client.widgets.grid.ListGrid;
import com.smartgwt.client.widgets.layout.HLayout;
import com.smartgwt.client.widgets.layout.VLayout;
import com.smartgwt.client.widgets.tile.TileGrid;
import com.smartgwt.client.widgets.tile.events.RecordClickEvent;
import com.smartgwt.client.widgets.tile.events.RecordClickHandler;
import com.smartgwt.client.widgets.tile.events.RecordDoubleClickEvent;
import com.smartgwt.client.widgets.tile.events.RecordDoubleClickHandler;
import com.smartgwt.client.widgets.viewer.DetailViewerField;

public class ImageViewAndSelectWindow extends Window{
  boolean firstTimeViewingListGrid = true; 
  TileGrid mediaTileGrid = new TileGrid();  
  ListGrid mediaListGrid = new ListGrid();  
  String imageLocation="catalog";
//  String imageLocation="catalog";
  String uploadServiceUrl;
  String imageFetchServiceUrl;
  String selectedImgPath="";
  
  public static interface CloseHandler{
    void onClosed(String message);
  }
  private List<CloseHandler> closeHandlers=new ArrayList<CloseHandler>();
  public void addCloseHandler(CloseHandler handler){
    closeHandlers.add(handler);
  }
  public void removeHandler(CloseHandler handler){
    closeHandlers.remove(handler);
  }
  protected void fireCloseEvent(String message){
    for(CloseHandler handler:closeHandlers)
      handler.onClosed(message);
  }
  
  public ImageViewAndSelectWindow(String imgPath,String fetchImgUrl,String uploadUrl){
    uploadServiceUrl=uploadUrl;
    imageFetchServiceUrl=fetchImgUrl;
    imageLocation=imgPath;
    setWidth(800);  
    setHeight(435);  
    setTitle("图片选择工具");  
    setShowMinimizeButton(false);  
    setIsModal(true);  
    setShowModalMask(true);  
    //centerInPage();  
    setShowFooter(true);
    addCloseClickHandler(new CloseClickHandler() {  

		@Override
		public void onCloseClick(CloseClickEvent event) {
			
			destroy();  
            fireCloseEvent(selectedImgPath);
		}
    });  
    drawSelectForm();
    
    IButton okButton = new IButton("确定");
    okButton.addClickHandler(new ClickHandler() {
      public void onClick(ClickEvent event) {
        destroy();
        fireCloseEvent(selectedImgPath);
      }
    });
    
    IButton cancleButton = new IButton("取消");
    cancleButton.addClickHandler(new ClickHandler() {
      public void onClick(ClickEvent event) {
        destroy();
      }
    });

  
    HLayout hlayout = new HLayout(15);
    hlayout.setAlign(Alignment.CENTER);
    hlayout.addMember(okButton);
    hlayout.addMember(cancleButton);
    addItem(hlayout);
    
    
  }
  @SuppressWarnings("deprecation")
private FormPanel createUploadingForm() {
    final FormPanel form = new FormPanel();
    form.setAction(uploadServiceUrl+"?imagePath="+imageLocation);
    //form.setAction("http://127.0.0.1:8080/productmng/control/uploadImage?imagePath=images/"+imageLocation);

    // Because we're going to add a FileUpload widget, we'll need to set the
    // form to use the POST method, and multipart MIME encoding.
    form.setEncoding(FormPanel.ENCODING_MULTIPART);
    form.setMethod(FormPanel.METHOD_POST);
    
    // Create a panel to hold all of the form widgets.
    HorizontalPanel panel = new HorizontalPanel();
    panel.setSpacing(8);
    form.setWidget(panel);
    panel.setWidth("100%");
    // Create a TextBox, giving it a name so that it will be submitted.
    final TextBox tb = new TextBox();
    tb.setWidth("20%");
    tb.setName("imagePath");
    tb.setEnabled(false);
    //panel.add(tb);

    
    // Create a FileUpload widget.
    final com.google.gwt.user.client.ui.FileUpload upload = new com.google.gwt.user.client.ui.FileUpload();
    upload.setName("uploadFormElement");
    panel.add(upload);

    // Add a 'submit' button.
    panel.add(new Button("上传图片", new ClickListener() {
      public void onClick(Widget sender) {
        form.submit();
      }
    }));

    form.addSubmitHandler(new SubmitHandler() {

		@Override
		public void onSubmit(SubmitEvent event) {

			if (upload.getFilename().length() == 0) {
				SC.say("必须选择一个图片文件再上传");
				event.cancel();
			} else if (!upload.getFilename().endsWith(".jpg")
					&& !upload.getFilename().endsWith(".gif")
					&& !upload.getFilename().endsWith(".png")
					&& !upload.getFilename().endsWith(".JPG")
					&& !upload.getFilename().endsWith(".GIF")
					&& !upload.getFilename().endsWith(".PNG")) {
				SC.say("只能上传 JPG,GIF,PNG 等后缀的图片文件！");
				event.cancel();
			}
		}

	});

    form.addSubmitCompleteHandler(new FormPanel.SubmitCompleteHandler() {
      public void onSubmitComplete(SubmitCompleteEvent event) {
        // When the form submission is successfully completed, this event is
        // fired. Assuming the service returned a response of type text/html,
        // we can get the result text here (see the FormPanel documentation for
        // further explanation).
//        com.google.gwt.user.client.Window.alert("上传文件成功:" + event.getResults());
        mediaTileGrid.invalidateCache();
        mediaTileGrid.fetchData();
        String filename = event.getResults();
        filename = filename.substring(filename.lastIndexOf("images/"), filename.length()-2);
        selectedImgPath = filename;
      }
    });

    return form;
}
  private void drawSelectForm(){
    imageDatasource dataSource = new imageDatasource();  
    
    /*final DynamicForm uploadForm = new DynamicForm();  
    uploadForm.setWidth100();  
    uploadForm.setNumCols(3);  
    uploadForm.setColWidths(60, 200, "*");  
    uploadForm.setSaveOnEnter(true);  
      
    
     
    uploadForm.setFields(searchTitleItem, searchSearchItem); 
    uploadForm.addSubmitValuesHandler(new SubmitValuesHandler() {

      public void onSubmitValues(SubmitValuesEvent event) {
        if (uploadForm.validate()) {
          uploadForm.saveData(new UploadJSONResponseCallbackr() {
            public void execute(DSResponse response,
                Object rawData, DSRequest request) {
              DeferredCommand.addCommand(new Command() {
                public void execute() {
                  //winModal.destroy();
                }
              });
            }
          });
        }
      }
    });*/

    IButton viewAsTiles = new IButton("图标显示");  
    viewAsTiles.setAutoFit(true);  
    viewAsTiles.setIcon("silk/application_view_tile.png");  
    viewAsTiles.addToRadioGroup("views"); 
    viewAsTiles.setSelected(true);
    viewAsTiles.setActionType(SelectionType.CHECKBOX);  
    viewAsTiles.addClickHandler(new com.smartgwt.client.widgets.events.ClickHandler() {  
        public void onClick(com.smartgwt.client.widgets.events.ClickEvent event) {  
            mediaTileGrid.show();  
            mediaListGrid.hide();  
        }  
    });  
      
    IButton viewAsList = new IButton("列表显示");  
    viewAsList.setAutoFit(true);  
    viewAsList.setIcon("silk/application_view_detail.png");  
    viewAsList.addToRadioGroup("views");  
    viewAsList.setActionType(SelectionType.CHECKBOX);  
      
    viewAsList.addClickHandler(new com.smartgwt.client.widgets.events.ClickHandler() {  
        public void onClick(com.smartgwt.client.widgets.events.ClickEvent event) {  
            if (firstTimeViewingListGrid) {  
                firstTimeViewingListGrid = false;  
                mediaListGrid.setData(mediaTileGrid.getResultSet());  
            }  
            mediaTileGrid.hide();  
            mediaListGrid.show();  
        }  
    });  
      
      
    HLayout buttons = new HLayout(15);  
    buttons.setWidth100();  
    //buttons.setAlign(VerticalAlignment.CENTER);
    buttons.setPadding(5);
    //final Label pathinfo=new Label("选择图片："+imageLocation);
    //pathinfo.setWidth100();
    buttons.setMembers(viewAsTiles, viewAsList);  
      
    mediaTileGrid.setWidth100();  
    mediaTileGrid.setHeight(220);  
    mediaTileGrid.setTileWidth(150);  
    mediaTileGrid.setTileHeight(150);  
    mediaTileGrid.setDataSource(dataSource);  
    mediaTileGrid.setAutoFetchData(true);  
    mediaTileGrid.addRecordClickHandler(new RecordClickHandler() {
      public void onRecordClick(RecordClickEvent event) {
        setStatus("选中图片："+event.getRecord().getAttribute("imageName"));
        selectedImgPath=imageLocation+"/"+event.getRecord().getAttribute("imageName");
      }
  });
    
    mediaTileGrid.addRecordDoubleClickHandler(new RecordDoubleClickHandler() {
      public void onRecordDoubleClick(RecordDoubleClickEvent event) {
        setStatus(event.getRecord().getAttribute("imageName"));
        selectedImgPath=imageLocation+"/"+event.getRecord().getAttribute("imageName");
        destroy();
        fireCloseEvent(selectedImgPath);
      }
  });
    DetailViewerField pictureField = new DetailViewerField("picture");  
    pictureField.setImageWidth(100);
    pictureField.setImageHeight(100);
    DetailViewerField commonNameField = new DetailViewerField("imageName");
    mediaTileGrid.setFields(pictureField,commonNameField);
      
    mediaListGrid.setWidth100();  
    mediaListGrid.setHeight(220);  
    mediaListGrid.setAlternateRecordStyles(true);  
    mediaListGrid.setDataSource(dataSource);  
    mediaListGrid.setVisibility(Visibility.HIDDEN);  
    mediaListGrid.addRecordClickHandler(new com.smartgwt.client.widgets.grid.events.RecordClickHandler() {
      public void onRecordClick(com.smartgwt.client.widgets.grid.events.RecordClickEvent event) {
        setStatus("选中图片："+event.getRecord().getAttribute("imageName"));
        selectedImgPath=imageLocation+"/"+event.getRecord().getAttribute("imageName");
      }
  });
    
    mediaListGrid.addRecordDoubleClickHandler(new com.smartgwt.client.widgets.grid.events.RecordDoubleClickHandler() {
      public void onRecordDoubleClick(com.smartgwt.client.widgets.grid.events.RecordDoubleClickEvent event) {
        setStatus(event.getRecord().getAttribute("imageName"));
        selectedImgPath=imageLocation+"/"+event.getRecord().getAttribute("imageName");
        destroy();
        fireCloseEvent(selectedImgPath);
      }
  });
      
    VLayout resultsLayout = new VLayout();  
    //resultsLayout.setLeft(350);  
    resultsLayout.setWidth100();  
    resultsLayout.setHeight100();  
    resultsLayout.setMembers( buttons, mediaTileGrid, mediaListGrid);  
    this.addItem(resultsLayout);
    this.addItem(createUploadingForm());
    //resultsLayout.draw();  
  }
  
  private class imageDatasource extends DataSource{
    public imageDatasource(){
      String url=imageFetchServiceUrl+"?imagePath="+imageLocation;
      setDataURL(url);  
      //setDataURL("data/images.xml");   
      setRecordXPath("/list/image");
      DataSourceImageField thumbnail = new DataSourceImageField("picture", "图标");  
      //thumbnail.setWidth(150);  
      //thumbnail.setImageHeight("300");  
      //thumbnail.setImageWidth("300");  
      thumbnail.setValueXPath("picture");
      thumbnail.setImageURLPrefix(GWT.getHostPageBaseURL() + "/");
//      thumbnail.setImageURLSuffix(".jpg");
  
   
  
      DataSourceField title = new DataSourceField("imageName", FieldType.TEXT);  
      title.setTitle("文件名");
      
  
      setFields(thumbnail,title);
      

    }
  }
  private static class UploadJSONResponseCallbackr implements RequestCallback {
    public UploadJSONResponseCallbackr(){
    }
    public void onError(Request request, Throwable exception) {
      SC.warn("发起服务请求出错:"+exception.toString());
    }

    public void onResponseReceived(Request request, Response response) {
      if(response.getStatusCode()==200){
        String responseText = response.getText();
        //responseText="{\"response\":[{\"prodCatalogId\":\"测试目录\",\"catalogName\":\"测试的目录\",\"useQuickAdd\":\"Y\",\"styleSheet\":null,\"headerLogo\":null,\"contentPathPrefix\":null,\"templatePathPrefix\":null,\"viewAllowPermReqd\":null,\"purchaseAllowPermReqd\":null,\"lastUpdatedStamp\":{\"date\":6,\"day\":4,\"hours\":11,\"minutes\":25,\"month\":0,\"nanos\":31000000,\"seconds\":39,\"time\":1294284339031,\"timezoneOffset\":-480,\"year\":111},\"lastUpdatedTxStamp\":{\"date\":6,\"day\":4,\"hours\":11,\"minutes\":25,\"month\":0,\"nanos\":31000000,\"seconds\":37,\"time\":1294284337031,\"timezoneOffset\":-480,\"year\":111},\"createdStamp\":{\"date\":6,\"day\":4,\"hours\":11,\"minutes\":25,\"month\":0,\"nanos\":31000000,\"seconds\":39,\"time\":1294284339031,\"timezoneOffset\":-480,\"year\":111},\"createdTxStamp\":{\"date\":6,\"day\":4,\"hours\":11,\"minutes\":25,\"month\":0,\"nanos\":31000000,\"seconds\":37,\"time\":1294284337031,\"timezoneOffset\":-480,\"year\":111}},{\"prodCatalogId\":\"GoogleCatalog\",\"catalogName\":\"Google Catalog\",\"useQuickAdd\":null,\"styleSheet\":null,\"headerLogo\":null,\"contentPathPrefix\":null,\"templatePathPrefix\":null,\"viewAllowPermReqd\":null,\"purchaseAllowPermReqd\":null,\"lastUpdatedStamp\":{\"date\":6,\"day\":4,\"hours\":11,\"minutes\":25,\"month\":0,\"nanos\":799000000,\"seconds\":39,\"time\":1294284339799,\"timezoneOffset\":-480,\"year\":111},\"lastUpdatedTxStamp\":{\"date\":6,\"day\":4,\"hours\":11,\"minutes\":25,\"month\":0,\"nanos\":31000000,\"seconds\":37,\"time\":1294284337031,\"timezoneOffset\":-480,\"year\":111},\"createdStamp\":{\"date\":6,\"day\":4,\"hours\":11,\"minutes\":25,\"month\":0,\"nanos\":799000000,\"seconds\":39,\"time\":1294284339799,\"timezoneOffset\":-480,\"year\":111},\"createdTxStamp\":{\"date\":6,\"day\":4,\"hours\":11,\"minutes\":25,\"month\":0,\"nanos\":31000000,\"seconds\":37,\"time\":1294284337031,\"timezoneOffset\":-480,\"year\":111}},{\"prodCatalogId\":\"RentalCatalog\",\"catalogName\":\"Rental Catalog\",\"useQuickAdd\":\"N\",\"styleSheet\":null,\"headerLogo\":null,\"contentPathPrefix\":null,\"templatePathPrefix\":null,\"viewAllowPermReqd\":null,\"purchaseAllowPermReqd\":null,\"lastUpdatedStamp\":{\"date\":6,\"day\":4,\"hours\":11,\"minutes\":26,\"month\":0,\"nanos\":500000000,\"seconds\":8,\"time\":1294284368500,\"timezoneOffset\":-480,\"year\":111},\"lastUpdatedTxStamp\":{\"date\":6,\"day\":4,\"hours\":11,\"minutes\":26,\"month\":0,\"nanos\":828000000,\"seconds\":7,\"time\":1294284367828,\"timezoneOffset\":-480,\"year\":111},\"createdStamp\":{\"date\":6,\"day\":4,\"hours\":11,\"minutes\":26,\"month\":0,\"nanos\":500000000,\"seconds\":8,\"time\":1294284368500,\"timezoneOffset\":-480,\"year\":111},\"createdTxStamp\":{\"date\":6,\"day\":4,\"hours\":11,\"minutes\":26,\"month\":0,\"nanos\":828000000,\"seconds\":7,\"time\":1294284367828,\"timezoneOffset\":-480,\"year\":111}},{\"prodCatalogId\":\"TestCatalog\",\"catalogName\":\"Test Catalog\",\"useQuickAdd\":\"N\",\"styleSheet\":null,\"headerLogo\":null,\"contentPathPrefix\":null,\"templatePathPrefix\":null,\"viewAllowPermReqd\":null,\"purchaseAllowPermReqd\":null,\"lastUpdatedStamp\":{\"date\":6,\"day\":4,\"hours\":11,\"minutes\":25,\"month\":0,\"nanos\":32000000,\"seconds\":39,\"time\":1294284339032,\"timezoneOffset\":-480,\"year\":111},\"lastUpdatedTxStamp\":{\"date\":6,\"day\":4,\"hours\":11,\"minutes\":25,\"month\":0,\"nanos\":31000000,\"seconds\":37,\"time\":1294284337031,\"timezoneOffset\":-480,\"year\":111},\"createdStamp\":{\"date\":6,\"day\":4,\"hours\":11,\"minutes\":25,\"month\":0,\"nanos\":32000000,\"seconds\":39,\"time\":1294284339032,\"timezoneOffset\":-480,\"year\":111},\"createdTxStamp\":{\"date\":6,\"day\":4,\"hours\":11,\"minutes\":25,\"month\":0,\"nanos\":31000000,\"seconds\":37,\"time\":1294284337031,\"timezoneOffset\":-480,\"year\":111}},{\"prodCatalogId\":\"eBayCatalog\",\"catalogName\":\"eBay Catalog\",\"useQuickAdd\":\"Y\",\"styleSheet\":null,\"headerLogo\":null,\"contentPathPrefix\":null,\"templatePathPrefix\":null,\"viewAllowPermReqd\":null,\"purchaseAllowPermReqd\":null,\"lastUpdatedStamp\":{\"date\":6,\"day\":4,\"hours\":11,\"minutes\":25,\"month\":0,\"nanos\":878000000,\"seconds\":39,\"time\":1294284339878,\"timezoneOffset\":-480,\"year\":111},\"lastUpdatedTxStamp\":{\"date\":6,\"day\":4,\"hours\":11,\"minutes\":25,\"month\":0,\"nanos\":31000000,\"seconds\":37,\"time\":1294284337031,\"timezoneOffset\":-480,\"year\":111},\"createdStamp\":{\"date\":6,\"day\":4,\"hours\":11,\"minutes\":25,\"month\":0,\"nanos\":878000000,\"seconds\":39,\"time\":1294284339878,\"timezoneOffset\":-480,\"year\":111},\"createdTxStamp\":{\"date\":6,\"day\":4,\"hours\":11,\"minutes\":25,\"month\":0,\"nanos\":31000000,\"seconds\":37,\"time\":1294284337031,\"timezoneOffset\":-480,\"year\":111}}],\"total\":1,\"success\":true}";
        try {
          JSONValue jsonValue = JSONParser.parse(responseText);
          
          
        } catch (JSONException e) {
          SC.warn("解析数据出错:"+e.toString());
        }
      }
      else{
        SC.warn("后台服务调用出错："+"错误码为："+response.getStatusCode());
      }
    }
  }
}
