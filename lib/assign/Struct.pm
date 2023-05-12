use strict; use warnings;
package assign::Struct;

use assign::Types;

use XXX;

sub new {
    my $class = shift;
    bless {
        elems => [],
        @_,
    }, $class;
}

sub parse {
    my ($self) = @_;

    my $node = $self->{node};
    my $statement;
    for my $child ($node->children) {
        my $type = ref($child);
        if ($type eq 'PPI::Token::Whitespace') {
            next;
        }
        if ($type eq 'PPI::Statement') {
            XXX $node, "more than one statement"
                if $statement;
            $statement = $child;
            next;
        }
        XXX $node, "unexpected node";
    }

    XXX $node, "no statement in array"
        unless $statement;

    $self->{in} = [ $statement->children ];

    while (1) {
        $self->parse_elem or last;
        $self->parse_comma or last;
    }

    return $self;
}

sub parse_comma {
    my ($self) = @_;
    my $in = $self->{in};
    while (@$in) {
        my $tok = shift(@$in);
        my $type = ref($tok);
        next if $type eq 'PPI::Token::Whitespace';

        if ($type eq 'PPI::Token::Operator' and
            $tok->content eq ','
        ) {
            return 1;
        }
        else {
            XXX $tok, $in, "comma expected";
        }
    }
    return 0;
}

1;
