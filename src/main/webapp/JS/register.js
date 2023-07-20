function checkPassword()
{
	if(document.getElementById("pwd").value != document.getElementById("cnfrmpwd").value)
	{
		alert("Password Mis Match");
		return false;
	}
	else
	{
		alert("Success");
		return true;
	}

}
var submit = document.getElementById('sendValues'),
checkbox = document.getElementById('checkbox'),
disableSubmit = function(e) {
    submit.disabled = this.checked
};

checkbox.addEventListener('change', disableSubmit);