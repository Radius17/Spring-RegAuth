# SpringBoot-RegAuth

SpringBoot registration and authentication.

Based on https://github.com/Ex3mS1ze/spring-reg-auth
Author Ex3mS1ze https://github.com/Ex3mS1ze


> Пробуем зарегистрироваться.
>

> В приложении пока не предусмотрено метода для регистрации пользователя-администратора, но он нужен.
> Поэтому после регистрации нового пользователя, добавим в таблицу пользователь-роли запись, дающую эту роль:
>
> INSERT INTO public.t_user_roles(user_id, roles_id) VALUES (1, 111);
>
