/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


function toggleContainers() {

  var container1 = document.getElementById('container1');
  var container2 = document.getElementById('container2');
  var userinput = document.getElementById("userinput");
  var passwordinput = document.getElementById("input");
  var email_input = document.getElementById("email");
  var span = document.getElementById("user");
  var span1 = document.getElementById("pass");
  var span2 = document.getElementById("email_forgot");

  container1.classList.toggle('hidden');
  container2.classList.toggle('hidden');
  userinput.value = '';
  passwordinput.value = '';
  email_input.value = '';
  span.style.transform = "translateX(0px) translateY(0px)";
  span.style.padding = "15px 40px";
  span.style.fontSize = "1em";
  span.style.border = "none";
  span.style.background = "transparent";
  span1.style.transform = "translateX(0px) translateY(0px)";
  span1.style.padding = "15px 40px";
  span1.style.fontSize = "1em";
  span1.style.border = "none";
  span1.style.background = "transparent";
  span2.style.transform = "translateX(0px) translateY(0px)";
  span2.style.padding = "15px 40px";
  span2.style.fontSize = "1em";
  span2.style.border = "none";
  span2.style.background = "transparent";

}