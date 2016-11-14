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

console.log(reverse("hello"));