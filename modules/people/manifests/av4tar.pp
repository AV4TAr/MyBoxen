class people::av4tar{

  osx::recovery_message {
    'If this Mac is found, please email diego@sapriza.net':
  }

  include osx::global::enable_keyboard_control_access
  include osx::global::expand_save_dialog
  include osx::global::disable_remote_control_ir_receiver

  include osx::dock::autohide
  include osx::dock::clear_dock

  class { 'osx::dock::icon_size':
    size => 36
  }

  #include android::sdk

  include alfred
  include ctags
  include chrome
  include chrome::canary

  #include fish

  include firefox
  include geoip
  #include heroku
  include iterm2::stable
  include java
  #include jmeter
  include limechat
  include notational_velocity::nvalt
  include skype
  include spectacle
  include tmux
  include tunnelblick
  include transmission
  include virtualbox
  include vagrant
  # vagrant::plugin { 'librarian-puppet': }
  vagrant::plugin { ['cachier', 'vagrant-vbox-snapshot', 'vagrant-berkshelf']:}
  include vlc
  include wget
  include hipchat
  
  include evernote
  #include adium
  #include dropbox
  #include pgadmin3
  #include spotify
  #include caffeine
  #include tmux
  #include zsh
  include secondbar

  class { 'intellij':
    edition => 'community',
  }

  include python
  include vim
  vim::bundle { [
    'scrooloose/syntastic',
    'rodjek/vim-puppet',
    'scrooloose/nerdtree',
    'vim-scripts/fish-syntax',
    'tpope/vim-fugitive',
    'godlygeek/tabular',
    'evanmiller/nginx-vim-syntax'
  ]:
    require => Package['boxen/brews/python']
  }

  git::config::global { 'user.email': value => 'diego@sapriza.net' }
  git::config::global { 'user.name': value => 'Diego Sapriza' }
  git::config::global { 'color.ui': value => 'auto' }

  # set a global gitignore file
  git::config::global { 'core.excludesfile ':
    value   => '~/.gitignore',
    require => File["/Users/${::luser}/.gitignore"]
  }

  # ignore .bundle rbenv implicit gemset folder
  file { "/Users/${::luser}/.gitignore":
    content => '.bundle',
  }


}