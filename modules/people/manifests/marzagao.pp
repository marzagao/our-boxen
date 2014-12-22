class people::marzagao {
  include chrome
  include iterm2::stable
  include dockutil
  include dropbox
  include evernote
  include sublime_text_3
  include spotify

  include virtualbox  
  class { 'vagrant': 
    version => '1.6.5'
  }
  include vagrant_manager

  package {
    [
      'gpg',
      'git-crypt',
      'go',
      'hg',
      'awscli',
      'ec2-api-tools',
      'wget',
    ]:
  }

  package { 'GoogleAppEnginePython':
    provider => 'appdmg',
    source   => 'https://storage.googleapis.com/appengine-sdks/featured/GoogleAppEngineLauncher-1.9.17.dmg',
  }

  sublime_text_3::package { 'GoSublime':
    source => 'DisposaBoy/GoSublime'
  }

  file { "/usr/local/bin":
    ensure => "directory",
  }
 
  file { '/usr/local/bin/sublime':
   ensure => 'link',
   target => '/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl',
   require => File['/usr/local/bin'],
  }

  package { 'Cyberduck':
    provider   => 'compressed_app',
    source     => 'https://update.cyberduck.io/Cyberduck-4.6.zip'
  }

  appstore::app { 'Telegram':
    source => 'messenger-for-telegram/id747648890',
  }
  
  appstore::app { 'Slack':
    source => 'slack/id803453959',
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
  dockutil::item { 'Add SublimeText':
    item     => "/Applications/Sublime Text.app",
    label    => "Sublime Text",
    action   => "add",
    position => 3,
  }
  dockutil::item { 'Add Cyberduck':
    item     => "/Applications/Cyberduck.app",
    label    => "Cyberduck",
    action   => "add",
    position => 4,
  }
  dockutil::item { 'Add Telegram':
    item     => "/Applications/Telegram.app",
    label    => "Telegram",
    action   => "add",
    position => 5,
  }
  dockutil::item { 'Add Slack':
    item     => "/Applications/Slack.app",
    label    => "Slack",
    action   => "add",
    position => 6,
  }
  dockutil::item { 'Add Evernote':
    item     => "/Applications/Evernote.app",
    label    => "Evernote",
    action   => "add",
    position => 7,
  }
}
