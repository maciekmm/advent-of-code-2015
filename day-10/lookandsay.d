import std.stdio;
import std.conv;
import std.string;

void main() {
	string input = strip(readln());

	for(int i=0; i<50; i++) {
		string copy;
		for(int j=0; j<input.length;) {
			int times=0;
			for(int k=j; k<input.length; k++) {
				if(input[j]==input[k]) {
					times++;
				} else {
					break;
				}
			}
			copy ~= to!string(times)~input[j];
			j += times;
		}
		input = copy;
		if(i==39) {
		    writeln("After 40 interations:");
		    writeln(input.length);
		}
  }
	writeln("After 50 iterations:");
	writeln(input.length);
}
