package Pod::Weaver::Section::Homepage::DefaultCPAN;

use 5.010001;
use Moose;
use Text::Wrap ();
with 'Pod::Weaver::Role::Section';

#use Log::Any '$log';

use Moose::Autobox;

our $VERSION = '0.01'; # VERSION

sub weave_section {
  my ($self, $document, $input) = @_;

  my $name = $input->{zilla}->name;
  my $homepage = $input->{distmeta}{resources}{homepage} //
      "https://metacpan.org/release/$name";

  my $text = "Please visit the project's homepage at L<$homepage>.";

  $text = Text::Wrap::wrap(q{}, q{}, $text);

  $document->children->push(
    Pod::Elemental::Element::Nested->new({
      command  => 'head1',
      content  => 'HOMEPAGE',
      children => [
        Pod::Elemental::Element::Pod5::Ordinary->new({ content => $text }),
      ],
    }),
  );
}

no Moose;
1;
# ABSTRACT: Add a HOMEPAGE section

__END__

=pod

=encoding utf-8

=head1 NAME

Pod::Weaver::Section::Homepage::DefaultCPAN - Add a HOMEPAGE section

=head1 SYNOPSIS

In your C<weaver.ini>:

 [Homepage::DefaultCPAN]

To specify a bugtracker other than C<https://metacpan.org/release/NAME>, in
dist.ini:

 [MetaResources]
 homepage=http://example.com/

=head1 DESCRIPTION

This section plugin adds a HOMEPAGE section.

=head1 SOURCE

The development version is on github at L<http://github.com/sharyanto/perl-Pod-Weaver-Section-Homepage-DefaultCPAN>
and may be cloned from L<git://github.com/sharyanto/perl-Pod-Weaver-Section-Homepage-DefaultCPAN.git>

=for Pod::Coverage weave_section

=head1 HOMEPAGE

Project homepage is at
https://metacpan.org/release/Pod-Weaver-Section-Homepage-DefaultCPAN.

=head1 BUGS

Please report any bugs or feature requests on the bugtracker website
http://rt.cpan.org/Public/Dist/Display.html?Name=Pod-Weaver-Section-Homepag
e-DefaultCPAN

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