
function reload() {
    location.reload();
}

function submit_register() {
    var username = document.getElementById("username");
    var password = document.getElementById("password");

    if (username.value.length < 6) {
        document.getElementById("notice").innerHTML = "username is invaild.";
        return false;
    }
    else if (password.value.length < 6) {
        document.getElementById("notice").innerHTML = "password is invaild.";
        return false;
    }
    else {
        //提交到数据库，如果冲突返回用户名被占用

    }
}

function to_register() {
    document.getElementById("top-tips").innerHTML = "请注册";
    document.getElementById("in").style.display = "none"
    document.getElementById("main-tips").innerHTML = "用户名和密码至少6位"
    document.getElementById("register").style.display = "none";
    document.getElementById("submitregister").style.display = "block";
	document.getElementById("hiddenText").value="register";
	document.getElementById("email").style.display="block"

	document.getElementById("emailLabel").style.display="block"
}



function disableTextSubmit(e) {
    if (e.keyCode == 13) {
        return false;
    }
}