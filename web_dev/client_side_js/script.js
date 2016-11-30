console.log("This is running");

function removeImg(event) {
  event.target.hidden = true;
  event.target.style.display = "inline-block;";
  console.log("")
}

function mouseoverRemove(event){
   event.target.hidden = true;
}

function turnBlue(event) {
  event.target.style.color = "blue";
}




var photo = document.getElementById("photo");
photo.addEventListener("click", removeImg);

var photo2 = document.getElementById("photo2");
photo2.addEventListener("mouseover", mouseoverRemove);

var p = document.getElementsByTagName("p");
for(i=0;i<p.length;i++) {
	p[i].addEventListener("mouseover", turnBlue);
}
