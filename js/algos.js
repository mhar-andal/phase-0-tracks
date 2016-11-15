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
