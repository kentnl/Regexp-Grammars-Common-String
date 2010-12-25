use strict;
use warnings;

package Regexp::Grammars::Common::String;

# ABSTRACT: Some basic String parsing Rules for Regexp::Grammars

use Regexp::Grammars;
use v5.10.0;

my $grammar = qr{
    <grammar: Regexp::Grammars::Common::String>

    <token: String>
        "
        <[MATCH=([^"\\]*)]>+
        (
            \\<[MATCH=(.)]>
            <[MATCH=([^"\\]*)]>
        )*
        "
        <MATCH=(?{ join q{}, @{ $MATCH }})>

}x;

=head1 DESCRIPTION

Regexp::Grammars is just too useful to not use, but too pesky and confusing for new people.

Some of the more complex things involve string extraction and escape-handling, and I seriously spent the better part 2 hours learning how to make this work. So, even if this module is not immediately useful, it may serve as an educational tool for others.

I probably should have delved deeper into the L<Regexp::Common> Family, but I couldn't find one in there that did exactly what I wanted.

At present, this module only provides one rule, L</String>, but I will probably add a few more later.


=head1 SYNOPSIS

    use Regex::Grammars;
    use Regexp::Grammars::Common::String;

    my $re = qr{

        (.*<[String]>)+

        <extends: Regexp::Grammars::Common::String>

    }x; #  don't forget the x!

        ...

    if( $content =~ $re ){
        print Dumper( \%/ ); # Praying Mantis operator!?
    }
=cut

=head1 GRAMMARS

=head2 L<Regexp::Grammars::Common::String>

    <extends: Regexp::Grammars::Common::String>

=cut

=head1 RULES

=head2 String

For parsing strings like so:

    "Hello"     => 'Hello'
    "Hel\lo"    => 'Hello'
    "Hel\\lo"   => 'Hel\lo'
    "Hel\"lo"   => 'Hel"lo'

It should do a reasonable job of picking up strings from files and properly returning their parsed contents.

It made sense to me to drop the excess C<\>'s that are used for escaping, in order to get a copy of the string as
it would be seen to anything else that parsed it properly and evaluated the escapes into characters.

=cut

1;
