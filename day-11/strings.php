<?php
function isPretty($string) {
	if (preg_match('/[iol]/', $string) || !preg_match('/(.)\\1.*(.)\\2/', $string)) {
		return false;
	}

	for ($i = 0; $i < strlen($string) - 3; $i++) {
		if (ord($string[$i]) == ord($string[$i + 1]) - 1 && ord($string[$i + 1]) == ord($string[$i + 2]) - 1) {
			return true;
		}
	}
}

$str = trim(fgets(STDIN));

while (!isPretty(++$str));
echo "First one:" . $str . "\xA";

while (!isPretty(++$str));
echo "Second one:" . $str . "\xA";
?>

