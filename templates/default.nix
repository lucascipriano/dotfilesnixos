{
  # nix flake init -t github:lucascipriano/dotfilesnixos#templates.rust
  rust = {
    description = "Rust Project Template";
    path = ./rust;
  };

  # nix flake init -t github:lucascipriano/dotfilesnixos#templates.go
  go = {
    description = "Go Project Template";
    path = ./go;
  };

  # nix flake init -t github:lucascipriano/dotfilesnixos#templates.basic
  basic = {
    description = "A very basic flake";
    path = ./basic;
  };
}
