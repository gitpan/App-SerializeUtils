package App::SerializeUtils;

use 5.010001;
use strict;
use warnings;

our $VERSION = '0.06'; # VERSION

1;
#ABSTRACT: Utilities for serialization tasks

__END__

=pod

=encoding utf-8

=head1 NAME

App::SerializeUtils - Utilities for serialization tasks

=head1 SYNOPSIS

 $ script-that-produces-json | json2yaml

=head1 DESCRIPTION

This distributions provides the following command-line utilities:

For converting between serializable formats (each of these take input from stdin
and output to stdout):

 dd2json
 dd2phpser
 dd2yaml

 json2dd
 json2phpser
 json2yaml

 phpser2dd
 phpser2json
 phpser2yaml

 yaml2dd
 yaml2json
 yaml2phpser

Also included is this utility to pretty-print JSON:

 pp-json

And utilities for checking:

 check-json
 check-phpser
 check-yaml

=head1 SEE ALSO

L<Data::Dump>

L<JSON>

L<PHP::Serialization>

L<YAML>

=head1 HOMEPAGE

Please visit the project's homepage at L<https://metacpan.org/release/App-SerializeUtils>.

=head1 SOURCE

Source repository is at L<https://github.com/sharyanto/perl-App-SerializeUtils>.

=head1 BUGS

Please report any bugs or feature requests on the bugtracker website
http://rt.cpan.org/Public/Dist/Display.html?Name=App-SerializeUtils

When submitting a bug or request, please include a test-file or a
patch to an existing test-file that illustrates the bug or desired
feature.

=head1 AUTHOR

Steven Haryanto <stevenharyanto@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Steven Haryanto.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
