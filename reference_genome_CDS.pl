#!usr/bin/perl -w

#Creator: Norman B. Best
#Date: April 25th, 2022
#Purpose: Creates BED file of CDS locations from a GFF3 file to be used for calling SNPs within CDS positions throughout the genome.

use strict;
use warnings;

my $filein = "<reference_genome>.gff3";

my $fileout = "reference_genome_CDS.bed";

my $counter;
my $chr;
my $ensembl;
my $CDS;
my $start;
my $end;
my $a;
my $b;
my $c;
my $rest;
my @CDS;

open FILE1, "<", "$filein" or die;

while (my $line = <FILE1>){
    
    if ($line =~ m/^\d/){
    
        
    
        chomp $line;
    
        ($chr, $ensembl, $CDS, $start, $end, $a, $b, $c, $rest) = split " ", $line, 9;
    
    
        if ($CDS =~ m/^CDS$/){
        
            $counter++;
            
            push @CDS, {"CHR" => $chr, "START" => $start, "END" => $end};
        }
    }
}

close (FILE1);





open FILE2, ">", "$fileout" or die;

for ( my$i=0; $i < $counter; $i++){
    
    print FILE2 "$CDS[$i]{CHR}\t$CDS[$i]{START}\t$CDS[$i]{END}\n";
}

close (FILE2);

exit;