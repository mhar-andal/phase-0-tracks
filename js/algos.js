function find_long(arr) {
longest_word = arr[0];

for(i = 1; i < arr.length; i++) {
	if (arr[i].length > longest_word.length) {
		longest_word = arr[i];
	}

}
return longest_word;
}

arr = ["long phrase","longest phrase","longer phrase"];

console.log(find_long(arr));

var person1 = {name: "Mhar", age: 20};
var person2 = {name: "Matt", age: 20};
var person3 = {name: "Thomas", age: 59};
var person4 = {name: "Thomas", age: 18};

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

matchKeyValue(person1, person2);
matchKeyValue(person2, person3);
matchKeyValue(person3, person4);