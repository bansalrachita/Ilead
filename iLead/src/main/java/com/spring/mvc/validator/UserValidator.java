package com.spring.mvc.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.spring.mvc.user.User;
import com.spring.mvc.user.User.Role;


public class UserValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return User.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "validate.username", "The username is Incorrect");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "validate.password", "password is incorrect");
		
		User user = (User)target;
		
		if(Role.None.equals(user.getRole())){
			errors.rejectValue("role", "required.role","role is required");
		   }
	}

}
