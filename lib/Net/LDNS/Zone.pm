package Net::LDNS::Zone;

use 5.008008;
use strict;
use warnings;

use Net::LDNS ':all';

our $VERSION = '0.02';

sub new {
    my ($class, %args) = @_;

    my $line_nr = 0;
    my $status = &LDNS_STATUS_OK;
    my $zone;
    my $file;

    if ($args{filename}) {
	unless (open FILE, $args{filename}) {
	    $Net::LDNS::last_status = &LDNS_STATUS_FILE_ERR;
	    $Net::LDNS::line_nr = 0;
	    return;
	}

	$file = \*FILE;
    }

    if ($file) {
	$zone = _new_from_file($file, 
			       $args{origin} || $Net::LDNS::DEFAULT_ORIGIN, 
			       $args{default_ttl} || $Net::LDNS::DEFAULT_TTL, 
			       $args{class} || $Net::LDNS::DEFAULT_CLASS, 
			       $status, $line_nr);
    }
    else {
	$zone = _new();
    }

    if ($args{filename}) {
	close $file;
    }

    $Net::LDNS::last_status = $status;
    $Net::LDNS::line_nr = $line_nr;
    if (!defined $zone) {
	return;
    }

    return $zone;
}

sub to_string {
    my $self = shift;

    return join('', map { $self->$_ ? $self->$_->to_string : '' } qw/soa rrs/);
}

sub soa {
    my $self = shift;
    return Net::LDNS::GC::own($self->_soa, $self);
}

sub set_soa {
    my ($self, $soa) = @_;
    Net::LDNS::GC::disown(my $old = $self->soa);
    $self->_set_soa(my $copy = $soa->clone);
    return Net::LDNS::GC::own($copy, $self);
}

sub rrs {
    my $self = shift;
    return Net::LDNS::GC::own($self->_rrs, $self);
}

sub set_rrs {
    my ($self, $list) = @_;
    Net::LDNS::GC::disown(my $old = $self->rrs);
    $self->_set_rrs(my $copy = $list->clone);
    return Net::LDNS::GC::own($copy, $self);
}

sub DESTROY {
    Net::LDNS::GC::free($_[0]);
}

1;
__END__

=head1 NAME

Net::LDNS - Perl extension for the ldns library

=head1 SYNOPSIS

  use Net::LDNS ':all'

  my z = new Net::LDNS::Zone(
    filename => '/path/to/myzone',
    origin => new Net::LDNS::RData(LDNS_RDF_TYPE_DNAME, 'myzone'), #optional
    default_ttl => 3600, #optional
    class => LDNS_RR_CLASS_IN, #optional
  )
  my z = new Net::LDNS::Zone(
    file => \*FILE,
    origin => ..., default_ttl => ..., class => ...
  )
  my z = new Net::LDNS::Zone

  z->to_string
  z->print(\*FILE)
  z->canonicalize
  z->sort
  rr = z->soa
  z->set_soa(rr)
  rrlist = z->rrs
  z->set_rrs(rrlist)
  z->sign(keylist)
  z->sign_nsec3(keylist, algorithm, flags, iterations, salt)

=head1 SEE ALSO

http://www.nlnetlabs.nl/projects/ldns

=head1 AUTHOR

Erik Pihl Ostlyngen, E<lt>erik.ostlyngen@uninett.noE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2013 by Erik Pihl Ostlyngen

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.14.2 or,
at your option, any later version of Perl 5 you may have available.

=cut
