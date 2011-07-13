<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="Database_Functions.DBFunctions"%>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Appointments</title>
<script>
calendar = {
	month_names: ["January","February","March","April","May","June","July","Augest","September","October","November","December"],
	weekdays: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
	month_days: [31,28,31,30,31,30,31,31,30,31,30,31],
	//Get today's date - year, month, day and date
	today : new Date(),
	opt : {},
	data: [],

	//Functions
	/// Used to create HTML in a optimized way.
	wrt:function(txt) {
		this.data.push(txt);
	},
	
	/* Inspired by http://www.quirksmode.org/dom/getstyles.html */
	getStyle: function(ele, property){
		if (ele.currentStyle) {
			var alt_property_name = property.replace(/\-(\w)/g,function(m,c){return c.toUpperCase();});//background-color becomes backgroundColor
			var value = ele.currentStyle[property]||ele.currentStyle[alt_property_name];
		
		} else if (window.getComputedStyle) {
			property = property.replace(/([A-Z])/g,"-$1").toLowerCase();//backgroundColor becomes background-color

			var value = document.defaultView.getComputedStyle(ele,null).getPropertyValue(property);
		}
		
		//Some properties are special cases
		if(property == "opacity" && ele.filter) value = (parseFloat( ele.filter.match(/opacity\=([^)]*)/)[1] ) / 100);
		else if(property == "width" && isNaN(value)) value = ele.clientWidth || ele.offsetWidth;
		else if(property == "height" && isNaN(value)) value = ele.clientHeight || ele.offsetHeight;
		return value;
	},
	getPosition:function(ele) {
		var x = 0;
		var y = 0;
		while (ele) {
			x += ele.offsetLeft;
			y += ele.offsetTop;
			ele = ele.offsetParent;
		}
		if (navigator.userAgent.indexOf("Mac") != -1 && typeof document.body.leftMargin != "undefined") {
			x += document.body.leftMargin;
			offsetTop += document.body.topMargin;
		}
	
		var xy = new Array(x,y);
		return xy;
	},
	/// Called when the user clicks on a date in the calendar.
	selectDate:function(year,month,day) {
		var ths = _calendar_active_instance;
		document.getElementById(ths.opt["input"]).value = year + "-" + month + "-" + day; // Date format is :HARDCODE:
		ths.hideCalendar();
	},
	/// Creates a calendar with the date given in the argument as the selected date.
	makeCalendar:function(year, month, day) {
		year = parseInt(year);
		month= parseInt(month);
		day	 = parseInt(day);
		
		//Display the table
		var next_month = month+1;
		var next_month_year = year;
		if(next_month>=12) {
			next_month = 0;
			next_month_year++;
		}
		
		var previous_month = month-1;
		var previous_month_year = year;
		if(previous_month< 0) {
			previous_month = 11;
			previous_month_year--;
		}
		
		this.wrt("<table>");
		this.wrt("<tr><th><a href='javascript:calendar.makeCalendar("+(previous_month_year)+","+(previous_month)+");' title='"+this.month_names[previous_month]+" "+(previous_month_year)+"'>&lt;</a></th>");
		this.wrt("<th colspan='5' class='calendar-title'><select name='calendar-month' class='calendar-month' onChange='calendar.makeCalendar("+year+",this.value);'>");
		for(var i in this.month_names) {
			this.wrt("<option value='"+i+"'");
			if(i == month) this.wrt(" selected='selected'");
			this.wrt(">"+this.month_names[i]+"</option>");
		}
		this.wrt("</select>");
		this.wrt("<select name='calendar-year' class='calendar-year' onChange='calendar.makeCalendar(this.value, "+month+");'>");
		var current_year = this.today.getYear();
		if(current_year < 1900) current_year += 1900;
		
		for(var i=current_year-70; i<current_year+10; i++) {
			this.wrt("<option value='"+i+"'")
			if(i == year) this.wrt(" selected='selected'");
			this.wrt(">"+i+"</option>");
		}
		this.wrt("</select></th>");
		this.wrt("<th><a href='javascript:calendar.makeCalendar("+(next_month_year)+","+(next_month)+");' title='"+this.month_names[next_month]+" "+(next_month_year)+"'>&gt;</a></th></tr>");
		this.wrt("<tr class='header'>");
		for(var weekday=0; weekday<7; weekday++) this.wrt("<td>"+this.weekdays[weekday]+"</td>");
		this.wrt("</tr>");
		
		//Get the first day of this month
		var first_day = new Date(year,month,1);
		var start_day = first_day.getDay();
		
		var d = 1;
		var flag = 0;
		
		//Leap year support
		if(year % 4 == 0) this.month_days[1] = 29;
		else this.month_days[1] = 28;
		
		var days_in_this_month = this.month_days[month];

		//Create the calender
		for(var i=0;i<=5;i++) {
			if(w >= days_in_this_month) break;
			this.wrt("<tr>");
			for(var j=0;j<7;j++) {
				if(d > days_in_this_month) flag=0; //If the days has overshooted the number of days in this month, stop writing
				else if(j >= start_day && !flag) flag=1;//If the first day of this month has come, start the date writing

				if(flag) {
					var w = d, mon = month+1;
					if(w < 10)	w	= "0" + w;
					if(mon < 10)mon = "0" + mon;

					//Is it today?
					var class_name = '';
					var yea = this.today.getYear();
					if(yea < 1900) yea += 1900;

					if(yea == year && this.today.getMonth() == month && this.today.getDate() == d) class_name = " today";
					if(day == d) class_name += " selected";
					
					class_name += " " + this.weekdays[j].toLowerCase();

					this.wrt("<td class='days"+class_name+"'><a href='javascript:calendar.selectDate(\""+year+"\",\""+mon+"\",\""+w+"\")'>"+w+"</a></td>");
					d++;
				} else {
					this.wrt("<td class='days'>&nbsp;</td>");
				}
			}
			this.wrt("</tr>");
		}
		this.wrt("</table>");
		this.wrt("<input type='button' value='Cancel' class='calendar-cancel' onclick='calendar.hideCalendar();' />");

		document.getElementById(this.opt['calendar']).innerHTML = this.data.join("");
		this.data = [];
	},
	
	/// Display the calendar - if a date exists in the input box, that will be selected in the calendar.
	showCalendar: function() {
		var input = document.getElementById(this.opt['input']);
		
		//Position the div in the correct location...
		var div = document.getElementById(this.opt['calendar']);
		var xy = this.getPosition(input);
		var width = parseInt(this.getStyle(input,'width'));
		div.style.left=(xy[0]+width+10)+"px";
		div.style.top=xy[1]+"px";

		// Show the calendar with the date in the input as the selected date
		var existing_date = new Date();
		var date_in_input = input.value;
		if(date_in_input) {
			var selected_date = false;
			var date_parts = date_in_input.split("-");
			if(date_parts.length == 3) {
				date_parts[1]--; //Month starts with 0
				selected_date = new Date(date_parts[0], date_parts[1], date_parts[2]);
			}
			if(selected_date && !isNaN(selected_date.getYear())) { //Valid date.
				existing_date = selected_date;
			}
		}
		
		var the_year = existing_date.getYear();
		if(the_year < 1900) the_year += 1900;
		this.makeCalendar(the_year, existing_date.getMonth(), existing_date.getDate());
		document.getElementById(this.opt['calendar']).style.display = "block";
		_calendar_active_instance = this;
	},
	
	/// Hides the currently show calendar.
	hideCalendar: function(instance) {
		var active_calendar_id = "";
		if(instance) active_calendar_id = instance.opt['calendar'];
		else active_calendar_id = _calendar_active_instance.opt['calendar'];
		
		if(active_calendar_id) document.getElementById(active_calendar_id).style.display = "none";
		_calendar_active_instance = {};
	},
	
	/// Setup a text input box to be a calendar box.
	set: function(input_id) {
		var input = document.getElementById(input_id);
		if(!input) return; //If the input field is not there, exit.
		
		if(!this.opt['calendar']) this.init();
		
		var ths = this;
		input.onclick=function(){
			ths.opt['input'] = this.id;
			ths.showCalendar();
		};
	},
	
	/// Will be called once when the first input is set.
	init: function() {
		if(!this.opt['calendar'] || !document.getElementById(this.opt['calendar'])) {
			var div = document.createElement('div');
			if(!this.opt['calendar']) this.opt['calendar'] = 'calender_div_'+ Math.round(Math.random() * 100);

			div.setAttribute('id',this.opt['calendar']);
			div.className="calendar-box";

			document.getElementsByTagName("body")[0].insertBefore(div,document.getElementsByTagName("body")[0].firstChild);
		}
	}
}

</script>

<style type="text/css">
.calendar-box {
	display:none;
	background-color: #99C2FF;
	border:1px solid #444;
	position:absolute;
	width:260px;
	padding: 0 5px;
}
.calendar-box select.calendar-month {
	width:90px;
}
.calendar-box select.calendar-year {
	width:70px;
}
.calendar-box .calendar-cancel {
	width:100%;
}
.calendar-box table td {
	width:14%;
}
.calendar-box .calendar-title {
	text-align:center;
}
.calendar-box a {
	text-decoration:none;
}
.calendar-box .today a {
	padding:0 5px;
	margin-left:-5px;
	background-color:#ffe9c6;
} 
.calendar-box .selected a {
	padding:0 5px;
	margin-left:-5px;
	background-color:#c9ff8b;
}
#psdg-header {
	margin:0;
	padding: 14px 0 0 24px;
	width: 61.35%;
	height: 55px;
	color:#FFF;
	font-size:13px;
	background: #0c2c65 url(/DentAssist/backgrounds/head-bcg.jpg) no-repeat right top;	
}
.psdg-bold {
	font: bold 22px Arial, Helvetica, sans-serif;
	
}

body{
font-size: 18px;
color: black;
}
.table_prop{
	padding-left: 15px;
	background-color: #EBF5FF;
}

.table_header{
background-color: silver;
font-size: 18px;
color: black;
font-weight: bold;
}

.other_row{
	background-color:#EEDC82;
	font-size: 15px;
	color: black;
	
}
.date_filter{
	background-color: white;
}
</style>
<script>
function getDate(){
	var date_ap = document.getElementById("app_date").value;
	window.location.href = "Appointments_Home.jsp?ad="+date_ap;
}
</script>
</head>
<body><% String date_Filter = request.getParameter("ad"); %>
<table width="100%" border="0" cellspacing="3" cellpadding="3">
    <tr>
      <td width="2%" height="123"><img src="/DentAssist/backgrounds/logo.jpg" alt="" width="275" height="117" /></td>
      <td><img src="/DentAssist/backgrounds/blue_banner.jpg" width="100%" height="170" /></td>
    </tr>
  </table>
  
<hr class="line_style">

<div id="psdg-header">
<span class="psdg-bold">Your Patient Appointments (<%= date_Filter %>)</span>
</div>

<table border="0" cellspacing="0" cellpadding="18">
<tr class="table_header" >
	<td>Appointment ID</td>
	<td>Name</td>
	<td>Appointment Date</td>
	<td>Appointment Time</td>
	<td>Treatment at a Glance</td>
	</tr>
<% 
   Statement stmt = null;	
   stmt = DBFunctions.createConnection().createStatement();
   ResultSet rs = stmt.executeQuery("select app_id, FIRST_NAME, LAST_NAME, APPOINTMENT_DATE, APPOINTMENT_TIME, treatment_summary from MINE.APPOINTMENTS, MINE.PATIENTS_DETAILS where MINE.APPOINTMENTS.PATIENT_ID=MINE.PATIENTS_DETAILS.PATIENT_ID and APPOINTMENT_DATE='"+date_Filter+"'");
   while(rs.next()){
%>
<tr class = "other_row">
<td><a class = 'link_font' href ='Patients.find?pid=<%= rs.getString(1) %>' ><%= rs.getString(1) %></a></td>
<td><%= rs.getString(2) %> <%= rs.getString(3) %></td>
<td><%= rs.getString(4) %></td>
<td><%= rs.getString(5) %></td>
<td><%= rs.getString(6) %></td>
<% } %>

<% rs.close();
stmt.close();
DBFunctions.createConnection().close();

%>

</table>  
<table align="left">
<tr>
<td class="date_filter" align="left">See Appointments For:</td>
	<td><input type="text" name="app_date" id="app_date" /><br />
     <script type="text/javascript">
 		calendar.set("app_date");
 	  </script></td>
 	  <td><input type="button" name="srch" value="Find" onclick="getDate()"></td>
</tr>
</table>  
</body>
</html>