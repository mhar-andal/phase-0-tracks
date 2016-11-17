// Psuedocode
// find longest word
// INPUT: Array
// STEPS: assign first element to a variable
// run forloop to iterate array, run condition to check element lengths, finds biggest
// OUTPUT: longest word

// Match Key Value
// INPUT: 2 objects
// STEPS: run conditions to check if there variabls are equal
// OUTPUT: retun true or false

// Generate random words
// INPUT: length
// STEPS: run for loop, assign a random length word, add length words
// OUTPUT: return the array of words

// random number for letters
// INPUT: none
// STEPS: calculate random number
// OUTPUT: number

// randomo number for length
// INPUT: none
// STEPS: calculate random number for length
// OUTPUT: number

function find_long(arr) {
longest_word = arr[0];

for(i = 1; i < arr.length; i++) {
	if (arr[i].length > longest_word.length) {
		longest_word = arr[i];
	}

}
return longest_word;
};

function matchKeyValue(obj1, obj2) {
	if (obj1.age == obj2.age) {
		console.log("Both share same age");
		return true;
	}
	else if(obj1.name == obj2.name) {
		console.log("Both share same name");
		return true;
	}
	else {
		console.log("Nothing in common")
		return false;
	}
};

function genRandomData(length) {
	
	var words = [];
	var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
	
	for(var i = 0; i < length; i++) {
		var word = "";	
		for(var j = randomLength(); j < 10; j++) {
			word += possible.charAt(randomLetter());
			
		}
		words[i] = word;
	}
	return words
};

function randomLetter() {
	number = Math.random() * (52 - 0);
	return Math.floor(number);
};

function randomLength() {
	number = Math.random() * (11 - 1);
	return Math.floor(number);
};

arr = ["long phrase","longest phrase","longer phrase"];

console.log(find_long(arr));

var person1 = {name: "Mhar", age: 20};
var person2 = {name: "Matt", age: 20};
var person3 = {name: "Thomas", age: 59};
var person4 = {name: "Thomas", age: 18};

matchKeyValue(person1, person2);
matchKeyValue(person2, person3);
matchKeyValue(person3, person4);

console.log(genRandomData(3));
console.log(genRandomData(5));
console.log(genRandomData(8));

array = []
for(var x = 0; x < 10; x++) {
	array[x] = find_long(arr);
}
console.log(array);