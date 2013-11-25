function gradient(id, level)
{
	var box = document.getElementById(id);
	box.style.opacity = level;
	box.style.MozOpacity = level;
	box.style.KhtmlOpacity = level;
	box.style.filter = "alpha(opacity=" + level * 100 + ")";
	box.style.display="block";
	return;
}


function fadein(id) 
{
	var level = 0;
	while(level <= 1)
	{
		setTimeout( "gradient('" + id + "'," + level + ")", (level* 1000) + 10);
		level += 0.01;
	}
}


// Open the lightbox
function openbox(type)
{
    if (type == "login") {
        var box = 'box_login';
        var shadow = 'shadowing_login';
    }
    else {
        var box = 'box_signup';
        var shadow = 'shadowing_signup';
    }
    
  document.getElementById(shadow).style.display = 'block';
  gradient(box, 0);
  fadein(box);

  formtype = "";
 
}


// Close the lightbox
function closebox(type)
{
    if (type == "login") {
        var box = 'box_login';
        var shadow = 'shadowing_login';
    }
    else {
        var box = 'box_signup';
        var shadow = 'shadowing_signup';
    }

   document.getElementById(box).style.display='none';
   document.getElementById(shadow).style.display='none';
}
