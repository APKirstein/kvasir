function date() {
	document.getElementById("answer").innerHTML = Date ();
}


function tCheck() {
	cIn = document.getElementById("input");
	return (5/9) * (cIn-32);
	document.getElementById("answer").innerHTML = "cIn";
}

/*<p>Type in either field to convert from Fahrenheit to Celsius or from Celsius to Fahrenheit:</p>
<div class="section_item" style="width:240px; margin-top:12px; margin-left:10px; float:left;">
        <form name="form" style="font-size:18px; ">
		<table><tr><td>Fahrenheit: </td><td>
		<input  style="font-size:18px; " type="text" name="F" value="32" size="10" onKeyUp="C.value = 100/(212-32) * (this.value - 32 )">°</td></tr>
        <tr><td>Celsius: </td><td><input  style="font-size:18px; " type="text" name="C" value="0" size="10" onKeyUp="F.value = (212-32)/100 * this.value + 32 ">°
        </td></tr></table>
        </form>
</div>*/