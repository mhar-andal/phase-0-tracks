// colors = ["brown", "grey", "black", "white"];
// names = ["Ed", "Sunshine", "Nightmare", "Thunder"];

// colors.push("tan");
// names.push("Bob");

// //create an empty object, horses
// //use a for loop to iterate through names array, each item becomes a key
// //use another for loop to iterate through the colors array, each item becomes a value
// //horses['Ed'] = "brown";

// var horses = {};
// for (var i = 0; i < names.length; i++){
// 	horses[names[i]] = colors[i];
// }

// console.log(horses);

function Car(used, year, color) {
	this.used = used;
	this.year = year;
	this.color = color;

	this.race = function() {console.log("Vroom!");};

	this.print = function() {
		if(used == true){
			console.log("This is a used car");
		} 
		else if(used == false){
			console.log("This is a new car");
		}
		console.log("Year: " + year);
		console.log("Color: " + color);
	};
	this.print();
	console.log("Car initialization complete!");
	}

var jeep = new Car(false, 2015, "black");
var subaru = new Car(true, 2000, "green");
var mazda = new Car(false, 2016, "silver");

jeep.race();
subaru.race();
mazda.race();


// creating an array filled with objects, using for loop to iterate through each object to make it race
var cars = [
    new Car(false, 2015, "black"),
    new Car(true, 2000, "green"),
    new Car(false, 2016, "silver")
];

for (i = 0; i < cars.length; i++){
	cars[i].race();
}