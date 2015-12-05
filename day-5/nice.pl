#!/usr/bin/perl

while(<STDIN>) {
	if (!(/(ab|cd|pq|xy)/)&&/(.)\1/&&/[aeiou].*[aeiou].*[aeiou]/) {
		$nice++;
	}
	if (/(..).*\1/&&/(.).\1/) {
		$nicer++;
	}
}
print("Nice strings: ".$nice."\n");
print("Nicer strings: ".$nicer."\n");
