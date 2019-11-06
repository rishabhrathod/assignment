#!C:\\Strawberry\\perl\\bin\\perl

use DBI;
use strict;
# use Data::Dumper;

require 'C:\\Users\\Z0042KME\\xampp\\htdocs\\startbootstrap-agency-gh-pages\\cgi-bin\\db_params.pl';

sub init_dbh
{
my ($APP) = @_;
die "Connection details for $APP not defined!" if (! defined $DB::CONN_DETAILS{$APP});
my $DBH = DBI->connect("dbi:Pg:database=".$DB::CONN_DETAILS{$APP}[0].";host=localhost", $DB::CONN_DETAILS{$APP}[1], $DB::CONN_DETAILS{$APP}[2]) or die("Cannot connect to DSN ".$DB::CONN_DETAILS{$APP}[0]);
$DBH->{LongReadLen} = 512 * 1024;
return $DBH;
}

sub init_cgi
{
my $query = $ENV{QUERY_STRING}; # get the query string
my $length = $ENV{CONTENT_LENGTH}; # get the content length
my (@assign, %formlist); # create some temporaries

if ($query =~ /\w+/) # Check if GET query contains dat
	{@assign = split('&',$query);} # Extract the field/value pairs

elsif (defined($length) and $length>0)#GETis empty, POST instead
{
	sysread(STDIN, $_, $length);
	chomp;
	@assign = split('&'); # Extract the field/value pairs
	}
	foreach (@assign) # Now split field/value pairs to has
		{
		my ($name,$value) = split /=/;
		$value =~ tr/+/ /;
		$value =~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;
		if (defined($formlist{$name})) # If the field exists, append data
			{$formlist{$name} .= ",$value";}
		else # Otherwise, create new hash key
		{$formlist{$name} = $value;	}
		}
	return %formlist; # Return the hash to the caller
}

sub get_data
{
my ($DBH,$SQL)=@_;
my $ARR_REF=$DBH->selectall_arrayref($SQL) or die "Cannot run LKP SQL $SQL!" ;
return @{$ARR_REF};
}

sub get_data_hash
{
my ($DBH,$SQL,$KEY)=@_;
my $ARR_REF=$DBH->selectall_hashref($SQL,$KEY) or die "Cannot run LKP SQL $SQL!" ;
return %{$ARR_REF};
}

sub get_auth_user()
{
my $cgi = CGI->new;
my $SECRET="6HiSb9B9jeid0DT0FNgH5oru";
my $AUTHCOOKIE = $cgi->cookie('auth_cookie');
my $DATA = decode_jwt(token=>$AUTHCOOKIE, key=>$SECRET);
my @ARR=split(/:/,$DATA);
return $ARR[0];
}

sub get_user_role()
{
my $cgi = CGI->new;
my $SECRET="6HiSb9B9jeid0DT0FNgH5oru";
my $AUTHCOOKIE = $cgi->cookie('auth_cookie');
my $DATA = decode_jwt(token=>$AUTHCOOKIE, key=>$SECRET);
my @ARR=split(/:/,$DATA);
return $ARR[1];
}

1;