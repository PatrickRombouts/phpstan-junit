workflow "Testing" {
  on = "push"
  resolves = ["test"]
}

action "dependency" {
  uses = "docker://composer"
  args = "install"
}

action "test" {
  uses = "docker://php:7.2"
  needs = ["dependency"]
  args = "bin/phpunit"
}
