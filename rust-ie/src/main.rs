use std::io::{self, Write};

fn main() -> io::Result<()> {
    let handle = io::stdout();

    let mut buf = String::new();
    let mut writer = handle.lock();

    for word in word_list(&mut buf)? {
        if !is_valid(word) {
            writeln!(writer, "{}", word)?;
        }
    }

    Ok(())
}

fn is_valid(s: &str) -> bool {
    let mut is_safe = false;

    for pair in s.as_bytes().windows(2) {
        match pair {
            [b'c', b'e'] => is_safe = true,
            [b'e', b'i'] if !is_safe => return false,

            _ => is_safe = false,
        }
    }

    true
}

fn word_list(buf: &mut String) -> io::Result<impl Iterator<Item = &str>> {
    use std::env;
    use std::fs::File;
    use std::io::Read;

    File::open(env::args().nth(1).expect("Provide filename"))
        .and_then(|mut f| f.read_to_string(buf))?;

    Ok(buf.split_ascii_whitespace())
}
