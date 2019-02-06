use regex::Regex;
use std::io::{self, Write};

struct Filter {
    pattern: Regex,
}

impl Filter {
    fn new() -> Self {
        Self {
            pattern: Regex::new("c?ei").unwrap(),
        }
    }

    fn is_valid(&self, s: &str) -> bool {
        for groups in self.pattern.captures_iter(s) {
            if !groups.get(0).unwrap().as_str().starts_with('c') {
                return false;
            }
        }
        true
    }
}

fn main() -> io::Result<()> {
    let handle = io::stdout();
    let filter = Filter::new();

    let mut writer = handle.lock();

    for word in word_list() {
        if !filter.is_valid(word) {
            writeln!(writer, "{}", word)?;
        }
    }

    Ok(())
}

fn word_list() -> impl Iterator<Item = &'static str> {
    static ENABLE1: &str = include_str!("../../resource/enable1.txt");
    ENABLE1.split_ascii_whitespace()
}
