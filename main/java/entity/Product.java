package entity;

public class Product {
	
	private int number;
	private String title;
	private String seller;
	private int price;
	private String date;
	private String content;
	
	//이건 혹시몰라서
	private String buyer;
	private String status;
	private Boolean buy_confirm;
	private Boolean sell_confirm;
	
	//버튼처리용
	private Boolean seller_button;
	private Boolean confirm_button;
	private Boolean cancel_button;
	private Boolean request_button;
	private Boolean insert_button;
	private Boolean update_button;
	private Boolean delete_button;
	
	
	public Product() {
		
	}
	
	public Product(String title, int price, String content) {
		this.title=title;
		this.price=price;
		this.content=content;
	}
	
	
	public String getBuyer() {
		return buyer;
	}
	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Boolean getBuy_confirm() {
		return buy_confirm;
	}
	public void setBuy_confirm(Boolean buy_confirm) {
		this.buy_confirm = buy_confirm;
	}
	public Boolean getSell_confirm() {
		return sell_confirm;
	}
	public void setSell_confirm(Boolean sell_confirm) {
		this.sell_confirm = sell_confirm;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSeller() {
		return seller;
	}
	public void setSeller(String seller) {
		this.seller = seller;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Boolean getSeller_button() {
		return seller_button;
	}
	public void setSeller_button(Boolean seller_button) {
		this.seller_button = seller_button;
	}
	public Boolean getConfirm_button() {
		return confirm_button;
	}
	public void setConfirm_button(Boolean confirm_button) {
		this.confirm_button = confirm_button;
	}
	public Boolean getCancel_button() {
		return cancel_button;
	}
	public void setCancel_button(Boolean cancel_button) {
		this.cancel_button = cancel_button;
	}
	public Boolean getRequest_button() {
		return request_button;
	}
	public void setRequest_button(Boolean request_button) {
		this.request_button = request_button;
	}
	public Boolean getInsert_button() {
		return insert_button;
	}
	public void setInsert_button(Boolean insert_button) {
		this.insert_button = insert_button;
	}
	public Boolean getUpdate_button() {
		return update_button;
	}
	public void setUpdate_button(Boolean update_button) {
		this.update_button = update_button;
	}
	public Boolean getDelete_button() {
		return delete_button;
	}
	public void setDelete_button(Boolean delete_button) {
		this.delete_button = delete_button;
	}
	
}
