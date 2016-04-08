window.addEventListener('DOMContentLoaded',init,false);

function init() {
    alert ('Did the page load? Yes. Yes it did.');

var buttons = document.getElementsByTagName("button")

var button1 = buttons[0]
button1.addEventListener('click',show_hide1,false);

var button2 = buttons[1]
button2.addEventListener('click',show_hide2,false);
}




function show_hide1() {
    if (document.getElementById('toggle1').style.display != "none") {
        document.getElementById('toggle1').style.display = "none";
    }
    else { 
        document.getElementById("toggle1").style.display = "block";
        }
}

function show_hide2() {
    if (document.getElementById("toggle2").style.visibility != "hidden") {
        document.getElementById("toggle2").style.visibility = "hidden";
    }
    else {
        document.getElementById("toggle2").style.visibility = "visible";
        }
}