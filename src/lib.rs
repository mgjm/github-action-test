#![warn(missing_docs, clippy::all, clippy::pedantic, clippy::nursery)]

//! This is a demo!

/// The test.
pub struct Test;

impl Test {
    /// Create a new test.
    #[must_use]
    pub const fn new() -> Self {
        Self
    }
}
