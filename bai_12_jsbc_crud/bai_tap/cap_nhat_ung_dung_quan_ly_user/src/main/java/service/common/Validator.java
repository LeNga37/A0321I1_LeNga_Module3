package service.common;

import repository.UserRepository;
import repository.impl.UserRepositoryImpl;

public class Validator {
   static UserRepository userRepository = new UserRepositoryImpl();
    public static String ValidateName(String name){
        String messenger = null;
        String NAME_REGEX = "^(([A-Z][a-z]+)(| ))+$";;
        if(!name.matches(NAME_REGEX)){
            messenger = "Tên không đúng định dạng, vui lòng nhập theo định dạng sau: ";
        }
        return messenger;
    }
}
