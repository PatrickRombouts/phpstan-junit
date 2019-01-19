workflow "Testing" {
  on = "push"
  resolves = [
    "test",
    "docker://php",
  ]
}

action "dependency" {
  uses = "docker://composer"
  args = "install"
}

action "test" {
  uses = "docker://php"
  needs = ["dependency"]
  args = "vendor/bin/phpunit"
}

action "docker://php" {
  uses = "docker://php"
  needs = ["dependency"]
  args = "vendor/bin/phpstan"
}
