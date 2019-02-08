import std.stdio, std.regex;

class Filter {
	static Regex!char pattern = regex("([^c]|^)ei");

	bool isValid(char[] s) {
		return matchFirst(s, pattern).length() == 0;
	}
}

void main(string[] args)
{
	auto path = args[1];
	auto file = File(path);

	scope(exit) file.close;

	auto filter = new Filter;
	foreach (word; file.byLine) {
		if (!filter.isValid(word)) {
			writeln(word);
		}
	}
}
