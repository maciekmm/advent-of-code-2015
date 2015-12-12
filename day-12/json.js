var json = json || JSON.parse(document.body.innerHTML); //extension

function parse(obj, ignoredKey) {
	var sum = 0;
	for (var key in obj) {
		// DAMN, wasted 5 minutes here
		if (!Array.isArray(obj) && obj[key] === ignoredKey) {
			return 0;
		}
		if (typeof obj[key] == "object") {
			sum += parse(obj[key], ignoredKey);
		} else if (typeof obj[key] == "number") {
			sum += obj[key];
		}
	}
	return sum;
}

console.log("All keys: ", parse(json));
console.log("Ignored red: ", parse(json, "red"));
