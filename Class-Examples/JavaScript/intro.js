window.addEventListener('DOMContentLoaded',init,false);

function init() {
    alert ('Hi there! Looks like the page loaded! Yay!');
    var buttons = document.getElementsByTagName("button")
buttons[0].addEventListener('click', changeColor,false)
buttons[1].addEventListener('click', changeColor2, false)
}


function changeColor() {
var p1 = document.getElementById("colorToggle")
{p1.style.backgroundColor = "skyblue";}
}

function changeColor2() {
pars = document.getElementsByTagName('p');
    for (var i = 0, length = pars.length; i < length; i++) {
        pars[i].style.backgroundColor = "pink";
    }   
}

/*
 * document.getElementById("myBtn").addEventListener("click", displayDate); 
 *  
if (condition) {
    block of code to be executed if the condition is true
} else { 
    block of code to be executed if the condition is false
}
 */