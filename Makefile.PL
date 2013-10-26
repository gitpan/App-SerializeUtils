
use strict;
use warnings;

use 5.010001;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Utilities for serialization tasks",
  "AUTHOR" => "Steven Haryanto <stevenharyanto\@gmail.com>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "App-SerializeUtils",
  "EXE_FILES" => [
    "bin/yaml2dd",
    "bin/json2dd",
    "bin/pp-json",
    "bin/dd2json",
    "bin/phpser2yaml",
    "bin/dd2phpser",
    "bin/check-json",
    "bin/phpser2json",
    "bin/phpser2dd",
    "bin/json2phpser",
    "bin/check-yaml",
    "bin/yaml2json",
    "bin/dd2yaml",
    "bin/check-phpser",
    "bin/yaml2phpser",
    "bin/json2yaml"
  ],
  "LICENSE" => "perl",
  "NAME" => "App::SerializeUtils",
  "PREREQ_PM" => {
    "Data::Dump" => 0,
    "JSON" => 0,
    "JSON::PP" => 0,
    "JSON::XS" => 0,
    "PHP::Serialization" => 0,
    "YAML::Syck" => 0,
    "YAML::XS" => 0
  },
  "TEST_REQUIRES" => {
    "File::Spec" => 0,
    "IO::Handle" => 0,
    "IPC::Open3" => 0,
    "Test::More" => 0
  },
  "VERSION" => "0.06",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  my $tr = delete $WriteMakefileArgs{TEST_REQUIRES};
  my $br = $WriteMakefileArgs{BUILD_REQUIRES};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



