#[test]
fn version_matches_cargo_toml() {
    assert_eq!(quanttide_tech::version(), "0.1.0");
}
