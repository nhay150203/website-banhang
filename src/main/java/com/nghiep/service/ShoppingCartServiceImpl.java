package com.nghiep.service;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;


import com.nghiep.entity.Item;
import com.nghiep.utils.DB;


//1. nhớ dùng @SessionScope
@SessionScope
@Service
public class ShoppingCartServiceImpl implements ShoppingCartService{
	//2. dùng HashMap 
	Map<Integer, Item> map = new HashMap<>();
	@Override
	public Item add(Integer id) {
		//3. thêm 1 món hàng dựa mả sản phẩm id
		
		//4. kiểm tra id đó có trong giỏ hàng chưa
		Item item = map.get(id);
		//5. nếu chưa có trong giỏ hàng
		if(item == null) {
			item = DB.items.get(id); //6. tạo 1 item
			item.setQty(1);  //7. số lượng là 1
			map.put(id, item); //8 thêm vào giỏ hàng
		} else {
			//9. ngược lại nếu có trong giỏ hàng rồi thì tăng số lượng lên 1
			item.setQty(item.getQty() + 1);
		}
		return item;
	}
	@Override
	public void remove(Integer id) {
		map.remove(id); //10. xóa 1 món hàng thì dựa vào id
	}
	@Override
	public Item update(Integer id, int quantity) {
		//11. cập nhật số lượng dựa id, qty
		Item item = map.get(id);
		item.setQty(quantity);
		return item;
	}
	@Override
	public void clear() {
		map.clear(); // xóa hết trong giỏ hàng
		
	}
	@Override
	public Collection<Item> getItems() {
		return map.values();  // lấy danh sách các món hàng trong giỏ hàng ra
	}
	@Override
	public int getCount() {
		return map.values().stream()
				.mapToInt(item -> item.getQty())
				.sum();
	}
	@Override
	public double getAmount() {
		return map.values().stream()
				.mapToDouble(item -> item.getPrice()*item.getQty())
				.sum();
	}
	@Override
	public int getAmountItem() {
		return map.size();
	}
}


