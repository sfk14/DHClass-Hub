document.getElementById("svg1").onmouseover = function() {mouseOver1()};
        document.getElementById("svg1").onmouseout = function() {mouseOut1()};
        document.getElementById("svg1").onmousedown = function() {mouseDown1()};
        document.getElementById("svg1").onmouseup = function() {mouseUp1()};
        
        function mouseOver1() {
        document.getElementById("svg1").style.opacity="1";
        document.getElementById("circle1").style.fill="red";
        }
        
        function mouseOut1() {
        document.getElementById("circle1").style.fill = "white";
        }
        
        function mouseDown1() {
        document.getElementById("circle1").setAttribute("opacity","0.5");
        }
        
        function mouseUp1() {
        document.getElementById("circle1").setAttribute("opacity","1");
        }