package quanttide

import "testing"

func TestVersion(t *testing.T) {
	if got := Version(); got != "0.1.0" {
		t.Errorf("Version() = %q, want %q", got, "0.1.0")
	}
}
