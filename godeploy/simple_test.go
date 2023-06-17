package simplemath

import "testing"

func TestAdd(t *testing.T) {
	want := 6
	have := Add(4, 2)
	if want != have {
		t.Errorf("wanted %d but have %d", want, have)
	}
}

func TestMultiply(t *testing.T) {
	want := 10
	have := Multiply(5, 2)
	if want != have {
		t.Errorf("wanted %d but have %d", want, have)
	}
}
