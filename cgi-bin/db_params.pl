#!C:\\Strawberry\\perl\\bin\\perl
package DB;
my $DOME_DSN="postgres";
our %CONN_DETAILS= (
'public' => [$DOME_DSN,'postgres','12345'] 
);

1;