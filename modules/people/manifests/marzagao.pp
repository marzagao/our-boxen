class people::marzagao {
  include chrome
  include iterm2::stable
  include dockutil
  include dropbox
  
  class { 'vagrant': }
  include vagrant_manager

  package {
    [
      'gpg',
    ]:
  }

  dockutil::item { 'Add Chrome':
    item     => "/Applications/Google Chrome.app",
    label    => "Google Chrome",
    action   => "add",
    position => 1,
  }
  dockutil::item { 'Add iTerm':
    item     => "/Applications/iTerm.app",
    label    => "iTerm",
    action   => "add",
    position => 2,
  }
}
