<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Access Denied</title>
<style> 
body {
  background: #000;
  font-size: xx-large;
  color: silver;
}
canvas {
  position: absolute;
  top: 0;
  left: 0;
  height: 100%;
  width: 100%;
}
</style> 
</head>
<body>
Access Denied!

<canvas height="600" width="600"></canvas> 
<script> 
var canvas = document.getElementsByTagName('canvas')[0],
    ctx = null,
    grad = null,
    body = document.getElementsByTagName('body')[0],
    color = 255;
    
if (canvas.getContext('2d')) {
  ctx = canvas.getContext('2d');
  ctx.clearRect(0, 0, 600, 600);
  ctx.save();
  // Create radial gradient
  grad = ctx.createRadialGradient(0,0,0,0,0,600); 
  grad.addColorStop(0, '#000');
  grad.addColorStop(1, 'rgb(' + color + ', ' + color + ', ' + color + ')');
 
  // assign gradients to fill
  ctx.fillStyle = grad;
 
  // draw 600x600 fill
  ctx.fillRect(0,0,600,600);
  ctx.save();
  
  body.onmousemove = function (event) {
    var width = window.innerWidth, 
        height = window.innerHeight, 
        x = event.clientX, 
        y = event.clientY,
        rx = 600 * x / width,
        ry = 600 * y / width;
        
    var xc = ~~(256 * x / width);
    var yc = ~~(256 * y / height);
 
    grad = ctx.createRadialGradient(rx, ry, 0, rx, ry, 600); 
    grad.addColorStop(0, '#000');
    grad.addColorStop(1, ['rgb(', xc, ', ', (255 - xc), ', ', yc, ')'].join(''));
    // ctx.restore();
    ctx.fillStyle = grad;
    ctx.fillRect(0,0,600,600);
    // ctx.save();
  };
}
</script> 
<script> 
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script> 
<script> 
try {
var pageTracker = _gat._getTracker("UA-1656750-18");
pageTracker._trackPageview();
} catch(err) {}</script> 
</body>
</html>