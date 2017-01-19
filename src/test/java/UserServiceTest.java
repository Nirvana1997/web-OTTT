import cn.sq.domain.User;
import cn.sq.exception.*;
import cn.sq.service.serviceImpl.UserServiceImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * Created by qianzhihao on 2017/1/18.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-*.xml"})
public class UserServiceTest {
    @Autowired
    private UserServiceImpl userService;
    //此处直接使用UserService的实现类，主要是方便抛出异常，然后异常出现时候可以针对性的处理

    @Test
    public void testAdd() {
        User user = new User();
        try {
            userService.add(user);
        } catch (UserCanNotBeNullException e) {
            //用户不能为空异常抛出
            e.printStackTrace();
        } catch (UserNameCanNotBeNullException e) {
            //用户名不能为空
            e.printStackTrace();
        } catch (UserPwdCanNotBeNullException e) {
            //用户密码不能为空
            e.printStackTrace();
        } catch (UserAlreadyExistException e) {
            //用户存在抛出
            e.printStackTrace();
        } catch (OtherThingsException e) {
            e.printStackTrace();
        }
    }
}
