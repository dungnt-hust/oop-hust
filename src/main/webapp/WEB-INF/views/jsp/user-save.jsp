 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
 
 <div class="container-fluid bg-form" style = "margin-top: -40px;">
        <div class="row justify-content-center">
            <div class="col-md-3 col-sm-6 col-xs-12 setting-container">
                    <h1 class="login-title mb-4">Add new user</h1>

                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="flexRadioDefault"
                            id="roleuser" checked>
                        <label class="form-check-label" for="flexRadioDefault1">
                            ROLE_USER
                        </label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="roleadmin">
                        <label class="form-check-label" for="flexRadioDefault2">
                            ROLE_ADMIN
                        </label>
                    </div>
                    	<c:url value="/saveUser" var="saveUser" />
						<c:url value="/saveAdmin" var="saveAdmin" />
                    <form:form action="${saveUser}" method="POST" modelAttribute="user" id="formsave">
                        <div class="form-group row mb-3">
                            <label for="name" class="col-sm-2 col-form-label">Name</label>
                            <div class="col-sm-10">
                                <form:input path="name" class="form-control name-valid"/>
                            </div>
                            <p class="error-name error-validation"></p>
                        </div>
                        <div class="form-group row mb-3">
                            <label for="mssv" class="col-sm-2 col-form-label">MSSV</label>
                            <div class="col-sm-10">
                                <form:input path="mssv" class="form-control mssv-valid" />
                            </div>
                            <p class="error-mssv error-validation"></p>
                        </div>
                        <div class="form-group row mb-3">
                            <label for="username" class="col-sm-2 col-form-label">Username</label>
                            <div class="col-sm-10">
                                <form:input path="username" class="form-control username-valid" />
                            </div>
                            <p class="error-username error-validation"></p>
                        </div>
                        <div class="form-group row mb-3">
                            <label for="password" class="col-sm-2 col-form-label">Password</label>
                            <div class="col-sm-10">
                                <form:input path="password" type="password" class="form-control password-valid" />
                            </div>
                            <p class="error-password error-validation"></p>
                        </div>
                        <div class="form-group row mb-3">
                            <label for="Class" class="col-sm-2 col-form-label">Class</label>
                            <div class="col-sm-10">
                                <form:input path="clazz" class="form-control class-valid" />
                            </div>
                            <p class="error-class error-validation"></p>
                        </div>
                        <div class="form-group row mb-3">
                            <label for="Class" class="col-sm-2 col-form-label">Image Link</label>
                            <div class="col-sm-10">
                                <form:input path="image" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group row mb-3">
                            <label for="Enable" class="col-sm-2 col-form-label">Enable</label>
                            <div class="col-sm-10">
                                <form:input path="enabled" class="form-control" />
                            </div>
                        </div>
                        </form:form>
                        <div class = "see-listuser">
                        	<a href = "<c:url value="/user-list?sort=" />">See the list of users here</a>
                        </div>
                        <div class="form-group row mb-3 text-center">
                            <div class="col-sm-12">
                                <button class="btn btn-primary" onclick="my_button_click_handler()">Done</button>
                            </div>
                        </div>
                   
            </div>
        </div>
</div>
<script>
	function my_button_click_handler() {
        const name = document.querySelector(".name-valid");
        const error_name = document.querySelector(".error-name");
        const mssv = document.querySelector(".mssv-valid");
        const error_mssv = document.querySelector(".error-mssv");
        const username = document.querySelector(".username-valid");
        const error_username = document.querySelector(".error-username");
        const password = document.querySelector(".password-valid");
        const error_password = document.querySelector(".error-password");
        const clazz = document.querySelector(".class-valid");
        const error_clazz = document.querySelector(".error-class");
        const filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

        if(name.value.length == 0){
            error_name.innerText = "Name is not null";
            return;
        }else if(name.value.length < 3){
            error_name.innerText = "Name is too short";
            return;
        }else if(name.value.length > 50) {
            error_name.innerText = "Name is too long";
            return;
        } else {
            error_name.innerText = "";
        }

        if(username.value.length == 0){
            error_username.innerText = "username is not null";
            return;
        }else if(!filter.test(username.value)){
            error_username.innerText = "Username is email";
            return;
        } else{
            error_username.innerText = "";
        }

        if(password.value.length == 0){
            error_password.innerText = "Password is not null";
            return;
        }else if(password.value.length < 6){
            error_password.innerText = "Password is too weak";
            return;
        }else{
            error_password.innerText = "";
        }

        if (document.getElementById('roleuser').checked) {
            document.getElementById("formsave").action = "${saveUser}";
            if(mssv.value.length == 0){
                error_mssv.innerText = "MSSV is not null";
                return;
            }else if(mssv.value.length != 8){
                error_mssv.innerText = "MSSV has 8 characters";
                return;
            } else{
                error_mssv.innerText = "";
            }

            if(clazz.value.length == 0){
                error_clazz.innerText = "Class is not null";
                return;
            }else if(clazz.value.length > 10){
                error_clazz.innerText = "Class is too long";
                return;
            } else{
                error_username.innerText = "";
            }
        } else if (document.getElementById('roleadmin').checked) {
            document.getElementById("formsave").action = "${saveAdmin}";
            //document.getElementById("formsave").submit();
        }

        document.getElementById("formsave").submit();
	};
</script>
