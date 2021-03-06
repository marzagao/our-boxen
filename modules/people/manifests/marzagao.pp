class people::marzagao {
  include chrome
  include iterm2::stable
  include dockutil
  include dropbox
  include evernote
  include sublime_text_3
  include spotify
  include skype

  class{ 'virtualbox':
    version => '5.0.0',
    patch_level => '101573',
  }

  class { 'vagrant': 
    version => '1.7.3'
  }

  package {
    [
      'gpg',
      'git-crypt',
      'mercurial',
      'awscli',
      'ec2-api-tools',
      'wget',
      'google-app-engine',
      'go',
      'redis',
    ]:
  }

  class { 'ruby::global':
    version => '2.2.2'
  } 

  ruby_gem { 'r10k for all rubies':
    gem          => 'r10k',
    version      => '~> 1.5.1',
    ruby_version => '*',
  }

  sublime_text_3::package { 'GoSublime':
    source => 'DisposaBoy/GoSublime'
  }
  sublime_text_3::package { 'SublimePuppet':
    source => 'russCloak/SublimePuppet'
  }
  sublime_text_3::package { 'Cobalt2ColorScheme':
    source => 'wesbos/cobalt2'
  }
  sublime_text_3::package { 'Terraform.tmLanguage':
    source => 'alexlouden/Terraform.tmLanguage'
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

  appstore::app { 'Kindle':
    source => 'kindle/id405399194',
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
