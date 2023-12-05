/*챗봇js*/

function chatOpen() {
   document.getElementById("chat-open").style.display = "none";
   document.getElementById("chat-close").style.display = "block";
   document.getElementById("chat-window1").style.display = "block";
}
function chatClose() {
   document.getElementById("chat-open").style.display = "block";
   document.getElementById("chat-close").style.display = "none";
   document.getElementById("chat-window1").style.display = "none";
}
function openConversation() {
   document.getElementById("chat-window1").style.display = "none";
}

//Gets the text from the input box(user)
function userResponse() {
   console.log("response");
   let userText = document.getElementById("textInput").value;

   if (userText == "") {
      alert("Please type something!");
   } else {
      document.getElementById("messageBox").innerHTML += `<div class="first-chat">
      <p>${userText}</p>
      <div class="arrow"></div>
    </div>`;
      document.getElementById("textInput").value = "";
      var objDiv = document.getElementById("messageBox");
      objDiv.scrollTop = objDiv.scrollHeight;

      setTimeout(() => {
         adminResponse();
      }, 1000);
   }
}

//admin Respononse to user's message
function adminResponse() {
   fetch("https://api.adviceslip.com/advice")
      .then((response) => {
         return response.json();
      })
      .then((adviceData) => {
         let Adviceobj = adviceData.slip;
         document.getElementById(
            "messageBox"
         ).innerHTML += `<div class="second-chat">
          <div class="circle" id="circle-mar"></div>
          <p>${Adviceobj.advice}</p>
          <div class="arrow"></div>
        </div>`;

         var objDiv = document.getElementById("messageBox");
         objDiv.scrollTop = objDiv.scrollHeight;
      })
      .catch((error) => {
         console.log(error);
      });
}

//press enter on keyboard and send message
addEventListener("keypress", (e) => {
   if (e.keyCode === 13) {
      const e = document.getElementById("textInput");
      if (e === document.activeElement) {
         userResponse();
      }
   }
});