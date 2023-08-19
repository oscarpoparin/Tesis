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

// Verificar si el elemento userinput existe en la página actual (index.html o forgot.html)
const userinput = document.getElementById("userinput");
if (userinput) {
  userinput.addEventListener("input", function() {
    var span = document.getElementById("user");
    if (userinput.value.trim() !== "") {
      span.style.background = "rgba(97, 96, 96, 0.904)";
      span.style.transform = "translateX(20px) translateY(-24px)";
      span.style.fontSize = "0.75em";
      span.style.padding = "0 5px";
      span.style.border = "1px solid rgba(255, 255, 255, 0.712)";
    }else{
      span.style.transform = "translateX(0px) translateY(0px)";
      span.style.padding = "15px 40px";
      span.style.fontSize = "1em";
      span.style.border = "none";
      span.style.background = "transparent";
    }
  });
}

// Verificar si el elemento input existe en la página actual (index.html o forgot.html)
const passwordinput = document.getElementById("input");
if (passwordinput) {
  passwordinput.addEventListener("input", function() {
    var span1 = document.getElementById("pass");
    if (passwordinput.value.trim() !== "") {
      span1.style.background = "rgba(97, 96, 96, 0.904)";
      span1.style.transform = "translateX(20px) translateY(-24px)";
      span1.style.fontSize = "0.75em";
      span1.style.padding = "0 5px";
      span1.style.border = "1px solid rgba(255, 255, 255, 0.712)";
    }else{
      span1.style.transform = "translateX(0px) translateY(0px)";
      span1.style.padding = "15px 40px";
      span1.style.fontSize = "1em";
      span1.style.border = "none";
      span1.style.background = "transparent";
    }
  });
}

// Verificar si el elemento email_input existe en la página actual (index.html o forgot.html)
const email_input = document.getElementById("email");
if (email_input) {
  email_input.addEventListener("input", function() {
    var span2 = document.getElementById("email_forgot");
    if (email_input.value.trim() !== "") {
      span2.style.background = "rgba(97, 96, 96, 0.904)";
      span2.style.transform = "translateX(20px) translateY(-24px)";
      span2.style.fontSize = "0.75em";
      span2.style.padding = "0 5px";
      span2.style.border = "1px solid rgba(255, 255, 255, 0.712)";
    }else{
      span2.style.transform = "translateX(0px) translateY(0px)";
      span2.style.padding = "15px 40px";
      span2.style.fontSize = "1em";
      span2.style.border = "none";
      span2.style.background = "transparent";
    }
  });
}

