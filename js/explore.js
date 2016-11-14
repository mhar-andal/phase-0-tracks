// Psuedocode 
// function that takes string as a parameter and reverses the string
//for each letter in the string going backwards
// add the letter to a new string
// return new string

function reverse(string) {
	str = ""
	for(var i = string.length - 1; i > -1; i--) {
		str = str + string[i]
	}

	return str
}

reversed_word = reverse("hello");

if (2 == 2) {
	console.log(reversed_word);
}

if (2 == 3) {
	console.log("This won't actually run");
}

