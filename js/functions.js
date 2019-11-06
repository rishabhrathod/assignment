function init_page() {
$( document ).ajaxStart(function() {$('.ajax-loader').css("visibility", "visible");});
$( document ).ajaxStop(function() {$('.ajax-loader').css("visibility", "hidden");});
}

function init_header(page_name) {
$("#header").append('<div class="ajax-loader"><img src="images/waiting.gif" alt=""/></div>');
$("#header").append('<div class="common_header">'+
	'<table border="0" width="100%" id="common_header_table" style="margin: 0px;"><tr>'+
	'<td colspan="2" class="align_center" id="common_header_links"><h2>'+page_name+'</h2></td>'+
	'</tr></table>'+
'</div>');
}

function add_version(release_info) {
$("#version_info").append(release_info);
}

function setCookie(cname, cvalue, exdays) {
	var d = new Date();
	d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
	var expires = "expires="+d.toUTCString();
	document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
  }
  
function getCookie(cname) {
	var name = cname + "=";
	var ca = document.cookie.split(';');
	for(var i = 0; i < ca.length; i++) {
	  var c = ca[i];
	  while (c.charAt(0) == ' ') {
		c = c.substring(1);
	  }
	  if (c.indexOf(name) == 0) {
		return c.substring(name.length, c.length);
	  }
	}
	return "";
  }
  
function checkCookie() {
	var user = getCookie("username");
	if (user != "") {
	  alert("Welcome again " + user);
	} else {
	  user = prompt("Please enter your name:", "");
	  if (user != "" && user != null) {
		setCookie("username", user, 365);
	  }
	}
  }