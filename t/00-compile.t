use 5.006;
use strict;
use warnings;

# this test was generated with Dist::Zilla::Plugin::Test::Compile 2.039

use Test::More  tests => 36 + ($ENV{AUTHOR_TESTING} ? 1 : 0);



my @module_files = (
    'App/SerializeUtils.pm'
);

my @scripts = (
    'bin/check-json',
    'bin/check-phpser',
    'bin/check-yaml',
    'bin/dd2json',
    'bin/dd2phpser',
    'bin/dd2sereal',
    'bin/dd2storable',
    'bin/dd2yaml',
    'bin/json2dd',
    'bin/json2phpser',
    'bin/json2sereal',
    'bin/json2storable',
    'bin/json2yaml',
    'bin/phpser2dd',
    'bin/phpser2json',
    'bin/phpser2sereal',
    'bin/phpser2storable',
    'bin/phpser2yaml',
    'bin/pp-json',
    'bin/sereal2dd',
    'bin/sereal2json',
    'bin/sereal2phpser',
    'bin/sereal2storable',
    'bin/sereal2yaml',
    'bin/serializeutils-convert',
    'bin/storable2dd',
    'bin/storable2json',
    'bin/storable2phpser',
    'bin/storable2sereal',
    'bin/storable2yaml',
    'bin/yaml2dd',
    'bin/yaml2json',
    'bin/yaml2phpser',
    'bin/yaml2sereal',
    'bin/yaml2storabls'
);

# no fake home requested

my $inc_switch = -d 'blib' ? '-Mblib' : '-Ilib';

use File::Spec;
use IPC::Open3;
use IO::Handle;

open my $stdin, '<', File::Spec->devnull or die "can't open devnull: $!";

my @warnings;
for my $lib (@module_files)
{
    # see L<perlfaq8/How can I capture STDERR from an external command?>
    my $stderr = IO::Handle->new;

    my $pid = open3($stdin, '>&STDERR', $stderr, $^X, $inc_switch, '-e', "require q[$lib]");
    binmode $stderr, ':crlf' if $^O eq 'MSWin32';
    my @_warnings = <$stderr>;
    waitpid($pid, 0);
    is($?, 0, "$lib loaded ok");

    if (@_warnings)
    {
        warn @_warnings;
        push @warnings, @_warnings;
    }
}

foreach my $file (@scripts)
{ SKIP: {
    open my $fh, '<', $file or warn("Unable to open $file: $!"), next;
    my $line = <$fh>;
    close $fh and skip("$file isn't perl", 1) unless $line =~ /^#!.*?\bperl\b\s*(.*)$/;

    my @flags = $1 ? split(/\s+/, $1) : ();

    my $stderr = IO::Handle->new;

    my $pid = open3($stdin, '>&STDERR', $stderr, $^X, $inc_switch, @flags, '-c', $file);
    binmode $stderr, ':crlf' if $^O eq 'MSWin32';
    my @_warnings = <$stderr>;
    waitpid($pid, 0);
    is($?, 0, "$file compiled ok");

   # in older perls, -c output is simply the file portion of the path being tested
    if (@_warnings = grep { !/\bsyntax OK$/ }
        grep { chomp; $_ ne (File::Spec->splitpath($file))[2] } @_warnings)
    {
        warn @_warnings;
        push @warnings, @_warnings;
    }
} }



is(scalar(@warnings), 0, 'no warnings found') if $ENV{AUTHOR_TESTING};


