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
    visit_words(|word| {
        if !filter.is_valid(word) {
            write!(writer, "{}", word)?;
        }
        Ok(())
    })
}

// This goddamn mess is only very slightly faster, if at all, than the alternative in Master.
fn visit_words(mut action: impl FnMut(&str) -> io::Result<()>) -> io::Result<()> {
    use std::env;
    use std::fs::File;
    use std::io::{BufRead, BufReader};

    let path = env::args().nth(1).expect("provide file path");
    let mut buf = String::new();
    let mut input = File::open(path).map(BufReader::new)?;

    while let Ok(len) = input.read_line(&mut buf) {
        if len == 0 {
            break;
        }

        action(&buf)?;
        buf.clear();
    }

    Ok(())
}
