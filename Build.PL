
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  'build_requires' => {
    'Data::Dumper' => '0',
    'English' => '0',
    'File::Find' => '0',
    'File::Temp' => '0',
    'Module::Build' => '0.3601',
    'Test::More' => '0.96'
  },
  'configure_requires' => {
    'Module::Build' => '0.3601'
  },
  'dist_abstract' => 'Some basic String parsing Rules for Regexp::Grammars',
  'dist_author' => [
    'Kent Fredric <kentnl@cpan.org>'
  ],
  'dist_name' => 'Regexp-Grammars-Common-String',
  'dist_version' => '0.01000001',
  'license' => 'perl',
  'module_name' => 'Regexp::Grammars::Common::String',
  'recommends' => {},
  'recursive_test_files' => 1,
  'requires' => {
    'Regexp::Grammars' => '0',
    'perl' => '5.010000'
  },
  'script_files' => []
);


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
