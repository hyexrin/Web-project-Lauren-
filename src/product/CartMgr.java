package product;

import java.util.Hashtable;

public class CartMgr {

    private Hashtable hCart = new Hashtable();

    public CartMgr() {
    }

    public void addCart(OrderBean order) {
        String product_no = order.getProduct_no();
        int quantity = order.getQuantity();
        if (quantity > 0) {
            if (hCart.containsKey(product_no)) {
                OrderBean tempOrder = (OrderBean) hCart.get(product_no);
                quantity += tempOrder.getQuantity();
                tempOrder.setQuantity(quantity);
                hCart.put(product_no, tempOrder);
            } else {
                hCart.put(product_no, order);
            }
        }
    }

    public Hashtable getCartList() {
        return hCart;
    }

    public void updateCart(OrderBean order) {
        String product_no = order.getProduct_no();
        hCart.put(product_no, order);
    }


    public void deleteCart(OrderBean order) {
        String product_no = order.getProduct_no();
        hCart.remove(product_no);
    }

}