
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  'build_requires' => {
    'Module::Build' => '0.3601'
  },
  'configure_requires' => {
    'Module::Build' => '0.3601'
  },
  'dist_abstract' => 'Utilities for serialization tasks',
  'dist_author' => [
    'Steven Haryanto <stevenharyanto@gmail.com>'
  ],
  'dist_name' => 'App-SerializeUtils',
  'dist_version' => '0.02',
  'license' => 'perl',
  'module_name' => 'App::SerializeUtils',
  'recommends' => {},
  'recursive_test_files' => 1,
  'requires' => {
    'Data::Dump' => '0',
    'JSON' => '0',
    'PHP::Serialization' => '0',
    'Test::More' => '0.96',
    'YAML::Syck' => '0',
    'perl' => '5.010000'
  },
  'script_files' => [
    'bin/yaml2php',
    'bin/yaml2dd',
    'bin/dd2json',
    'bin/php2yaml',
    'bin/json2dd',
    'bin/php2dd',
    'bin/dd2yaml',
    'bin/dd2php',
    'bin/json2php',
    'bin/pp-json',
    'bin/json2yaml',
    'bin/php2json',
    'bin/yaml2json'
  ]
);


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
