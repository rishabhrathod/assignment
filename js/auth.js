var tooling_login="/tooling_login.html"
var ces_login="/auth/validate_user.pl"

function getCookie(cname) {
    var name = cname + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var ca = decodedCookie.split(';');
    for(var i = 0; i <ca.length; i++) {
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
// function check_auth() {
// 	var user_valid=0;
// 	auth_cookie=getCookie("auth_cookie");
// if (! auth_cookie) 
// 	{	
// 	document.cookie="caller_page="+encodeURIComponent(location.href)+';max-age=180';
// 	//alert ("Please login to view the webpage.");
// 	redirect();
// 	}
// else
// 	{
// 	var myHeaders = new Headers();
// 	myHeaders.append('pragma', 'no-cache');
// 	myHeaders.append('cache-control', 'no-cache');

// 	var myInit = {
// 	  method: 'GET',
// 	  headers: myHeaders,
// 	};
// 	var fetchparms = { method: 'GET', cache: 'no-store', headers: myHeaders };	
// 	const request = async () => {
// 		const response = await fetch("/cgi-bin/auth_map_user.pl?AUTH="+auth_cookie, fetchparms);
// 		const json = await response.json();
// 		user_valid=json.RESULT;
// 		//console.log(user_valid);
// 		if (user_valid==0)
// 			{
// 			alert ("You do not have any authorzied applications.");
// 			redirect();
// 			}
// 		}
// 	var authorize=request();
// 	}
// }

// function logout() {
// 	document.cookie = 'auth_cookie=; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
// 	redirect();
// }

// function redirect() {
// 	var caller_page=location.href;
// 	if(caller_page.indexOf('tooling') !== -1)
// 		{window.location.replace(tooling_login);}
// 	else
// 		{window.location.replace(ces_login);}	
// }

// function setgid() {
// auth_cookie=getCookie("auth_cookie");
// $.ajax({async :false,
//         method: "POST",
//         url: "/cgi-bin/auth_map_user.pl?TYPE=USER&AUTH="+auth_cookie })
//         .done(function(data) {
//  $("#GID").val(data.USER);
//  $("#gid").val(data.USER);
// });
// }

function setgid() {
	/*auth_cookie=getCookie("auth_cookie");
	$.get("/cgi-bin/auth_map_user.pl?TYPE=USER&AUTH="+auth_cookie, function(data) {
	$("#GID").val(data.USER);
	}); */
	var users=["Z003TKXU","Z003B2DN","Z001TV4Y","Z001KSTZ","Z002PA4A","Z0042KME","Z003TKXU","Z003RZAU","Z003CUJP","Z0017PEK","Z003ESRE"];
	let gid=window.prompt("Enter GID:\n1:Fahmi Abufool\n2Praveen Khan\n3:Salman Munawer\n4:Dhakshina Ramadurai \n5:Rishabh\n6:Vinayak Thatte\n7:Rafik\n8:Murugaesan\n9:siddiqua\n10:josh","0");
	if (! gid) {gid=0;}
	$("#GID").val(users[gid]);
    $("#gid").val(users[gid]); 
	}
	

// function get_roles() {
// auth_cookie=getCookie("auth_cookie");
// let retobj;
// $.ajax({async :false,
//         method: "POST",
//         url: "/cgi-bin/auth_map_user.pl?TYPE=GETROLES&AUTH="+auth_cookie })
//         .done(function(data) {
//         retobj=data;
//         });
// return retobj;
// }
