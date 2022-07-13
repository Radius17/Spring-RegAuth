package ru.radius17.reg_auth.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import ru.radius17.reg_auth.config.WebSecurityConfig;
import ru.radius17.reg_auth.entity.User;
import ru.radius17.reg_auth.service.UserService;

import javax.validation.Valid;

@Controller
public class ProfileController {

    @Autowired
    private UserService userService;

    @GetMapping("/profile")
    public String profile(Model model) throws UsernameNotFoundException {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserDetails) {
            String username = ((UserDetails)principal).getUsername();
            // User user = userService.findUserById(75L); // Test
            User user = userService.findUserByUsername(username);
            if(user.getId() == null){
                // По всей видимости сразу выкидывает
                throw new UsernameNotFoundException("User not found");
            }
            model.addAttribute("userForm", user);
//        } else {
//            username = principal.toString();
        }
        return "profile";
    }

    @PostMapping("/profile")
    public String addUser(@ModelAttribute("userForm") @Valid User userForm, BindingResult bindingResult, Model model) {

        if (bindingResult.hasErrors()) {
            return "profile";
        }
        if (!userForm.getPassword().equals(userForm.getPasswordConfirm())){
            model.addAttribute("passwordError", "Пароли не совпадают");
            return "profile";
        }
        /*
        if (!userService.saveUser(userForm)){
            model.addAttribute("usernameError", "Пользователь с таким именем уже существует");
            return "profile";
        }
        */
        return "redirect:/";
    }
}
