




import java.util.Date;

import org.hibernate.Session;

import com.fivewood.print.entity.Order;
import com.fivewood.print.entity.User;
import com.fivewood.print.hibernate.HibernateSessionFactory;


public class HibernateTest {

	/**
	 * @param args
	 */
    public static void main(String[] args) {
		HibernateTest ht = new HibernateTest();
		
		/*Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		session.save(new User("xy1", "abcd1234", "xy@xy.com"));
		session.getTransaction().commit();
		session.close();*/
		
		ht.addOrder();

	}
	
	public Integer addOrder() {
		Session session = HibernateSessionFactory.getSession();
		session.beginTransaction();
		Order order = new Order(100000002, 1, new Date());
		session.save(order);
		session.getTransaction().commit();
		session.close();
		return order.getId();
	}

}
