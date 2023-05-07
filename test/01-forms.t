use assign::Test;

# Array destructuring:

test <<'...', "Unpack aref into 'my' vars";
my [ $a, $b, $c ] = $aref;
+++
my $a = $aref->[0];
my $b = $aref->[1];
my $c = $aref->[2];
...

test <<'...', "Unpack a literal aref";
my [ $a, $b, $c ] = [111, 222, 333];
+++
my $___1 = [111, 222, 333];
my $a = $___1->[0];
my $b = $___1->[1];
my $c = $___1->[2];
...

test <<'...', "Unpack aref into 'our' vars";
our [ $a, $b, $c ] = $aref;
+++
our $a = $aref->[0];
our $b = $aref->[1];
our $c = $aref->[2];
...

test <<'...', "Unpack aref into 'local' vars";
local [ $a, $b, $c ] = $aref;
+++
local $a = $aref->[0];
local $b = $aref->[1];
local $c = $aref->[2];
...

test <<'...', "Unpack aref into 'local' vars";
my $a; our $b; local $c;
[ $a, $b, $c ] = $aref;
+++
my $a; our $b; local $c;
$a = $aref->[0];
$b = $aref->[1];
$c = $aref->[2];
...
