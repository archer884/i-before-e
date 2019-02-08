import std.stdio, std.regex;

/// Filter used to reject words not complying with the I-before-E rule.
class Filter {
	/// Regex pattern used to detect noncompliance.
	static Regex!char pattern = regex("([^c]|^)ei");

	/// Returns true if a word is compliant, else false.
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
